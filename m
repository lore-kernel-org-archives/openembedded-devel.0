Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1QjXHC-00023Z-16
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 15:57:26 +0200
Received: (qmail 20262 invoked by uid 0); 20 Jul 2011 13:26:39 -0000
Received: from 193.8.40.126 by www038.gmx.net with HTTP;
	Wed, 20 Jul 2011 15:26:36 +0200 (CEST)
Date: Wed, 20 Jul 2011 15:26:36 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20110720132636.276450@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, fpletz@franz-pletz.org,
	genext2fs-devel@lists.sourceforge.net
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX18hMuhn210hrlL8sv1kgnq8wJVFgpoLpqOrjIst+0
	nkhtk4DNL0yTwV5xJBdqa9upaxPpTIeQns2w== 
X-GMX-UID: uOUUfcxcPTR+Ho921jIwmpw5c2tpZAui
Cc: tytso@mit.edu, xavier.bestel@free.fr
Subject: genext2fs: patch for fixing inode based symlink string length limit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2011 13:57:26 -0000
X-Groupsio-MsgNum: 33245
Content-Type: multipart/mixed; boundary="========GMX276451311168396334696"

--========GMX276451311168396334696
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

below patch fixes a problem with symlinks where the target string had exactly 59 chars and the needed terminating null character.

(where the problem hits: when a fs with such entries gets checked by e2fsck
then those tool detects it as a problem and offers to delete that symlink.
if running an automated fixing cycle it would kill me all those symlinks.)

regards, Alex.

PS: in a test bed with a generated image file i am further seeing a note from e2fsck about a fs with revision zero but feature flags are set.
thats reported as a fs problem and a fix is suggested by a y/n query.


-- 
NEU: FreePhone - 0ct/min Handyspartarif mit Geld-zurück-Garantie!		
Jetzt informieren: http://www.gmx.net/de/go/freephone

--========GMX276451311168396334696
Content-Type: text/x-patch;
 charset="iso-8859-15";
 name="genext2fs.c-fix-symlink-len.diff"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="genext2fs.c-fix-symlink-len.diff"

diff -Nru genext2fs-1.4.1.orig/genext2fs.c genext2fs-1.4.1/genext2fs.c
--- genext2fs-1.4.1.orig/genext2fs.c	2011-07-20 10:57:24.000000000 +0200
+++ genext2fs-1.4.1/genext2fs.c	2011-07-20 14:34:11.000000000 +0200
@@ -1415,9 +1415,10 @@
 	uint32 nod = mknod_fs(fs, parent_nod, name, FM_IFLNK | FM_IRWXU | FM_IRWXG | FM_IRWXO, uid, gid, 0, 0, ctime, mtime);
 	extend_blk(fs, nod, 0, - (int)get_nod(fs, nod)->i_blocks / INOBLK);
 	get_nod(fs, nod)->i_size = size;
-	if(size <= 4 * (EXT2_TIND_BLOCK+1))
+	if(size < 4 * (EXT2_TIND_BLOCK+1))
 	{
 		strncpy((char*)get_nod(fs, nod)->i_block, (char*)b, size);
+		((char*)get_nod(fs, nod)->i_block)[size+1] = '\0';
 		return nod;
 	}
 	extend_blk(fs, nod, b, rndup(size, BLOCKSIZE) / BLOCKSIZE);
@@ -1643,6 +1644,10 @@
 			switch(st.st_mode & S_IFMT)
 			{
 				case S_IFLNK:
+					if((st.st_mode & S_IFMT) == S_IFREG || st.st_size >= 4 * (EXT2_TIND_BLOCK+1))
+						stats->nblocks += (st.st_size + BLOCKSIZE - 1) / BLOCKSIZE;
+					stats->ninodes++;
+					break;
 				case S_IFREG:
 					if((st.st_mode & S_IFMT) == S_IFREG || st.st_size > 4 * (EXT2_TIND_BLOCK+1))
 						stats->nblocks += (st.st_size + BLOCKSIZE - 1) / BLOCKSIZE;

--========GMX276451311168396334696--

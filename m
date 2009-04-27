Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LyOZa-0005Ee-TW
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 13:01:00 +0200
Received: (qmail 17942 invoked by uid 813007); 27 Apr 2009 10:55:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 27 Apr 2009 10:55:27 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2009 12:54:58 +0200
Message-Id: <1240829698-28666-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
Subject: [PATCH 1/1] genext2fs: added 1.4.1 version
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
X-List-Received-Date: Mon, 27 Apr 2009 11:02:04 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 conf/checksums.ini                             |    4 +
 recipes/genext2fs/genext2fs-1.4.1/volume.patch |  153 ++++++++++++++++++++++++
 recipes/genext2fs/genext2fs-native_1.4.1.bb    |   10 ++
 recipes/genext2fs/genext2fs_1.4.1.bb           |    9 ++
 4 files changed, 176 insertions(+), 0 deletions(-)
 create mode 100644 recipes/genext2fs/genext2fs-1.4.1/volume.patch
 create mode 100644 recipes/genext2fs/genext2fs-native_1.4.1.bb
 create mode 100644 recipes/genext2fs/genext2fs_1.4.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index bea59ad..395dcd9 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -7226,6 +7226,10 @@ sha256=5af6001401a6bc04c075474be5d8aeb2bdb2ca3e509022c2fc55ca7c7f310256
 md5=fd0337e89778e2dba74461c555ea8e42
 sha256=e50495d292a1d456c28044efbf07c16d8865f8d95e1caba86f4c5b2e3fb1d28f
 
+[http://downloads.sourceforge.net/genext2fs/genext2fs-1.4.1.tar.gz]
+md5=b7b6361bcce2cedff1ae437fadafe53b
+sha256=404dbbfa7a86a6c3de8225c8da254d026b17fd288e05cec4df2cc7e1f4feecfc
+
 [http://downloads.sourceforge.net/genext2fs/genext2fs-1.4rc1.tar.gz]
 md5=664431bf6737df1c265500e1f0b5d40c
 sha256=e60f88763ee12c02a5c7ade1a58925ef0ab198f9ec6aaf404747dfc29074c7be
diff --git a/recipes/genext2fs/genext2fs-1.4.1/volume.patch b/recipes/genext2fs/genext2fs-1.4.1/volume.patch
new file mode 100644
index 0000000..825fc35
--- /dev/null
+++ b/recipes/genext2fs/genext2fs-1.4.1/volume.patch
@@ -0,0 +1,153 @@
+---
+ genext2fs.c |   26 +++++++++++++++++++-------
+ 1 file changed, 19 insertions(+), 7 deletions(-)
+
+--- genext2fs-1.4.1.orig/genext2fs.c
++++ genext2fs-1.4.1/genext2fs.c
+@@ -507,11 +507,13 @@ swab32(uint32 val)
+ #define utdecl32(x,n) uint32 x[n];
+ 
+ typedef struct
+ {
+ 	superblock_decl
+-	uint32 s_reserved[235];       // Reserved
++	uint32  s_reserved1[9];
++	char s_volume[16];
++	uint32 s_reserved2[222];       // Reserved
+ } superblock;
+ 
+ typedef struct
+ {
+ 	groupdescriptor_decl
+@@ -1219,11 +1221,11 @@ extend_blk(filesystem *fs, uint32 nod, b
+ 			lbw = bw;
+ 		bw = lbw;
+ 		while(create)
+ 		{
+ 			int i, copyb = 0;
+-			if(!(fs->sb.s_reserved[200] & OP_HOLES))
++			if(!(fs->sb.s_reserved2[187] & OP_HOLES))
+ 				copyb = 1;
+ 			else
+ 				for(i = 0; i < BLOCKSIZE / 4; i++)
+ 					if(((int32*)(b + BLOCKSIZE * (amount - create)))[i])
+ 					{
+@@ -1891,11 +1893,12 @@ swap_badfs(filesystem *fs)
+ 	}
+ }
+ 
+ // initialize an empty filesystem
+ static filesystem *
+-init_fs(int nbblocks, int nbinodes, int nbresrvd, int holes, uint32 fs_timestamp)
++init_fs(int nbblocks, int nbinodes, int nbresrvd, int holes,
++		uint32 fs_timestamp, char *volumeid)
+ {
+ 	uint32 i;
+ 	filesystem *fs;
+ 	directory *d;
+ 	uint8 * b;
+@@ -1956,10 +1959,13 @@ init_fs(int nbblocks, int nbinodes, int 
+ 	fs->sb.s_inodes_per_group = nbinodes_per_group;
+ 	fs->sb.s_wtime = fs_timestamp;
+ 	fs->sb.s_magic = EXT2_MAGIC_NUMBER;
+ 	fs->sb.s_lastcheck = fs_timestamp;
+ 
++	if (volumeid != NULL)
++		strncpy(fs->sb.s_volume, volumeid, sizeof(fs->sb.s_volume));
++
+ 	// set up groupdescriptors
+ 	for(i=0, bbmpos=gdsz+2, ibmpos=bbmpos+1, itblpos=ibmpos+1;
+ 		i<nbgroups;
+ 		i++, bbmpos+=nbblocks_per_group, ibmpos+=nbblocks_per_group, itblpos+=nbblocks_per_group)
+ 	{
+@@ -2055,11 +2061,11 @@ init_fs(int nbblocks, int nbinodes, int 
+ 	fs->sb.s_state = 1;
+ 	fs->sb.s_max_mnt_count = 20;
+ 
+ 	// options for me
+ 	if(holes)
+-		fs->sb.s_reserved[200] |= OP_HOLES;
++		fs->sb.s_reserved2[187] |= OP_HOLES;
+ 	
+ 	return fs;
+ }
+ 
+ // loads a filesystem from disk
+@@ -2351,11 +2357,11 @@ print_fs(filesystem *fs)
+ 
+ static void
+ dump_fs(filesystem *fs, FILE * fh, int swapit)
+ {
+ 	uint32 nbblocks = fs->sb.s_blocks_count;
+-	fs->sb.s_reserved[200] = 0;
++	fs->sb.s_reserved2[187] = 0;
+ 	if(swapit)
+ 		swap_goodfs(fs);
+ 	if(fwrite(fs, BLOCKSIZE, nbblocks, fh) < nbblocks)
+ 		perror_msg_and_die("output filesystem image");
+ 	if(swapit)
+@@ -2465,10 +2471,11 @@ main(int argc, char **argv)
+ 	int squash_uids = 0;
+ 	int squash_perms = 0;
+ 	uint16 endian = 1;
+ 	int bigendian = !*(char*)&endian;
+ 	filesystem *fs;
++	char *volumeid = NULL;
+ 	int i;
+ 	int c;
+ 	struct stats stats;
+ 
+ #if HAVE_GETOPT_LONG
+@@ -2477,10 +2484,11 @@ main(int argc, char **argv)
+ 	  { "root",		required_argument,	NULL, 'd' },
+ 	  { "devtable",		required_argument,	NULL, 'D' },
+ 	  { "size-in-blocks",	required_argument,	NULL, 'b' },
+ 	  { "bytes-per-inode",	required_argument,	NULL, 'i' },
+ 	  { "number-of-inodes",	required_argument,	NULL, 'N' },
++	  { "volume-id",	required_argument,	NULL, 'L' },
+ 	  { "reserved-percentage", required_argument,	NULL, 'm' },
+ 	  { "block-map",	required_argument,	NULL, 'g' },
+ 	  { "fill-value",	required_argument,	NULL, 'e' },
+ 	  { "allow-holes",	no_argument, 		NULL, 'z' },
+ 	  { "faketime",		no_argument,		NULL, 'f' },
+@@ -2493,11 +2501,11 @@ main(int argc, char **argv)
+ 	  { 0, 0, 0, 0}
+ 	} ;
+ 
+ 	app_name = argv[0];
+ 
+-	while((c = getopt_long(argc, argv, "x:d:D:b:i:N:m:g:e:zfqUPhVv", longopts, NULL)) != EOF) {
++	while((c = getopt_long(argc, argv, "x:d:D:b:i:N:L:m:g:e:zfqUPhVv", longopts, NULL)) != EOF) {
+ #else
+ 	app_name = argv[0];
+ 
+ 	while((c = getopt(argc, argv,      "x:d:D:b:i:N:m:g:e:zfqUPhVv")) != EOF) {
+ #endif /* HAVE_GETOPT_LONG */
+@@ -2517,10 +2525,13 @@ main(int argc, char **argv)
+ 				bytes_per_inode = SI_atof(optarg);
+ 				break;
+ 			case 'N':
+ 				nbinodes = SI_atof(optarg);
+ 				break;
++			case 'L':
++				volumeid = optarg;
++				break;
+ 			case 'm':
+ 				reserved_frac = SI_atof(optarg) / 100;
+ 				break;
+ 			case 'g':
+ 				gopt[gidx++] = optarg;
+@@ -2607,11 +2618,12 @@ main(int argc, char **argv)
+ 			if(tmp_nbinodes > nbinodes)
+ 				nbinodes = tmp_nbinodes;
+ 		}
+ 		if(fs_timestamp == -1)
+ 			fs_timestamp = time(NULL);
+-		fs = init_fs(nbblocks, nbinodes, nbresrvd, holes, fs_timestamp);
++		fs = init_fs(nbblocks, nbinodes, nbresrvd, holes,
++				fs_timestamp, volumeid);
+ 	}
+ 	
+ 	populate_fs(fs, dopt, didx, squash_uids, squash_perms, fs_timestamp, NULL);
+ 
+ 	if(emptyval) {
diff --git a/recipes/genext2fs/genext2fs-native_1.4.1.bb b/recipes/genext2fs/genext2fs-native_1.4.1.bb
new file mode 100644
index 0000000..50b371b
--- /dev/null
+++ b/recipes/genext2fs/genext2fs-native_1.4.1.bb
@@ -0,0 +1,10 @@
+require genext2fs_${PV}.bb
+inherit native
+
+do_stage () {
+	install -m 0755 genext2fs ${STAGING_BINDIR}/
+}
+
+do_install () {
+	:
+}
diff --git a/recipes/genext2fs/genext2fs_1.4.1.bb b/recipes/genext2fs/genext2fs_1.4.1.bb
new file mode 100644
index 0000000..10ad9de
--- /dev/null
+++ b/recipes/genext2fs/genext2fs_1.4.1.bb
@@ -0,0 +1,9 @@
+require genext2fs.inc
+
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/genext2fs/genext2fs-${PV}.tar.gz \
+	   file://volume.patch;patch=1"
+
+DEFAULT_PREFERENCE = "1"
+
+inherit autotools
-- 
1.6.3.rc0






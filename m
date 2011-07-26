Received: from kcmailp08.birch.net ([216.212.0.103] helo=mx01.birch.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dick@softplc.com>) id 1QlmCu-000301-OT
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 20:18:19 +0200
Received: (qmail 95244 invoked from network); 26 Jul 2011 17:59:37 -0000
Received: by simscan 1.0.8 ppid: 95234, pid: 95235, t: 0.0701s scanners:none
Received: from unknown (HELO [192.100.100.3]) ([65.16.135.194])
	(envelope-sender <dick@softplc.com>)
	by mx01.birch.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	26 Jul 2011 17:59:37 -0000
Message-ID: <4E2F0089.2020103@softplc.com>
Date: Tue, 26 Jul 2011 12:59:37 -0500
From: Dick Hollenbeck <dick@softplc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] enhance lib/oe/unpack.py for ".tar.lzma" files
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
X-List-Received-Date: Tue, 26 Jul 2011 18:18:19 -0000
X-Groupsio-MsgNum: 33335
Content-Type: multipart/mixed; boundary="------------060106030009060901050707"

--------------060106030009060901050707
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The boys a mingw started packaging binutils as .tar.lzma files.
This is the only trick I found to unpack them.  It works.
(I am trying to revitalize canadian-sdk at newer component versions.)



--------------060106030009060901050707
Content-Type: text/x-patch;
 name="0008-unpack.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0008-unpack.patch"

diff --git a/lib/oe/unpack.py b/lib/oe/unpack.py
index 8e8bf36..d7e34a7 100644
--- a/lib/oe/unpack.py
+++ b/lib/oe/unpack.py
@@ -88,6 +88,8 @@ def unpack_file(file, destdir, parameters, env=None):
             cmd = 'xz -dc %s > %s' % (file, os.path.basename(root))
         elif file.endswith('.tar.lz'):
             cmd = 'lzip -dc %s | tar x --no-same-owner -f -' % file
+        elif file.endswith('.tar.lzma'):
+            cmd = 'tar --lzma --no-same-owner -xf %s' % file
         elif file.endswith('.lz'):
             root, ext = os.path.splitext(file)
             cmd = 'lzip -dc %s > %s' % (file, os.path.basename(root))

--------------060106030009060901050707--

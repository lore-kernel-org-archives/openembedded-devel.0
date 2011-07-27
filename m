Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dick@softplc.com>) id 1Qm9lI-0008Qf-Dr
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 21:27:21 +0200
Received: by gxk3 with SMTP id 3so1356648gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2011 12:23:05 -0700 (PDT)
Received: by 10.91.177.7 with SMTP id e7mr169444agp.74.1311794585364;
	Wed, 27 Jul 2011 12:23:05 -0700 (PDT)
Received: from localhost.localdomain (host65-16-135-194.birch.net
	[65.16.135.194])
	by mx.google.com with ESMTPS id j9sm176122yhn.39.2011.07.27.12.23.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 12:23:04 -0700 (PDT)
From: Dick Hollenbeck <dick@softplc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jul 2011 14:23:00 -0500
Message-Id: <1311794580-20745-1-git-send-email-dick@softplc.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Dick Hollenbeck <dick@softplc.com>
Subject: [PATCH v2] unpack.py: add support for .tar.lzma
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
X-List-Received-Date: Wed, 27 Jul 2011 19:27:21 -0000

* invoke tar properly to unpack a file with .tar.lzma extension

Signed-off-by: Dick Hollenbeck <dick@softplc.com>
---
 lib/oe/unpack.py |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
-- 
1.7.0.4




Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiA69-0006LL-KH
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:28:05 +0100
Received: by bwz10 with SMTP id 10so1580396bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=mJmNZ2CyJVhrszglHUbQX8YeV9nRo8WkWiYSrjqdaKo=;
	b=xbJeYIMLa9KpZEEJaTlCvrtP/6KFyFoybtjV7ufAT+9OVejw/OegtqZKYythRblqRt
	HiSXK/+p1uQTqEDO+rfcyLdoZ7UOwiJNC+i+uYqLBTtvZw8jPLzzvkAtmisS/JS0tSmY
	HmC5Ffyg/N4K9fh9v9VDSKqGFBq7ppjxDd5Yk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=afm7FsZry6AFrdOoW9eFxN9AqUeN68cdZoo9iKOQGQh1bfuZt7oHT5HPAxmgjAHRgu
	rw0u9yTm4SiyHhMnoDbin7sV9jgAAPdRwlxrzYiXwRCGU9yGuKImm4cC2ZlxvXEfjMxO
	LSUkzDHesyT2uZfzGL4FWWqvKf0KAFiOw1We8=
Received: by 10.204.53.78 with SMTP id l14mr735274bkg.16.1296065617246;
	Wed, 26 Jan 2011 10:13:37 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a17sm7646389bku.11.2011.01.26.10.13.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 10:13:35 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pi9s5-0002W0-OO; Wed, 26 Jan 2011 19:13:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 19:13:25 +0100
Message-Id: <1296065612-9637-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 2/9] packaged-staging.bbclass: improve documentation
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
X-List-Received-Date: Wed, 26 Jan 2011 18:28:05 -0000

Mention usage of PSTAGE_MIRROR and add debugging-output for fetching.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/packaged-staging.bbclass |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 83e77c9..eea5fe0 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -6,6 +6,10 @@
 #
 # INHERIT += "packaged-staging"
 #
+# To use the prebuilt pstage packages, save them away..
+# $ rsync --delete -a tmp/pstage/ /there/oe/build/pstage_mirror
+# .. and use it as mirror in your conf/local.conf:
+# PSTAGE_MIRROR = "file:///there/oe/build/pstage_mirror"
 
 
 #
@@ -190,16 +194,20 @@ def staging_fetch(stagepkg, d):
         pd = d.createCopy()
         dldir = bb.data.expand("${PSTAGE_DIR}/${PSTAGE_PKGPATH}", pd)
         mirror = bb.data.expand("${PSTAGE_MIRROR}/${PSTAGE_PKGPATH}/", pd)
-        srcuri = mirror + os.path.basename(stagepkg)
+        bn = os.path.basename(stagepkg)
+        srcuri = mirror + bn
         bb.data.setVar('DL_DIR', dldir, pd)
         bb.data.setVar('SRC_URI', srcuri, pd)
 
         # Try a fetch from the pstage mirror, if it fails just return and
         # we will build the package
+        bb.debug(1, "Attempting to fetch staging package %s" % (bn))
         try:
             bb.fetch.init([srcuri], pd)
             bb.fetch.go(pd, [srcuri])
-        except:
+	    bb.debug(1, "Fetched staging package %s" % (bn))
+        except Exception as ex:
+	    bb.debug(1, "Failed to fetch staging package %s: %s" % (bn, ex))
             return
 
 PSTAGE_TASKS_COVERED = "fetch unpack munge patch configure qa_configure rig_locales compile sizecheck install deploy package populate_sysroot package_write_deb package_write_ipk package_write package_stage qa_staging"
-- 
1.7.2.3




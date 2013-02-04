Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2OT4-0006Y7-B9
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 17:00:29 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so2700466dak.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 07:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=/Uo3fBB2ug+/2i9My8QRlg1W0hhhaNdzOLT6J3zrPWA=;
	b=02hgzuXd1wVaMVmIVKf2MK7uqY0ulWxdxDF5Ve/cIisKPVwo/cAUy3UnD+4DOzQCxL
	Nn/L8yvsKxWM+jwqThIvsAkBZbNXNWp+58kz1IxQyDYkTwzQFZdxYKjQy0Xkq02RR6wK
	Ei5Z5jqpJ9FOO43XeMYzZhymkPP7wF1XR5gNNNaYxjf4THSMHmu/3k7d5ygWDN9L0Vdd
	a5J72ogPjhQuelFi/9OMQe7TnDaJZF8uY6PfIY10XL8+lgURxzomFNKavzPtlgbujOq/
	yQr5BQEug7dFbOe/pYvJcqh2y+ldsXAjydBe3FS/8TcFeE2BmF/b5DLbfVAj3a4t1Hpy
	lB+w==
X-Received: by 10.66.83.136 with SMTP id q8mr53890346pay.83.1359992676635;
	Mon, 04 Feb 2013 07:44:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x2sm22268113paw.8.2013.02.04.07.44.34
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 07:44:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 15:44:09 +0100
Message-Id: <0540b31ae7c042d8adbe448d2ec8773fa24b2d35.1359988981.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1359988981.git.Martin.Jansa@gmail.com>
References: <cover.1359988981.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359988981.git.Martin.Jansa@gmail.com>
References: <cover.1359988981.git.Martin.Jansa@gmail.com>
Subject: [PATCH][for-danny 1/2] lvm2: upgrade to 2.02.97 which is compatible with newer udev
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
X-List-Received-Date: Mon, 04 Feb 2013 16:00:32 -0000

* older versions are using symbols removed in newer udev
  | dmsetup.c:985: error: undefined reference to 'udev_get_dev_path'
  | collect2: error: ld returned 1 exit status
  | make[1]: *** [dmsetup] Error 1
  | make[1]: Leaving directory
  `/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/lvm2/2.02.85-r2.0/LVM2.2.02.85/tools'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb | 7 -------
 meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb | 6 ++++++
 2 files changed, 6 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb
deleted file mode 100644
index b2a4ff3..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require lvm2.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "91785ca438e5ce679dd3a386b183d552"
-SRC_URI[sha256sum] = "e5c2b0d76e7b1df7630e211734eb09697d66ab879b17eb19545cb77272813eb7"
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb
new file mode 100644
index 0000000..2de17cf
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb
@@ -0,0 +1,6 @@
+require lvm2.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "d18bd01334309db1c422b9bf6b181057"
+SRC_URI[sha256sum] = "edda82012e8a9e1f0b00ba5a331468d3e0201992be14c0dbea71bf564a51fc2b"
-- 
1.8.1.2




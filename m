Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E32557E65E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 16:55:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d18so13846227wrs.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PaKLBeKTWRhvOJIn9mWc8uI/Ext5YeWZFsqiNRg1EKg=;
	b=mgYQsI5j2mC70gmPy3aMGEwJRR8Z4nV+jsZlb9rZq4SKKBhueR1Xm8MIJyhbbRxItW
	er4etg3OmE+qPXwMR3S2H9m+iqH8UwfTWeTVJ+5t3TwUctKkO3kn265sydoBVms+NbQy
	IUD+nYTOQFjgNgxGAyRqc7LU0fygr3uPSlqkmV1DigA0KFjs3Vr2ku0IyEpPHzSZ7EsG
	EkgxWNZsiTcxYI/UttdGMWKnfA0oxcubwQkZWWHlVVV2fOtnjkjIjihzp/+duHi4ZDCV
	MQaTAxEWlEORlF4eH3by4Es5KlHzAUJ7q9+vzYc5q0yE4vatFRYwOmMlQrZX+wiw33IX
	dhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PaKLBeKTWRhvOJIn9mWc8uI/Ext5YeWZFsqiNRg1EKg=;
	b=nC57vgEB65yGTJx4BWMjjVbFi+s0B6i7nFyl6TWm4/JX2UfZ/zHO3TkJqDbVMc6/0G
	D8/7Ym982eZQXHijSaCqFEqFNc7wWLZCVXD0b9k9yRaUfuHJQF4shXFmaxHeNEsNY40V
	A3rvujfXGg6srhoXjOYyCclwzxBq1TfBbypymawffKQUBJoFJ+oKUJceDi0vPxs3VZoV
	Jq+uMm/c/DGicZxiH9I+33+hsJ0/j3tEFtg2Ncn6vR6/FXaOK10nj4mxjCBJ3wurrbQh
	aTqYpnz/Se43KjsizQGuyOE8VXnmzsN6/512/PU85bIYNwhQnqO6ncaCiYO4y8noCn2w
	Q0GQ==
X-Gm-Message-State: APjAAAXhUDh8x49o5syFJ+m7/STBfGrR5VFRaIG0EzkMnUsr38OM+o6F
	edKwcL8HafZUeM8ywZzb5bNePFrU
X-Google-Smtp-Source: APXvYqxvzzlE3ebBbNceFJAvYyn9G4+nF219aIs7aqStO3m4KxohY1dVqHlg/xmd3DDHx6ctck7sPg==
X-Received: by 2002:adf:df91:: with SMTP id z17mr44491470wrl.336.1560272116398;
	Tue, 11 Jun 2019 09:55:16 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	c16sm12867996wrr.53.2019.06.11.09.55.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 09:55:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:55:02 +0000
Message-Id: <20190611165504.23049-9-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611165504.23049-1-Martin.Jansa@gmail.com>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][warrior][PATCH 09/11] igmpproxy: remove 0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch and _GNU_SOURCE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2019 16:55:16 -0000

* it was upgraded to 0.2.1 in:
  commit 50979151e69e5707580b2f3d263a9b36b6a190d5
  Author: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
  Date:   Sat Mar 16 18:22:59 2019 +0100

    igmpproxy: update to 0.2.1

* which includes _GNU_SOURCE:
  https://github.com/pali/igmpproxy/commit/7d790aa2f16afad63418e573db13ea39d76ed141
* and includes sys/types.h in os-linux.h:
  https://github.com/pali/igmpproxy/commit/6f92242b23178e979f4a806abe4ac9652b51c593
* and the patch doesn't apply cleanly:
  ERROR: Fuzz detected:

  checking file src/igmpproxy.h
  Hunk #1 succeeded at 51 with fuzz 2 (offset 5 lines).

  patching file src/igmpproxy.h
  Hunk #1 succeeded at 51 with fuzz 2 (offset 5 lines).

  The context lines in the patches can be updated with devtool:

      devtool modify lib32-igmpproxy
      devtool finish --force-patch-refresh lib32-igmpproxy <layer_path>

  Don't forget to review changes done by devtool!

  ERROR: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...Include-sys-types.h-for-u_short-u_in.patch | 25 -------------------
 .../igmpproxy/igmpproxy_0.2.1.bb              |  6 +----
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch

diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch b/meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch
deleted file mode 100644
index 82cdc36ac4..0000000000
--- a/meta-networking/recipes-daemons/igmpproxy/igmpproxy/0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a557651a08e21e3c7c7f5eca9f5405f86624903f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Jul 2017 22:42:51 -0700
-Subject: [PATCH] src/igmpproxy.h: Include sys/types.h for u_short/u_init
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/igmpproxy.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/igmpproxy.h b/src/igmpproxy.h
-index 4dabd1c..4454729 100644
---- a/src/igmpproxy.h
-+++ b/src/igmpproxy.h
-@@ -46,6 +46,7 @@
- #include <stdbool.h>
- 
- #include <sys/socket.h>
-+#include <sys/types.h>
- #include <sys/un.h>
- #include <sys/time.h>
- #include <sys/ioctl.h>
--- 
-2.13.3
-
diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
index c99ebe0e9c..db96d487bf 100644
--- a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
+++ b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
@@ -4,12 +4,8 @@ HOMEPAGE = "http://sourceforge.net/projects/igmpproxy/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=432040ff3a55670c1dec0c32b209ad69"
 
-SRC_URI = "https://github.com/pali/igmpproxy/releases/download/${PV}/igmpproxy-${PV}.tar.gz \
-           file://0001-src-igmpproxy.h-Include-sys-types.h-for-u_short-u_in.patch \
-"
+SRC_URI = "https://github.com/pali/igmpproxy/releases/download/${PV}/${BP}.tar.gz"
 SRC_URI[md5sum] = "3a9c2cb42c1f5ee0cb769a4884545641"
 SRC_URI[sha256sum] = "d351e623037390f575c1203d9cbb7ba33a8bdef85a3c5e1d2901c5a2a38449a1"
 
 inherit autotools pkgconfig
-
-CFLAGS += "-D_GNU_SOURCE"
-- 
2.17.1



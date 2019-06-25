Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id D5A167DD6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:50 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id s49so25770824edb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EaRONJQR4isqYdrUoQwHJ5Wa1zBhjclla+owtWnis0I=;
	b=ELcNVi07/oooz8K2Fo5BxVog+UkBuG+m9BSFTXaNHO/PYdwzH9kaFFoF0BloE8wg5v
	r1J7MlAK3hjIqZo7aGKAj6ekPthkTXbsu7O/9r6pbFCvOyIepE+wRqwJ7pPZP1R3sof8
	nzTXm/svKAZNYt6sGOpySi3aS/4R3cxor6TSVp4MroFOZu6olj9MIkIS4SCfKHcODXwn
	TiSBz+DFdNaK4NtznG1xc9fyC4Itkmr+TWYvRSHww24LB4zv6UjpXZjqf/7mCXe+xBiP
	O4pvTJyEk2IP1eLbaBGGy4cSahwVMbkFPNYC+EbLTvCHCRIpHLWpHURVLswweL6qZ/EJ
	93jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=EaRONJQR4isqYdrUoQwHJ5Wa1zBhjclla+owtWnis0I=;
	b=o0Mt3iR4J6WFjIccEFF+W9/qyUj5tofqyg6rRx8u1vW0CcIu2FBNBBWIvGLy4dltRi
	mV/I+htmDVttVhqb6pTlS98DosoA9Ar4Q0R+fsD7ONGn8m7RDYueW5xIo9PEVkkGyJxh
	uPosI0GKI/AvRVztEj5rcdK0BArGrnC0LZb1My5liolZuIP1A3sNSTx836n8FKSbmVso
	ZE8CE0e6sKQdhsQPfxcQnSbtFk9cLmmgq57r0nEN7DPtPSjV+/cMVz2P6SUv2+iXtIX+
	/kS3degzHX2fR1MLJ9UPVDsWBA3q8YImCLfGVzp7+Ret83fEdOFieWsTdrK7DF2Cs73f
	3WNQ==
X-Gm-Message-State: APjAAAWqL5+5vfM0JjkK5QG5AveSLXs1D8Ve4Bm0v4aW9wGLHBTYEr+H
	s5+lxBDdH9xD46VES8bb36/MG3uBQJc=
X-Google-Smtp-Source: APXvYqzwV2TYT41ePn1yrH+X1t0uvaTLU1F2SLvl3YSK1RmRRyaDRWKLUabTy0l7Y/1XpFuWLq7ViQ==
X-Received: by 2002:a50:974b:: with SMTP id d11mr133638551edb.24.1561449171472;
	Tue, 25 Jun 2019 00:52:51 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:50 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:18 +0200
Message-Id: <20190625075223.13585-19-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 18/23] jlex: Do not build as an all PACKAGE_ARCH
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:51 -0000
Content-Transfer-Encoding: 8bit

jlex RDEPENDS on non -all package and breaks multiconfig.

Fixes:

ERROR: mc:qt5506:jlex-1.2.6-r0 do_package_write_deb: Fatal errors occurred in subprocesses:
Command 'PATH="/workdir/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/workdir/repo/poky/scripts:/workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/recipe-sysroot-native/usr/bin/allarch-poky-linux:/workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/recipe-sysroot/usr/bin/crossscripts:/workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/recipe-sysroot-native/usr/sbin:/workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/recipe-sysroot-native/usr/bin:/workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/recipe-sysroot-native/sbin:/workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/recipe-sysroot-native/bin:/workdir/repo/poky/bitbake/bin:/workdir/build/tmp/hosttools" dpkg-deb -b /workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/packages-split/jlex /workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/deploy-debs/all' returned non-zero exit status 2
Subprocess output:dpkg-deb: building package 'jlex' in '/workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/deploy-debs/all'.
dpkg-deb: error: unable to create '/workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/deploy-debs/all': No such file or directory

ERROR: mc:qt5506:jlex-1.2.6-r0 do_package_write_deb:
ERROR: mc:qt5506:jlex-1.2.6-r0 do_package_write_deb: Function failed: do_package_deb
ERROR: Logfile of failure stored in: /workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/temp/log.do_package_write_deb.1491

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/jlex/jlex_1.2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/jlex/jlex_1.2.6.bb b/recipes-core/jlex/jlex_1.2.6.bb
index 45d76ed..b8f9ffb 100644
--- a/recipes-core/jlex/jlex_1.2.6.bb
+++ b/recipes-core/jlex/jlex_1.2.6.bb
@@ -3,6 +3,8 @@ AUTHOR = "Elliot Berk, A. Appel, C. Scott Ananian"
 LICENSE = "JLEX"
 LIC_FILES_CHKSUM = "file://Main.java;beginline=148;endline=166;md5=9bf4a6a951053991db64f9d7330d648a"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 RDEPENDS_${PN} = "java2-runtime"
 RDEPENDS_${PN}_class-native = ""
 
-- 
2.20.1



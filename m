Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.7429.1586164850594040751
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LoiAH9ar;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id h2so5915001wmb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Db6IEmf6jB4F1NvI4OVV55aYAoWiSRWMxy6pyV+GMvQ=;
        b=LoiAH9arwtYWL9+cgyPbhsUzoGPlYYNSSvBHQyKiLhOzefrjD5Fatlpjvo/2i0Z343
         RBr+LpiyFYvZ0ObdPqNVwGv/vR2Ug8H1xkpIJ8DuWiADoWLuE9AQvOGXoW8YX1XNXX8c
         V6ZM3XHetBjGHOtAzeopurtdWPGYFdXXqUDxwRHDB995btNv0AgSCyB74mygXOm2Y/8F
         bAkRC7B5uE0p/vcJ+KU2PfFpOuMtHqUmUEyZ4gqt7hOUXjg1DcJnpKJotUyT7x2JGNvf
         m2qRS/CCGwOkVEVEmhdqvifWCfGvZaGyv8vFVicY89l8NGxyED2VGRrkf9ilBCNM7666
         bZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Db6IEmf6jB4F1NvI4OVV55aYAoWiSRWMxy6pyV+GMvQ=;
        b=TLdAIzwS4FqGkmPKJq1emCJsUGxXiut/+/V/b7EdzT7jTJmIO/J1rKPRDbilLwNCIS
         1v3p1INoqHAIwj+O0uZDTanAfbCEpAFn55NXAR7m/Ibj5EJFex0EjpdqOo9BKTtr57iK
         JAh1X3adWd3xzj5t/QuhcJ8s0H2QH/pCeBIJr0ldF6vYi00xdUhlqN2M5a3lfefBQbLw
         /S6ulzueeebgdpectju74fHoQs3gPboFKhmg289oUIJceaLZpT/3U7S8NwQ62BQd+yhQ
         7hx+gY6rVz3KOk7XlPiywxm5P7uTXmonWwRJgQM2lDhIivtr69iI3cd6sYTPLlDihdi0
         YUng==
X-Gm-Message-State: AGi0Pua2ZJF5BbkxS43UxP4zomXEOqno0oDdlZFJ0WQT4RVDUE4LuBP4
	L8GDdSTFDApgML0NhNsJq6do28D11lw=
X-Google-Smtp-Source: APiQypJzKVr75MIJ/6uoyRExu3fXosQNeuTyZHSSLaR3utK0lWmQFG6frHllRnhzlLbvEKpo3TPBnw==
X-Received: by 2002:a1c:bb08:: with SMTP id l8mr6818973wmf.168.1586164848404;
        Mon, 06 Apr 2020 02:20:48 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:47 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/14] libsigc++-3: upgrade 3.0.2 -> 3.0.3
Date: Mon,  6 Apr 2020 11:20:25 +0200
Message-Id: <20200406092032.3574-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2020-03-25  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	3.0.3

2020-03-25  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	README.md: Better describe when maintainer-mode is necessary

	As a libsigc++-3 tarball does not contain generated source code,
	maintainer-mode is not always necessary when you build with Meson
	from a tarball that was created by Autotools.

2020-03-24  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	README.md: Improve the Build section

	and remove README_build. All build information is in README.md.

2020-03-10  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	meson.build: Update version to 3.0.2

2020-03-10  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	examples: Disable deprecated API when building with Meson

	Deprecated SIGCXX API is disabled when example programs are built
	with Autotools. Do the same when building with Meson.

2020-01-13  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	README.md, README_build: Describe building with Meson

2020-01-08  Robert Middleton  <robert.middleton@rm5248.com>

	Added example of using libsigc++ with Qt

	Pull Request #35.

2020-01-06  Lennard Berger  <lennard.berger@student.uni-tuebingen.de>

	tests: Replace C-style casts with static_cast<>

	murrayc-tuple-utils Pull Request #4 .

2020-01-02  Kjell Ahlstedt  <kjellahlstedt@gmail.com>

	docs/docs/reference/meson.build: Check if perl is found

	Don't use perl.path() when configuring Doxyfile, if perl is not found.
	Perl is not required, if build-documentation=false.
	Fixes #53

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libsigc++-3_3.0.2.bb => libsigc++-3_3.0.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-3_3.0.2.bb => libsigc++-3_3.0.3.bb} (77%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.3.bb
similarity index 77%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.3.bb
index 26bd02c7b..fc4f5d649 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.2.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=959bffe2993816eb32ec4bc1ec1d5875"
 DEPENDS = "mm-common"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/3.0/libsigc++-${PV}.tar.xz"
-SRC_URI[md5sum] = "1f93f8ed4ead38e876157834b2c57c21"
-SRC_URI[sha256sum] = "4b77676de1e74774ec456bcc6ac6f04a2791a12cc1fe07f8305d4c3c86e2f339"
+SRC_URI[md5sum] = "8dca4559e732f47710370baa8bc2e66f"
+SRC_URI[sha256sum] = "e4f4866a894bdbe053e4fb22ccc6bc4b6851fd31a4746fdd20b2cf6e87c6edb6"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
2.21.1


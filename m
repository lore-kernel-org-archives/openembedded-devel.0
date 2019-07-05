Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id BECF97ED3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:19:07 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id w13so7951826eds.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EaRONJQR4isqYdrUoQwHJ5Wa1zBhjclla+owtWnis0I=;
	b=a/1uWUV4Xfkinb9G70XBQnmwHLzeoHXkX8wGK7JtFPieTfTOulsR+iwpyiu5500HTc
	JAN9vuE7rCtAvaTXaGhuZeApyTd1lqKBKMBvyQ+NlrTnBuHFpbXtSJmwZj0DapKSrzSn
	8bNK2xdWFaX3UbLvoF7WN4+vvAenhoQJ+0WwD/oHrLvK4axrS5HTn4wFO7oqTvjtggZz
	lCHdeWb/DsFQI8vPOIpdtMe2DbapSUZn+QjkI2JihXS84W8PdsObMPwxidEmZ33g1WZj
	UG8UeLAB4/gXCaQ2MURvrw8+s4hVrPO+AKKr/QfwmJ4kd11qXV8J32uVd0KmIKFSexf+
	t/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=EaRONJQR4isqYdrUoQwHJ5Wa1zBhjclla+owtWnis0I=;
	b=L/1dsGJypAq/3lNYwAgyzz7k5Rhj3NwJOaQ/5AHGixIdC92K7AREdq5y3gupG9GjG8
	yEz7ZMQiscjgnqF30ZQ46ubNWfE4lk7keFOzFzTZcz7kZKOFvjRSIAFQ7xrxJGuttofp
	RjPfs0/7w0B3VX+T9MaquQ6CtPcXjE74tIUXKYwPLvW5AqlXOzJTZFMXX7z0a3SAJCWS
	ESFoIq00PA81HHE4D5b/EOQdBUuj2Lb5CHLP72dX44NFr0MT8r1Kv/EtIsjuqrhch0e9
	vTi5SOcmyTVS7MPePWvBF/V2VuDZLTlAuYUFMEOb9/DewSf8Z/09p09iobiBERI+zBDj
	BPlg==
X-Gm-Message-State: APjAAAUwCK6+UvCH0HeqNyCRGP+hQulGA+AbCavoSiRQOeuJu0caKe7w
	G3lYV1/O3uQG9CGCyOGXKqd5DhlWsdI=
X-Google-Smtp-Source: APXvYqyjw3Dw6QwyRrZ5FoQUzqEw/F+P6PkyAUv7PAoYSNd7QcJ6kFlN3Y3mqxKLeOtNRqI8ML3/SQ==
X-Received: by 2002:a17:906:b315:: with SMTP id
	n21mr2977945ejz.312.1562325548228; 
	Fri, 05 Jul 2019 04:19:08 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.19.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:19:07 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:19 +0200
Message-Id: <20190705111824.22255-19-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 18/23] jlex: Do not build as an all PACKAGE_ARCH
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
X-List-Received-Date: Fri, 05 Jul 2019 11:19:08 -0000
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



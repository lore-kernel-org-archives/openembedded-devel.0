Return-Path: <rehsack@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD7D7DDA2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 17:27:09 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id v38so13649270edm.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=PM1aeE5dvKZKCnMnZl9ZTcsfe0Hh6Vjzdqz7uMRZMeo=;
	b=Z7GZOwbDC7drd2ks92LJ50xwyZjm5421GPw4zMrZ+3bC291erFWP/dnGUcn/5fWnb0
	r5v6+2EHW+GON5Rt86ZAKOnpcgrhTLIXD2DRx4s155WA0MCxbKPVUSvP6JwmFzWVUBBq
	sgqthbQU7g+sMU8iyhR50LTsoaf5Mcf5yBQ5zYXy3ps2wOyxsku1hHTXT6apC+MeWjkp
	1gqKYgGCcg4KwzGqrlVFmoQiP8fpTxpRQlDowmia9tpYqEZjtPHlSreL6+0H/zeekZz5
	GRX1dwy3BR1RcQYIoUr/H+jxJUBUFqE16SptZ93gZOSRCz0Dr8lfH8rzRrLmnPOVrVdf
	0Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=PM1aeE5dvKZKCnMnZl9ZTcsfe0Hh6Vjzdqz7uMRZMeo=;
	b=FXFqsTK9WkkxJET7sZpNCgWiTyvJxIlnn9YFcwhH1FoUJecPriFTA4ajXQ4vik4D/h
	h6VWXCvRqefL7R0NQMb6RAeZI5YhjxXsGIFa3sVOo6UcXbUtBQHwMPSpcByLjmuEZ5zK
	clgSpNpHfLEtdn4M+i5RqX9++SBefRMliyi/gR7dmttHSs3NmF9WxlrCvLdkfU1qhQyW
	1CSAmpyA3DiiuqZte87rsgnHbEb4ZQA4Mr5EUCp3nlTa9ptso183IorECaX2JtPr+r+e
	FQIF5rV/FtjVKEHcS8iInirAWWZdN5GYkrTyHb9fB7M9nqgA25MTTbTgV/7kMiUolI09
	u7yA==
X-Gm-Message-State: APjAAAWQf0MBqsRQh/sUI0l4KTbut+MddWQ/nFQb1S3U4vZhS7di8pA7
	xLq7Zdjw0xVTGAJ67GUDZvsZR+5R3Ig=
X-Google-Smtp-Source: APXvYqzM1AtVlca94mnALZhyIOfAYkFDz23FbNdrG7rjrehlhnoM49ZiFag+rHZfTiBHQeLKQ1YyFA==
X-Received: by 2002:a17:906:7621:: with SMTP id c1mr902740ejn.39.1569259630413;
	Mon, 23 Sep 2019 10:27:10 -0700 (PDT)
Received: from beaker.muppets.liwing.de (p5B25B936.dip0.t-ipconnect.de.
	[91.37.185.54]) by smtp.gmail.com with ESMTPSA id
	c15sm2242301edl.16.2019.09.23.10.27.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 10:27:09 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:26:50 +0200
Message-Id: <20190923172650.21097-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-oe][PATCH v2] libstatgrab: add recipe for libstatgrab-0.92
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
X-List-Received-Date: Mon, 23 Sep 2019 17:27:10 -0000

With the recent update at begin of summer, which includes the fix
for nxp bsp issues, it's time to bring libstatgrab to more people
than the few who use it in datacenter monitoring.

Language bindings will follow once base library is settled.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../libstatgrab/libstatgrab_0.92.bb           | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb

diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
new file mode 100644
index 000000000..4ede3c8c6
--- /dev/null
+++ b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Utilities to collect and visualise system statistics"
+HOMEPAGE = "http://www.i-scream.org/libstatgrab/"
+
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "ncurses"
+
+PACKAGES_prepend = "statgrab statgrab-dbg saidar saidar-dbg ${PN}-mrtg "
+
+# don't use the git tag unless docbooc2x is available to build the manpages
+SRC_URI = "https://github.com/libstatgrab/libstatgrab/releases/download/LIBSTATGRAB_0_92/libstatgrab-0.92.tar.gz \
+          "
+SRC_URI[md5sum] = "5362b2ddbec54b3901e7d70c22cda249"
+SRC_URI[sha256sum] = "5bf1906aff9ffc3eeacf32567270f4d819055d8386d98b9c8c05519012d5a196"
+
+# Perl5 is for tests only
+EXTRA_OECONF = "--without-perl5 --with-mnttab=/proc/mounts"
+
+inherit autotools pkgconfig
+
+FILES_statgrab = "${bindir}/statgrab"
+FILES_statgrab-dbg = "${bindir}/.debug/statgrab"
+FILES_saidar = "${bindir}/saidar"
+FILES_saidar-dbg = "${bindir}/.debug/saidar"
+FILES_${PN}-mrtg = "${bindir}/statgrab-make-mrtg-config ${bindir}/statgrab-make-mrtg-index"
+RDEPENDS_${PN}-mrtg_append = "perl statgrab"
-- 
2.17.1



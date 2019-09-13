Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2576B7E713
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:05:41 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g207so2925767wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 07:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=KyIzz+qmdYcQ0ItM4DhrOodMX3Dhmgw6YeCVpJ+XLks=;
	b=aun9BI0x/gqZ5U7iHtG+5hTt8O9X9NNecjvRJuo3cpUmtmmyvIj6iXArhy5n3NmlKV
	gzt/tz4hwbMclRn2zUqbD9XdS16RvkorGoAMSx2UTTHOxQbmrjUFdRpCXeJQZ6cvfbQb
	8WeoTQfx4HX6cglIJm3PagMsVBc8qoar6uF4e+JvZNwanyTU9GYB5hwaDdoOI+qwcnVZ
	v/ORajcOfyfvs9DmO1ZvWkEYTmq0Jg3YH1EkhJYNNEtarTUtCUV5EiAb8+gt6MUd04DJ
	Fm02j0iWFttU01Mcr3dDOP1ztTdzeNg6ts4N+S6cjl/gPJznjaX3bRadzkqpcVVJ+WA1
	e59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=KyIzz+qmdYcQ0ItM4DhrOodMX3Dhmgw6YeCVpJ+XLks=;
	b=Jb5T6NVbo83zU0d71P93TIp+L8QzfEsLtc0EIFp0sERYi+sba4qaw062WkaSGCmLFw
	JYPui/rdRpSaH0z2Gzml5dcYX2pW9Rgtn2rHUb3PfM1niPAr2qi21DJZgdtCgxrSMPx9
	crrV/x5YT1E3+I301z/5nlgRADy9yKoRxFFMenw0bMAT1ZP5FrA5YCrSp9hsbgQoPG7R
	kfNCDIEYx/bWCis88/ZGJxdLzWtjiCj/YF02+E7d7/bUhw9QoeYrQQtSBxaLx8C/Z3Pw
	4g4EGm8d9m/HOQxBrbCGaJ75Yq73DdOnb7PmywUcf4UzW5gdaHy8UFs2IhqZPp8pZvDF
	UiJg==
X-Gm-Message-State: APjAAAV4mXED8KyAYI9oXGyLCd0itgq2IidY/cZcqLqBA4R3RksqlByx
	RSCBlcpyur9Xyo0r+rCECzDOxaCTlMg=
X-Google-Smtp-Source: APXvYqwPpxGJK9Uk7pu2Sg1HXEp47Aknp0TZL75mdhg5/YC6nx70h6Y7g0aNGdtNBNvW+E+ezcl79w==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr3015976wmj.127.1568383541649; 
	Fri, 13 Sep 2019 07:05:41 -0700 (PDT)
Received: from beaker.muppets.liwing.de (p5B25B936.dip0.t-ipconnect.de.
	[91.37.185.54]) by smtp.gmail.com with ESMTPSA id
	q192sm2935493wme.23.2019.09.13.07.05.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 07:05:40 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 16:05:33 +0200
Message-Id: <20190913140533.7328-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-oe][PATCH] libstatgrab: add recipe for libstatgrab-0.92
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
X-List-Received-Date: Fri, 13 Sep 2019 14:05:42 -0000

With the recent update at begin of summer, which includes the fix
for nxp bsp issues, it's time to bring libstatgrab to more people
than the few who use it in datacenter monitoring.

Language bindings will follow once base library is settled.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../libstatgrab/libstatgrab_0.92.bb           | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb

diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
new file mode 100644
index 000000000..ab08d8bb2
--- /dev/null
+++ b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
@@ -0,0 +1,26 @@
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
+SRCREV = "fa7e1d9fe76c3a1a7ade264c746b3f5edc566f3b"
+SRC_URI = "git://github.com/libstatgrab/libstatgrab.git \
+          "
+# Perl5 is for tests only
+EXTRA_OECONF = "--without-perl5 --with-mnttab=/proc/mounts"
+
+S = "${WORKDIR}/git"
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



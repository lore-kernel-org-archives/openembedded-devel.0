Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 041F37E28F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 21:09:28 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h11so116950ljb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 14:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=yV6MAXK7spPScycRYYenI4QlBJc03kHy8iYJmokapvg=;
	b=b3qjKrzgPOHq4ZDsjJ0IdKPKCbAKanMO/l5titKafR2oihbP67XKQCIQrn2Gdd7tAN
	84+OiUEnNv+VHMPUcbC1+/CPFP4liDhDGLeqiuMiiScsR1XHA7ccMXuOUGzidPzZ+OSr
	U7PmCo/VNSgrqPl+o4xPOC0DM14YdvvnFYBoBq90wm5vXmpxu+LJtt3cJ2+G47bWXtcK
	TTjCaC7DJt9DfP6g4XLZopxoG4ZGLXTRqMFz80JuCGjKQ3e+3A1u3msFYgQ01LA7Cp4K
	Xhz2H/omx8YGFXmTuH8kDwB63/C86oxzOHmUuIaGbq/qF+Yp6ru9nWXCzuFDX39hWyyE
	ilSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yV6MAXK7spPScycRYYenI4QlBJc03kHy8iYJmokapvg=;
	b=aDhz2nOHGl+uJ3oFxtnuflUgL7NneTOITf5BCUQ02NVKVPFkdk25MgKZaLnfGVjepd
	+pjd/Bu5Ejhb5u96lz/qnnk9y3Q/p3qtrrlTdUUZPKB0cp0uavG7xybDZ5Wz0Kzma41Q
	CIPpHbecjC67wDuDQDnIaDdX1eNldJflMGyObgLBkdl6DlpeLqEW0l8MpQgBwEcAc+/7
	G0h/VlvwJVuO44uB5tDdVArzgv8fKhsmi0YzNfWXNUeNAuq2su2mAFSWtxyxTFNQ2uJS
	k8+Cl4nmnAw1eAWWqG3L55yUpUXvr2rX+pdzw/55Nz1sfqDEDtiYSRECzOPoqjdpVh1K
	n1ew==
X-Gm-Message-State: APjAAAVjQmASHzU8hguH3gORWy1IibipbYjFrKUVsZyPsACzDrgzLU3v
	u6mr4oMvBzWnpa++Id0dRoekAw612oM=
X-Google-Smtp-Source: APXvYqwfQLTIUeMI5JsPWkR6mSjSlWu/fanTz+NJdlvLddaWAeOB1mKQHplez4xxLDuiY9UXKDmYqw==
X-Received: by 2002:a2e:9b46:: with SMTP id o6mr5319504ljj.76.1558472969003;
	Tue, 21 May 2019 14:09:29 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	o70sm4953203lff.53.2019.05.21.14.09.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 14:09:28 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 May 2019 23:09:26 +0200
Message-Id: <20190521210926.5236-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] lldpd: update to 1.0.3
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
X-List-Received-Date: Tue, 21 May 2019 21:09:29 -0000

Removed patch is not appropriate anymore.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ....service.in-Use-fixed-path-for-mkdir.patch | 32 -------------------
 .../lldpd/{lldpd_0.9.8.bb => lldpd_1.0.3.bb}  |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch
 rename meta-networking/recipes-daemons/lldpd/{lldpd_0.9.8.bb => lldpd_1.0.3.bb} (91%)

diff --git a/meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch b/meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch
deleted file mode 100644
index 4876e1794..000000000
--- a/meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f9f3e4dd31588cce5f655730da7b5c3f56a9bdc1 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Tue, 26 Sep 2017 09:19:51 -0300
-Subject: [PATCH] src/daemon/lldpd.service.in: Use fixed path for mkdir command
-Organization: O.S. Systems Software LTDA.
-
-@mkdir_p@ is expanded to host tools path ../build/tmp/hosttools/mkdir that
-doesn't exist on target. Remove @mkdir_p@ and use /bin/mkdir -p to
-create /var/run/lldpd directory.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- src/daemon/lldpd.service.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/daemon/lldpd.service.in b/src/daemon/lldpd.service.in
-index fdb7338..4291830 100644
---- a/src/daemon/lldpd.service.in
-+++ b/src/daemon/lldpd.service.in
-@@ -9,7 +9,7 @@ Type=notify
- NotifyAccess=main
- EnvironmentFile=-/etc/default/lldpd
- EnvironmentFile=-/etc/sysconfig/lldpd
--ExecStartPre=@mkdir_p@ @PRIVSEP_CHROOT@
-+ExecStartPre=/bin/mkdir -p @PRIVSEP_CHROOT@
- ExecStart=@sbindir@/lldpd $DAEMON_ARGS $LLDPD_OPTIONS
- Restart=on-failure
- PrivateTmp=yes
--- 
-2.14.2
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.8.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.3.bb
similarity index 91%
rename from meta-networking/recipes-daemons/lldpd/lldpd_0.9.8.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.3.bb
index dbd84cf67..9a912a2fe 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.8.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.3.bb
@@ -9,11 +9,10 @@ SRC_URI = "\
     http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
     file://lldpd.init.d \
     file://lldpd.default \
-    file://src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch \
     "
 
-SRC_URI[md5sum] = "8809600492f6b73149eb19158e819c1f"
-SRC_URI[sha256sum] = "9ee494e91bc33938575b2c09b26188c486ef8eac6e2155d250c189cc4e988c4f"
+SRC_URI[md5sum] = "04844328f053ee343344d892efb8a00c"
+SRC_URI[sha256sum] = "39fced395168015416bfe78b95414facf066f841f349024433aa20ab54e4c360"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
 
-- 
2.17.1



Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id A470B7E48C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 18:58:45 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 14so6484135ljj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 11:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lyYJJ0HTcX7LyqLLGWbdpbGjQ0vE4RSovCjrQDsp52g=;
	b=ZiqUJpqCZAyNaa2UaDMYL5BEUobxOdKPUmkuSDAKgQrS+9L8tx5Mr4bMokh/EJKLGF
	Ow71nzTG85s2JQnXTTms1u3WHun6UlmpFDsTQ0O151SK4JATflTWeNm+pcFhgeTtRpkj
	jvoL5LKPzITcIdqVJ5E1VQaehkh+pIZOXfiJldc76bw066+T1r7lLQzj2aPX2vMdSyIW
	TMQBiRBwJivkVazEkWRDPU9QCd19qEaxlUi7CKb2T41fvPaurt741SapReOQtuVbdbJP
	u0mP/oEqj1358+XuDRumegBIY+SNeEZydNa2+8CooUh4XTeXc7Q3hLNyqOaDEPg+ZrlM
	mjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lyYJJ0HTcX7LyqLLGWbdpbGjQ0vE4RSovCjrQDsp52g=;
	b=USfDBHfRBeFMLi6Qe8FqRdYb3H00/Xs7BE1NtWCex9Ea6GhfiMRU9n+CEJp7DO5/EP
	aPCH4PSZkI8WeDY2Xxm4WjkxwpPyAjc7JOecWAczn1kGC7J27EFaux8l+CR51ZXr70Jq
	i+WZeZ7fH3k1m1y4gnaBMcR9i3vyTbeNZlcE7/54OEh423z2GwhGZXdxRqKYTbEEcsyA
	1b8CNkcrVkijLST1WmPr8lAf5P26zRfzlg2Sx+3PgJq14CQRL+ePBhvYbWLdyNHzLEP/
	3QEo3aC/OeD8SfRBHoKmKv2i3FohDqdcGqkhWC0o5jo5rxh1H27afGx91Mq6HcHbFuCQ
	XCEQ==
X-Gm-Message-State: APjAAAUzwOwTIywzbqZW5EDRQDD5RyiYXlPAbaJ1ktD+Iw788NYeJ+ZQ
	7EomcH32jr7X6updkB2qHkUP3Dh1G7o=
X-Google-Smtp-Source: APXvYqwLg48Rv5t3MP1BG9Z7/NrDh4b6NisCJeLcf+Lg8pQ2O5E7OVzXg/x1ODdTYluUbd6Kdnr+zw==
X-Received: by 2002:a2e:91c3:: with SMTP id u3mr20068605ljg.130.1558637925848; 
	Thu, 23 May 2019 11:58:45 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id j7sm83960lji.27.2019.05.23.11.58.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 11:58:44 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 20:58:40 +0200
Message-Id: <20190523185840.31256-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-networking] lldpd: update to 1.0.3
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
X-List-Received-Date: Thu, 23 May 2019 18:58:46 -0000

Removed patch is not appropriate anymore.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...1-priv-include-limits.h-for-PATH_MAX.patch | 27 ++++++++++++++++
 ....service.in-Use-fixed-path-for-mkdir.patch | 32 -------------------
 .../lldpd/{lldpd_0.9.8.bb => lldpd_1.0.3.bb}  |  6 ++--
 3 files changed, 30 insertions(+), 35 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/0001-priv-include-limits.h-for-PATH_MAX.patch
 delete mode 100644 meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch
 rename meta-networking/recipes-daemons/lldpd/{lldpd_0.9.8.bb => lldpd_1.0.3.bb} (91%)

diff --git a/meta-networking/recipes-daemons/lldpd/files/0001-priv-include-limits.h-for-PATH_MAX.patch b/meta-networking/recipes-daemons/lldpd/files/0001-priv-include-limits.h-for-PATH_MAX.patch
new file mode 100644
index 000000000..9ea4a9ffb
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/files/0001-priv-include-limits.h-for-PATH_MAX.patch
@@ -0,0 +1,27 @@
+From c6a283bfcbfefe9c89113e81b0f792c12c4eefb8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?S=C3=B6ren=20Tempel?= <soeren+git@soeren-tempel.net>
+Date: Mon, 25 Mar 2019 18:43:03 +0100
+Subject: [PATCH] priv: include limits.h for PATH_MAX
+
+Upstream-Status: Backport
+
+Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+---
+ src/daemon/priv.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/daemon/priv.c b/src/daemon/priv.c
+index f4d6bdf..ba5ae58 100644
+--- a/src/daemon/priv.c
++++ b/src/daemon/priv.c
+@@ -27,6 +27,7 @@
+ #include <unistd.h>
+ #include <signal.h>
+ #include <errno.h>
++#include <limits.h>
+ #include <sys/wait.h>
+ #include <sys/stat.h>
+ #include <sys/socket.h>
+-- 
+2.17.1
+
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
index dbd84cf67..e650b5795 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.8.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.3.bb
@@ -9,11 +9,11 @@ SRC_URI = "\
     http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
     file://lldpd.init.d \
     file://lldpd.default \
-    file://src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch \
+    file://0001-priv-include-limits.h-for-PATH_MAX.patch \
     "
 
-SRC_URI[md5sum] = "8809600492f6b73149eb19158e819c1f"
-SRC_URI[sha256sum] = "9ee494e91bc33938575b2c09b26188c486ef8eac6e2155d250c189cc4e988c4f"
+SRC_URI[md5sum] = "04844328f053ee343344d892efb8a00c"
+SRC_URI[sha256sum] = "39fced395168015416bfe78b95414facf066f841f349024433aa20ab54e4c360"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
 
-- 
2.17.1



Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.3133.1599324970566910579
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jGUsDwk5;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 2so4622927pjx.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YjKUBTTeVTSBB80M/a0ns6nQm43UjKsnmvSarKvrJtU=;
        b=jGUsDwk5QZmJbARKur5RFp0XMblEWGdKLf+UdbgeSKGg3sMXTyYTKoXybPwKlgk3Un
         2y83NSVtgNYI5wJsWQuap+eLZ1h6orw7eqkmJrcLswan4KQ7FRUeW+TtrNGt0cSwqpJz
         U+X5AwXJX1H1lMp9T5o+JfGod5PGJ9Uc4K5H9gcsNjfx2CRrJ5qWUi3v66nVXquAu1N8
         tigpwBrlLe9JahtXjt7WIdk5N3FndeVlRnju+66RHw6NcOerGFbsSo0dxaNxbzX9TTIR
         +q28EQaSY8hT2PSBwM8nxWarTzbc5FMRV+PdGLlJkkxg05NeQH3uDVaOhWClWbqpAzKw
         Fn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YjKUBTTeVTSBB80M/a0ns6nQm43UjKsnmvSarKvrJtU=;
        b=QGquxNePr0bZ4WUnhYbkEa7wtwwTxBM4FfbwFUEI/z4ZjQE7471w1vE3dBcNDp9MFy
         9JxhK1bVUX7ywUy/2BkrJ5xEFqVnDnL/qUSk+oLJahwaBDnXTuQGiw/xxTYJIEj51A16
         4CAYOffuhXIxss273a/DINsNPBMyCbHUX4qZfrtFFDk3Y994RZJ/Nh/4twKJQXX5oVwV
         Z4+zstdcSgnVyehXnDSR+ysPQtJc+brsWc+4XkYTw9roJqxc6lgH4Ot2az350col13au
         yFJ6HVQdzWjcJQpy5clDbj43WyqJSnDdyBlN1398BBzXgZ1xTDbOc68UYDV+LqcCwTyU
         kTdQ==
X-Gm-Message-State: AOAM5320fd0eq/GhB55dd9ykPn9gSm4+9aR0TnTRk91r5REPlc5RB0YF
	3h8nP+hxwTP4FJ6Kqe8qqhPWOIYYZCg=
X-Google-Smtp-Source: ABdhPJxhgfLlNsifGGUlznvUkcAGtqWHAX5nHr1AZK77BQVNDSZ9J/KnJ/woFUiEVw4AUq4g240Alg==
X-Received: by 2002:a17:90a:384c:: with SMTP id l12mr12579748pjf.27.1599324969845;
        Sat, 05 Sep 2020 09:56:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:09 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 04/20] radvd: add /etc/radvd.conf
Date: Sat,  5 Sep 2020 09:55:47 -0700
Message-Id: <022b5a307cb60273ac2922ae11af4e5ed219e8ff.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

When starting radvd without any configuration the following errors would
be triggered.

"""
root@intel-x86-64:~# systemctl status radvd
● radvd.service - Router advertisement daemon for IPv6
Loaded: loaded (/lib/systemd/system/radvd.service; enabled; vendor preset:
	enabled)
Active: inactive (dead)
        Condition: start condition failed at Tue 2019-09-24 13:29:36 UTC; 3s ago
	    └─ ConditionPathExists=/etc/radvd.conf was not met
"""

Normally the user should create and configrue the /etc/radvd.conf
manually.  However the radvd provide a example file for redhad located
at "radvd/redhat/radvd.conf.empty". When installing, it would copy
radvd/redhat/radvd.conf.empty to /etc/radvd.conf. Also add this empty
conf here to used as an example of configuration

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5af77740a46c334978adc7f37f53ea9a318d3a33)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-daemons/radvd/files/radvd.conf     | 18 ++++++++++++++++++
 .../recipes-daemons/radvd/radvd.inc            |  5 ++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/radvd/files/radvd.conf

diff --git a/meta-networking/recipes-daemons/radvd/files/radvd.conf b/meta-networking/recipes-daemons/radvd/files/radvd.conf
new file mode 100644
index 0000000000..c006f86313
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/files/radvd.conf
@@ -0,0 +1,18 @@
+# NOTE: there is no such thing as a working "by-default" configuration file. 
+#       At least the prefix needs to be specified.  Please consult the radvd.conf(5)
+#       man page and/or /usr/share/doc/radvd-*/radvd.conf.example for help.
+#
+#
+#interface eth0
+#{
+#	AdvSendAdvert on;
+#	MinRtrAdvInterval 30;
+#	MaxRtrAdvInterval 100;
+#	prefix 2001:db8:1:0::/64
+#	{
+#		AdvOnLink on;
+#		AdvAutonomous on;
+#		AdvRouterAddr off;
+#	};
+#
+#};
diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index 59a07d78dc..802dbe34e9 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -18,7 +18,8 @@ SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
            file://radvd.init \
            file://radvd.service \
            file://volatiles.03_radvd \
-           file://radvd.default"
+           file://radvd.default \
+           file://radvd.conf"
 
 inherit autotools useradd pkgconfig systemd
 
@@ -52,6 +53,8 @@ do_install_append () {
     for i in radvd.conf.example README; do \
         install -m 0644 ${S}/$i ${D}${docdir}/radvd; \
     done
+
+    install -m 0644 ${WORKDIR}/radvd.conf ${D}${sysconfdir}/radvd.conf
 }
 
 USERADD_PACKAGES = "${PN}"
-- 
2.17.1


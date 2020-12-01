Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.30.1606856460593500957
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Dec 2020 13:01:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DiXkSJBi;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id c198so7175595wmd.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Dec 2020 13:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BRxBXXxXFtilRsh189hbSxdNQBn3zb+e3toWSD9WQFU=;
        b=DiXkSJBiOhVTqkNAY7QLXl4IFpvroa8D/8I5ESMkzhKw/VbFisrA4jgLvPh67zX+Dr
         39aWpGW0jU+s3BiIl0wTDgO+AzfYZJ2mHSGlJhC/GGPPwXf4WyBlu2W0DK/gEioyrXdf
         YKmON6JAXGXkEv6ZK99iNxi6Y4jSRen6Eh02z4FPooipe2Uw81KMy1buI3MS0tfhYARl
         73MGpX+88n37xGnd+aNpwZSCJEOAEeSRrm5nLwAXZeC0mKh7FHmr/w9p9gh63pbN+943
         uDLNAV6dFELWgNs3MEX9mBhroER1NuJlCZ1iFHRJEDK8nOJA0XrVyc0QgVQ8zbyaGhMH
         r+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BRxBXXxXFtilRsh189hbSxdNQBn3zb+e3toWSD9WQFU=;
        b=UDlIS5wc+smBrU9OVlNWgODDNK+Y8RzwO8qFDR5vkM19wvgz9Y8JTiWQNoJXBW6h6w
         FzKcLp8+NWyE7/8Qw5nmN/9j7JmqNjOFOS5v7MGcsOv6qIkB5k2CDiXKdEtha57X1c0i
         yz3Jk3PYziYAlt4W60t8T/eHHHrbz8ulfYPzSS+3qG3toaSfn+fKL8eknTiFAU2nbhw7
         5lm/9x/2l4jh6R+ExwvJtFuLLcCYReeJK28iD5qkMYzPLxRGuovuJ1XBchp67i4UElYh
         VTslk7iYBTMakw4XlgKD4RSQeTxaYbGyF9qcNJEAURCcOhcU7s3XuWmUuKq3W5o2pBJl
         eHiQ==
X-Gm-Message-State: AOAM533gMImpb7VZYbtLmlG+iPARlS1GQVho4I1CiNxcPGWst+qEfhpu
	JkrLzVPPViUJiDn8yKTHQjf1YS289EU=
X-Google-Smtp-Source: ABdhPJzeiwHB4Z6v7JCrZ48bLfoi0XkF73G/ohV9AyY34GIzh2ELaIwwy/iIag2Pd+KTjDKVySnx0w==
X-Received: by 2002:a1c:bc41:: with SMTP id m62mr2456067wmf.46.1606856458575;
        Tue, 01 Dec 2020 13:00:58 -0800 (PST)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan (mob-109-113-138-119.net.vodafone.it. [109.113.138.119])
        by smtp.gmail.com with ESMTPSA id c9sm1142628wrp.73.2020.12.01.13.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 13:00:57 -0800 (PST)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: add upstream patch to fix CVE-2020-29394
Date: Tue,  1 Dec 2020 22:00:55 +0100
Message-Id: <20201201210055.979056-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More information on: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=976228
| A buffer overflow in the dlt_filter_load function in dlt_common.c in
| dlt-daemon 2.8.5 (GENIVI Diagnostic Log and Trace) allows arbitrary
| code execution because fscanf is misused (no limit on the number of
| characters to be read in a format argument).

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon/275.patch           | 36 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.5.bb           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
new file mode 100644
index 000000000..4edb62b30
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
@@ -0,0 +1,36 @@
+From 7f5cd5404a03fa330e192084f6bdafb2dc9bdcb7 Mon Sep 17 00:00:00 2001
+From: GwanYeong Kim <gy741.kim@gmail.com>
+Date: Sat, 28 Nov 2020 12:24:46 +0900
+Subject: [PATCH] dlt_common: Fix buffer overflow in dlt_filter_load
+
+A buffer overflow in the dlt_filter_load function in dlt_common.c in dlt-daemon allows arbitrary code execution via an unsafe usage of fscanf, because it does not limit the number of characters to be read in a format argument.
+
+Fixed: #274
+
+Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
+---
+ src/shared/dlt_common.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
+index 254f4ce4..d15b1cec 100644
+--- a/src/shared/dlt_common.c
++++ b/src/shared/dlt_common.c
+@@ -404,7 +404,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, const char *filename, int verb
+     while (!feof(handle)) {
+         str1[0] = 0;
+ 
+-        if (fscanf(handle, "%s", str1) != 1)
++        if (fscanf(handle, "%254s", str1) != 1)
+             break;
+ 
+         if (str1[0] == 0)
+@@ -419,7 +419,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, const char *filename, int verb
+ 
+         str1[0] = 0;
+ 
+-        if (fscanf(handle, "%s", str1) != 1)
++        if (fscanf(handle, "%254s", str1) != 1)
+             break;
+ 
+         if (str1[0] == 0)
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index f3fcee4d2..5066e76d3 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0004-Modify-systemd-config-directory.patch \
     file://241.patch \
     file://245.patch \
+    file://275.patch \
 "
 SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
 
-- 
2.25.1


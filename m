Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97ACC5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 10:21:28 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4425.1787307678718829664
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 03:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GpAWKRgH;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c160420289bso127585366b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 03:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787307677; x=1787912477; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q4hMa77+nfMBRzE2YA3jOvZ8AmQhhxPRHfCclfLKdg8=;
        b=GpAWKRgHnP7+jGYiyzpIkcYucE09jHVORJ0Ps5z2cUxcOMvLcnFSshFEKl1Di0UQXe
         hcPrSyMoyCihtMnQ9PXJoq/9PwwizgIDpRQvv4dJJcUKpv12ojsuW+IR8/46riBZo5Yv
         lSulpAWxoGHzRhfotPZg9OMyUxwf7NzDsq1FgrG+ApQezgIVYEtoyh6rgktF/3bmCTAX
         8lCb/MAvgGd9y6zfbMA4TL2tpbbrtX7qhqX2kS8Pv/X2jZT9yKZPNrwoCOVmPsSI2OK6
         4wvkNBDLyl64uYx/t7v31jTui5zgKTckgoicLiPYy+l8qUT3ERRgPfiO0TP61EHJuinK
         yOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307677; x=1787912477;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q4hMa77+nfMBRzE2YA3jOvZ8AmQhhxPRHfCclfLKdg8=;
        b=sy7K/RDSMeE9A6RIzdYhEnUZ6gA5OMusUUbdk6/noDS8hD8CfoFXgD/HmoEcbP5TJD
         cePas69LPolASHEoVbuvPpObyiOJqIdZFJtB6+AWMw2IpsM1nFcPOAMy7o7tbJ9dBwJU
         s331QMq6Cr6ZOIVJYW2Mn9obTfMafriKFf8hmt7jCMnm2/b7I+5X1+0jq9V6j1sA+JuV
         QQPhVGtPQWJ8XWbBzaRHN3j49z210DbfQe7AoZQ5kL7lRLgz//e1d6DyrxHRwBX03KwL
         JIj7nRTi3UR/Kd5SHmIDDX7p1pyPzoDmoVpvPOpaLXzta4VK7UDObN8noSzKXBih4iM7
         MXsw==
X-Gm-Message-State: AFuF++mcWnn/EZZqa/JmwZpwA5qPAn5uVNi0moAxEPNbezAm0kXPeMfn
	wZzAVj8j+PV+PSwLKqji2OS4lsJEiMMN91qoNMTpfycTLHliE4tUOlfe
X-Gm-Gg: AR+sD12fUKjZkmk/N9CcQG3vy/vR9Z0uZQtZwF3zk8HhZXM1ujINHSauxoof3ipTGoH
	1zJfAH9t+oxeGl8jwpsNZdFZQsmZW/O1H3u+ILJkmABxFckSiRdGg/5jT4nhNSrA+oR1XwFbKLX
	N52Ge2hys0ZVao0ohMYW8ojFUPtpPB2wiiA2ipPcrH31y1NjdmSp7Yz00N6ahNzcHI7KK39yIRQ
	nTfH5tXHLLeoo9PJUGLi3/e2tDK/iIJr1K1RWAWPk6XHwpTL/ljoToXgdDfqoiiiFn+U1NXyfM1
	Z/jk7+2S2/XCmD8v5S2ZcuRk/94nE4jMMW4ysrLkz1kmbr9/jOj+2JtOYVOTr1449xX+zGdapih
	kayMrlVkDMQMpE3+ln+F7ziEpO6GAGQL/FwUvuuX4ewRZH+nE5Za5LF5RfmI7Um+zS3V/vixPkH
	1N6Gz83b+xOzh3Kzi0fFtoN+RuAe0dQbrS5S+ePz2JuFG006ru4qkDQrPSbwE1NWOn
X-Received: by 2002:a17:906:5183:10b0:c16:84dc:9607 with SMTP id a640c23a62f3a-c246a704562mr457815666b.19.1787307676679;
        Fri, 21 Aug 2026 03:21:16 -0700 (PDT)
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm405999566b.2.2026.08.21.03.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:21:16 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Fri, 21 Aug 2026 12:20:51 +0200
Subject: [PATCH] ntp: Stop building and delivering ntpdate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-ntp-drop-ntpdate-v1-1-6c22b3848fc3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIImiGoC/yXMQQ5AMBCF4avIrDWhSSlXEYsyg7Gopi2RiLsrd
 u9bvP+CQJ4pQJtd4OngwJtNKPMMxsXYmQRjMshCVoWWpbDRCfSbeweaSAK1rrHRSqnaQLo5TxO
 fX7Lrf4d9WGmMbwfu+wFwjV4pdAAAAA==
X-Change-ID: 20260821-ntp-drop-ntpdate-d887d985557a
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 10:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129417

From: Michal Sieron <michal.sieron@nokia.com>

ntpdate has been deprecated. meta-openembedded@6315006aadd in theory
dropped it, but in practice the binary was still being built and
shipped, but now as part of ntp-utils package.
To avoid this, let's patch it out of the build.

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 ...akefile.am-Don-t-build-deprecated-ntpdate.patch | 27 ++++++++++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p18.bb            |  1 +
 2 files changed, 28 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp/0001-Makefile.am-Don-t-build-deprecated-ntpdate.patch b/meta-networking/recipes-support/ntp/ntp/0001-Makefile.am-Don-t-build-deprecated-ntpdate.patch
new file mode 100644
index 0000000000..60499885e8
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/0001-Makefile.am-Don-t-build-deprecated-ntpdate.patch
@@ -0,0 +1,27 @@
+From 65d2d8a7c335dd6a815aaa37bf954b2862852949 Mon Sep 17 00:00:00 2001
+From: Michal Sieron <michal.sieron@nokia.com>
+Date: Thu, 20 Aug 2026 09:54:37 +0200
+Subject: [PATCH] Makefile.am: Don't build deprecated ntpdate
+
+ntpdate has been deprecated. meta-openembedded@6315006aadd in theory
+dropped it, but in practice the binary was still being built and
+shipped, but now as part of ntp-utils package.
+To avoid this, let's patch it out of the build.
+
+Upstream-Status: Inappropriate [OE specific]
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1967f98a0..5b49acee0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -11,7 +11,6 @@ SUBDIRS =		\
+ 	sntp		\
+ 	libparse	\
+ 	ntpd		\
+-	ntpdate		\
+ 	ntpdc		\
+ 	ntpq		\
+ 	ntpsnmpd	\
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
index 6f9bb01c02..334120814d 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://0001-include-fix-build-failure-with-glibc-2.43-_Generic-m.patch \
            file://0001-ITS-10011-build-fix-compatibility-with-stricter-C99-.patch \
            file://0001-colcomp-sntp-libpkgver-colcomp.c-Convert-K-R-functio.patch \
+           file://0001-Makefile.am-Don-t-build-deprecated-ntpdate.patch \
            file://ntpd \
            file://ntp.conf \
            file://ntpd.service \

---
base-commit: 1a7e4f34335820c64d3cc18d0cac74c7e291491a
change-id: 20260821-ntp-drop-ntpdate-d887d985557a

Best regards,
--  
Michal Sieron <michalwsieron@gmail.com>



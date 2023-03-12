Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE0DC6FD19
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 20:39:00 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.4374.1678653537558868457
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Mar 2023 13:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o384BfDx;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id k2so2952948pll.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Mar 2023 13:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678653537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7aHTzpqHJkN8gg5oDeYqstEd3gFRAilWN3KTFKzNAqA=;
        b=o384BfDxVN08Qsd98dzkxx5VPl5TCy/huBthJPZICHuoSaOGxlGcU9zFHzwju22On6
         w0tsmgUnGhkEtcMe5LuS/Kt5WH7AdsqGoD80thUYw70RCDbufUpp7/bhSbte7WLzBeNw
         PunBgvdsbYV2WwrWeH7i6/+nf0JuFSXIJ8Wzzl21SXnsxEvIclv8sy7J50xVUTE1ZLEF
         inKGn0cAQgVCkPwaj9dfBa6rQtJK5oCXDrL7oXjJQgQf9tbQv/bjt/TfYKTEwc/iltJw
         14jSEIbviwJyOfQXYS7re/87ZSI0rWRKdqRXfXzcPa/RduBIXR2qiI5Iq9FinMouIrvX
         M+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678653537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aHTzpqHJkN8gg5oDeYqstEd3gFRAilWN3KTFKzNAqA=;
        b=qjP8V5ngjYtd51SZ8GtWrTijgVTZbYG81oook7TfCEYQjK/xYsQeCGLV5/aYx+IAnY
         B7l5oCmWv82SkNFRy9EST09g9F03gbOpRo0zWKSfqgzUNWCQwz9E6HVy6vhuGhqKR3iR
         O12kEfkEnDd8Jlfe1osPw1EgDVglXkR3n+PQS/jmOnaiwf4rlMKrNmQaqhyDmocEuz+D
         04NDjKx61jyJyEc1Qjmvnbacp7wGe3O4RvmsszU0OlaBMhR587LqrJyX4jihm3FLsljK
         w4SWKdFOaXGex2mc7EhlE3MpS4zbDP63fg9/tb3TIzQ9F3IEGyOLYWskJ1NvytUgLuoC
         ogXQ==
X-Gm-Message-State: AO0yUKUMLxOsn1+wXMHbV42cTMu4+nJGPikQEGmpWmLnb5ZwbqV10rTo
	Rdpf6XsQkqIlP/RLvVHyvlTjGYVHuLA=
X-Google-Smtp-Source: AK7set+Yp/S6G4iEg6gRN/aJ5AkE2vkAhdtu+SOHud3QjtCJ6KOLWsScEXQ0ERAt63+aW/GGvYWPvQ==
X-Received: by 2002:a17:903:32cf:b0:19d:1d32:fbe with SMTP id i15-20020a17090332cf00b0019d1d320fbemr38284729plr.20.1678653536635;
        Sun, 12 Mar 2023 13:38:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f857])
        by smtp.gmail.com with ESMTPSA id ik23-20020a170902ab1700b001a0432ca99csm979962plb.269.2023.03.12.13.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 13:38:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gsoap: Upgrade to 2.8.126
Date: Sun, 12 Mar 2023 13:38:51 -0700
Message-Id: <20230312203851.3252240-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Mar 2023 20:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101508

Fix build with musl while here
Enable IPv6 and C locales at least

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Simplify-check-for-gethostbyname_r.patch | 94 +++++++++++++++++++
 .../{gsoap_2.8.124.bb => gsoap_2.8.126.bb}    |  7 +-
 2 files changed, 98 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.124.bb => gsoap_2.8.126.bb} (80%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch
new file mode 100644
index 0000000000..3d12f733f0
--- /dev/null
+++ b/meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch
@@ -0,0 +1,94 @@
+From fa923a50790c907725c822b2fc7d63b2da62b4ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 12 Mar 2023 13:34:55 -0700
+Subject: [PATCH] Simplify check for gethostbyname_r()
+
+This helps build fix with musl.
+
+Imported from Alpine: https://git.alpinelinux.org/aports/tree/community/gsoap/musl-fixes.patch
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gsoap/stdsoap2.c   |  6 ++----
+ gsoap/stdsoap2.cpp | 10 ++--------
+ 2 files changed, 4 insertions(+), 12 deletions(-)
+
+diff --git a/gsoap/stdsoap2.c b/gsoap/stdsoap2.c
+index 654a1e1..fa31d02 100644
+--- a/gsoap/stdsoap2.c
++++ b/gsoap/stdsoap2.c
+@@ -5463,7 +5463,7 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
+     hostent = NULL;
+     soap->errnum = h_errno;
+   }
+-#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && defined(HAVE_GETHOSTBYNAME_R)
++#elif defined(HAVE_GETHOSTBYNAME_R)
+   while ((r = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &hostent, &soap->errnum)) < 0)
+   {
+     if (tmpbuf != soap->tmpbuf)
+@@ -5478,8 +5478,6 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
+     if (!tmpbuf)
+       break;
+   }
+-#elif defined(HAVE_GETHOSTBYNAME_R)
+-  hostent = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &soap->errnum);
+ #elif defined(VXWORKS)
+   /* vxWorks compatible */
+   /* If the DNS resolver library resolvLib has been configured in the vxWorks
+@@ -23112,7 +23110,7 @@ soap_strerror(struct soap *soap)
+   {
+ #ifndef WIN32
+ # ifdef HAVE_STRERROR_R
+-#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
++#  if 1
+     err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
+     if (err != 0)
+       soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
+diff --git a/gsoap/stdsoap2.cpp b/gsoap/stdsoap2.cpp
+index 654a1e1..5fd5fd6 100644
+--- a/gsoap/stdsoap2.cpp
++++ b/gsoap/stdsoap2.cpp
+@@ -5430,7 +5430,7 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
+ {
+ #if (defined(_AIX43) || defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R)
+   struct hostent_data ht_data;
+-#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && defined(HAVE_GETHOSTBYNAME_R)
++#elif defined(HAVE_GETHOSTBYNAME_R)
+   int r;
+   char *tmpbuf = soap->tmpbuf;
+   size_t tmplen = sizeof(soap->tmpbuf);
+@@ -5463,7 +5463,7 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
+     hostent = NULL;
+     soap->errnum = h_errno;
+   }
+-#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && defined(HAVE_GETHOSTBYNAME_R)
++#elif defined(HAVE_GETHOSTBYNAME_R)
+   while ((r = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &hostent, &soap->errnum)) < 0)
+   {
+     if (tmpbuf != soap->tmpbuf)
+@@ -5478,8 +5478,6 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
+     if (!tmpbuf)
+       break;
+   }
+-#elif defined(HAVE_GETHOSTBYNAME_R)
+-  hostent = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &soap->errnum);
+ #elif defined(VXWORKS)
+   /* vxWorks compatible */
+   /* If the DNS resolver library resolvLib has been configured in the vxWorks
+@@ -23112,13 +23110,9 @@ soap_strerror(struct soap *soap)
+   {
+ #ifndef WIN32
+ # ifdef HAVE_STRERROR_R
+-#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
+     err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
+     if (err != 0)
+       soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
+-#  else
+-    return strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* GNU-specific */
+-#  endif
+ # else
+     return strerror(err);
+ # endif
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.124.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.126.bb
similarity index 80%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.124.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.126.bb
index 22e0119798..10c2c3350d 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.124.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.126.bb
@@ -5,9 +5,9 @@ LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
                     file://GPLv2_license.txt;md5=a33672dbe491b6517750a0389063508b"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
-           "
-SRC_URI[sha256sum] = "4b798780989338f665ef8e171bbcc422a271004d62d5852666d5eeca33a6a636"
+SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip \
+           file://0001-Simplify-check-for-gethostbyname_r.patch"
+SRC_URI[sha256sum] = "b65190ebf8c2517d6fafbdc2000bc7bc650d921a02f4aa53eb1e3df267592c4a"
 
 inherit autotools
 
@@ -15,6 +15,7 @@ BBCLASSEXTEND = "native"
 
 S = "${WORKDIR}/${BPN}-2.8"
 
+EXTRA_OECONF += "--enable-ipv6 --enable-c-locale"
 PARALLEL_MAKE = ""
 
 EXTRA_OEMAKE:class-target = "SOAP=${STAGING_BINDIR_NATIVE}/soapcpp2"
-- 
2.39.2



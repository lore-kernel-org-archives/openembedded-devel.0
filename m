Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B540AC4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 21:07:10 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web10.20730.1713042427052940431
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Apr 2024 14:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=eYIOHxiF;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1713042426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=surnYYWdATBGUb6X3XB/HBWSvSUKkroxf36jOHTAIHY=;
	b=eYIOHxiF6KyKTxmCml3PNlHKgXm0MS/7Ov+ndCngFh184A+9vbK7oPUQdL78UA9lgwLcdl
	pTXY+v66wi5a2EwBDe7MFY4ohcmnBVvYgZtPmhsmqcnJSluEX+uAxdCrVqdn/f6Af71Rvn
	/NFPyZhhwld22mjj9NyORLMEGA9t9tU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-11-Qsmub6UJPPiGre4rBWBZQw-1; Sat, 13 Apr 2024 14:06:59 -0700
X-MC-Unique: Qsmub6UJPPiGre4rBWBZQw-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2da1f03be85so9724021fa.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Apr 2024 14:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713042416; x=1713647216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IyG2FDkhWG5hJYA9GSABRE4gMuN4c5aPD7iQPU/VU8=;
        b=klhq+zC5MgAGIzeYXbOriQG4kTlN6aR+JMiOkJDSe6I8rv6ODOFss/6zDFnXZTJ9E3
         V7kZGxPZh30gntGi+NJAJbvI+wU0xZZ7uSwhCPjtOve0Z2eImkqIFidUyCbxa3MLKb/V
         k5YQ4oiL1fxU/+DyaIlaT85s+H6dmVj2QqRO+fxPrzgfckAA+Xsa7AevcwaSPDXHRU5z
         lo3DhLvYYE/q7hf3sPONQycG2wXN4UK1Lku75pQftQzbcRTsNI+PKlsNzSVzBA81CpjF
         b1OzDxxLqOoIAx4kpu3OT5SEzxguA2YbULR2w7vS7Gf9VcknhK3xpVSmc5YRUk0vwzSG
         9J2g==
X-Gm-Message-State: AOJu0YwN2Jmb2EBgOiJxs3Y0nvxgH4yBT0gc5jWY53+CgoMcx0PU3q2d
	0YsPSw8Yikmx0lSxpaZvHKlhhjIOZphDLazP4zAfNUdDeU0IVjp9PNmrAs+uQJw8ge66EkoSYV6
	I4816THYB7kLRheRpkanXo3fbmTL3wfxJA+oFf2Qpaia0NNLRsiZyoj9a8XyxFGmUWT0wqLywcs
	pyb8NhvwMc/x1POMk/UwaDvhIYLPhnfaoSpVxFCYFvl5lEC8ESRjsQEpkTm3JRIXkPGCRE
X-Received: by 2002:a2e:b0ef:0:b0:2da:320a:68d9 with SMTP id h15-20020a2eb0ef000000b002da320a68d9mr1337375ljl.13.1713042416089;
        Sat, 13 Apr 2024 14:06:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEigfX3H2Kk1Ef658uTEK/hDIv0gKXz+uoHfznfKrT2iVu1OuH8f1vmjDE8WB0t48h+1GoE5Q==
X-Received: by 2002:a2e:b0ef:0:b0:2da:320a:68d9 with SMTP id h15-20020a2eb0ef000000b002da320a68d9mr1337364ljl.13.1713042415284;
        Sat, 13 Apr 2024 14:06:55 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id q3-20020adfab03000000b00346c231231asm7055878wrc.86.2024.04.13.14.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 14:06:54 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH] python3-twisted: cleanup FILES and recipe in general
Date: Sat, 13 Apr 2024 21:05:56 +0000
Message-Id: <20240413210556.511936-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404131407040291"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Apr 2024 21:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109949

--MCBoundary=_12404131407040291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changes are made to prepare upgrading Twisted to a newer version
in a later commit.

Summary of changes:

Remove python3-twisted-bin since there is no FILES defined for bin

Use PYTHON_SITEPACKAGES_DIR when refering to the site-packages directory

Remove ALOT of files from FILES list which no longer exist. Many of these
files were deprecated and removed a long time ago.

Removed redundant :append to FILES packages, they can simply be in the
first definition of it.

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 .../python/python3-twisted_22.10.0.bb         | 265 +++++-------------
 1 file changed, 77 insertions(+), 188 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb=
 b/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
index 72a173e6f..20b9ce254 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
@@ -3,7 +3,6 @@ Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets=
, a large number of p
 (including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more."
 HOMEPAGE =3D "http://www.twistedmatrix.com"
=20
-#twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rathe=
r than LGPL.
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f8d67f84b6e178c92d471011b2245f=
c"
=20
@@ -34,16 +33,11 @@ PACKAGES +=3D "\
     ${PN}-core \
 "
=20
-PACKAGES =3D+ "\
-    ${PN}-bin \
-"
-
 DEPENDS +=3D " \
     python3-incremental-native \
 "
=20
 RDEPENDS:${PN} =3D "\
-    ${PN}-bin \
     ${PN}-core \
     ${PN}-conch \
     ${PN}-mail \
@@ -84,229 +78,124 @@ RDEPENDS:${PN}-pair +=3D "${PN}-core"
 FILES:${PN} =3D "${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.dist-inf=
o/*"
=20
 FILES:${PN}-test =3D " \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy/test/ =
\
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/test \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/*/test \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy/test/ \
 "
=20
 FILES:${PN}-protocols =3D " \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/*.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/gps/ \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/mice/ \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/__pycache__/*pyc \
 "
=20
 FILES:${PN}-zsh =3D " \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-completio=
n.zsh \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/python/twisted-completion.zsh \
 "
=20
 FILES:${PN}-conch =3D " \
     ${bindir}/ckeygen \
     ${bindir}/tkconch \
     ${bindir}/conch \
-    ${bindir}/conchftp \
     ${bindir}/cftp \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py=
* \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_conch.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_conch*.=
pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/conch \
 "
=20
 FILES:${PN}-core =3D " \
-${bindir}/manhole \
-${bindir}/mktap \
-${bindir}/twistd \
-${bindir}/tap2deb \
-${bindir}/tap2rpm \
-${bindir}/tapconvert \
-${bindir}/tkmktap \
-${bindir}/trial \
-${bindir}/easy_install* \
-${bindir}/pyhtmlizer \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.so \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__init__.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/notestplugin.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/testplugin.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_ftp.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_inet.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_manhole.py* =
\
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_portforward.=
py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_socks.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_telnet.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_trial.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/dropin.cache \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/application \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/cred \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/enterprise \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/internet \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/persisted \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols\
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python\
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/timeoutqueue.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/filepath.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dxprofile.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/plugin.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/htmlizer.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__init__.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dispatch.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/hook.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadpool.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/otp.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/usage.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/roots.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/versions.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/urlpath.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/util.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/components.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/logfile.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/runtime.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/reflect.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/context.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadable.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/rebuild.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/failure.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/lockfile.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/formmethod.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/finalize.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/win32.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dist.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/shortcut.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zipstream.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/release.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/syslog.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/log.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/compat.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/procutils.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/text.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_twisted_zsh_stub \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/scripts/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/tap/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/trial/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/__init__.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/_version.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/copyright.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/im.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/topfiles \
-${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/logger/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/_threads/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/positioning/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/py.typed \
+    ${bindir}/twist \
+    ${bindir}/twistd \
+    ${bindir}/trial \
+    ${bindir}/pyhtmlizer \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/*.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/application \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/cred \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/enterprise \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/internet \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/persisted \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/scripts \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/spread \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/tap \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/trial \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/*.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/python/*.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/*.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/Twisted*egg-info \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/logger \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/_threads \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/positioning \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/py.typed \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/__pycache__/*pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/python/__pycache__/*pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/__init__*.pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/cred_anonymous*=
.pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/cred_file*.pyc =
\
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/cred_memory*.py=
c \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/cred_sshkeys*.p=
yc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/cred_unix*.pyc =
\
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_core*.p=
yc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_ftp*.py=
c \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_inet*.p=
yc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_portfor=
ward*.pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_reactor=
s*.pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_socks*.=
pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_trial*.=
pyc \
 "
=20
 FILES:${PN}-mail =3D " \
-${bindir}/mailmail \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_mail.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/mail \
+    ${bindir}/mailmail \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_mail.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_mail*.p=
yc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/mail \
 "
=20
 FILES:${PN}-names =3D " \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_names.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/names \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_names.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_names*.=
pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/names \
 "
=20
 FILES:${PN}-news =3D " \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_news.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/news \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_news.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_news*.p=
yc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/news \
 "
=20
 FILES:${PN}-runner =3D " \
-${libdir}/site-packages/twisted/runner/portmap.so \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/runner\
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_runner.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_runner*=
.pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/runner \
 "
=20
 FILES:${PN}-web =3D " \
-${bindir}/websetroot \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_web.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/web\
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_web.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_web*.py=
c \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/web \
 "
=20
 FILES:${PN}-words =3D " \
-${bindir}/im \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_words.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/words\
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_words.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_words*.=
pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/words \
 "
=20
 FILES:${PN}-flow =3D " \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_flow.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/flow \"
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_flow.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_flow*.p=
yc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/flow \
+"
=20
 FILES:${PN}-pair =3D " \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_pair.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/pair \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_pair.py* \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_pair*.p=
yc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/pair \
 "
=20
 FILES:${PN}-doc +=3D " \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_pydoctortemplate=
s/ \
-"
-
-FILES:${PN}-core:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__pycache__/*pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/__init=
__*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/notest=
plugin*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/testpl=
ugin*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_ftp*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_inet*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_manhole*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_portforward*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_socks*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_telnet*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_trial*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_core*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_qtstub*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_reactors*.pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/cred*.=
pyc \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/dropin=
*.cache \
-"
-
-FILES:${PN}-names:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_names*.pyc \
-"
-
-FILES:${PN}-news:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_news*.pyc \
-"
-
-FILES:${PN}-protocols:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/__pycache__/*pyc=
 \
-"
-
-FILES:${PN}-conch:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_conch*.pyc \
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/python/_pydoctortemplates \
 "
=20
-FILES:${PN}-lore:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_lore*.pyc \
-"
-FILES:${PN}-mail:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_mail*.pyc \
-"
-
-FILES:${PN}-web:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_web*.pyc \
-"
-
-FILES:${PN}-words:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_words*.pyc \
-"
-
-FILES:${PN}-flow:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_flow*.pyc \
-"
-
-FILES:${PN}-pair:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_pair*.pyc \
-"
-
-FILES:${PN}-runner:append =3D " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_runner*.pyc \
-"
--=20
2.34.1

Disclaimer

The information contained in this communication from the sender is confiden=
tial. It is intended solely for use by the recipient and others authorized =
to receive it. If you are not the recipient, you are hereby notified that a=
ny disclosure, copying, distribution or taking action in relation of the co=
ntents of this information is strictly prohibited and may be unlawful.

This email has been scanned for viruses and malware, and may have been auto=
matically archived by Mimecast, a leader in email security and cyber resili=
ence. Mimecast integrates email defenses with brand protection, security aw=
areness training, web security, compliance and other essential capabilities=
. Mimecast helps protect large and small organizations from malicious activ=
ity, human error and technology failure; and to lead the movement toward bu=
ilding a more resilient world. To find out more, visit our website.

--MCBoundary=_12404131407040291
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Changes are made to prepare upgrading Twisted to a =
newer version<BR>
in a later commit.<BR>
<BR>
Summary of changes:<BR>
<BR>
Remove python3-twisted-bin since there is no FILES defined for bin<BR>
<BR>
Use PYTHON_SITEPACKAGES_DIR when refering to the site-packages directory<BR=
>
<BR>
Remove ALOT of files from FILES list which no longer exist. Many of these<B=
R>
files were deprecated and removed a long time ago.<BR>
<BR>
Removed redundant :append to FILES packages, they can simply be in the<BR>
first definition of it.<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 .../python/python3-twisted_22.10.0.bb         | 265 +++++-------------<BR>
 1 file changed, 77 insertions(+), 188 deletions(-)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb=
 b/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb<BR>
index 72a173e6f..20b9ce254 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb<BR>
@@ -3,7 +3,6 @@ Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets=
, a large number of p<BR>
 (including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more.&qu=
ot;<BR>
 HOMEPAGE =3D &quot;http://www.twistedmatrix.com&quot;<BR>
 <BR>
-#twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rathe=
r than LGPL.<BR>
 LICENSE =3D &quot;MIT&quot;<BR>
 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0f8d67f84b6e178c92d471011b=
2245fc&quot;<BR>
 <BR>
@@ -34,16 +33,11 @@ PACKAGES +=3D &quot;\<BR>
     ${PN}-core \<BR>
 &quot;<BR>
 <BR>
-PACKAGES =3D+ &quot;\<BR>
-    ${PN}-bin \<BR>
-&quot;<BR>
-<BR>
 DEPENDS +=3D &quot; \<BR>
     python3-incremental-native \<BR>
 &quot;<BR>
 <BR>
 RDEPENDS:${PN} =3D &quot;\<BR>
-    ${PN}-bin \<BR>
     ${PN}-core \<BR>
     ${PN}-conch \<BR>
     ${PN}-mail \<BR>
@@ -84,229 +78,124 @@ RDEPENDS:${PN}-pair +=3D &quot;${PN}-core&quot;<BR>
 FILES:${PN} =3D &quot;${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.dis=
t-info/*&quot;<BR>
 <BR>
 FILES:${PN}-test =3D &quot; \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy/test/ =
\<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/test \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/*/test \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy/test/ \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-protocols =3D &quot; \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/*.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/gps/ \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/mice/ \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/__pycache__/*pyc \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-zsh =3D &quot; \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-completio=
n.zsh \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/python/twisted-completion.zsh \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-conch =3D &quot; \<BR>
     ${bindir}/ckeygen \<BR>
     ${bindir}/tkconch \<BR>
     ${bindir}/conch \<BR>
-    ${bindir}/conchftp \<BR>
     ${bindir}/cftp \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py=
* \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_conch.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_conch*.=
pyc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/conch \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-core =3D &quot; \<BR>
-${bindir}/manhole \<BR>
-${bindir}/mktap \<BR>
-${bindir}/twistd \<BR>
-${bindir}/tap2deb \<BR>
-${bindir}/tap2rpm \<BR>
-${bindir}/tapconvert \<BR>
-${bindir}/tkmktap \<BR>
-${bindir}/trial \<BR>
-${bindir}/easy_install* \<BR>
-${bindir}/pyhtmlizer \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.so \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__init__.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/notestplugin.py* \<B=
R>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/testplugin.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_ftp.py* \<BR=
>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_inet.py* \<B=
R>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_manhole.py* =
\<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_portforward.=
py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_socks.py* \<=
BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_telnet.py* \=
<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_trial.py* \<=
BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/dropin.cache \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/application \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/cred \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/enterprise \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/internet \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/persisted \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols\<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python\<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/timeoutqueue.py* \<BR=
>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/filepath.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dxprofile.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/plugin.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/htmlizer.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__init__.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dispatch.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/hook.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadpool.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/otp.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/usage.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/roots.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/versions.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/urlpath.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/util.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/components.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/logfile.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/runtime.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/reflect.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/context.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadable.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/rebuild.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/failure.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/lockfile.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/formmethod.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/finalize.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/win32.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dist.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/shortcut.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zipstream.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/release.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/syslog.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/log.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/compat.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/procutils.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/text.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_twisted_zsh_stub \<B=
R>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/scripts/ \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/ \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/tap/ \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/trial/ \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/__init__.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/_version.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/copyright.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/im.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/topfiles \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/logger/ \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/_threads/ \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/positioning/ \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/py.typed \<BR>
+    ${bindir}/twist \<BR>
+    ${bindir}/twistd \<BR>
+    ${bindir}/trial \<BR>
+    ${bindir}/pyhtmlizer \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/*.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/application \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/cred \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/enterprise \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/internet \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/persisted \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/scripts \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/spread \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/tap \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/trial \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/*.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/python/*.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/*.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/Twisted*egg-info \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/logger \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/_threads \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/positioning \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/py.typed \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/__pycache__/*pyc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/python/__pycache__/*pyc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/__init__*.pyc \=
<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/cred_anonymous*=
.pyc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/cred_file*.pyc =
\<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/cred_memory*.py=
c \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/cred_sshkeys*.p=
yc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/cred_unix*.pyc =
\<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_core*.p=
yc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_ftp*.py=
c \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_inet*.p=
yc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_portfor=
ward*.pyc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_reactor=
s*.pyc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_socks*.=
pyc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_trial*.=
pyc \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-mail =3D &quot; \<BR>
-${bindir}/mailmail \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_mail.py* \<B=
R>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/mail \<BR>
+    ${bindir}/mailmail \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_mail.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_mail*.p=
yc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/mail \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-names =3D &quot; \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_names.py* \<=
BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/names \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_names.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_names*.=
pyc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/names \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-news =3D &quot; \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_news.py* \<B=
R>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/news \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_news.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_news*.p=
yc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/news \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-runner =3D &quot; \<BR>
-${libdir}/site-packages/twisted/runner/portmap.so \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/runner\<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_runner.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_runner*=
.pyc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/runner \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-web =3D &quot; \<BR>
-${bindir}/websetroot \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_web.py* \<BR=
>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/web\<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_web.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_web*.py=
c \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/web \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-words =3D &quot; \<BR>
-${bindir}/im \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_words.py* \<=
BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/words\<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_words.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_words*.=
pyc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/words \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-flow =3D &quot; \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_flow.py* \<B=
R>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/flow \&quot;<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_flow.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_flow*.p=
yc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/flow \<BR>
+&quot;<BR>
 <BR>
 FILES:${PN}-pair =3D &quot; \<BR>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_pair.py* \<B=
R>
-${libdir}/${PYTHON_DIR}/site-packages/twisted/pair \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_pair.py* \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_pair*.p=
yc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/pair \<BR>
 &quot;<BR>
 <BR>
 FILES:${PN}-doc +=3D &quot; \<BR>
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_pydoctortemplate=
s/ \<BR>
-&quot;<BR>
-<BR>
-FILES:${PN}-core:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__pycache__/*pyc \<=
BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/__init=
__*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/notest=
plugin*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/testpl=
ugin*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_ftp*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_inet*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_manhole*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_portforward*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_socks*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_telnet*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_trial*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_core*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_qtstub*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_reactors*.pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/cred*.=
pyc \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/dropin=
*.cache \<BR>
-&quot;<BR>
-<BR>
-FILES:${PN}-names:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_names*.pyc \<BR>
-&quot;<BR>
-<BR>
-FILES:${PN}-news:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_news*.pyc \<BR>
-&quot;<BR>
-<BR>
-FILES:${PN}-protocols:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/__pycache__/*pyc=
 \<BR>
-&quot;<BR>
-<BR>
-FILES:${PN}-conch:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_conch*.pyc \<BR>
+    ${PYTHON_SITEPACKAGES_DIR}/twisted/python/_pydoctortemplates \<BR>
 &quot;<BR>
 <BR>
-FILES:${PN}-lore:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_lore*.pyc \<BR>
-&quot;<BR>
-FILES:${PN}-mail:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_mail*.pyc \<BR>
-&quot;<BR>
-<BR>
-FILES:${PN}-web:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_web*.pyc \<BR>
-&quot;<BR>
-<BR>
-FILES:${PN}-words:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_words*.pyc \<BR>
-&quot;<BR>
-<BR>
-FILES:${PN}-flow:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_flow*.pyc \<BR>
-&quot;<BR>
-<BR>
-FILES:${PN}-pair:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_pair*.pyc \<BR>
-&quot;<BR>
-<BR>
-FILES:${PN}-runner:append =3D &quot; \<BR>
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_runner*.pyc \<BR>
-&quot;<BR>
-- <BR>
2.34.1<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
/p><p style=3D"font-family: Verdana; font-size:8pt; color:#666666;">Warning=
:  Copyright Nox Health.  This communication is confidential and may contai=
n privileged information.  By the use of email over the Internet or other c=
ommunication systems, Nox Health is not waiving either confidentiality of, =
or legal privilege in, the content of the email and of any attachments.  If=
 the recipient of this message is not the intended addressee, please call N=
ox Health immediately by calling (+1) 888.505.0280</p></body></html>

--MCBoundary=_12404131407040291--



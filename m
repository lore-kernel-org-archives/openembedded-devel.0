Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350D7FC980D
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:07 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37629.1774820335420828652
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wqd1UNN4;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9825ba7f9dso739480766b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820334; x=1775425134; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLSGNV3XpgQg4PIlApbdmPRYqlEveBaDi1oHM6iNaxs=;
        b=Wqd1UNN4ccZg0TGUqh68w4FsosAMj9LSbFbqqVzztYTxpAQ1t4v/nWeJyPcqTajmyC
         PzY0t1K6XFr58KEOPf53H6mQgFdWubhcaoyzuD9sUyqw+QQUVwUibFX4nUvbWrJxMHmd
         R72CzwY8vq6zDysfhfsyYgxm5qMSh/1b1GPrIpx9uhz+3TWB6xoGIna09ElPB59PnXAz
         jTujKGKBRJ2VeyhAMfPJywfxBCq5UAMeP7GW4CfySMXHX8cksYHcQT5kaAs1VEgi2S6W
         eYzz7P20R7QzCzQj50oGWdHIqRObTaRrRroS36zJEmeJR62T8o1I6NgAE7yBQ6cfi7XE
         LEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820334; x=1775425134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KLSGNV3XpgQg4PIlApbdmPRYqlEveBaDi1oHM6iNaxs=;
        b=JeO40UX9ie7USuuQmRKg29WyGA3pienHtgBLWddDtReyRppRXSD2/AhtcsOazo6F+V
         8iFoKCcM+TuS3RyDtQqPXZuDsILXgw3j83m/fVrPBaZs9PoD0DzIR2P6XPRslaJd2zkZ
         ydtJbkDV9NmmevY4Sh+AetS/IT/S0ep3E8gDlCdXDXiM59OjePMxeoD1EsLQEMwHwljU
         apsnJShzC4k7nuxSav3aignsRH97EoLvkZchzyZDloW3cQg8ExdWd/6TPDV6sosowAzk
         KWhMGpYjvPaPHYRKmdSepguPmpypmJX/NATJJZzJSptL+8yoady4G4JxAAwi6v6FAczF
         tWEQ==
X-Gm-Message-State: AOJu0YwQXojb2//iwtsO6o/stigr0YFPzJ+q3caHc0qes6qVfrn8pgUy
	qGjDBzmPSp47c6iqJv+OnyKvL1WNE5zy/fhkdNVDw3wp/5UUZGHGmT7C
X-Gm-Gg: ATEYQzyYfwivdot9vinS1Yu3y5Tb9LFgZGDvZB8bO2E9gY8EUyolwHGymOsJRC5FIxk
	tq3sIC/ytXmVQYep7Bin4I4O35uBTsazJC5JuagkWV4UpuNAIfc7yJ1TQV0KGjiHWHYA7DHnutZ
	v/ob+eDdLaT0W+QgaJ08SQYu663IbZOLZ1SlwIajy6XU8/vW+dfYhTrChO48yBZTIJO5PlwY8nl
	s+D5m0tih3SUIRyzOEWPUezh97DRrCwvfH66znYM2snTUNkzahfBdReyIbPByQatEA6ClyhZWTu
	4CQ9JRlerUMAr4+aCpIGcfhaymaaZMnYEvKjbiXtTgaW4jl7wrfEaxy9ydXMenLkvvMt3ntrZ8c
	YJGiTuSeMz2LpIaS7pk8rO961s7DrasDnQopDQI97KmeKUmVHfQ1PXDXBapTJGmlKWShqVjxElu
	yd4ADnLzdYy3Ryck5TMcLrgfyBIE7H1j1mt+zVncBl0i/9+w+TnlyrKQlxzF088llQ+C+gOJ4=
X-Received: by 2002:a17:907:3fa3:b0:b98:4eea:9b72 with SMTP id a640c23a62f3a-b9b51c3843dmr581571266b.11.1774820333561;
        Sun, 29 Mar 2026 14:38:53 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:53 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:02 +0200
Subject: [PATCH 01/13] meta-python: Convert confusing appends to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-1-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125810

While in this case `RDEPENDS:class-target +=` wouldn't result in any
unwanted override, there is no guarantee there won't be a change, which
would be hidden by this override. To avoid any surprises in the future
let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb          | 4 ++--
 meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb          | 2 +-
 meta-python/recipes-devtools/python/python3-progress_1.6.1.bb         | 2 +-
 meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb            | 2 +-
 meta-python/recipes-devtools/python/python3-yamlloader_1.6.0.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb      | 2 +-
 .../recipes-extended/python-pyparted/python3-pyparted_3.13.0.bb       | 2 +-
 meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.3.1.bb | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb b/meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb
index d75b14c49f..1e7372f692 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb
@@ -20,7 +20,7 @@ FILES:${PN}-tests += " \
     ${PYTHON_SITEPACKAGES_DIR}/astroid/__pycache__/test* \
 "
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-lazy-object-proxy \
     python3-logging \
     python3-six \
@@ -29,7 +29,7 @@ RDEPENDS:${PN}:class-target += "\
     python3-typing-extensions \
 "
 
-RDEPENDS:${PN}-tests:class-target += "\
+RDEPENDS:${PN}-tests:append:class-target = " \
     python3-unittest \
     python3-xml \
 "
diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
index b32fe2e1d0..184ce28c1a 100644
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "6b0b831ce8f15f7300721aa49829fc4e83921a9a301cc7f606be6686a2
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN}:class-target += " \
+RDEPENDS:${PN}:append:class-target = " \
     python3-datetime \
     python3-fcntl \
     python3-io \
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb
index 85ec93695d..5b201a7554 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb
@@ -8,7 +8,7 @@ PTEST_PYTEST_DIR = "test"
 
 SRC_URI[sha256sum] = "3b60763c1373dd60f398488069bcdc703cd08a711477b5d480eecc9f9626f47e"
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-io \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-progress_1.6.1.bb b/meta-python/recipes-devtools/python/python3-progress_1.6.1.bb
index 57c0748a5c..9ec4ec2b66 100644
--- a/meta-python/recipes-devtools/python/python3-progress_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-progress_1.6.1.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "c1ba719f862ce885232a759eab47971fe74dfc7bb76ab8a51ef5940bad
 
 inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN}:class-target += " \
+RDEPENDS:${PN}:append:class-target = " \
     python3-datetime \
     python3-math \
 "
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb
index 70652048f3..ee57717a5c 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN}-ptest += " \
 	python3-misc \
 "
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-stringold \
     python3-threading \
 "
diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.6.0.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.6.0.bb
index 4844e10de1..281c73eec4 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.6.0.bb
@@ -11,6 +11,6 @@ DEPENDS += "\
     python3-hatch-vcs-native \
 "
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-pyyaml \
 "
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb
index 1446d15935..690c2d26aa 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb
@@ -11,7 +11,7 @@ PACKAGES =. "${PN}-test "
 
 RPROVIDES:${PN} += "zope-interfaces"
 
-RDEPENDS:${PN}:class-target += "python3-datetime"
+RDEPENDS:${PN}:append:class-target = " python3-datetime"
 RDEPENDS:${PN}-test += "python3-unittest python3-doctest"
 
 FILES:${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.13.0.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.13.0.bb
index 0f7065f5ae..ab0fe8c602 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.13.0.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.13.0.bb
@@ -15,7 +15,7 @@ inherit pkgconfig pypi setuptools3
 
 DEPENDS += "parted"
 
-RDEPENDS:${PN}:class-target += " \
+RDEPENDS:${PN}:append:class-target = " \
     parted (>= 2.3) \
     python3-codecs \
     python3-math \
diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.3.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.3.1.bb
index f02c96e405..83156cfddf 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.3.1.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.3.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "7fb1c32e358d55c2c6966a071c8ecc0ca81de3d32944a67cc646c57b1a
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-ply \
     python3-pyyaml \
     python3-six \

-- 
2.53.0



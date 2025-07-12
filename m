Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85C3C83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 21:15:18 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.44704.1752354917180513405
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 14:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mt3bKkrY;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74b27c1481bso1975469b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 14:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752354916; x=1752959716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N6fFtLfrYF6JirXnh3T4jQPgeUniJGRtg84k0fNbxY=;
        b=Mt3bKkrYMTm+/B+7CXnIwt8cnm3rYFFARtRggek2BfO5c4Fxk9Riw5VaqxQxusqlPW
         vwXIZNdjfe6o6QlpsGqN1nG42PIFQp6FxQmOOuSYSvVeTvesjkocKppapPkXkuDPnsKB
         vzd1QqVDyN/Ih4B44Pg0x42CERTtVWkXIixjKlvbOPX9evd9wOmjSrWzZ/Ywkba5GL1j
         EvXtKQZxKEJQg83QeRaQNah5+hNcxGnT79BjDkh70QL76HKdB5vauS50HE0g9WVfDi5O
         v2zD393ksYaFxp1aC+2qq0N6jrC1CzTMOV/kzrZBs2dFsjqqq0jXlfb1Ps1LYrW6agvG
         TJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752354916; x=1752959716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+N6fFtLfrYF6JirXnh3T4jQPgeUniJGRtg84k0fNbxY=;
        b=RBm53iJIbXL07PcJirFaVjw/6e6iiUMXuSUpWUYaKGSB4ilq2ZY0UP+McuupPUxSD/
         vjlvcWBmIuzmafV/oHqn7/ADTnCXt8X5gaHTfexfLu1bxRZfi4OCHR45q/Ltkvq+peSQ
         eLNOsyRu6qVOdrc/G4//XU0iHvDMxUArSQdUmK/daVwMFcoMaQxozilHaeboSStT7zgE
         7C5TcUgM7oY35xt4Mmx91fGa26JNa7b6nMlJjVkFHsw1BKZmUq5a7+gVmsgmDduPkIXM
         y4P/WT5vgubQQ3qMmfrU4HMyf1BewPl0uV3GehSBTmvzhbwNPIu3q5M/8n+sBqyI+Hiq
         QOhg==
X-Gm-Message-State: AOJu0YyZl43xOjfeOaqGj7dNjVA1YUnMrOeFDpS1saUpAVTZCYm0CAHA
	m+P8iNsQmM22E8H6vBX5n1sWokyecDsFV9ggFx98tcARjRocL/D1D6FMygO7VZyM
X-Gm-Gg: ASbGncu5eWwhunjMD5Kj/MnbANYGCfguZQ9kfDOpfOsNgGcmmNA3yOJdesWvLPPIiS2
	nJwiCcKXQjKi/8awWI5XhR20NwecWMaoWB8w8If17i33gjvGXHAS747UhYHGwTevQVJHTjFFW+j
	ZGtk7FJfUeuSLc+EO+qdBOHVioVSfIkHOMhyaLJ9r82FJjwlQpB/WxBiLZLO4pIgIu1xiZyCOwD
	FTXECN7zT7dJKJkpp9JVn65Na2h14CqdeUf4GgdONqkSEDJDHHEdxaFQ7QJ8Ea7giKlYbwLy0hC
	GAYV+/MVCwRGFdUEjUbl4VFC8Wm7E+6Ab8P4QFtApTLRjH+FS72ui+XWxpKo4USOyaDjYDLSZIi
	CdbOirXG/L+9h3A==
X-Google-Smtp-Source: AGHT+IF3Fy1BWPyrSi4NtKFiVLn1U/qw5tIVt7ZnoQcxNNhZFJwr0UO69qvVj4zpdfKTNaclPWmgpw==
X-Received: by 2002:a05:6a00:b42:b0:73d:fefb:325 with SMTP id d2e1a72fcca58-74f1beebda4mr8633343b3a.5.1752354916226;
        Sat, 12 Jul 2025 14:15:16 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f8f24dsm7291470b3a.156.2025.07.12.14.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 14:15:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] libmusicbrainz: Upgrade to tip of trunk
Date: Sat, 12 Jul 2025 14:15:10 -0700
Message-ID: <20250712211510.201143-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712211510.201143-1-raj.khem@gmail.com>
References: <20250712211510.201143-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 21:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118492

* Brings fixes for cmake4 builds
* Temporarily install make-c-interface in build area for target build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musicbrainz/libmusicbrainz_git.bb                | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 1ae43e8aef..d42814feab 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "expat libxml2 libxml2-native neon neon-native libmusicbrainz-native"
 
 PV = "5.1.0+git"
 
-SRCREV = "4655b571a70d73d41467091f59c518517c956198"
+SRCREV = "4efbed3afae11ef68281816088d7cf3d0f704dfe"
 SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git;branch=master;protocol=https \
            file://0001-http-fetch-Pass-a-non-null-buffer-to-ne_set_request_.patch \
            "
@@ -20,7 +20,15 @@ EXTRA_OECMAKE:append:class-target = " -DIMPORT_EXECUTABLES=${STAGING_LIBDIR_NATI
 do_install:append:class-native() {
     install -Dm 0755 ${B}/src/make-c-interface ${D}${bindir}/make-c-interface
     install -Dm 0644 ${B}/ImportExecutables.cmake ${D}${libdir}/cmake/${BPN}/ImportExecutables.cmake
-    sed -i -e s:'${B}'/src/::g ${D}${libdir}/cmake/${BPN}/ImportExecutables.cmake
+    sed -i -e 's:${B}/src/::g' ${D}${libdir}/cmake/${BPN}/ImportExecutables.cmake
+}
+
+do_compile:prepend:class-target() {
+	install -Dm 0755 ${STAGING_BINDIR_NATIVE}/make-c-interface ${B}/src/make-c-interface
+}
+
+do_compile:append:class-target() {
+	rm -rf ${B}/src/make-c-interface
 }
 
 BBCLASSEXTEND = "native"


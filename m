Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE5CC78A29
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:24 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 17so1302133pfw.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jijHjvmEk93XIUjizTXFPXOsNBxroYgca8wISeGr6yQ=;
	b=dMgFg2/eblNZOJIrhhN8z/t/1KNxJ+QflmWhxR7CAYW0efiexcNMJWaL+vw18AjrKT
	XUJe7SS3u+/h9gDGkCiHgB0kHJK065MXbk0cEI9x3QypnZfitaSRhDr8cCo5FP64a77H
	SwK/Bn2k07FpAAAB3VYMdUbKqV2xNO9SG5xD0nd6unGUBUsx70HEYXtbuL8pToNKM9Q+
	TJflOX3C70PYYn1h87DfAryNW6WVCW1iknkSIWNG15gh8zpdqCc/Rb+s2lzehXno5Sb7
	hhQIjIGTjNaBIPuInZeeiB67a99BLUyVbfpk4V7wNBcK5KUk6U60WkmIcwHQTnqrh6bF
	nO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jijHjvmEk93XIUjizTXFPXOsNBxroYgca8wISeGr6yQ=;
	b=FU/ku7l4gBYHbHsDRmkYkamZd/d0wcEVw28CvFBgbYxBu0um645b0QYnv+CD+OU39+
	cDhhxku/YRZ06RWpRMVBNjHTnRu6qnEEz8XkyZhWSG8ehumSGWa53xcgiG6Jdm1kj/Lu
	sunoBf/HBgY+4GaxMvVLtCihF55j+3XZX6qaG7Z/qs5eYBBKEdc3UoqFiNkTgmjFWvJJ
	QblgmiNkiNNtqIlvClu9jT2sXw31tGTl9JKyt4ikUeYFafVSdoYTjH2LfShmKSvlwni/
	Es6KRD5FvlNAPyWqpz1F941Z0bRmWOWgbqlD1+6P2EbgYSy/PT/XLdU/410MXT+MiaeR
	tzZw==
X-Gm-Message-State: APf1xPCaXaza2qQYQHhAW2oPs1b5JxA0xejG09ZfbQz98a8gRpI/Q/Nk
	MGcRgLg6OdVOk6sIujR1zWA=
X-Google-Smtp-Source: AG47ELv5QfGDJrzS5eNfULBZtjCeRx/ZKsN0spO6Pj7TVaiQpHcF2uHKrURBeB+U5/n+dhmsyV/7+g==
X-Received: by 10.98.60.144 with SMTP id b16mr23766615pfk.61.1520449285897;
	Wed, 07 Mar 2018 11:01:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:00:57 -0800
Message-Id: <1520449275-29492-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 05/23] evolution-data-server: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:25 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
index 2d410e2..f4ff489 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
@@ -14,7 +14,9 @@ DEPENDS = " \
     dbus db virtual/libiconv zlib libsoup-2.4 libglade libical nss libsecret \
 "
 
-inherit gnomebase cmake gtk-doc gettext gobject-introspection perlnative pythonnative
+inherit distro_features_check gnomebase cmake gtk-doc gettext gobject-introspection perlnative pythonnative
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += " \
     file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
-- 
2.7.4



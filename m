Return-Path: <brgl@bgdev.pl>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id F39166BA11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 22:34:37 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id q21so4798449pfn.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6YwTx6KfPor0BMfzYYwCjb4D570YzCckYWRyTWDtHyk=;
	b=Z1UN7y7wjqlUt4B54ofilaUopccnh9QPCOfRde7GnSii3iQWX0+2NzIHyUFY1obVnU
	sbNGk19t9LwjCRsABrwwG3PD7K1UlDQN/7KSyKD2V1Yg1S9BsJ62NOq7pNJ4efFaqBI4
	XBQd+NpWNFIxK59a5mol0wYQEsVaAwzUtceUiyEERnx7x7P8Bk8cagncRThGMxpeIDqB
	k8J4SEwueFdMYIlQUvfxP5LJ5UN2IhxKY43jUwtC0VSW9+T3nvm4fM/MO2pPWGROBNGG
	xLnZXNWAd4KUDc+tobd1q8j9T3KwlS2pkZAlO9ikmZ6QV9Lf/IhEpxSQpsexpevQLcGZ
	KKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6YwTx6KfPor0BMfzYYwCjb4D570YzCckYWRyTWDtHyk=;
	b=bAsdQaB/HHg4WuwnjTh/Rdlji3RqxGmmOArT3KuDnYRobGLc+3kdweRSjV9xuKprzT
	ORiIF8ognViGcLof4bqcU7H4FdAeSIasIvOSuTTXIUZOnanA2ouF08f1Zd7c7guRiMFx
	cJRfJvMrCG7FoZeRD6z4yPH4oXWS6zRhxpjfTJkdri7pxbQIlzN0bOgCbrL4ciWq1euu
	j0kF+rPhsL9HYPGNemxP3fSmFucA6VHkFT3ajke9E7kfxWTIN7Pefh6V+UyM2ZC3R5fm
	KvW2meOUNOKdtl4TBXot70t6Tv1/e/MYylCoEzwMI4z0uB0taQZGZLV89gifN8HOoJGs
	iQyQ==
X-Gm-Message-State: APjAAAUwyNHnMcV6hY9lrGDGQc9KucscjBvbAr0EgwATG2t1XQXsDTN3
	/+j9kYPJd1VKFiz8tUMOKje0gg==
X-Google-Smtp-Source: APXvYqwcKqWbfR+j/ozxujJ0CQSfi+7CDW71VhQiERnDm1y5p3CNoKUgyG/IUdJi08dhdkPSdW/rMQ==
X-Received: by 2002:a63:d34b:: with SMTP id u11mr14129341pgi.442.1570746879104;
	Thu, 10 Oct 2019 15:34:39 -0700 (PDT)
Received: from debian-brgl.local ([204.153.194.98])
	by smtp.gmail.com with ESMTPSA id 6sm5797121pgl.40.2019.10.10.15.34.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 15:34:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2019 00:34:28 +0200
Message-Id: <20191010223429.31337-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010223429.31337-1-brgl@bgdev.pl>
References: <20191010223429.31337-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-networking][PATCH 2/3] networkd-dispatcher: remove unneeded RDEPENDS
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
X-List-Received-Date: Thu, 10 Oct 2019 22:34:38 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We already depend on systemd in DISTRO_FEATURES so adding it to
RDEPENDS is redundant. We also rdepend on two python packages, so
there's no need to explicitly depend on python3.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../networkd-dispatcher/networkd-dispatcher_2.0.1.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
index c700bd17c..06c83e9d8 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
 inherit distro_features_check
 
-RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
+RDEPENDS_${PN} = "python3-pygobject python3-dbus"
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 SRC_URI = "https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/${PV}/networkd-dispatcher-${PV}.tar.bz2"
-- 
2.23.0



Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id EA7C2615A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:23:46 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j15so10431158pgm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rAAF9sv2wUxoaxs9CY7I3QSp96PD67Z5zJR6m98vfwU=;
	b=RD6nftSnpEP822Luu+8qpdBHks7DkoZbqBoSKdgbuEpjDAiJS/v32ZrrUT9Q2yB/mT
	lKgcKDM5UXLwM0KtKd0atYNUTZ7c8TSrS/iC7441k9TExTUeJSGU2kbuRQGQu3D1EIL3
	/iduH+eTy801tpx7Bg4QNgDAYa3dP3wSugGverOwoGuDgqBkjZNGuaz+VWhRGo0CFead
	mtPrRKrPBbc69SgrNh6+ynxlcE7m2MZn04m1lJXq9NIB7NJ0IAxwoUn28awGpzCN6V5p
	WuUxXmPbPrgQey2hoXchgkfvgvdkQT4YPzCN/ZdV65KofGUgG3FBIeydOiLQIkDo0tMm
	+nDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rAAF9sv2wUxoaxs9CY7I3QSp96PD67Z5zJR6m98vfwU=;
	b=bvzxO0F3dahBkmdK5M36sBK9dKuXPEPUt2ZpTi0iogF/pkvvzklhYw4o+REOxnBw7+
	n9b5+PpOFGA0lBMe2k9qMk48XIv+vQQRJ4BktvDGzImOgFJk1rBmZUeJIgVd/njjOfuP
	uWjuxLUc8M3pbhHuwE2Fr21Dx6z8c/okyT4OA00c1JAgsDZjM2v3pI6Dk1KW9lnYi6Qb
	oLZkQ0QbRgG+HwlW2aPISxlox7zxqfGnX6lzGpx4qCrxUPc+PLw4sgYFDlDSfiTlT/V6
	0RPEVbacImBduPQAbrbEg5zn9iAm7whGG9WLh5F0sPGLWa/Ha//m1A1vjdftZrrjYXpC
	T2dw==
X-Gm-Message-State: APjAAAUPops+p1bZieeSIVm3NofsGLAR3Lwc5S6mqvUBLnc3bNnI70i7
	ukGjKnpj/3Z6lZcwGddJbz0mYowTFM0=
X-Google-Smtp-Source: APXvYqzF5Cybe+9f1UguWzOE0ZIJ4zKq214bM4lwXZzNBNVGr34f69L0q+iguHsjyeZw39oZUeuo8g==
X-Received: by 2002:a65:420b:: with SMTP id c11mr20576049pgq.297.1582007026711;
	Mon, 17 Feb 2020 22:23:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id h26sm2573363pfr.9.2020.02.17.22.23.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 22:23:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 22:23:44 -0800
Message-Id: <20200218062348.3742529-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200218062348.3742529-1-raj.khem@gmail.com>
References: <20200218062348.3742529-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 4/8] gupnp-dlna: Rename patchdir to PN
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
X-List-Received-Date: Tue, 18 Feb 2020 06:23:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This makes is specific to gupnp-dlna alone since thats only recipe using
the patches inside files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gupnp/{files => gupnp-dlna}/move_vapigen.patch                | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{files => gupnp-dlna}/move_vapigen.patch (100%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/files/move_vapigen.patch b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna/move_vapigen.patch
similarity index 100%
rename from meta-multimedia/recipes-connectivity/gupnp/files/move_vapigen.patch
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna/move_vapigen.patch
-- 
2.25.1



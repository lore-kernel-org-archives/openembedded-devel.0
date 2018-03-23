Return-Path: <brgl@bgdev.pl>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 558F378771
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 11:07:25 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u46so11700080wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tUDV3OghiXobuv6N2hl9B/tR7RgX6SZJz5WaJoNVvRo=;
	b=sq1kRmnrU/3Mn7t1dHAF9rMJNsNpaMMQEkWrBMKjKm6TAyaC3ok3sKd3wxLxo6Jze3
	4Ua6eSFSrKWjeg+QokO3WYbyBYozuwemKMMLH+E0eC7lrwuK+f+jZCm3yxsp6Xyivnih
	Hqu6zOmifvJTTYlqsbbrd7ElIw0zprryF3a6gcLmm4RUMoMyoP8ioEo0p6XXIVDYALaT
	XzOKuuD+8StJvYgqmwkgtZviUtNnymFUrajZgNaFLM28XlQM1tlQE2PCUJtMxATgHc5W
	lY3sC8iO+eMAv/0kzDgJZUrCl1YDrGhlOCWoNypclf6sDtG5TRyoc8XH8b45cwF7jbwZ
	ATpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tUDV3OghiXobuv6N2hl9B/tR7RgX6SZJz5WaJoNVvRo=;
	b=Y6CMdbhRKhfC2YJ6QKyz26NvBHMJgW1gu5qFtlYg5h9cLSGDGwwfu6uZRn4skNRe4C
	K3NRmredaWzrMQHvgpgOxSrnObJTArO/Wx5JY928zumKBNmavISd/K8u2us9RYyLhCg6
	e5jy7DTRmbG1Tjfsui0mEWqrwz4fkIlUTa14+k2PoaRItHudZpPOOhqKfgvQd2UtbJdy
	/lNe3wiRDA2H5Gtm5ybVLbGvHJ8NBTwiZoFUn0jZbl6VUjvGcrpEpIJjX9k4jmYOavU9
	wuux9YJ5hyNauj/GPUC0Qtton027WSDmV9BDW8gx2gBWObBrmxaIA4+DI9rEPX7Cbz0x
	p72Q==
X-Gm-Message-State: AElRT7ESF6MXmr5VVeVoeF9JLwPlekYKXtl9OBNsihNE2NwsCavbjLlB
	rAUsyeQ/cz/t8igVegzYwlVMgA==
X-Google-Smtp-Source: AG47ELsMfQS4yRmslvTLTYtz3ox2Fsj+vNozMM/pxbynAOXOrXecyNlWVpR1h57Fyu2YhjiZ0HaT1g==
X-Received: by 10.223.161.25 with SMTP id o25mr11115119wro.137.1521803246860; 
	Fri, 23 Mar 2018 04:07:26 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
	by smtp.gmail.com with ESMTPSA id
	c57sm6184788wrg.84.2018.03.23.04.07.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Mar 2018 04:07:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Mar 2018 12:07:16 +0100
Message-Id: <20180323110719.1010-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.16.1
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/3] libgpiod: support for v1.0 series
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
X-List-Received-Date: Fri, 23 Mar 2018 11:07:26 -0000

I recently released a new major version of libgpiod in which the
initial API was heavily reworked. Since it's no longer compatible
with v0.3.2 but I know there are users of the latter and I also
intend on supporting it for some time, I thought we should have both
versions in recipes-support.

This series adds a new recipe for libgpiod v1.0 that can live next to
v0.3.2.

Bartosz Golaszewski (3):
  libgpiod: include the version in the recipe filename
  libgpiod: split recipe into .inc and .bb files
  libgpiod: add support for v1.x series

 meta-oe/recipes-support/libgpiod/{libgpiod.bb => libgpiod.inc} | 5 -----
 meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb             | 4 ++++
 meta-oe/recipes-support/libgpiod/libgpiod_1.0.bb               | 4 ++++
 3 files changed, 8 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod.bb => libgpiod.inc} (80%)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_1.0.bb

-- 
2.16.1



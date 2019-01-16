Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8936CEFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2019 21:42:05 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id n190so3675327wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2019 13:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hRMOHHJBn4GQKBRkJ4rVYpPUfQNnNTrOiynAPFd+wV4=;
	b=ChqEwo584b0zid/cFNdWvuF7beZInC6w+Rs0x3UCK/6rv8GwNX+Ufxxatp3teQwYG3
	eQJemvp7U+jOTnp5uC+mbBWGe0ihViXUuXVFtS0lX0T4R5mQlBLOohqvi6c6EilWMpMD
	Y/OBKbodLmRgSke9DPVJl9dPpbwkUlCXeXcYPSC/7M63feQl0XzTSA70fLaCoXvqyGEN
	Tdq42hNib0pOT4bvkI6asrnOfR+V0y91Zc9d6gQya8s6hG3gh2TD3foH7UoTPlqgn4Ho
	hvkmDCirAxFdRZ8Ku1Qfj5cIZeqnS2z11BP/BqMb7lKbevaNlV37/baw24UNxFxPTgDS
	bBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hRMOHHJBn4GQKBRkJ4rVYpPUfQNnNTrOiynAPFd+wV4=;
	b=PZ/C8kCts4vEP7k9C3qqkLfUkgglSv3ktcvASe9gZUe5MBsOsDaJZDsvMenARUWCQw
	tDd3+6VY9Isdzry6Ps3ofe9z5A7c9whGmwiPxPZhExNP/eQJ1RYMNvH3HJ/qZkAWqmGb
	tUeM8hcK+HLGPeDOVBZ770uSy5J6RyP+w63Zh/5OoK9L/PZOOEH0jWmlDgGiINFogNTW
	kU6JjzBouQejlfJMW7F/GZeYDREsMuhmtgXCRsDbswDqfZxYUtnFQebLodmKOFVlomEG
	hcq+d0QhZbYWsCH0YJZOHnGvRcLoYulXGqREJPh54kh7N9MPYYWwpSmEuXbF7lwytwPw
	WuXg==
X-Gm-Message-State: AJcUukeFoY3pACZYVt2myS23cKZg4Atrw6AmgMith3DsgpAgoy0flsq2
	YQKHHy8Zau7zTgn9xu/rHMhQpT2U
X-Google-Smtp-Source: ALg8bN7AfGcYHV0Iz0IWNJIAbixoxSTPS0SiaKXcexydN23UqiHpoxQLBhtM5bfljGRIxC5kL3+XGg==
X-Received: by 2002:a1c:9183:: with SMTP id t125mr8861704wmd.79.1547674925712; 
	Wed, 16 Jan 2019 13:42:05 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0029715DABF2C2CD5F5CC1.dip0.t-ipconnect.de.
	[2003:f0:7f00:2971:5dab:f2c2:cd5f:5cc1])
	by smtp.gmail.com with ESMTPSA id
	x81sm38356554wmg.17.2019.01.16.13.42.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Jan 2019 13:42:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Jan 2019 22:41:53 +0100
Message-Id: <20190116214154.11514-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/1] fluidsynth: upgrade 1.1.11 -> 2.0.3
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
X-List-Received-Date: Wed, 16 Jan 2019 21:42:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Although just a single patch it

* is a big enhancement for embedded devices when setting
  'synth.dynamic-sample-loading' to 1 and working with large soundfonts:
  * Load times are reduced extremly
  * RAM memory consumption is reduced significantly which opens new
    possibilties
* was a long running and huge effort

Andreas Müller (1):
  fluidsynth: upgrade 1.1.11 -> 2.0.3

 ...elaration-for-float-multithreaded-se.patch |  76 -----
 .../fluidsynth/fluidsynth-native_git.bb       |  10 +
 .../fluidsynth/fluidsynth.inc                 |  12 +
 ...tables-helper-we-have-to-use-native-.patch |  37 +++
 ...te_float-Allow-zero-pointer-for-left.patch | 178 ++++++++++
 ...elaration-for-float-multithreaded-se.patch | 304 ++++++++++++++++++
 .../fluidsynth/fluidsynth_1.1.11.bb           |  24 --
 .../fluidsynth/fluidsynth_git.bb              |  22 ++
 8 files changed, 563 insertions(+), 100 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth-native_git.bb
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb

-- 
2.20.1



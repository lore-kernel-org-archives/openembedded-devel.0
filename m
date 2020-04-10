Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.8010.1586522101342709388
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 05:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=MywwA73F;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id x4so2370516wmj.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mv2R9l/1G1rAYPae7b3wJ3yL/+anlS5ydjZiYIBT3uU=;
        b=MywwA73FzU+rXjhzENuzgi2ZjXjL857O7B45etpO+DmDESH5cns5zWELjCSig0LTNm
         u2X++xG1U7W7gMX8g0jXNuvKOICoc8KB89tP2e+bn1xFTdRIaNxTnYydgg2DZLShlvwW
         8Lw90VlhM7sYucMl3jo53ebBHoesQtMhXtZsk/zhHpHv0gTvmOM+4oniOvHfCC1MHLtF
         FsRHxeoECmj37uDYWDjQV/fbirTwPF6xqUdp0yEP98rck+uAl/elr4rI2A33V0sVMu2A
         EBbzjnZcjCcmPcueg/M8eQEXuBp6y0uLeLTG1PLTldgFRYxYpYtV/d62XprwcK/S61IH
         Xa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mv2R9l/1G1rAYPae7b3wJ3yL/+anlS5ydjZiYIBT3uU=;
        b=XqpdG+qEWs/P3uExeoXpcF1Up/EtOoBU9wqoJkeR7k9AtvfWi9KgkRdAH1YryzgAIh
         OE6KiyaKc/Awpfo7vuU+SCe9KC3Rq/opKv8uUU68Ji+q1d36q8GiHK2dJMd1aAgLlKwS
         IKAQoP3hQvtvqwacyDEiT+3GacIisOTRad/N9ET0Kf9YuIDiBCcXTWumSeVf2esyRO5F
         v7Ag0syi9NUTXdgsn464ESRuIwUU2Q55QVDht9eHrnH51ap+ye51WS6LcSF9ronUlYYG
         Co+8TMxtIfQaZjiUyGvsLjU1N+hIoJasSzs3HDrmatts2NT1eDDcbf8ALJhM/zeRDi/O
         9KBQ==
X-Gm-Message-State: AGi0PuY/wt0c8U14es9mZw1rG1+UHomM21Qi+08PZX8iNdam+MrE6Plz
	+YbupvxPsImmlNh8+Lvat//Trg==
X-Google-Smtp-Source: APiQypICzCOmucU5lH21dy7WyHqEfeD5Zn/Qa7vPTI/DxV/f4xAxdkm2gJ76hz1GtHAto3x9ngqC/w==
X-Received: by 2002:a1c:9891:: with SMTP id a139mr5326507wme.129.1586522099785;
        Fri, 10 Apr 2020 05:34:59 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id d7sm2685062wrr.77.2020.04.10.05.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 05:34:59 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-devel@lists.openembedded.org,
	yocto@lists.yoctoproject.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [OE-core][PATCH v2 0/2] generic dm-verity support + BBB example
Date: Fri, 10 Apr 2020 14:34:47 +0200
Message-Id: <20200410123449.9624-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series attempts to introduce support for dm-verity in meta-security.
It depends on a series[1] I submitted for OE-core that introduces multi-stage
image deployment that's currently pending review (although the general idea
was accepted by Richard). This new way of deploying image artifacts is aimed
at solving a circular dependency problem[2] which turned out to be impossible
to resolve if all artifacts are deployed at once by the do_image_complete task.

The first patch in this series introduces a generic bbclass that allows to
generate and append dm-verity hash data at the end of the partition image.

The second patch adds support for an example verified boot image for Beagle
Bone Black where the root dm-verity hash is stored inside the signed fitImage
in an initramfs which takes care of mouting the protected rootfs.

Patch 2/2 - while made sure to work on BBB - should be generic enough to be
reusable across many platforms.

[1] https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg135694.html
[2] https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg134825.html

Bartosz Golaszewski (2):
  classes: provide a class for generating dm-verity meta-data images
  dm-verity: add a working example for BeagleBone Black

 classes/dm-verity-img.bbclass                 | 88 +++++++++++++++++++
 .../images/dm-verity-image-initramfs.bb       | 26 ++++++
 .../initrdscripts/initramfs-dm-verity.bb      | 13 +++
 .../initramfs-dm-verity/init-dm-verity.sh     | 46 ++++++++++
 wic/beaglebone-yocto-verity.wks.in            | 15 ++++
 5 files changed, 188 insertions(+)
 create mode 100644 classes/dm-verity-img.bbclass
 create mode 100644 recipes-core/images/dm-verity-image-initramfs.bb
 create mode 100644 recipes-core/initrdscripts/initramfs-dm-verity.bb
 create mode 100644 recipes-core/initrdscripts/initramfs-dm-verity/init-dm-verity.sh
 create mode 100644 wic/beaglebone-yocto-verity.wks.in

-- 
2.25.0


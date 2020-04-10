Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.8043.1586522502816265597
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 05:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=zp6hjDfz;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.66, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f66.google.com with SMTP id u13so1693128wrp.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 05:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GnjiosE8k9+SjfCC659z+xw09yFMhIFV7oPLZdv5g6A=;
        b=zp6hjDfzkU7gKzZiGOw6o32Tbu4Y/eOE9W78GhZ5S7oqdA2TfLrqHE/EZLufNlxVih
         dA+JYm/eRS8+Sa9FYzn4jEoJPmDfD+HJfJ7CVPiI8yg+LnU4XII8yvrJ9TDEeb/1AxeI
         6msdetN04QqDHgMeA8QpyslQ9Enlrg1/vmIWq0EODtYHydAwnXqLCg5wMPH8W0cNBS5Y
         uiZlhcHxL1kz8pv6LQUEBJKDUz33BcIKpQcseN9nJ9b9M10pLsvl794inK3T278sD3Vn
         CV52Wd+RI0kjOyyO0otrHj7b3ME5WfmvI5diKCKy1dobKsCi0ma7lzhyCoOX5qRFS8Uv
         3UrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GnjiosE8k9+SjfCC659z+xw09yFMhIFV7oPLZdv5g6A=;
        b=J7cp21tzp0N4D0Nh6YwLIYRu10vjpIwPi0gFsgcGU5iG1qdHbKIkbPY+Ar8Ntb5MUM
         l8OPqD63wM9tfTiX3WPFB1Nukbgon83xW098PaNqvhvRyVTk1TAvMKT8047BQxJuLk/F
         oJi1KTCmXwIurbotzmoW0hOWFAFMVA6QA0YDeqIOj3kHM5VRh/M+6ZtsWCbvwQql3wS8
         iGkHY9G4HxaQvSqC8CycfOAvh19pbnwUAbWEV6d2n+neWXI6b8Jr4I3vMqhaEJeOUvr3
         QK9aMh5/9zyNQWVDlQjNXWDpY38PngDexSWqoY8k6oNv/HmPP8bgz9V71B/QyTq7rbmc
         heCA==
X-Gm-Message-State: AGi0PuacVFU7AcRQygzlm2WTKJG9zXl9lcguZgEm7yx/n9id2jzIvgkD
	Ij7JVo3uz8onbrSE2jGEoKK3gA==
X-Google-Smtp-Source: APiQypLnPZg5J1FGfsiFzpRtPhlpqXoEx2pL890COxTuQLcx+yKx5s0t8JehiCBE523gja/q8Dd8eg==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr4409186wrs.174.1586522501264;
        Fri, 10 Apr 2020 05:41:41 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id d10sm2663747wrp.9.2020.04.10.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 05:41:40 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-devel@lists.openembedded.org,
	yocto@lists.yoctoproject.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-security][RFC 0/2] generic dm-verity support + BBB example
Date: Fri, 10 Apr 2020 14:41:33 +0200
Message-Id: <20200410124135.24217-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I'm terribly sorry for spamming, but I eventually decided to resend it: not
only the tags were messed up but I also added a v2 on top. This time it
should be good.

===

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


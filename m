Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.67765.1629370981288188412
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 04:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YiBZncEb;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id q10so8482256wro.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 04:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RESp6Mgu+NOes7LBlok8PtBfOrPiMUU9fUxGLmO8kHo=;
        b=YiBZncEbxCJr33zTYuG/DIbn1OBlrlJh430IJSri+SVNXwefaCohCzsFKTQA69d5l7
         jUJNcNoPu4S2PAaado5sEE1ijMkWaZNH+CLOO7jKve/fYJT13icScXvtfXgUW9nbNMkR
         HnmAgZHPN2jwsKrb01kuNOQTF7iWHK9bhFXzLmuUbVrg1aiatvl2hCnvuSCE8Z9dkvB3
         bpHUjCRPcll/3nwT7wz8ewIxiF+k0UqMk1MMYisMOK7PDOwpq6n+RSpNnsjre16XPip6
         LVRgmFMhyZZT3YtBORAik5zmR3dPWWLuSb/HQJp3DyuBv5Y1Fo7kTpQRnP4kkxBXkx14
         0iXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RESp6Mgu+NOes7LBlok8PtBfOrPiMUU9fUxGLmO8kHo=;
        b=JD4ExXAfQumjkbzDRJKy/VqdYBCiS197Ykez/2aWK8JBmHowmj7AaUdfqW8loDYK4c
         z6pIYgfRtSjwLC/3sxFnJvM6xBvIlhVezfumClcPka/nv4MhsoZr90h4EIZp1WrWDUxG
         D7jRFgdXvRqLDekpGXTgbgUjoTMMBvQvYH1WnGE1G1nQrhADaFbmJsvvJT5EaRC6dKUF
         nZw20mD7sFwCGTH0/AznrEZVVTGDukIAyNET7JqBBOGk+e28NsuroNhlYdo8wsXVqX7p
         YxgBCooHuTFFBQJ3KYNgNN9nr7omoCrivtni7bgjMkneLXkkQPDsH8iBXYF5Azr+L6Va
         NdhA==
X-Gm-Message-State: AOAM5312wUAMSeeRBWaL5of7ObdJV2S+1j9G1/8LUIlHPLJnGT/fckIX
	BQPfhs/lGhfn+/0B7u2f1283bhDRiI4BcA==
X-Google-Smtp-Source: ABdhPJxPORWmgO2zWDAj+dwT7qaiHpS/XVrPs4jBw+4vZf+o4X+moUrttoIpYFYHQkqQGj5Opp7UkA==
X-Received: by 2002:adf:e9c4:: with SMTP id l4mr3115615wrn.15.1629370979894;
        Thu, 19 Aug 2021 04:02:59 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f030860fe64da8baf3ac76f.dip0.t-ipconnect.de. [2003:f0:7f03:860:fe64:da8b:af3a:c76f])
        by smtp.gmail.com with ESMTPSA id y13sm2119642wmj.27.2021.08.19.04.02.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 04:02:59 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] udisks2: upgrade 2.9.2 -> 2.9.3
Date: Thu, 19 Aug 2021 13:02:48 +0200
Message-Id: <20210819110248.3505349-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819110248.3505349-1-schnitzeltony@gmail.com>
References: <20210819110248.3505349-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes since 2.9.2:
* Ignore "Extended Boot Loader" GPT partition
* Use the mkfs command to format exfat partitions
* udiskslinuxblockobject: Add safety checks for UDisksLinuxBlock interface
* udiskslinuxfsinfo: Add dosfstools >= 4.2 quirks
* udiskslinuxblock: Re-read partition table after creating FAT filesystem
* udiskslinuxdriveata: Use GTask to apply configuration in a thread
* udiskslinuxfilesystemhelpers: Fix leaking string in case g_mkdtemp() fails
* udiskslinuxmdraidobject: Optimize unused data out from the g_io_channel_read_to_end() call
* udiskslinuxmdraidobject: Handle source attach failure gracefully
* udiskslinuxmanager: Trigger uevent on a newly created mdraid array
* udiskslinuxswapspace: Trigger uevent after setting label
* udiskslinuxblock: Handle missing parent device while looking up drive for block
* modules: Limit module name to alphanumeric characters and -_ separators
* tests: Mark Drive.ATA tests as unstable
* tests: Handle missing /dev/disk/by-path gracefully
* tests: Respect custom method call timeouts
* tests: Extend iscsi method call timeouts
* tests: Extend module tests with invalid characters
* tests: Do not dist config_h.py
* spec: Do not build udisks2-zram for any RHEL release
* udiskslinuxpartition: Trigger uevent after changing partition type
* dbus_tests: Fix including non-existing tests based on tags
* Add (no)autodefrag to list of allowed btrfs mount options
* udisksclient: Make get_block_for_drive deterministic
* Fix two comments (one copy'o, one typo)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../udisks/{udisks2_2.9.2.bb => udisks2_2.9.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/udisks/{udisks2_2.9.2.bb => udisks2_2.9.3.bb} (90%)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb b/meta-oe/recipes-support/udisks/udisks2_2.9.3.bb
similarity index 90%
rename from meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.9.3.bb
index 348f64752..de8249e28 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.9.3.bb
@@ -17,8 +17,8 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 RDEPENDS:${PN} = "acl"
 
-SRC_URI = "git://github.com/storaged-project/udisks.git;branch=master"
-SRCREV = "da6d9480fefeb0ffdf8a84626b5096827d8d7030"
+SRC_URI = "git://github.com/storaged-project/udisks.git;branch=2.9.x-branch"
+SRCREV = "c430dd9a27e158693cc783e9ee91bf6e5b2a8819"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
-- 
2.31.1


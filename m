Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13E5C79F9E
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 02:08:07 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.526.1788833283374194439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 19:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KNnixgxh;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc149372c14so1932081a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 19:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788833283; x=1789438083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+c2dFac43txWhwdHWfxj7txH+u3lSEQIzej4CDqzChs=;
        b=KNnixgxh/JF6YpbpjOoe+mE+jxQX5fe1cvTesLKQAq14+fP3TsU3NgoDWEy5HXVXlJ
         6aFQR0LLKAirp7nP4MssRkaLEWlmtOlyNPQ02JEW5zto2fyKLy6LNFnd/DfaAWJHhBeV
         7hpBY8U43+RXvTKLuf7PHRmOeDPQHCfcj4FKow6ekrnHKsK6TfWWdFgitYJoEf0Dyc5p
         5UtZTIo6rQJ59oPUvYZF7F6178Cn/Nyhsx77TXk4G2s/B3OfvcP1R/3eViILh7fQfaD8
         DYcAuEC9IpogDL5fd8Ofhh2c0yXh51ssxeEg8Ec3QNSjKj+udN3q/5YptP1XHJDo0Cax
         6/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788833283; x=1789438083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+c2dFac43txWhwdHWfxj7txH+u3lSEQIzej4CDqzChs=;
        b=pr7zl0YsY9bkWOfK9gjDDtlhMgNOY4PfmSbgs3V3vAlw0H+RoTgzUCiwt7ZxO5arGs
         VfwYE3QZKytQ8XIPI9zgFdWZbCPHiF8RwKpv0IxqwKkoAS3TyTZszRQi2gs2cErmFBDw
         1rN9Gu6IX0LKIrBmF5FVcz0j1PbnYSyb1ImTe9eTJwlQ5p9FWJg1Oe1fWJrdtdGZ5pb9
         MOxoH2+dB5Y0SFJ55+5GQz7kreCXLw3D4TQK0QfJfpwUN12aGuxDG4WTcoKOLL3/kGMp
         wt8XSCLPKAH1Ml9g5A1jp9pwEQN0trud/B8aVkD9yIjg1DsETAh9TaiL6WhXaStvoCsX
         wuqQ==
X-Gm-Message-State: AFuF++nhzmdnRhqyK6GYPrV7vtftXxnjjncZQXWkUO0ttTAkVN+O0T76
	2NuEVq/bsTa2VhccK5mZRlnUM6+hw/Gmiyl7+RuG5nJeLSs+LecBORwuNPCb+w==
X-Gm-Gg: AYBFou1RmWJ/YsYW6VDYeIr0mFkTA/QWMH5yzX8R9kAnuvFIdHbrz+hq+qzKgN1ykbO
	Vb2GNqfVZUMktgPdXWZ8pGUw+Chb+ZiHxfY+n6oFGTZ3Y6qlxKVYskuPaPPjdOXbCIxKevIVLLl
	BzXsYu+xi7kWNXrpirzoa6TqP6yhRjOHKDYYwcey97V+qjpwdCh2kptWCUz7EWLiHEwigQvg3lH
	acLPWkv8qpCIhty9o6MwteL09klZsfpL48UyZaECLUc6nAWGiutUJLdtDEhd3IdPhVAKzQrgnF/
	NTmgL/aTayDW4+9BFprbL9MdWkC9lKSBqe4gxcL9FHfJ26pQ0etjnnmhTLz6yJQEA9nLgDVO8IO
	UmNSOEu18Wx31uYM1IUZPgS4jH9yLTVr6uQ74NiRbxXShH+P3XPxCJsutgW59vTdROD/6NSC1pn
	E4ozF+lkhyd3POl0fBSDH4RWKkLzkPEHtvSJqy1OKBFp3yxyWaI7YtI8sguXbNz3NaSqoQFZti0
	g/m8XxkE+R6x7xMRCAH4q302H11McEu62mUmEoo4Oe6X+ZGLhw/MThQUK+9g35jEJbp5zCQSCl1
	anoq1jB5jsTln7pR9liNWC7zWYzyzrzbN6xNlrnfgONlrvkT3KzaVCkD8jHIC0wn7FtEkn/HKDW
	9VWSqs0NvYzyuh6zUgwmmg1jMkLso4vQPumvJBgqGZwV6Fg==
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr38040582a91.14.1788833282541;
        Mon, 07 Sep 2026 19:08:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm14044803eec.20.2026.09.07.19.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:08:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 5/6] zfs: Upgrade to 2.4.4 release
Date: Mon,  7 Sep 2026 19:07:51 -0700
Message-ID: <20260908020752.2748681-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908020752.2748681-1-khem.raj@oss.qualcomm.com>
References: <20260908020752.2748681-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 02:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129853

Supports linux kernels upto 7.2

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-filesystems/zfs/{zfs_2.4.3.bb => zfs_2.4.4.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.4.3.bb => zfs_2.4.4.bb} (98%)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.3.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.4.bb
similarity index 98%
rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.4.3.bb
rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.4.4.bb
index 241ae19209..a92efec541 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.3.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.4.bb
@@ -4,14 +4,13 @@ LICENSE = "CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
 HOMEPAGE = "https://github.com/openzfs/zfs"

-SRCREV = "83020cf8259d057d4cc9102010c05f07ffdfc136"
+SRCREV = "71a9f9578616a90c3c14bb59629fb4d31bfd68d1"
 SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.4-release;tag=${BP} \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
            file://aaf28a4630af60496c9d33db1d06a7d7d8983422.patch \
            file://0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch \
 "

-
 # Using both 'module' and 'autotools' classes seems a bit odd, they both
 # define a do_compile function.
 # That's why we opt for module-base, also this prevents module splitting.


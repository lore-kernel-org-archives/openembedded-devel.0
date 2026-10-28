Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36231.1793161597340658120
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lRiALIo5;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso318283a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161597; x=1793766397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dumgubHzEU1E/yor9IhW5W+tq+KtZhiWvEPkY7OsG3A=;
        b=lRiALIo5AdKZL4TUCcWsFWzDie0aTLbIjCziOIi3WPqyVeEYmyiVurKfw3PN6i1UsE
         JGLrMlKresepXIx6pi7gTTc1uhFohsrGSwcjp2HCpkmtSULm2wcrSMM/QtesQmWnXQmL
         oA7SiDcWj++W4ZPKT8J5QIQZ5Z6f6zSHOkogMgFdc+DMoX8mkBVQD9TyYigHmZ5v/bTV
         OluNFVMepmaOSh6Y63UBhZWHGNzmp9GJfeKh629+911WXtVZtDYs5L1eawnP/H9AGRqT
         z2uf662mum9m/+aXdppNRCCicDea4PvrApnOpYJ8ovN5n+zMEwh9jh2NV7H+5pp4vxCm
         AaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161597; x=1793766397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dumgubHzEU1E/yor9IhW5W+tq+KtZhiWvEPkY7OsG3A=;
        b=cXDp6kYlD286WGhmtn1UQvd9HAWczpB7vGjypGZ/odUP3/dduavyYSiZLGcLTj4VNL
         2u1Bul4JoGVS93KCqALIGMzhnOochlOa1eXSSU4thtWBjyySxHihNW1n3xiES6EL9SzJ
         u3RhV2uJBGYuOvpFTvj2Z0/W56qsGadHFAkOBsW5gwMUTFN8FuGQlva+bJOKzdK9TCh4
         bzeSjh7hMLESn1hEZZYAUS21n+7orhHurBf8lI4k/DM17YKbH6UlYjlIekPAaMUzKgiz
         /hGZ7WOQVQpfK6GKiNk6Tdr3RslCf3eD0UG9wnSm3oWKbsHLFgRcw1VwiSHrxcogxzlx
         OriA==
X-Gm-Message-State: AFq9FYLQ8rEfBL1hS832tPeUFM/4mI8t5qri/vRwrAXGKr9+qaeKLa0h
	kATnFqwdteuVnuIzxk3VmrkO8AD/kDvDET1gH2LULKz4vLJtPO60gy+odoCcnQ==
X-Gm-Gg: AYBFou2sagFj9LoVmlLqTVeX83fNDRJxTRDrI0+l/5CB/kmAdvvDR5fFVsQIt21Plya
	eDRJJcBgcVGGycqD0qVjLXpPC7nLDEeqVQZlzeCdCAy/kV4F6fNlccfKAdJdyTsd4EH+PNTKU8M
	Rc9tt6S7wUnM03RX6EjfEVHLLGQH3xjxozuDVUFApM0MuHwbMF9NlF/Yg8w5GXON9jBZOourvPT
	dmLdWkPio1v6Q7ra/xQy6htaGFsbii76ZUDsvlv8XBjgbLH0WniFdAtZJNlaZuXr/XmWFdUTT3P
	jJ8beEOdY5GHpizFelpL/rLb2EqE/vd2O89ZjFS1mc8QV6DYgcvKgndV3TSOSJt3Z9kJJajKHp2
	glM002w7rgol0+xPjW4JcxBgqKzTO8fuDzEaZIslnBZj6+SSTbsSWh83bZyULg7RiLu1I7i9scN
	jXZu+I+cHCzJf1SbK/A6kIukqAje3WbyPh78dQDD2CC4IaewMp5LuhCsEarDc/TYr57bxn4XxEZ
	924cnlLrsPao0K2DMRJIo4PC3IWiBhKkjKzVZaHOBN9eFaIl9q7ILP6oPvp3/soL5SNEUFI+2+9
	rYKrDtmaK4ewLsxuMmkbK8bVcLqDIAyvJmXRxBuD9TCPcJI1zZFwPs9eQbh0iQ==
X-Received: by 2002:a17:90b:a09:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae57e35220mr613465a91.4.1793161596708;
        Tue, 27 Oct 2026 21:26:36 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: James Lee <james@codeconstruct.com.au>
Subject: [blacksail][PATCH 59/60] mctp: upgrade 2.6 -> 2.6.1
Date: Wed, 28 Oct 2026 17:23:57 +1300
Message-ID: <948fbdea56ba7f8c3dd6358615ff7dab69579916.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131610
Content-Type: text/plain; charset="utf-8"

From: James Lee <james@codeconstruct.com.au>

mctp 2.6.1 is a bugfix release that corrects mctpd's systemd service
file. mctpd requires CAP_NET_RAW to send MCTP control messages when
running as an unprivileged user. This capability is missing from
version 2.6, breaking mctpd.

Bump mctp and mctpd to version 2.6.1 to correct this.

Changelog:
https://github.com/CodeConstruct/mctp/blob/v2.6.1/CHANGELOG.md

Signed-off-by: James Lee <james@codeconstruct.com.au>
---
 meta-networking/recipes-support/mctp/mctp.inc                 | 4 ++--
 .../recipes-support/mctp/{mctp_2.6.bb => mctp_2.6.1.bb}       | 0
 .../recipes-support/mctp/{mctpd_2.6.bb => mctpd_2.6.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/mctp/{mctp_2.6.bb => mctp_2.6.1.bb} (100%)
 rename meta-networking/recipes-support/mctp/{mctpd_2.6.bb => mctpd_2.6.1.bb} (100%)

diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-networking/recipes-support/mctp/mctp.inc
index c8fc98f63a..cc140f23a1 100644
--- a/meta-networking/recipes-support/mctp/mctp.inc
+++ b/meta-networking/recipes-support/mctp/mctp.inc
@@ -3,8 +3,8 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4cc91856b08b094b4f406a29dc61db21"
 
-SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https;tag=v${PV}"
-SRCREV = "31ac0e86b0e23d32abf34d191653a87a47f3c9a7"
+SRC_URI = "git://github.com/CodeConstruct/mctp;branch=stable/2.6.x;protocol=https;tag=v${PV}"
+SRCREV = "ea1dfa9e59681c42d02ed3bf91cb150161481403"
 
 inherit meson pkgconfig
 
diff --git a/meta-networking/recipes-support/mctp/mctp_2.6.bb b/meta-networking/recipes-support/mctp/mctp_2.6.1.bb
similarity index 100%
rename from meta-networking/recipes-support/mctp/mctp_2.6.bb
rename to meta-networking/recipes-support/mctp/mctp_2.6.1.bb
diff --git a/meta-networking/recipes-support/mctp/mctpd_2.6.bb b/meta-networking/recipes-support/mctp/mctpd_2.6.1.bb
similarity index 100%
rename from meta-networking/recipes-support/mctp/mctpd_2.6.bb
rename to meta-networking/recipes-support/mctp/mctpd_2.6.1.bb

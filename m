Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDA6C61DA0
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:36 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.44970.1674653492937625935
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cYraXAWa;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1631b928691so5023453fac.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ug9SQp81rasDRime2atcCVTQNOu7erVQpsI8CemaXP8=;
        b=cYraXAWa+vLiowj98RI0QMW5L/RisGd1GdX8w89eehZNMq7WUX7bQN5H48BB0f4AI2
         a4000bn/bMBX5lFU1VCZ+6j+2BolVBE2K8UeaPjFqDHIADUwz3BJri20a7cob+GRmAFE
         TM5CspyLiTAKvXPzgYxQqG8S3neQN2cgcmbYz/M6xds7ooQ5ZT0N8nkezfqkH4ZBqMaJ
         0iN0sXtXenu8XLEy+tdSh/kMpNDx/CDQ39zmjbApgvdWa/0h/YCm54OBBzyhqgtqjJHE
         B0tFPnUUncszqXzKyoHNk1leNcjJTCTar1f1eCAmKB8v5qtNx5u1ZSTc7DK8zHdGU59T
         ITlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ug9SQp81rasDRime2atcCVTQNOu7erVQpsI8CemaXP8=;
        b=fmEyJqwbizE4muTGbuEkK5DBxyGur01ttCyYt0mgNzGnr8V+o+vBk7AiMpFW3YHl80
         nSP2gEWh2rnSGN4T3OBmAst1/Bik4AJgV3M5COa7OlcSHh+P1mZVQZ2dtXoXpRxgZ9fV
         5QrsOOx4oAPIHGmoyGENGjjUUINtAgx8TGF1DJnl3ywXnYNcEv4yvhc4xZEzOa4d1Yx1
         AT/ui1aTTgKUclvC1GLr/kWEfwIkeR5/irPgRwVbXCMOhOuoz0f6UxCZbVhcVhAzb83W
         YcshwfUNua697Vb5r7mB2bNfUSvwJEWBu2OoXDbYnRWUwDsRDxZ6SDftmGhMSk24hTx5
         vCuQ==
X-Gm-Message-State: AFqh2kp7jH8oeH2lFtibl2WH6x3CR14Al+ivgC5REZLnKj0VVYPVOdS4
	hJWAdkJylbx4QEuuLWgPKrSMxdCSD0k=
X-Google-Smtp-Source: AMrXdXuMbIqbye9i5jpOcHFIgwbZn8emqFL8crjbZ30Q7CootHaqvjTgYf8KZg7Xp5O9wI3OWePO4Q==
X-Received: by 2002:a05:6870:eca5:b0:15d:fe1e:2741 with SMTP id eo37-20020a056870eca500b0015dfe1e2741mr30082411oab.4.1674653492133;
        Wed, 25 Jan 2023 05:31:32 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 06/41] ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3
Date: Wed, 25 Jan 2023 08:30:48 -0500
Message-Id: <31b485825618d36ae7068e6b2766b15a31f49197.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100741

From: Omkar Patil <omkar.patil@kpit.com>

Changes:
Rejected zero-sized runs
Avoided merging runlists with no runs

Fix CVE-2022-40284

Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5d5e8854718dab02c2737e3faf288f830a514841)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
similarity index 95%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index b29716ad49..37a8106bb0 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
-SRC_URI[sha256sum] = "0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49c789510fd5eb93"
+SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
 
 UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
 UPSTREAM_CHECK_REGEX = "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
-- 
2.25.1



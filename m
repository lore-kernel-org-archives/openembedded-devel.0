Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDA7C677F1
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:22 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.46803.1673191278868958808
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y9raRjw+;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id s187so5166740oie.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ug9SQp81rasDRime2atcCVTQNOu7erVQpsI8CemaXP8=;
        b=Y9raRjw+mqEd/B88ajMgn7/Jt4nrhmj9pqupLQvxn1zlOzItnIXVIIpMMS7lh4fuNQ
         SBc8dXkFwJPmYvyfwWhJnFFPLVE3Nj8twhIVLkOOBjRAU9iTfbSUk8IsCPmoEiw9DGqF
         IB8Lbqek3ENWhFUN3JDCpMekIZTN/1WgPSCqW50M4NxUlea3jhO/SwTXWAm0hNqrQtNo
         T5kOD3ERSnBnEaAYt8XLv3qoxt1hTawQyFy2jxxXriHii/f3xQyBpbcOAdFFRCIE8SzE
         5Fsg5AKtELMUdM6KbFnZZl7exkGuLAwWDIDgflgjIxP6Jt6kgQQjWPxhN9npWQN961QW
         75kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ug9SQp81rasDRime2atcCVTQNOu7erVQpsI8CemaXP8=;
        b=asernQ6+X4xjEH0YBLQi0T3BQ3G2pqaioKkC5Masd2caIuMxZAM7JgWBrJIibzRdS1
         MM49UX2GibvSyAQtDj+dtsNuEn/rG4AqIUYZ8k7Eo3qKpUgTQFBtvqy0ZG3rzUhtmgLN
         q5wEO3nWL0NqpFtcn6CUlcuFmwE7rI1SQGCQ7WsliOpwPYhs326T7t2FGvdS8hiMUGhn
         010h0yLDtw2e5FTR1aWWcjzQo59fAbY13Qp4gGcYvT7qjzQ8sU5ixxHEXe/5iIZ7LVtP
         XhXKNsuUMkOk7znfjwIYST78AMQ1Jq5xYFtx9pSwWD5JwtWf5e5OJImZa3wifw/X8njj
         zHxQ==
X-Gm-Message-State: AFqh2kqSVj6Bu21tYnCfvqIfzKBouOSVP6RaHPmw+GGY1chv/pnYbzYB
	aHmKgYzS+ED3tx1TNmC6UEuQSNt+gLo=
X-Google-Smtp-Source: AMrXdXtZQPXljt69OhcHQmK0EoX7tmw8s3m89L5moX/s5buhaKppeDkHW8iDrKY8Jt/gP26jywd3Zw==
X-Received: by 2002:a05:6808:89:b0:35e:7ef8:d85b with SMTP id s9-20020a056808008900b0035e7ef8d85bmr25060850oic.37.1673191278115;
        Sun, 08 Jan 2023 07:21:18 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 06/26] ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3
Date: Sun,  8 Jan 2023 10:20:41 -0500
Message-Id: <31b485825618d36ae7068e6b2766b15a31f49197.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100451

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



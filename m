Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5318ECFA756
	for <webhook@archiver.kernel.org>; Sat,  5 Oct 2024 16:37:09 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.15192.1728146227421551771
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Oct 2024 09:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P1irHTT0;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71dc4451fffso3111230b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Oct 2024 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728146226; x=1728751026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CrOnXMI8cGE6PYln/7X3YCrztZJMND6/pmc4UVh48X4=;
        b=P1irHTT0sDarItzJYb2kZ/C/zQkOGdr2W12RizG2gpS6cFyPzDIi5cWvVKxe7TuRx0
         Ml9yv0tVhU0QnTYiMOrICXXll4nDscNfoMY0oKnsLF6O/qKRmSLA4N0LKCmcLzILWofU
         mKK5CMtYK8IhFqANxWMa2BwTS+OT9gR6SeeKdN2mRIZgU2NZT3GVnBGSANpPvJ1moBPs
         N7nqELLfYn60adMHDUfu+TyuHBzZkXvl1GwhIana7BJm5ts09169bBf7WD1TEDkzhTa5
         P7ESmE2XCRY3h1n/6gIh+CtoVVIF0MqUgex4gxOtzEaxQkxaVxnxdt2RR7fK8CTgJ2oK
         llQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728146226; x=1728751026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrOnXMI8cGE6PYln/7X3YCrztZJMND6/pmc4UVh48X4=;
        b=OEzLjjmseCtrtodcGz2ABhz44mkZl4dASNFRpN8gBeqwKA5nRTOnB45vWxR3S8hSF6
         +Yy771c+rlJ9qis/Nzq4d/QoAnImGkjKAAYCc0DQ1zaTX+F/UHZSE3G8Nl+j6msvyP2U
         FivQjkSVsFzGSqtIjINyUfQ1lX8UV3iuPiJl860WtP+pt0GFExNe62l1QV9HoLQOd6kU
         N/cHMEs2jbDiYGQyEUaJGi5JtF8akfoLQR+FlEnHGnI50FyPl+sIDAj4gYGJuNneHh2g
         pJcm2ghxBvq3rc5nJGOUwq2sSyK5g5ThOgqfd5DE70wgiKO62XBakITIiU0vL8iJ/1E1
         yrgw==
X-Gm-Message-State: AOJu0YyMEIYTcNot57D0JhXxqBwdgZeynyKkHPbXaYI337laAJnvsvrs
	mcnMf4fnSfOSR6h5VDiycQv3FSJiYCpXFysYcC5vCSKsaBb5dX7C0h/NTo/N
X-Google-Smtp-Source: AGHT+IHSA0jb/tw9oW4bGO0FjxGRkl98IsSv65iHZm0Tt0Y0v3ZXE1iXpyCu4o0wwkto2VRtFSxGqw==
X-Received: by 2002:a05:6a20:cd8f:b0:1cf:337e:9920 with SMTP id adf61e73a8af0-1d6dfae63dfmr10351748637.47.1728146226425;
        Sat, 05 Oct 2024 09:37:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::23dc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f6c3758esm1934754a12.74.2024.10.05.09.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 09:37:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] sshfs-fuse: Do not prompt for known_hosts during ptests
Date: Sat,  5 Oct 2024 09:37:04 -0700
Message-ID: <20241005163704.2594867-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Oct 2024 16:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112676

ptest runs are non-interactive, therefore ignore
adding to known_hosts on localhost

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sshfs-fuse/sshfs-fuse/run-ptest                    | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest
index 8d2017d39c..5aab54d5b5 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest
@@ -1,3 +1,11 @@
 #!/bin/sh
-
+mkdir -p ~/.ssh
+cat > ~/.ssh/config << EOF
+Host *
+  CheckHostIP no
+  StrictHostKeyChecking no
+  UserKnownHostsFile=/dev/null
+EOF
 pytest --automake
+
+rm -rf ~/.ssh/config


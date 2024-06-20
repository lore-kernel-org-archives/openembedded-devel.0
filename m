Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEFAC41513
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 16:11:02 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.51707.1718899854990483609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 09:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=AC8EqNPl;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.222.193, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-7955ddc6516so69788585a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 09:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1718899854; x=1719504654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/OGCV3qRp1DXq3OcJazwDy4RIIGu0tPtwPxG/EsvXzE=;
        b=AC8EqNPl78+p8pVXtSSW8KZCZswYHH3nDxt/s99c1vbk1bqxZvF6QS/iMqL8LBocTD
         UqCkaaKY/vyShDYs8IGGOVY4pbgpZ1/0Ngf1guZityOInipUxqTN9kc9/xTkb4YBod/o
         SO8Z13INR59qkv2OJ3LjUKci7k+n7lHG0j1s9dSvYSigt2kA46rbvMnK2YiSK9xDK41V
         +fCb1fY5RsPCFtr3DHttjl5Qt+9vqiJUNHWa9nn5X0gD7Wm6WFbh1y1O5yNUewwZCEJW
         svM6MRn5qLx2YLcGRGPnlCd5LQK1JGJ+9eq8ld1watIPbaSD6+la7eE9g2M63XXHjRll
         1uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718899854; x=1719504654;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/OGCV3qRp1DXq3OcJazwDy4RIIGu0tPtwPxG/EsvXzE=;
        b=tLvO9nPvQQM3zgX1ohKfGyhw8BMwMeEFV6sfxNrlOMxfm0sDNKDEjYELI/i+Nt6/3O
         NPMevXxasntEJGeMcFeHZr6UCzx29fsf5hH5RvhLojMqOxw57FnSUlQsxqghUnQOixZB
         KURxIOozUygId8U+C6ngKIs8aFa5yuE4BJ/mP78b7/TaDdwXgMXjcIItUzU3Ey2eV1NJ
         75HMZRE9lk94FmKf0KqIDVmCmbXXbdWj5qvBUcmqvc8gLNBF2w7tL+RneBWeiQL2Uy41
         x6k3w8z5jvPZGQ9i208EDa667RfWqsXXzUxW0r5Wg4kuhio8U8kv/9W6tr1tDqq3fYuw
         ffkA==
X-Gm-Message-State: AOJu0YwSstp67CqNSkSahrQ9c0QzxYq/nsdEAlaLni7tkxMEqYhdbTrC
	Rbb5XhwAkCBnMH7OBDdWVtndGmtEVRDTfgrEimnMfbgUypYBplsWeGoOO8SE9BjFabGnTei4J4D
	4Suz2Q6pOXq0=
X-Google-Smtp-Source: AGHT+IFZNlY662osBbfZRdFb4lqLf2vpiXDGmfEfMooGN24PzH2D6xgs2HLrY0WbYYPy4XeKl1gK0w==
X-Received: by 2002:a05:620a:44c1:b0:79b:b571:4bf7 with SMTP id af79cd13be357-79bb57151f9mr571899085a.21.1718899853980;
        Thu, 20 Jun 2024 09:10:53 -0700 (PDT)
Received: from localhost.localdomain (pool-173-35-206-140.cpe.net.cable.rogers.com. [173.35.206.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bad2bac97sm215739285a.123.2024.06.20.09.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:10:53 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] imagemagick: Update status for CVE
Date: Thu, 20 Jun 2024 12:10:48 -0400
Message-ID: <20240620161048.75491-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240620161048.75491-1-ninette@thehoodiefirm.com>
References: <20240620161048.75491-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 16:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110982

Update status for:
CVE-2016-7532, CVE-2014-9822, CVE-2014-9823, CVE-2014-9824, CVE-2014-9825, CVE-2014-9826, CVE-2014-9827, CVE-2014-9828, CVE-2014-9829, CVE-2014-9830, CVE-2014-9831, CVE-2014-9848, CVE-2014-9852, CVE-2014-9853, CVE-2014-9854, CVE-2014-9907, CVE-2016-10062, CVE-2016-10144, CVE-2016-10145, CVE-2016-10146, CVE-2016-5118, CVE-2016-7513, CVE-2016-7514, CVE-2016-7515, CVE-2016-7516, CVE-2016-7517, CVE-2016-7518, CVE-2016-7519, CVE-2016-7520, CVE-2016-7521, CVE-2016-7522, CVE-2016-7523, CVE-2016-7524, CVE-2016-7525, CVE-2016-7526, CVE-2016-7527, CVE-2016-7528, CVE-2016-7529, CVE-2016-7530, CVE-2016-7533

CPE is incorrect, the current version (7.1.1) is not affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 .../imagemagick/imagemagick_7.1.1.bb          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 6ab8a61b9..51bc36e56 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -99,3 +99,44 @@ ALTERNATIVE_LINK_NAME[montage.1] = "${mandir}/man1/montage.1"
 ALTERNATIVE_TARGET[montage.1] = "${mandir}/man1/montage.im7.1"
 ALTERNATIVE_LINK_NAME[stream.1] = "${mandir}/man1/stream.1"
 ALTERNATIVE_TARGET[stream.1] = "${mandir}/man1/stream.im7.1"
+
+CVE_STATUS[CVE-2016-7532] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9822] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9823] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9824] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9825] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9826] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9827] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9828] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9829] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9830] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9831] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9848] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9852] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9853] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9854] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2014-9907] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-10062] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-10"
+CVE_STATUS[CVE-2016-10144] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.7-1"
+CVE_STATUS[CVE-2016-10145] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.7-1"
+CVE_STATUS[CVE-2016-10146] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.6-8"
+CVE_STATUS[CVE-2016-5118] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-7"
+CVE_STATUS[CVE-2016-7513] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7514] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-0"
+CVE_STATUS[CVE-2016-7515] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7516] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7517] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7518] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7519] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7520] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7521] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7522] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7523] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7524] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7525] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7526] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7527] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7528] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7529] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7530] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7533] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
--
2.44.0



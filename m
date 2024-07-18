Return-Path: <alba@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601EBC3DA63
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 15:10:52 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.17423.1721315443689891795
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 08:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=wwAYyyoN;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.128.51, mailfrom: alba@thehoodiefirm.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42795086628so3574745e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1721315441; x=1721920241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+/5ZzUbt14JdhLcVzjReBS64znOffkkiwnDZNapTjw0=;
        b=wwAYyyoN9q2NUxwQGXjWBQ2/oSS4LC4rdGJa+kDTGMghF46DyuZPf4/SGNv/7DJ1jL
         xiCxANk5gXm0ii6EFhjQNNKtsBuOQ8IKZUwNkUQj3M9AkfaXJr621uyq2YRJQYutkenL
         50mk0A7Xrhto8Mw5UyrxRofeCkXF+3QSBaKWXzb3YT26Xt2mJKdKbsb2qcw2iWCMwpBl
         N3WypzxEWWOXt/6JU7dPjIUYd08XRKvaaXXy5sPJjH0ouK9+eInFPYaSLk658UJlDvrt
         +YQT9u5hAH6vqvfYPpjMgvil5RGKEzEwau2b/iMTx1jcOLdbNgSEpG7MLbh8spaOICyo
         4glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721315441; x=1721920241;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/5ZzUbt14JdhLcVzjReBS64znOffkkiwnDZNapTjw0=;
        b=Kco5i90qgQChXPnlfBrqGOwt2PlCaPM339xGKeapIiZcsCZtQD/537Paq3IW1lVc2S
         GUjeZ99d6ifxlTJIS1nT6OFna3N/Uaf7ScPHH3CKU+OeBO38fvz7CBKOaU3rmv5rMsfF
         6rPR+W7xJNvACYnwK72DDDf0XPjs4NtGNMVmWsPxj/cAliq4pEWBSYTiFUVI6JDmnPvh
         gRAqGvzit/cvNG38WlLk3xcsHTffhM1tUZLxqT4N6Cx64O9OZzJqqnCMo+ItnR5NPen3
         0HRZs3b4R6yFqChrWaM2zK0VvBmzzwXRJRq8TWqkoajYNrPpCFiwlr1KCcfXuKsJPjGu
         ShaA==
X-Gm-Message-State: AOJu0Yw3/wmStJPuiYkgqpZaUkFsUQmCPeS4ppKrUHKYJ5ozZ4KFdP2F
	b7YwRYQn5ZKctKNum3xxM4XywhwS6IBy2Yuegid2jamRmnB5pKUIKl796o5THIqj0p393XXyuF/
	j5rg=
X-Google-Smtp-Source: AGHT+IGR5Fdw4E67qc4dUfmF3jK/GQrUG11v7lH+2Q35uCNB5exqs4fN7uBrDiYtZoFb0tTngRUm4Q==
X-Received: by 2002:a05:600c:3c9b:b0:425:8bc2:d01e with SMTP id 5b1f17b1804b1-427c2d0df44mr36484275e9.39.1721315441183;
        Thu, 18 Jul 2024 08:10:41 -0700 (PDT)
Received: from localhost.localdomain (20.red-83-57-108.dynamicip.rima-tde.net. [83.57.108.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3685834365asm1765989f8f.64.2024.07.18.08.10.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Jul 2024 08:10:40 -0700 (PDT)
From: Alba Herrerias <alba@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Alba Herrerias <alba@thehoodiefirm.com>
Subject: [master][PATCH 0/1] imagemagick: update status for the remaining CVEs
Date: Thu, 18 Jul 2024 16:08:57 +0100
Message-Id: <20240718150858.15859-1-alba@thehoodiefirm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240620161048.75491-2-ninette@thehoodiefirm.com>
References: <20240620161048.75491-2-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 15:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111400

Update status for:
CVE-2016-7532, CVE-2014-9822, CVE-2014-9823, CVE-2014-9824, CVE-2014-9825, CVE-2014-9826, CVE-2014-9827, CVE-2014-9828, CVE-2014-9829, CVE-2014-9830, CVE-2014-9831, CVE-2014-9848, CVE-2014-9852, CVE-2014-9853, CVE-2014-9854, CVE-2014-9907, CVE-2016-10062, CVE-2016-10144, CVE-2016-10145, CVE-2016-10146, CVE-2016-5118, CVE-2016-7513, CVE-2016-7514, CVE-2016-7515, CVE-2016-7516, CVE-2016-7517, CVE-2016-7518, CVE-2016-7519, CVE-2016-7520, CVE-2016-7521, CVE-2016-7522, CVE-2016-7523, CVE-2016-7524, CVE-2016-7525, CVE-2016-7526, CVE-2016-7527, CVE-2016-7528, CVE-2016-7529, CVE-2016-7530, CVE-2016-7533

Ninette Adhikari (1):
  imagemagick: Update status for CVE

 .../imagemagick/imagemagick_7.1.1.bb          | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

-- 
2.40.1



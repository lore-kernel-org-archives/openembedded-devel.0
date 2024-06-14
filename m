Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A363C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 11:19:39 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.9055.1718363969567043978
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jun 2024 04:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=QBpXJDrp;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.222.172, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-795ca45c54cso119558285a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 04:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1718363968; x=1718968768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jchrfrHkgSHF75kX4UYcT5vjQsPsUFfJCq0sTOX8dOY=;
        b=QBpXJDrpu9bW2ATR2KAXFghtItmPjbcqlQpUi8FQz8EcDKU/em917zbWbL6UNeuw9U
         3CLOMJIXmVqqYbLQArlrus+Dbmzzul7sLocHiBFRcjE0yzN/afTropdzMXPpbs4OYsYs
         J/FSohIJjXx5P/Cr6DHtda2IMg8kGyLb1iaCktX4fXdPl9GUW8dtD0CcCVkjyYQcdQJk
         eoXzARZpt+b93sH/ZloQRfSPlNNdcoJrtMXPDF+MeF5asK+rfLXIXOe3yxEDbvZemgwu
         A79twR/GLdv26d5Kr9CYY1/Vkl49ZXdMN1V7XNLZfvDYJYGhdHgD15aNTm0CAsYERPz+
         PnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718363968; x=1718968768;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jchrfrHkgSHF75kX4UYcT5vjQsPsUFfJCq0sTOX8dOY=;
        b=NUj0HtrWDmL6iFxkeN9hCRLX88FtV1o7ePQwVgDtxhjznqSyixkxe+gJxTf5R6x/Wh
         fFn+wEuzjwYIxKW/zmpRpKU2/vm+ZROFKfht2T08aTNCIVJSxdTIputOMQLNCrsISmRo
         dIgHHr/d2jePe5Fw8Jb2RMRT0tvaayhbJtKtfKRLV/5LThLpbXZ+hMd+sqqStwvuxWVX
         A6FW9AdcvTGyUpnnXclyCeazNMSInQwA/HiGwt62bOOj9YgQ11ewVcIoJmz8d3odmsVm
         5ZMUu6mQiSfSDzW9JErq+uuiSqUKA8lRDX3eX2KL/Rb/1kC7bwbBHG6a+TLl9New9PXX
         wA9Q==
X-Gm-Message-State: AOJu0Yzh+2TXaF0xZIjznodKN1Aksk/1kNEg6U3Ks8a6QR7jE0BCfAnC
	RWJV/NL7aCq3VGQQ+rNOzDgaNTurTd7glvJTubvaGF2990AP8rOx9BeP8fJeshNJ+xUmyE3dOEU
	Eaq3KoA==
X-Google-Smtp-Source: AGHT+IEK1gVTZ2NYXHS3ZKFyyO8/HpHJGxsaOvEzO+WY91RhWxZh6o6Q6mhwMqjF84+9nKWqAay8rQ==
X-Received: by 2002:a05:620a:408b:b0:797:b67e:e84f with SMTP id af79cd13be357-798d242e126mr229562585a.37.1718363968320;
        Fri, 14 Jun 2024 04:19:28 -0700 (PDT)
Received: from Ninettes-MBP.home ([174.89.68.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aacb1e6dsm134668485a.13.2024.06.14.04.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 04:19:28 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] smarty: Update status for CVE-2020-10375
Date: Fri, 14 Jun 2024 07:19:10 -0400
Message-ID: <20240614111911.46353-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 11:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110904

The recipe used in the meta-openembedded is a different package compared to the one which has the CVE issue.
Package used in meta-embedded: https://www.smarty.net/
Package with CVE issue is from newmediacompany: https://www.smarty-online.de
No action required.

Ninette Adhikari (1):
  smarty: Update status for CVE-2020-10375

 meta-oe/recipes-support/smarty/smarty_4.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

--
2.44.0



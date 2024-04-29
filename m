Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980D3C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:07:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.17948.1714388860325147996
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Mz2Rj1MA;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.128.46, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41b21ed19f5so30249035e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714388859; x=1714993659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4/eU8KHDqMlNHj0PljxlrHU7scdTFfesMcA9PEzdis8=;
        b=Mz2Rj1MA33MpIfMnb+63GcfXbSJ0aHRbf8cdJBim965otDGJ7aYqQXApChYokRL5HT
         djDl4xRhOliBDSCMtXoDsqCprK+ICfsHXByS8e/xVGxdWZpsqo0aEAyqCr/Yg+3KNH20
         9d50A0sAsRiysqfGSRQE3n6xD0jfkwDuYI6eMPpnNEi8Lk4mqN40egkF4CQq1zBOuEtJ
         N2cDF8PVRs6s4frRhV2ZoJnyCIZP1O9lG4Z+mLNkoaKDdAxDCOo6aeA1ZH8UPLnsHZLx
         lY7XimD2Ek8d1ypem6PZdFTE1FDK6YsSc6+l+PT/AIDgmrS8jJT5EVUbk01zMa/C7OFD
         oinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388859; x=1714993659;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/eU8KHDqMlNHj0PljxlrHU7scdTFfesMcA9PEzdis8=;
        b=vvccBiaIJv++5gZD0zOdHEahpu8W9fCnI5dXOygTo6XBJgnjWqsvvTBrFN3I7Td8tv
         SjZFICmBrXSjArauwM07OPdV3Fm4293IuZkvfbQusHOBKmfr5QmE4qiigCTRZd6TfPeP
         ShBxwExctntw33o5JhlkuxGXCe1zylYyRAMOOQYN4TXWa2kPSVf2K6qSM14VdcMb8You
         Og7GWRhT70kR48zi0d77FyDt2wjW9P8qdqzdU+C9l9mg/gtHzIAgq8IrZhDsrHbmO9AP
         4MRl7vozAlqbkw6yqshvwqiYPRqi8eZKqVY2sMjsWelfScnSYuQsSWWAUqLqIFOO7NLb
         ZGnA==
X-Gm-Message-State: AOJu0YycJk6Wu3ZjpaKk46BSEf4SYv2/Xaz/zG76sgp5sfb2uDzYIbpo
	STNK481iiMRTCZTCsC8rqppmSUW+rnm1d1AUO5MwOfJP6NGwU+mXhsdr5aOLTmsBG1Lt4d4rGwK
	pH/M=
X-Google-Smtp-Source: AGHT+IHRJDqFH0VIf8nK/jlKYWcqfgaxVg26oq71AGTYN3PVh2prL1DKYH0JEMNg5/Jy3EVSSBYDxA==
X-Received: by 2002:a05:600c:3d93:b0:41b:de8d:dcda with SMTP id bi19-20020a05600c3d9300b0041bde8ddcdamr4490842wmb.23.1714388858717;
        Mon, 29 Apr 2024 04:07:38 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c350f00b00418d68df226sm41907683wmq.0.2024.04.29.04.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:07:38 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] mpd: Update status for CVE-2020-7465 and CVE-2020-7466
Date: Mon, 29 Apr 2024 13:07:34 +0200
Message-ID: <20240429110735.54205-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110172

The recipe used in the `meta-openembedded` is a different mpd package compared to the one which has the CVE issue.
Package used in `meta-embedded`: http://www.musicpd.org 
Package with CVE issue: https://sourceforge.net/projects/mpd/
No action required.

Ninette Adhikari (1):
  mpd: Update status for CVE-2020-7465 and CVE-2020-7466

 meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.44.0



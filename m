Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BF4C47073
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:49 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.98058.1703665299236714932
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=datoUeIG;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso3911898a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665299; x=1704270099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqfnSMTL/ayhsRHTnh2EE/X2IuZ1A1H6fNOauLVD0zM=;
        b=datoUeIGSwx+qaLGr8Gc58OUiM6RPNCuNJ4WGgepgR7i8zVvP/H677Q3xrrKO6Xh+R
         shi0GAt/S97E21UQd+TRvcPS4N+vOoeuFmWesYAunhEm6vzzdR8NcFf89BLfpdPt4DzO
         S0NPnzZd3kDljjAdJsa0WZ9vAg/fS3TK4LFGv9lxZIQWvDfrRCl1c3rkd9JGBlrvmOAN
         jqVxwK9d3OI2toEXSlCTzJIGBPd3vTS/gJezOH7v58Tyjw0DWJbFHhjEwbeaRjuNANvF
         qVhHiOMw1Rhg9pPCBCqM6kLeR2RI/GX1RbX2fUVNTsLK1pFWF9eN9NnsDEOa1rqBS2pJ
         OKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665299; x=1704270099;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqfnSMTL/ayhsRHTnh2EE/X2IuZ1A1H6fNOauLVD0zM=;
        b=W5gXUxhhvrVxtBlMp6XvkNFU31CoINzm92t7gpyAxB1T5+Td8khXNOZ2EW/YXZT3LG
         lO2nSZbOTiNUC2W/F8wdXqYhpntER0vjEl8DwPzBZOFUSLDYJx4EcsivH9+8trmGjMQi
         06onI3TiGjX+sKCPghBQthWwMaBklRtxa9gugzq4+ZSqzIjIADAhN5q3wczCx3unyAqh
         bpa9vAx4oF4YI1D0Y9ALNcRJRxQCyl1Omahk3VMb7uYYQtT7n0bPXBouxuMd24pH2nQT
         SX1Dmgtg+rvKcyDVFad4ds59Q7VNr+04X2qB9cZj8U28GKm7f/ltrowcFWDWAHy+0DPs
         09Ow==
X-Gm-Message-State: AOJu0YzU3BUBou84Zz8ClZnBlllq/qh0mG0ySy3+M0VDisQz8B6YL5FX
	hSqoCj92FnyeMnECRw9wO1jZWOwGdII=
X-Google-Smtp-Source: AGHT+IF0yXpdDFPX03uWzuuWxpitt3GbG0VmdXGRRYVeDdhRMG49bwHVRQVsM48YUVrrYonEu+WLWA==
X-Received: by 2002:a05:6a21:a5a1:b0:195:e36e:5b2c with SMTP id gd33-20020a056a21a5a100b00195e36e5b2cmr3398744pzc.52.1703665298652;
        Wed, 27 Dec 2023 00:21:38 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221154435.3874910-1-derek@asterius.io>
References: <20231221154435.3874910-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH 1/5] python3-rapidjson: update to version
 1.14
Message-Id: <170366529755.1947762.3359939810444554568.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:37 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107844


On Thu, 21 Dec 2023 15:44:31 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/5] python3-rapidjson: update to version 1.14
      commit: b39c548100d8ffeec23a0dd45affcab6a2677874
[2/5] python3-bitarray: update to version 2.9.0
      commit: 9723cc8de511f591727508c3435ca3d5e5b13369
[3/5] python3-pyfanotify: update to version 0.2.2
      commit: b572db47ccaa54d26788125557982f5419e4042c
[4/5] python3-eventlet: update to version 0.34.1
      commit: 83f5f3d95b8396721af4525fe92c2e0a6ccbaab0
[5/5] python3-flask-wtf: update to version 1.2.1
      commit: 6fd6bd049c3ed2071d8eb52dd9056f6d2062195b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E12C30658
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:58:21 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.29182.1719413892210370800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=GOD/yNMb;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.181, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7066a3229f4so3382303b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719413892; x=1720018692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfM+yeJsRqMKZbo6BHEhKSIyLCaiMSRYPnStjNUsxXc=;
        b=GOD/yNMbKRyseHOnS8HJgUCGMDnI/Jqz33MTfG9sC2Rxh2Z/dPlMvRB1bqx87qOzAn
         DTgUkDqTRkmmf7Y2Yw+8bCRLKrAXxdqeqKJ/3/aVLPTX2WUN5Sh5qi5h3opk72Vt0OK3
         MU6q/+j7xep33v3gxLjWCSd8ugtKR3+4Dpma20146QCHnujzQ1wPz5ecP9Elv9Zom0QH
         loU9q8Yxow2fcQzw1H7bcKRwY3CP3gbLvkBAeiVUwCTfuqhpqBq2DWOXG00XudhXUvcS
         eAh7YYQjsm3Ik3Z3AdYXsBUQ7q2WppTFHc9z7j35gE0xeOvgWRRNh6lO56lHDpPqfn33
         S2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719413892; x=1720018692;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfM+yeJsRqMKZbo6BHEhKSIyLCaiMSRYPnStjNUsxXc=;
        b=gHe1C+9rDhDhzON4FnRP9xdy+uErJ8anaMQ3TJNfX5jzZKSzCIN7JD0zhZ0FPmVTtN
         vsoIgLVaUQjF15G6vOavS32Z1f87qfUDp822VXBaHFHTL+kJzmW9/xLqDf0FjTJ44hBm
         EQnD6Eiqpm3CXYxlA3Q4wBakWXukeiX7IroIQZ/Z1HoudTT8rmsJ6MPtzHn8YUFDpFj2
         6NFKmdfdD9Gk9OOWy3nz5dODVEe7X2FTkeHIpR8hExiI//Fs/SkjxMX2RNhSk6CN2/bC
         C9uN9I4baABBCPv6SnXI8kfpcGwfGfqxT+wxO0+cRv6njfbOAGWxkzqD0VZXfqt2ErfN
         3OMw==
X-Gm-Message-State: AOJu0YzKVdeZa++AWs3OFQ8dMOpX92IVCZO15cGaFX5fm7ese/GbdLLU
	s8LMv+OqCr4sxSezGNR0MkCwRa9kGEhpea1NikWy5HLKPhTqPGA/5H0H9RVtWIFPOokv1dCPtSu
	K
X-Google-Smtp-Source: AGHT+IFYlxSSarAdV1lWh9pMpkVCNuIlB3oQF5ATOEsxts+HUpy2Z3vuw3gM4pfmDaWRzCj7r4ljvg==
X-Received: by 2002:a05:6a00:929d:b0:706:67c9:16d0 with SMTP id d2e1a72fcca58-706746f0a52mr11828443b3a.26.1719413891566;
        Wed, 26 Jun 2024 07:58:11 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065107b425sm10015257b3a.25.2024.06.26.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:58:11 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] xsp: CVE status update for CVE-2006-2658
Date: Wed, 26 Jun 2024 07:58:06 -0700
Message-ID: <20240626145807.17593-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111105

The recipe used in the `meta-openembedded` is a different xsp package compared to the one which has the CVE issue.
Package used in `meta-embedded`: maemo xsp http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/
Package with CVE issue: mono xsp https://github.com/mono/xsp

Ninette Adhikari (1):
  xsp: CVE status update for CVE-2006-2658

 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb | 2 ++
 1 file changed, 2 insertions(+)

--
2.44.0



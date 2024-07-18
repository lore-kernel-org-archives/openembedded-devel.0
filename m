Return-Path: <alba@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32991C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 10:31:10 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.12235.1721298662371527488
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 03:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=pXlZviES;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.221.51, mailfrom: alba@thehoodiefirm.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-368380828d6so439830f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 03:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1721298660; x=1721903460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GI1o8q+6ArsUWymMuHwfXbyzFXE4v8/whWePTd13VrE=;
        b=pXlZviESzDvf+Kq3nnn8/o8gc8VB22qv9JPdi//RkNmwjXBHxBhnEkTBKEvpWiMgel
         3Ixv823VjG4DQuN4vftrAdThifXROOtMYMSJ8qqLchmcXyQRUyHl+6G2Ur3B2Sz+Eg2u
         ZgnupDrsg2g1h12O6uQQVWkARLme8md1uFCOyyTJT4OV8qbDdsnRr7xe8GP9CI8+TGOI
         IdySA4sz6pGN9ovXmL6Y7CJjgzUuDrAhfYujwUcv1cqveTjYPWUXIvX0bkhn4vki1MAE
         Pqi2VXkIEessH2D5UrmDFi66t4coIs1k3UGVNDT+NE6mP2pr+U/X3GyrwazQWHVdj4U0
         jCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721298660; x=1721903460;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GI1o8q+6ArsUWymMuHwfXbyzFXE4v8/whWePTd13VrE=;
        b=pzfhYU4oOFNyZQCxfOLDSVE/vAD3WqJ9liGRiErfXibLp4stjPQpuj89JFtKEMD61Z
         xY4EsjVhCGoqNHo7Nq3NgmnfHILUBNH1ASh9r8xjaeskapiw+6DtNpP0UhA4jBWll+iB
         EVlttEN6MPgsZZD6e+0dMvArAGt/CDdAEMh4uQuKOXOKZDcm34rxTSVlxicFqvVFtnXl
         CWRzY9YSG76FzbS66xlMkkPv417/jx2HVHql4gdjqviHnSqLkJRQJXr10KMFWJfK11MJ
         ORLcJS2UQHL1xvylrMF3ojPWBtRRSgnzXyqVR/QJ8APSexi0Tr8EqAmbP82rM13P7P7/
         X86g==
X-Gm-Message-State: AOJu0YyyFjQYM89ZdqzmPw62vD77VUa7L5w8rv0uDyYNMFdCSXL/x1Tr
	mpOl25RBWban3MBudfXPWVYEq4rDsuilyfyPXK8g0vVQ+MzyUwJMzZQSgr28p5xpHKXetLI7NSk
	7XEA=
X-Google-Smtp-Source: AGHT+IH1jU2BmFDEksawYCCmek+SlDBTNnd8q4TmLrWUWmNkIJQIvNNL9WIy2cH3txSpJCo1xdnZrQ==
X-Received: by 2002:a5d:4843:0:b0:367:89b0:f58a with SMTP id ffacd0b85a97d-3683175d0admr3166317f8f.58.1721298659761;
        Thu, 18 Jul 2024 03:30:59 -0700 (PDT)
Received: from localhost.localdomain (20.red-83-57-108.dynamicip.rima-tde.net. [83.57.108.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3685834365asm1096739f8f.64.2024.07.18.03.30.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Jul 2024 03:30:59 -0700 (PDT)
From: Alba Herrerias <alba@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [master][PATCH 0/1] yelp: CVE status update for CVE-2008-3533
Date: Thu, 18 Jul 2024 11:29:48 +0100
Message-Id: <20240718102949.6841-1-alba@thehoodiefirm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <CAMKF1srD0K+BZ20ZmVrfK6bOrJaqvLf5zTjmbkoP1o0qdgc3Rw@mail.gmail.com>
References: <CAMKF1srD0K+BZ20ZmVrfK6bOrJaqvLf5zTjmbkoP1o0qdgc3Rw@mail.gmail.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 10:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111397

From: Ninette Adhikari <ninette@thehoodiefirm.com>

The current version (42.2) is not affected. Fixed in 2.24

Ninette Adhikari (1):
  yelp: CVE status update for CVE-2008-3533

 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb | 2 ++
 1 file changed, 2 insertions(+)

--
2.44.0



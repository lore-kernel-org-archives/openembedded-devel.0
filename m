Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB33C3600C
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 01:47:59 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.1956.1743731271168718735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 18:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oom1nGhF;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e6df4507690so1495884276.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 18:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743731270; x=1744336070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IShdWHloNX4uYJc5NxOmVdNT3yoCNTuic+qMk/2Ltdk=;
        b=Oom1nGhFOJyjcDS1EpCVamacT3KnPowzoGyfZ12tiO1GwQrUqMM+NiSa+O6ynSxyEk
         QYikddk1EpLhgzMdmtO0BvShzFohQOZcL2CGVss/jbE3PG1VF/mN7LUy3EOrfPqwaugq
         AlAUltWsFPdRhTO2f/Fbr9T9r+R87dMNRpuW4mt46UmfgiRes+cthRCz2ag34q1YGylb
         OA3xnQAPjQjGO+2rgrQS1JiPAklkCNb46Bcwg/FV6LCOAX0MkOcThxU1KpsuwVwEwVfn
         zUT4rSYZQY1u+yUm92fbm7/bRbu/r4Gws0BgW1zoktRUHgStFf8s+YEJol5pWVFYSiVZ
         j+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731270; x=1744336070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IShdWHloNX4uYJc5NxOmVdNT3yoCNTuic+qMk/2Ltdk=;
        b=GB1KKwiBQ4vi4N3R3ML4o9inb6g2rzjhG9oMNbHJ92nmBOCRi6Hz3leXylZFTVjLFd
         26lLNytfHsrRj04KkEeuIVPk/1u7LCcsakAa4KQPGV25gGfa6RjcLEFr/hLiCJCwm3q5
         HrZcypOC61Etdlp0/Q3Mnl2g6JLklHjyMbfvqU7X9nPm9FJ7KiLIFLGE+zV+s6K34gIN
         jTBUFj1yaCD6gR/HoU7A3BYuvUSrxTKQrPV3/3P6S1SolCIzwHMNPMEoD+IA/lapfc+r
         M21VDEK6MOzpYO9SHgFXaOYzNoKoND+2ZFlLWBkwNUE8vwVF9oREbaNlb/XTTWr3b8Gt
         HmGA==
X-Forwarded-Encrypted: i=1; AJvYcCXgOeHZxvMgd4N4CbwpYAROQAGMZwtFL1CWPX9f53tUpOwnci4vCnkA2gk7u/bMBhGrxRf7X6tWzLOVrMW2+eIfVNc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHECtF2JrQzkJDBJ3PYXbkW8cZcCd9dcGPT3ZfwhzRbIlLim93
	Dr3NTGxg17RMPVTIbPVb2FO/KbM8JV6HjdkZTjIKcPDOPlWWZVpm
X-Gm-Gg: ASbGnctT8+7pD3NSFo6olIdXivmw1b/3ehf3RKPQNqjZ592jNo6GrIjvoDJsz40DjWx
	LGnyBhDOwQUs4fBEdQZOLPyQ2hdMtCiM6gRttzURSD+YV8Bk28wL64ovi+3DaQBH1yWC3y63sBS
	zc0DFehpEgV8W6D+p1RW1bltVmUE6/TItd5aW5VxWBi4+kOP+hxVdsgIv59unrNDqlgHBOSHnbR
	EEcexaay9jvzXtwpf/cDwbbY8H8+hvHdaIwGP/tjqs0fhGJ3omTZBZ0rr4Ddcoj4/ptL/NN7tpF
	9U7Qp0KQ5utv6XtwcSslx3gsAjcGFT9lfVb76EBRa/RIGeaaug==
X-Google-Smtp-Source: AGHT+IHhvK8nZf7wkn+kGmJyGzfBRk0Z9/4O5DmH/VL4e8sSQdHxgTqUBF26Sr+xJvYyjDS12pkXiQ==
X-Received: by 2002:a05:6902:1686:b0:e60:8b26:8c34 with SMTP id 3f1490d57ef6-e6e077c4709mr9773771276.22.1743731269826;
        Thu, 03 Apr 2025 18:47:49 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e6e0cace5bfsm549562276.54.2025.04.03.18.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:47:49 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: martin.jansa@gmail.com,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-openembedded] [PATCH] recipes: Fix variable assignment whitespace
Date: Thu,  3 Apr 2025 21:47:46 -0400
Message-ID: <20250404014746.249819-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ab95bf2efed9124921b16e39ef0086d787bf4469.camel@linuxfoundation.org>
References: <ab95bf2efed9124921b16e39ef0086d787bf4469.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 01:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116557

I am seeing some problems with the warnings about whitespace around assignments while using master-next of poky.

In the case below, it's warning about an export statement.  But certainly in bash, putting a space around the equal sign of an export statement will make the export fail. 

--

WARNING: /home/jason/yocto/meta-openembedded/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb: /home/jason/yocto/meta-openembedded/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb:21 has a lack of whitespace around the assignment: 'export BUILD_ZLIB="0"'

--

Cheers,
Jason Schonberg


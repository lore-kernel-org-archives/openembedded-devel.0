Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6351C47255
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.97657.1703665292402175946
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d/m6t3cs;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28be8ebcdc1so2431879a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665291; x=1704270091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEFAxEyY5z4cXkvwvzFwWx/R6I3nCRADpxGLIWr+zmY=;
        b=d/m6t3csxcz08Q7JYlp5JAuXEzzfqDUD8Q2E/vMcMmsfOMCgRNUaJ4Wgq8+GOBgTil
         zDK1qaFTjLJT252Rf9vSbyR2u7roGiLiDV5J+pTq6kcTTg09Frnxn+jPoOaStvF0Z1ZQ
         9ZmfXAlogDXGhDUdji++j4CYE/KLghG5n7Nz1hdAZgrCbuAHbHHhlydhKsZ7XoaoLYRj
         WKPenTcWvDGY3AGkNVbnDX82zgM1fZF3uTfByPA+VXSY3bx6HKTJygb/WbHiXKZrys9N
         XQge1KbtTPuBYj8EeN7sAfeEGL/cB14WzDOcR5kpqCcIQ5KfTVFLnBYMcyCfrbYQGgeR
         aZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665291; x=1704270091;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEFAxEyY5z4cXkvwvzFwWx/R6I3nCRADpxGLIWr+zmY=;
        b=JFReq4KSL8ugNEW2mUH9sEVSfzd3lknJKshIypXLvxcWbpJCW/PjJNFzrizTwzdsoL
         BX8NE98JqqAnVttblxxXlXN7tU/2xljXyKYG+pPLpl2oHJXsZIctpA7fy6dhDsix3rBn
         ixkLiUY1rZWX/DREX2VYO0iWoVHDJLJuLeiNm3fmasZaZWZmxX1h5L7CRlmrFFD9YQSx
         ddvlsyF5w2U4sT17gkUAL7qRQ4tGuFckGC0ReX+zp3drrfpt7F1PegzTImKtYNhIpCNC
         eL8sw6y0sXryr4ZvBXIphF6/o4eTwAm0e/IoSkjzsB9OkHfXD4yo4ChRN9mgUPT28EEX
         G49w==
X-Gm-Message-State: AOJu0YwXA0DQRDqwunMUV6OJGomaHgoxGLY6B01rzcu0A6ojvcZi6Le9
	NaekADhEq0ieZKVNxtYqjQOqhoKh0hg=
X-Google-Smtp-Source: AGHT+IGyRlfhMEEFaM+W6qiSkQBazQCq26g8+AvuRc0zlnKGOn5CEMF5EYr4PmwHuxNPK5dTWBQMAQ==
X-Received: by 2002:a17:90a:b803:b0:28b:249d:64e6 with SMTP id n3-20020a17090ab80300b0028b249d64e6mr2286096pjr.84.1703665291554;
        Wed, 27 Dec 2023 00:21:31 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Jan Vermaete <jan.vermaete@gmail.com>
In-Reply-To: <20231206150753.396406-1-jan.vermaete@gmail.com>
References: <20231206150753.396406-1-jan.vermaete@gmail.com>
Subject: Re: [meta-webserver][PATCH] netdata: added Python as rdepends
Message-Id: <170366529092.1947762.13717754202818521694.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:30 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107837


On Wed, 06 Dec 2023 16:07:53 +0100, Jan Vermaete wrote:
> Netdata has plugins.  Some of the written in Python.
> 
> 

Applied, thanks!

[1/1] netdata: added Python as rdepends
      commit: 33245220ad91d13a57516615d87653d2de563bd1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



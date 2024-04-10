Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CFBCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 12:59:58 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.165175.1712753992269794990
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 05:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=jCx6hvni;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.180, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d485886545so117690431fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712753990; x=1713358790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NHq+KNLSCqh9813teUTe1ZC28lZ9uUUHQWiwC+7pf+U=;
        b=jCx6hvnilY3uY3RjVWkiFcJqqmV4EofCCUp4sDzVraHSA1A5pSSe8TsMbiaeptT01p
         YQR+DMy9sXMn4wLFzM/2W4dyajs8zV4vORXgabfijhBztIZAkb8VasgB56eCfM9ZOtMh
         ATDYM2LzMdxip//ZHDxDkdPvzL6lk5SboqFR8uihspwqtkzMLUjNUBEEVq+O7HGTQm7S
         2dTktG8FXRmOfCx2IOhbbEFIpUW8u7PveATcRYFAERKRmu3MPYeg4x84oYaVsltCfzOX
         nbKpeO6/mQPJvwqwWWOYD/gRa5sdW9VOagIWcs5Lwz5qXpVLcqbAZGuBs7Pz3MHKRVsz
         q0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753990; x=1713358790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHq+KNLSCqh9813teUTe1ZC28lZ9uUUHQWiwC+7pf+U=;
        b=ghfNnNYY5y/OUhkj0tW+JV2qLBYrdeBfIQRzrHXJpSBHzVvDZk9uJSzwiRc8qjRrQY
         1uWbiytrhGoMMgtQRg9taUnmSJv2Hi9kXZBOTti8iXo3sw2thc062sYbEPZcZACByByb
         LT5SYPtMtKJYj/UAgmaw4oIojsGphDElf7pS0VM7cFCi9cio6DcfLBYshnZCKdkX1W+5
         fRegk5mcP0dEl3N4Gk1A4gAIqTVS97i2YTpHlH9b8iUK3Mrw7Zkv25hSwIBWr6z3uyu4
         CBMkldmNrFf4RteaeAO0PdDV9+rlJdWYcDVBMFtX71L0ds4bfcwQ2BxMs1gs/XYmRmdE
         5T0g==
X-Gm-Message-State: AOJu0YyQhOZlQqiaP7CQayGE8jJ4WGENykf4evWVPTTyPEs6sL/IUo+d
	IADNWdFLb1shwL7E9Q89aWfWtxmtHWlBasIaJQCRxfLru06Iug12N3qGm/oqukf9QO2vi7iPjLm
	X
X-Google-Smtp-Source: AGHT+IFm1mVHn2pdAdqp28ykBBe5OpU9IqzdEIHlUmvul0o+Uvl9TWRC/3vKoJJ07Ws0VTLsd4KJ6Q==
X-Received: by 2002:a2e:2e07:0:b0:2d8:7d1a:1118 with SMTP id u7-20020a2e2e07000000b002d87d1a1118mr2452450lju.23.1712753990296;
        Wed, 10 Apr 2024 05:59:50 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id gc7-20020a170906c8c700b00a51a259fa60sm6862506ejb.118.2024.04.10.05.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:59:50 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] proftpd: Update CVE-2001-0027 status
Date: Wed, 10 Apr 2024 14:59:46 +0200
Message-ID: <20240410125947.44723-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 12:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109893

CVE-2001-0027 is only for ProFTPD running the mod_sqlpw module. This module is not used by meta-openembedded.
This CVE is not relevant anymore and can be assigned as 'not applicable'.

Ninette Adhikari (1):
  Update CVE-2001-0027 status CVE-2001-0027 is only for ProFTPD running
    the mod_sqlpw module. This module is not used by meta-openembedded.
    This CVE is not relevant anymore.

 meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0



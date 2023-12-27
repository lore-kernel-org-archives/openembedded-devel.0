Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB9FC46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:38 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.98057.1703665298039188597
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h9eGT5Ci;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5ce0efd60ddso367314a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665297; x=1704270097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTaTMzuyUtSBcRq3TuCadfxLKr7+0vHJbSqqRzq2+Ow=;
        b=h9eGT5CiBEevMVPGycN24UAR1oWqpz30ngcVpZZ07w+8+eXOF3p+lOkXdyEpRWfilx
         7NltgR+yL3NGfUA9xz53iXoWmp7m2XkIkTIbQFrnE/rQXco+AWdD0/JMuTnH1HcmxAkn
         aVy6Jq4T//eIPomjbcIvfH1fDpucN/rhcq1ziYzD2gctk/QlKr07/Y32JOpwzgqQh+Zu
         XnjwaCQ1oHZE4CkCKxX7QuhpIaDXsIZQpExcFAZh/TpzTxgCDLtYs8N1eZmEI6RuGnOC
         5Jgbwygf1O0zxZ4DLp0og68BANzFUerXeFbClNjzbPXQ6tagISVl/wr4HcUD6FNkMMrH
         PEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665297; x=1704270097;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTaTMzuyUtSBcRq3TuCadfxLKr7+0vHJbSqqRzq2+Ow=;
        b=SddGcG4lOFiiaabOQMU3iMPvEYqdHWq3Bs0BwG2o4MqYSX16ah7QkNQSRPv7wlcjSs
         7iLkT2DQnm1opRsxYRLGZhVB5KQ4Aq7gZAYCAAUbPOdomsVOul1lmAlhdURMIhl3R80g
         lBdS9dHFVntVpXsHasmXwnECo1DcHqU3rvdslnzqnlQc/wgJIEG1M5YoUDOtF2N1PaCB
         mIOUXv6dg8RvnKDUFKsH/FsjL1Sj8ZLK5K6yoc3rASgUOQxZdVcO52VhihWFNwFpJFDP
         jwCotlGXUuLkImla28uMftW9Uv2jhNrcgtZhCGshoglFpMJDr08/aXB2itcwqcVKr3l1
         FaKg==
X-Gm-Message-State: AOJu0Yy+q5g/EwFyzdL7dKyPKXWoeSo7jW0xWoONgDuMxKxLKtPEl66K
	Xu7r2dC4Ceq+EgVtdRCFIiWLyQra4L0=
X-Google-Smtp-Source: AGHT+IGS6LY1MMHAFwFLYvGVvyN4V1j0ATOL0e/OjUp9xivVrw9fXChEdP5z8vhoN6e5lJeYqFRVDw==
X-Received: by 2002:a17:90b:2398:b0:28c:687a:4916 with SMTP id mr24-20020a17090b239800b0028c687a4916mr841316pjb.10.1703665297421;
        Wed, 27 Dec 2023 00:21:37 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231221054409.13191-1-alperyasinak1@gmail.com>
References: <20231221054409.13191-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] avro-c: upgrade 1.11.2 -> 1.11.3
Message-Id: <170366529636.1947762.14287320411258157881.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:36 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107843


On Thu, 21 Dec 2023 08:44:09 +0300, alperak wrote:
> Changelog:
> 
> * This is a minor release, specifically addressing known issues with the 1.11.2 release, but also contains version bumps and doc fixes.
> 
> 

Applied, thanks!

[1/1] avro-c: upgrade 1.11.2 -> 1.11.3
      commit: e1552304bf3cd1abc403dd8cd1b4ed5cd646c64b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



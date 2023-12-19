Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE5CC4706E
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.6741.1702967230657459821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dJnqwg+P;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d045097b4cso15984885ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967230; x=1703572030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0klATmWQlkbwZyOYKYh2Gs3wNAQo7aiYWpPnHzZdXs=;
        b=dJnqwg+PDfmk7QXKhIr4njL1vY+mVerNjwKlT2yPjJl7fN1JFU4leBU+gkDMc5zTal
         eZo+rVnnfHTTl8UTBeVHQFuk5GnAbuP52NupBHpMQ3PDZ6CRGdtpxiFLTlkI1nAH2MsZ
         9PyKWVUMAJcmXra7Y/gfwhkSazTdtoxeNZuulTgtHNxqzbJc217zHWeersXN6cPzynrm
         FlrN9b5vrES5g6tIEOCGzezThu78GMZVP3hrlE/nuF1LEvLnF4swm3mZ849o93WOBVOC
         k97yRRSaz4xRqs1mxdnkLJdarYXqum0vVpr7yTbNU8x7YBIJK/PwLgjwnDlpPaUASOxC
         RbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967230; x=1703572030;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0klATmWQlkbwZyOYKYh2Gs3wNAQo7aiYWpPnHzZdXs=;
        b=Q6A5F1UYkYEpbCezk4NQAj4yPeHMNamYRTOJPP1NnzQ0joFMBq3IVoOg3JTcWgOtl/
         TTJtChV40eM6r3J5t4Hvps3EYkiL4hyI2mFDF9iK88gAA70TwYEOOwiDIIZxNgEMc5bg
         4IOVODgDoVFJ6E8XGuxpa0g91y67Uybw0o4QmETVguVnsqb97ZWRCju0ek9CmgxB6BqA
         ZFhPEOaeHgDiSSXF/HtBj8iP4rClcQEvDt9+Wbivd8G4W5DzqeDZ15/DSD93YVtHHzZp
         jngvshN3uFXfHbhEJC/c2eF9oK96pOxJwSGqCOZpP0iT2RnhZ1Ko39AHesXGgcK1h9/1
         PRYg==
X-Gm-Message-State: AOJu0YxR/mgybSpl/gIl3soQfq/JMtnLz+5gH4re2q6CXKZPWhx18X9M
	yQUV53FfNua74facm2ogNR4=
X-Google-Smtp-Source: AGHT+IF4fERVOB1e5J02EXJfOMe9S+aQ0l4lv9JcFlilPyDprncLfwpu6CMfmhFs8WBe1bDXXUhdFQ==
X-Received: by 2002:a17:902:7845:b0:1d3:529a:83b6 with SMTP id e5-20020a170902784500b001d3529a83b6mr4405992pln.17.1702967230046;
        Mon, 18 Dec 2023 22:27:10 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214045909.1188612-1-derek@asterius.io>
References: <20231214045909.1188612-1-derek@asterius.io>
Subject: Re: [meta-python][PATCHv2] python3-olefile: update to version 0.47
Message-Id: <170296722920.1627685.17983619226710757796.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:09 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107565


On Thu, 14 Dec 2023 04:59:09 +0000, Derek Straka wrote:
> Update license file checksum and verified the terms are the same
> 
> 

Applied, thanks!

[1/1] python3-olefile: update to version 0.47
      commit: 41fef651c04b0c69a40218ea1e80455141247bc2

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



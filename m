Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A502CC4706F
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.6740.1702967229719796379
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LChfkWtF;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cd8e2988ddso1088043a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967229; x=1703572029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLlfmcn5qtzjsWrqHw/+H0ZNjO8ZI/Axk3iF0QGXscg=;
        b=LChfkWtF55NcFQADNrvdBKDYbc/W5Lhj3zkonnvuX/nvmWwXSGzrzQbuy07Bsfs2hg
         bkEkCRWLLwiLDXHk3U4+V5p+MnMWULh37Ox0To9QT/dxhROe6BgPXM/Rc+5rh+bn5qYD
         I199CgE97rmeNiiVZ8FIBEn4TBR0q212f59kw/2uovG3vDN85md1UqgjrUjSZeBLBUsI
         SWwdAm7p6Z8Y0g9YVXs0K88Z/4Ic+yHIsAtaEnbzpPu+kzCCXFg/UOC4aKo/BPmVCp4G
         k+l2pb48kWSwXFTxUK2y39i3j4ziU7CTebn7dfzAzYsA8r3n687pPz+k9r+05tWZ+YQd
         VlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967229; x=1703572029;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLlfmcn5qtzjsWrqHw/+H0ZNjO8ZI/Axk3iF0QGXscg=;
        b=Fm5xJbNJ4r7xLYaYbf+y2FkiAtMUAlfUHIHoks2Jg4B0a+LYdEKttASo+lqaUR0hI8
         pW+c5mwy8cWc5HyyOcWwkrQL8D46qo49lUKjNlNwQbHs3sUAoEFUYRJxDQZWVhDE+U2t
         RfWWQY/8Ze61D+qi8Jmu39lBme+1Nk2N/jd4GVTUVpbXSNu1hck2T5X3IxdjYdq8l1lu
         s8WkrAQasrkTlGJ+9pnEIWqzhtMKqfeDDL/jBP/gUgjZf0B/vYEjUOr+UL2rVkiTKl8c
         il0YS8cwM7yMxeH6AENaLgjrPo3EFIiGNkO/mzeWImk7+OFbGWI1R5brv6sQoW2ukdX6
         2b/g==
X-Gm-Message-State: AOJu0YzMAknM2NNCxD9gu559hcPXZXEHB/YcGolECUDYBT+51Q7NSKg5
	S1Xwj2PPUTsJ9aHHKBQKYmRBiVYu6g4=
X-Google-Smtp-Source: AGHT+IHl6K5tgeAZO8cQ/sWb+3BusQBUGjkwAgUG6M2kfYL9z3OfqPR+vehzQehgwcUKAbI/1mDSag==
X-Received: by 2002:a05:6a20:3d83:b0:190:7b07:b7c9 with SMTP id s3-20020a056a203d8300b001907b07b7c9mr8338720pzi.66.1702967229065;
        Mon, 18 Dec 2023 22:27:09 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214045317.1187049-1-derek@asterius.io>
References: <20231214045317.1187049-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-tox: update to version 4.11.4
Message-Id: <170296722849.1627685.9425225529146341159.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:08 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107564


On Thu, 14 Dec 2023 04:53:17 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-tox: update to version 4.11.4
      commit: 97c2b0d2d52bb26719f013479c0a2accaed7b565

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



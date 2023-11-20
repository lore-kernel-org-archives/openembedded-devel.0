Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87924C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:15 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.43613.1700452273305028367
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V6LRIiF7;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b3e13fc1f7so2717757b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452272; x=1701057072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfqLn6jDuzyYx658yMUTkH/sHIkMPfwfwwcmirTdlHs=;
        b=V6LRIiF7yRumklG0xe4nx+nL3x0e/XoJeZhG3oAOPRNiT0FRJpTnwjRx/9K1JmSE5A
         ckJz6UnL3khQyH/WNSHlKPkShFokhZEmAVilkiqA3e7iprqhwAiAm3LdyKYW4ZzjblJL
         VkmatExHderkD0JObqYmoCAD6CkeNVgd9iD7+/7UmVh8X9PrpzU2rv4yBNjcT5DNIPRP
         90yIF4ZPqM8O4dz9PCt+mQie49qzMyUHPW0rn6suTsFOSBuTS4W05RUAsH+o1B+lf8YV
         epN8IfBaMOvXCLI3+Q4qYn4eZasnY5nA+0dottmw+Nmqa2zeVbNK3foPzklN+WROh8xo
         dhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452272; x=1701057072;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfqLn6jDuzyYx658yMUTkH/sHIkMPfwfwwcmirTdlHs=;
        b=OuGffcukEDWlWoYkfqiJFgwfI2vIb+Qv3YlvHxld5VgqAaK85ECvtzcczyNujNhHnH
         gzIPVfwHKuFCzTtsaf6TUFIiJ6vXW6qRxZNv0SFhh/Ue3dhXHP276qouFkeigzlrsFms
         o1BTOyqBv/ya2X6hj9D5vFDkpGm27ZP442A+IMxyoMrmqsIzok7GIUjGfNvQIVkqsIgn
         9jfHeoZHq3tCfVfwEuV2YOwTpYlBjGx+omRHwhK1o3E2P/pOmgJDIbx3OLmKe7AYk5V0
         RDcNNne6ChxC2zRiOwWdko2ijqa5PaV5SkRhMlpw55jdru+oVuyNmPsHGISoQ3VKFkDj
         wG3w==
X-Gm-Message-State: AOJu0YyK8EAafahgUiCFRSTrAcfaLcOT3X/ov5gv9sICUDxR389gRxAO
	bG6wyQNXRXkW0OAwT24vvIqdQELqy0fjng==
X-Google-Smtp-Source: AGHT+IFh8pPTMJmZyVI40cq2/6K7AiC14wJj1JaKF57PlFcp8iVaaigRsqEJpEjNGf4dVZvswiwQqg==
X-Received: by 2002:a05:6808:1185:b0:3ae:554b:6c57 with SMTP id j5-20020a056808118500b003ae554b6c57mr8031827oil.11.1700452272531;
        Sun, 19 Nov 2023 19:51:12 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700124129-22786-1-git-send-email-wangmy@fujitsu.com>
References: <1700124129-22786-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-networking] [PATCH] uftp: upgrade 5.0.1 -> 5.0.2
Message-Id: <170045227186.1416826.10093571365682906928.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:11 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106928


On Thu, 16 Nov 2023 16:42:09 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> =========
> -Fixed bug that caused crash when a CLIENT_KEY arrived out of order
> -Fixed option handling on Windows when an argument is missing
> 
> 

Applied, thanks!

[1/1] uftp: upgrade 5.0.1 -> 5.0.2
      commit: 93a5628ae660bf6aa3cfdc9e0032088e4df8a0c5

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62462C4707C
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.31443.1704682025160729294
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FvhOtG6z;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28c179bf45cso1241848a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682024; x=1705286824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nI4lM2fCvSVdQ51rnAuhLNybvpkQA1EeVIa21mnHhoI=;
        b=FvhOtG6zRsA4hO3eiVgSZfzOsslA2DDB0eWSLjnx7T6kocWlaZ3JbhwsS/2jRYMKog
         vaTj0wG6ms8Ytpxs98bGPUk9S4v/trm6BLR8lbipZ1yQnyAmwqXBViBgyozzdjHNPoOs
         cBVynpFNLgRox3jO0+Ip17S0h31HZgSjkWcWyz1ePUf+kH40/fCDaOSu4hgxVecHGvwZ
         HJICvYhx2vuHec0D9g2D4CgtP12eI3Ns9R17NmeapqZaH7yWx/abZK0jV5E3cx4FJkZN
         EFHCLz3ygiV0QDYdY2ClwhqFJQNsxVM0aS2C4Seelwr8V4wFLQrA/Qksn1v5TxJ7UaJC
         D9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682024; x=1705286824;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nI4lM2fCvSVdQ51rnAuhLNybvpkQA1EeVIa21mnHhoI=;
        b=wNbjQzRGqjSyQgtD7YQNuQUphXVfLhy7E32HkUifGj07H02wDCjRrF0tNPLEK7Ix+m
         QRAEYaXqsObTDTGakyJbYZW/KfwHZqSLg7+Hm+E3YdEGatFReAU5osOSv0QyBu4RoZiN
         wsE7nhRpfhSxvLGcNxSA951Qb+SA7xZzP7fX1USQxObqYiQugryIOhnl3vOHi3JSKC0S
         4Fo1b5TWVx3p/qH3QqTQD+RVy7N9c2DOxojsUnIfXwvYfl54AVAv5Mn6tALLxBrPMgkR
         +oHfJJZo1toDlXtPUy/OAOGssxjzRjoAlHRESssz6oz8QPZ1GWod1qh81f1g4j0u3XWV
         X8OQ==
X-Gm-Message-State: AOJu0Yy2BOFVf/I3kftyj5tTCN6CHl3yFQ6lVYg3YmdQ9KFnGSrHyXoo
	6yaVvzKiFNLgyZuEu1M5l3I=
X-Google-Smtp-Source: AGHT+IFFeGB4gSElEn9OC5tsnu3Q2NhKdONEMnZXKoEO1e+nv7Y8VE63l3485nBwW4RkO3E1KRfLZg==
X-Received: by 2002:a17:902:c94a:b0:1d5:7ae:82c with SMTP id i10-20020a170902c94a00b001d507ae082cmr3430098pla.127.1704682024567;
        Sun, 07 Jan 2024 18:47:04 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Jordan Crouse <jorcrous@amazon.com>
In-Reply-To: <20240102173256.46404-1-jorcrous@amazon.com>
References: <20240102173256.46404-1-jorcrous@amazon.com>
Subject: Re: [meta-networking][PATCH] keepalived: Move the sample
 configuration files to a separate package
Message-Id: <170468202398.912276.16128867594508635017.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:03 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108110


On Tue, 02 Jan 2024 17:32:56 +0000, Jordan Crouse wrote:
> By default keepalived installs a bunch of sample configurations to
> /etc/keepalived/samples. These are good demonstrations but will almost
> certainly not apply to any real world situation.
> 
> Move the sample files to a separate package.
> 
> 
> [...]

Applied, thanks!

[1/1] keepalived: Move the sample configuration files to a separate package
      commit: 231c8bd2642ccbbcff799660a6bc8d455730494c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



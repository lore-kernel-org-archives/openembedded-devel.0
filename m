Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63C0C4706F
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:17 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.98037.1703665269538470902
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LSsaWJpl;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-28c7c422ad9so826129a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665268; x=1704270068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgudoJUAUWsYM6sTNzgDxscHEzPLa1rexXGHcz+IEuE=;
        b=LSsaWJpljvn/OY+pHzBVkCI7cTt/KnMALMLoZ6OSSXX2K4MH+/JfaAK+1a04ndpyB2
         kREwslXpZkBlMRtYf0syrOPsLV68JR9RkWVHXQrjeTPbfMayr3CidVs3gIiC+iiQV0Qf
         Dz5IUe4WSglztYwz/awTMxwsmX4lTv0DyjzjIGdSRFb4FSqHhYaTM9ddc89BIRx+4UnL
         c0reg1ZURYOeYpWuUEtn3BofgkXM6FFEqBdf3X+YernX9W48Fmi47K1Pdan4SNtczo5/
         Gcx4ZTZraZxnwv5G31nRKw/LcnabEpxUaB1d+yDiEbP6RLVlQYnUREtwCMBHufXDT1Gv
         aWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665268; x=1704270068;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgudoJUAUWsYM6sTNzgDxscHEzPLa1rexXGHcz+IEuE=;
        b=dH3ImN49RYuivSv6g527fhxMzIKyL1Fl7G7L2IZvPL8gcdd63g+1GW71sbovnPfM0A
         MJVwern1FOL2ISJHqSy5Fkl+/+DYDP3UWHxz81Bn0YjGibs7IujCn7ha0V53ViUMVun2
         G5TkdaDCDAJHfMxEFUOSv5gURKH2WNEoTeLLSuLqPDvpoewbHksFHffVRNJauf/G8EXM
         lw2QscVa8ej0dkAEU+ADrL60nVHa1iJcrN0hIwpHc27kUNXynGJXnR8eWpGn80GhBwWd
         owdLIjySNBPnJ8THeVfPlg/OaFpV6JalSthYwJS22+/I87UecHTmVy4BQgz8vGeVu5mq
         +P+g==
X-Gm-Message-State: AOJu0YwGxvMTnOEtOhXL4cit31tIpojMdl+vXC1sRTOeMRxfjwnUjpka
	Ux9R/UmouEzwIPvZKmYCd8NWPjd0b7M=
X-Google-Smtp-Source: AGHT+IEoyT9cFoGU5g/KjBi2AZCMvKMM2hSEYD1ue0B212r3Ah0tx4I3WpQZFKYS9DT2+F8JEJGCGg==
X-Received: by 2002:a17:90a:4897:b0:28c:366d:3bc1 with SMTP id b23-20020a17090a489700b0028c366d3bc1mr2367265pjh.18.1703665268362;
        Wed, 27 Dec 2023 00:21:08 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, niko.mauno@vaisala.com
Cc: quaresma.jose@gmail.com
In-Reply-To: <20231219164440.3870374-1-niko.mauno@vaisala.com>
References: <20231219164440.3870374-1-niko.mauno@vaisala.com>
Subject: Re: [meta-oe][PATCHv3] pkcs11-provider: Add recipe
Message-Id: <170366526765.1947762.1618189235741795055.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:07 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107812


On Tue, 19 Dec 2023 16:44:40 +0000, niko.mauno@vaisala.com wrote:
> Starting with version 3.0 the OpenSSL project introduced a new modular
> system to extend OpenSSL that replaces the deprecated Engine modules.
> 
> Providers are loaded via configuration directives in the openssl
> configuration file (or directly loaded by applications).
> 
> The pkcs11 provider allows applications linked to openssl to use keys
> and cryptographic operations from a hardware or software token via
> their PKCS #11 driver and the use of PCKS #11 URIs.
> 
> [...]

Applied, thanks!

[1/1] pkcs11-provider: Add recipe
      commit: d44d4206b5bb52f102b89a7ae922c4b7f64a70db

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



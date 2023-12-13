Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA39C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:19 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.30690.1702451235071453944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=byDNr5RS;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6d9d0d0e083so5299797a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451234; x=1703056034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REzCk1vY408a4NX38bTX21LtBz5C6L/2crmry/KSVao=;
        b=byDNr5RSd2o+JexFB5D2K6zeOb1Nkem+koIG8XhnqTVvFX7KgJ+Tse3n35FwYx19YP
         rB+Pz2zr8YDOJSJm1vrSqCqt4tcjLQ8KDV4kfs84rtrr7hyimFlaCYO4OHXSlEHeMeXP
         LcrsLkxvMg35Pwr9po4Nf4e+TQnrFhMlBJoYo5neChKiJ9xgeojrCZ5gITvNK5ZUNb0g
         5z1FwSCl+oowLjNdMwhNtvz/KmsJzfgor2G7LOiUuG7AmJ56pm2sKSYm2p/j4ig5JDCw
         MU91ExuOUMgDePkvBjriRSHGkC2bGC8fNOile6skjaZ+J+ucjmvB7waOi7k5YkJuZclB
         FWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451234; x=1703056034;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REzCk1vY408a4NX38bTX21LtBz5C6L/2crmry/KSVao=;
        b=P6USf1WEsNaj8XmJXOuyHrbAVDvIoIznuRzUYlUEzkz+Fvzh1CmcXUzZcNskvxUGNh
         oIZUb5gRs85hlboFD9fmOLIOZ0oMzXdYowqRndN1jsqOnPV5nV0loMDzOSLwrKPjY3HG
         qCG0pg2BQm5nPv3Gzf1yRds6cCdyQcEvGQgprh4bgs2Eb3CJjmna1VdB6FkgCxMFkp5a
         CQ0c8aG/5LTYu2TsN9KhZV1Fh0GR1jOCdLUB5syCE6qA1P8ElPuxsIIwDb290TCll6bF
         6SVsCBgUCoT/56pk0r7CcHgn1ZwvXWy0JegCxSlKesxe0nos0tR5qsyIA6j6diSoeFC6
         upfg==
X-Gm-Message-State: AOJu0YwLtcL4MIKIGGOs1TQcZxNNpKMFEOWbU1BImv2EjKdZ8wM6ZRjF
	d6nzHWbLIJu6baD4ZQB1anIANE6l00s=
X-Google-Smtp-Source: AGHT+IEGmpALZ+ek/P2j2Vga8XbA+T0+NIcqyLG8+pSDjHDqnjRsHCS8Z81yno4KBLtBLWdMJen4iw==
X-Received: by 2002:a05:6808:ecb:b0:3b9:d903:9fa9 with SMTP id q11-20020a0568080ecb00b003b9d9039fa9mr8772045oiv.105.1702451233963;
        Tue, 12 Dec 2023 23:07:13 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Petr Chernikov <p.chernikov@yadro.com>
In-Reply-To: <20231204141856.2977926-1-p.chernikov@yadro.com>
References: <20231204141856.2977926-1-p.chernikov@yadro.com>
Subject: Re: [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from
 extra_oecmake
Message-Id: <170245123304.133993.13749546732288558825.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107350


On Mon, 04 Dec 2023 17:18:56 +0300, Petr Chernikov wrote:
> Old versions of abseil-cpp could not be compiled using C++ Standard 17.
> For now this cmake flag is not needed.
> 
> 

Applied, thanks!

[1/1] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from extra_oecmake
      commit: 190f7b50ac3d7d30cf9d31167fb74f7146c3c8ff

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



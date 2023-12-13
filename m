Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB6FC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:30 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.30696.1702451243037018176
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NkTSv3Fj;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso4651647fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451242; x=1703056042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLhLKonvclTzQZ302D/9S52NfjpJ9R5UDz2bxe08jdA=;
        b=NkTSv3FjaJta98216Ma4viNEQ4+6sYnOGimIx5rrxAS0RBfJC+2Dec4dSu9CyiOkuW
         MJQfoery1WRat0HX7Q0CV7HrPffT6xU3cvVdmJvs13419iNuoF4NK70dnU6fy7dIaEiB
         z6VZDVbp/Z09EUGyy8as3TZd9yKmZU/6WTLd6wOuaTI1ctxjEjEMBU6REmD6jRgNtJLl
         OmGoSAayesoO3HJpba+913uuqk0fyA/L7qJvFwn5M6JoDgUqdYdMrwRJOuRTR4gvlPh+
         idZJbjESZGAdWbWhxq9NRCMBlIgcZxqrMXw0RNNdLI3VmbXKlJfZmFcislAoM9sXpESh
         vnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451242; x=1703056042;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLhLKonvclTzQZ302D/9S52NfjpJ9R5UDz2bxe08jdA=;
        b=m7BTnjXUfAkkp6Gj+ju09LzwtpgFaYXKnuW/n3GUWJipuQqeZ8wIRlvx8UAlrNYr4p
         cnQHrT+gClx+eS3Yywrf/iZqYc3nMbNAOrNQhrErMPmvHo+iLnypMdmmd0+89KMlb32t
         aCKOLnsWuQ0ZY/2Q4jtrucwHYIMEd9E9yuvXwoCk2EndcZW3bi8/kkVO/J1EnkTSU5hc
         /y0rD6guMI1l9GrsU5G4N2kVBduyRPPIJezjSvodEKepRhTYRMyJpDU8KzCx1m8Ibkk7
         qKbViFHmo2xTE09LU5tHgy8yb7gdafxAd50VNHla7etmpOVv1WBJ70YVYRClk97P0See
         mQ+A==
X-Gm-Message-State: AOJu0YxUHaeNx+K3TiWp7HdcTG3nh+UKFiuE02NwzmsTxICtOT0fkZ88
	2CqF6XDAf00JxNQjiFEuyZ8T4Z1a098=
X-Google-Smtp-Source: AGHT+IGb03+NjvHkxPn1y+l9qH5MGTzi2uCQ5QZjE5r1T0Krc/H9Xk1hQjgA0ILX7u4iRoqBcnwoKA==
X-Received: by 2002:a05:6870:440b:b0:1fb:3a6e:2b08 with SMTP id u11-20020a056870440b00b001fb3a6e2b08mr8175884oah.55.1702451242094;
        Tue, 12 Dec 2023 23:07:22 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231206134239.322342-1-alperyasinak1@gmail.com>
References: <20231206134239.322342-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] xkbevd: upgrade 1.1.4 -> 1.1.5
Message-Id: <170245124129.133993.17886318606279686257.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:21 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107359


On Wed, 06 Dec 2023 16:42:39 +0300, alperak wrote:
> Changelog:
> 
> * Add .git-blame-ignore-revs to hide whitespace commits from git blame
> * eventTypeToString: remove unnecessary strcpy to static buffer
> * xkbevd.c: Update default DFLT_XKB_CONFIG_ROOT path
> * cfgscan: check if character is EOF before calling isalpha or isdigit
> * Rename shadowed variables
> * Variable scope reduction as suggested by cppcheck
> * gitlab CI: stop requiring Signed-off-by in commits
> * man page: remove out-of-date COPYRIGHT section
> * Build xz tarballs instead of bzip2
> * gitlab CI: add a basic build test
> * Update configure.ac bug URL for gitlab migration
> * Update README for gitlab migration
> * autogen: add default patch prefix
> * autogen.sh: use quoted string variables
> * autogen.sh: use exec instead of waiting for configure to finish
> 
> [...]

Applied, thanks!

[1/1] xkbevd: upgrade 1.1.4 -> 1.1.5
      commit: 709484dd74246baa37d31e5553c095ce22e2c0cc

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



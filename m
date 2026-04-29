Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA3AFF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 06:27:14 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5467.1777444023577306154
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 23:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p7sqkTmu;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2b636b944so17023640e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 23:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777444022; x=1778048822; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zM+bmRaEkthXK/j7PPJr4fkRvd1wwnL/klfaZMM1j+8=;
        b=p7sqkTmuZ4H4jQabWOsCayj1BKZjY5zyoNgTkcdDstUmff5omAbqqZS1Tn97uZRytS
         ++dn/BFbYtSAyqF9lic46Fv+D+kmm2WX0W+e3BnYdhxrMEO2ICMhkw0UIZTZiIy/SpqU
         P8i2b5+OPYDUwZy27Mjea9pnTVAdexoYdXxmylCbsnt5N+m2zUT1SdJhz0J2DXZPKjAp
         qGAqI+6OREj7pXcU/6Aa/kSX2agIy1VDDzPqn0uOroUcqa1BkQSzaGnPsg/DEMa01Vj/
         Wi0E35BcgURMC49XRIUgg6V+bEHkIOHycE9NRQQ7JdJSJiH/ZvhN60a98RwXaH3PK953
         j+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444022; x=1778048822;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zM+bmRaEkthXK/j7PPJr4fkRvd1wwnL/klfaZMM1j+8=;
        b=FQgucZG8k0ewq4Nlgf23DiZOo3k0BdTKkiDHgFDVX4NvhTml4oMqWP4bwkzBC69HN9
         IUrvCa8GC7WtXzWMHgI1GvzM2LGYWw7HiqGfTjbaixbzdlFHoUXpgnDHKtZHgptoZkEM
         CU7wzA74ZRqkcd152pFrOvz2Iaa3aVpsyDF1bdoC+xcosuVxlkuB0Biyn5iTXI2KuakZ
         JHeDA+HirUwqo9i92+jM8Wtcfbccsm2cKVCv35U4vid/hA5BkQlzMiEDN0odFvD/cUSW
         y1kHldAhhRZhsfs03x/MpTjoGYzUND9nz4o4ZELYabYNNwCmmZHZ0iduCl6//254nxp5
         Di+A==
X-Gm-Message-State: AOJu0YyFXNQME+oQ0RQbSkJ2Apj41Affkr+HipJaHnmG4naEVrvkLDAU
	wgcjEJKwMy4lPC7d340jOeG5xPg1XxamRbGwrE9uR51Nvj1znADCYIQSPQhEN8yYY4XWRnd1luJ
	KB6WE
X-Gm-Gg: AeBDiesEcxjvk/S9tzcHK+2MSrebYRCMNiEQNqwEyTU9fsM6oqmCue1lG1mBoRG5LJ1
	phypstdXF9V/o+xpDtyiZsq/cAq5rnxLPraNDLpCLa1JKVhrJonKvqAe0K3T2k80j3uSks1MCCr
	wQIfsq7ZGzKuP7F9ImJzd+42b36Kp/g9hgajt7YuboBx7JV+L1VhC8aeGhPVQ9tKrMlhgFnL9BH
	PlavfbPYHU+haGEwlBNKP9edKbB1YNqKAr5nXt/IlMvfGAHCYegSbMZqqigSRBWvT5IwqrHRDhz
	p9laq2zO5OMe9PMGYvmZgk1J+8mUksJLgoMf+2NRA/m+R5pecn/I4vjSwfcGlsh+xtD+Fw7DzS5
	efWxe3Cy7AalvWY7o+ZUy3EQDDEyQp4xyCCCVJUurGRySwRtTHxhwX0LmKwn81erB1PgWIfbAas
	cubAipA14ebuYGregIKoNRo98Pccvsst9DKSwB6TJI85iLFUk9e67kgBt0PML1aA==
X-Received: by 2002:a05:6512:1086:b0:5a3:ffc0:882d with SMTP id 2adb3069b0e04-5a749d2e53emr761458e87.41.1777444021523;
        Tue, 28 Apr 2026 23:27:01 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924f9482cesm2617101fa.2.2026.04.28.23.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:27:01 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:26:51 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] jq: fix build with gcc-15
Message-ID: <afGkq18K26ZX-Qog@nuoska>
References: <20260428090053.3401574-1-mikko.rapeli@linaro.org>
 <20260428090053.3401574-2-mikko.rapeli@linaro.org>
 <CA+s=J=zTPb2fjJXMsAg2P6pTujsJCbzdo9ppSUC9fo5GpyqeBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+s=J=zTPb2fjJXMsAg2P6pTujsJCbzdo9ppSUC9fo5GpyqeBw@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 06:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126663

Hi,

On Wed, Apr 29, 2026 at 11:22:33AM +0800, Anuj Mittal wrote:
> Hi,
> 
> On Tue, Apr 28, 2026 at 5:01 PM Mikko Rapeli via
> lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > * backport 3 commits to fix:
> >   http://errors.yoctoproject.org/Errors/Details/848831/
> >
> > ../jq-1.7.1/src/builtin.c:1705:4: error: initialization of 'jv (*)(void)' from incompatible pointer type 'jv (*)(jq_state *, jv)' [-Wincompatible-pointer-types]
> >  1705 |   {f_ ## name,  #name, 1},
> >       |    ^~
> 
> This was applied was later reverted in master because it regresses
> tests. Can you please check?

Thanks, should have checked the git logs further. CFLAGS += "-std=gnu17" is better than
the patch. Will fix in v3.

Cheers,

-Mikko


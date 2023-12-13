Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94563C4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:50 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.31077.1702451263695927894
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PQXtO18+;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5c66988c2eeso4812472a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451263; x=1703056063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LmMzb2Bkns+RQ1OsG62aCuWph1lfXAn+2JQCC5cPvo=;
        b=PQXtO18+XBWCW946UW+zqYt5HJow0kNYtDNFYwwvZ/uoj3vRmd5gVwC/hiLd5dCLhs
         1EvJJUWecABIwy79jGwaex0oZ/dGrMh8PkVR1zLw/QsJOU3rYMehiFMNHzi3KXdlr1MN
         1Rj+MSS2yGO4TDy82rPa+9+wfeLxePZK6WaF8o1woYEv0iX3of4HgVLsRcbVEcBjm47h
         Ga+BafVWhXsNIvwn70tK3yCeqYEZyCnnXWq0KJKSvvDPMYGfHpwI7fKSeED30zD+IvGY
         3vap8Llwwmh8X79oleUKThMDnbAm3pY8T+bTgQNXjvAK8x4Uz1fnOOnMZMZRXVsPmxmy
         BpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451263; x=1703056063;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LmMzb2Bkns+RQ1OsG62aCuWph1lfXAn+2JQCC5cPvo=;
        b=Z3KRkDnR3CSDyUcPCRTT76ktNXfZpVE4fb512gZ4YqRuZYdd7H4zsIo5QhKuNMy7gK
         BTL0IPchCJiXFnZXrRZpb6xi8GzDYX/WhwBlDITPcnNRuTO9sb8vIiXIw6e+vQMeoHqh
         tIvhsStxC5sDKU+JVq4YZ5mrNBaB9/n0/o2hltWmZNjD8qWsFCKLT0PB8mKjdTHooRJb
         CsH8DCaCDmF8wku1B/s3HYEPZsDpDl+++Wv99Vpox5MF9vl9aABgSfmJJD+dRWhvKK1F
         6hrb0b/oFUMh868scLEQUOqHWGfroGF9R2O/lCeCm4W3vRX/S3VqSkAOlb/uwyH/gPXs
         p46g==
X-Gm-Message-State: AOJu0YzlA4BiORHyt8wIcCU0BJXegqHsBVVDPdO0GJh3fsN6TS0Ln7OL
	wcOzaE5NihdMhXTI7goEPaDh/toeN9Y=
X-Google-Smtp-Source: AGHT+IE4y0q5caIb/PWLThAHNKv1n7X0eAS93B4F+ONqztjUAGU/qX2c1QYKaaHxJZsWl5avxD0Nug==
X-Received: by 2002:a05:6a20:748f:b0:18f:ce60:ceeb with SMTP id p15-20020a056a20748f00b0018fce60ceebmr9027372pzd.23.1702451262980;
        Tue, 12 Dec 2023 23:07:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20231212125742.2494501-1-martin.jansa@gmail.com>
References: <20231212125742.2494501-1-martin.jansa@gmail.com>
Subject: Re: [meta-multimedia][PATCH 1/2] rygel: fix build with gtk+3
 PACKAGECONFIG disabled
Message-Id: <170245126227.133993.5928496649587905016.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:42 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107381


On Tue, 12 Dec 2023 13:57:41 +0100, Martin Jansa wrote:
> * fixes:
>   rygel-0.42.4/meson.build:1:0: ERROR: Value "false" (of type "string") for combo option "gtk" is not one of the choices. Possible choices are (as string): "enabled", "disabled", "auto".
> 
> * possibly changed since:
>   https://github.com/GNOME/rygel/commit/7e1819d9e49084c9dc55064a6f21d0f7caa90da6
> 
> 
> [...]

Applied, thanks!

[1/2] rygel: fix build with gtk+3 PACKAGECONFIG disabled
      commit: cdaafdea99c6b49cc56216c6082722e01512a0cd
[2/2] rygel: add x11 to DISTRO_FEATURES
      commit: 23b62b3391f2e605f59e02abb3c99db2a7b82eb5

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



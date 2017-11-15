Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id AB5F07831C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 19:35:01 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id 207so15922718pgc.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 11:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dWu1iy/q0pqFFwD6lKMzz93r9KP26Ef7EaKVM2B5ZCQ=;
	b=KMP27C92BZ3c2cec4wxk6Rn+C/N2ZVLlQzZesUf6N9/RQmo+Lo3QMq4ciuFx1Ric7U
	0x/sMQmq9A8BSTdJ7ZoE5Ew5f5qoDUlLzbz1epgjs1h0BL9T9UgMK+l0PzuAS+iezRmh
	oJP8JHgBWd4EDPRDBd1SkxLOEuqUzuiNCEFdzBcIeQum6U95fYtDLU8qBGfJ+Ik5VXeM
	ySqo9vAvIfbuq/7MF1WRUNjNqDZqjjJflZaby/0XKOx/P3ZEU6K4jINVNH5pHu0cws+6
	Ro1Z3gp62ssY2FcS5lsuaHX8DfOHkE4SVQ5J/B6V0RIpYHzgBd+y1H0NBXAMaw4sZ41y
	ipqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dWu1iy/q0pqFFwD6lKMzz93r9KP26Ef7EaKVM2B5ZCQ=;
	b=PeTgN8nzs35EJWnIAi3kpmfQcixA2ZfQT/5SB6bPxzCP8Cgh075F262a5uYJ5hM673
	4EZUsPRFTLE+pT3fvrjV2e7iGST8Cc02i71RUC5oV8qEOYN7vc1+H2EUDKj2YO/urg9W
	ELl1FXC4CuuuO+gB6l2VDeZxqYGLdSyNgqDvorPfOqbAtTM049q7i3f00678gsAt8YJ4
	eP9p3zCTvvIwLSc05os7wCNnhQn2DQp3TLwv3RDr3TMxzlUimf+K95t3ckfWHYyNd2EE
	paCmvr45ohmT/vaffYcsJD8wbdGB+2P77gpoTrNo8+UosRAPxBfJrLAFPLohyhJhK42j
	NDbA==
X-Gm-Message-State: AJaThX7M9E9QEToHYIt/jeWb85pKDnCB97F4SPVsFLrgZrUAMK9LTG99
	eFhhD1xll4rhlvpvQW69ITX4HCLZjy8LwX66sJY=
X-Google-Smtp-Source: AGs4zMbNtTbEuTJ3ouyd3P6wPTbh0cDc7s2KrpCS6iSH4Mg2Jt3G+5LqQ+Q5xhiLwRAGwv9dNdfZxRKDg3k/HUJgw4M=
X-Received: by 10.84.179.67 with SMTP id a61mr15798102plc.338.1510774502976;
	Wed, 15 Nov 2017 11:35:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.167.106 with HTTP; Wed, 15 Nov 2017 11:34:32 -0800 (PST)
In-Reply-To: <20171115174136.GA4530@jama>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
	<CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
	<877eur1nby.fsf@rkubodac-desk.ger.corp.intel.com>
	<20171115174136.GA4530@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Nov 2017 11:34:32 -0800
Message-ID: <CAMKF1soYSpfBApFPmBa1zj1U6nkqJ9+nqPckRser8Y3eWPmRmg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Nov 2017 19:35:02 -0000
Content-Type: text/plain; charset="UTF-8"

>> As for musl: like I said in my original email and on GitHub, the musl
>> build is currently broken. Carrying tons of patches in the recipe is an
>> uphill battle, so unless someone takes the time to work with upstream I
>> don't think it makes much sense to try to keep the build working.
>

musl is relatively newer and support for various components may not be upstream
but it is getting there. There is no alternative than to carry patches
as of now.
and keep forward porting them as the versions advance. We may never get all
of them upstreamed as is the case with many other large packages.

> OK, fair enough, maybe Khem will again chime in and fix it for musl (in
> the meantime we might blacklist it for musl that people don't wait for
> the build to fail).

The patches needs to be redone mostly. Its ok to blacklist it from now.
I wish someone besides me would have cared too.


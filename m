Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id F36A160620
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 16:53:14 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id q126so81530944vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=7dI2fKDuMY629XotRHFp8t4BqpMm46q5ooV60wxD45E=;
	b=ZnsmwSbWM/FPFmlzxDUuFf6qpUEnHBuRj02DN4XMcrj3bw5E2RN2YIoBs5ayXcGL8h
	ucVXPdpz+/07UMCR5fAIYpAEV2q5qyZC0weGkATrtciVlCFR7hEUvfsmiuFtAUTY6b2F
	WCCgwdwHZbGvMLpXeVIMOdCTyGRBCotZomUGvgMyBrFZmNWhGJlR49WE8Kqk7ogQ2yBB
	FtfdcpaG1MOLDOHS0eS9oADND9JE4h2C1AQyCD+T+Y45uH2PjzblrkeZK2VmFpmjHjDl
	l4kcKlcdw678Aumx8OyBJzHdFBGjVGDN23FgUUYF0BGhnQduA9aNlMi9JaBpWwo8eETV
	hBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=7dI2fKDuMY629XotRHFp8t4BqpMm46q5ooV60wxD45E=;
	b=BD6LE+X6mKnoRIzgKGLCs5+gGGIV+W4P56H6Gi58SFW6VmCQpG0d1AQnNObppkGhJ/
	IeNcA1wNFKlLjlGBZAicSoHWZl/eTUenipVs80R1O44qnCgM+a+C2xhqJ3fknqRW/Bhz
	0xnxMD11ew/tqNkcW35KyuHqmE2orpdw1NHqRhsDmBwlLBilQTXgsBaPm4Mhcel0I6ic
	vcYhJwFiVa/xtYXRvUs1RAcshFCC6nwgBQkM6Fg6q77wd3ExKell4vs/44ZYu1LYW2Ba
	MhH8H03mY1O8AhhQEa/swrHgiTKlEPEQKkCBczHfPbIaQOS1bBGZMAmk3xNUUyTaHYg3
	wwsw==
X-Gm-Message-State: AA6/9RkbKOaXpGbP4t3AblGjA4qH5XLOmo4V3ZIFzlLgqP/TPyjvmnxdFy3o/E3ORkGevA==
X-Received: by 10.31.150.7 with SMTP id y7mr2423422vkd.97.1476982394349;
	Thu, 20 Oct 2016 09:53:14 -0700 (PDT)
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com.
	[209.85.213.46]) by smtp.gmail.com with ESMTPSA id
	t198sm17365296vkc.6.2016.10.20.09.53.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 09:53:12 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f46.google.com with SMTP id q126so81528218vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:53:12 -0700 (PDT)
X-Received: by 10.31.210.130 with SMTP id j124mr2503968vkg.17.1476982392108;
	Thu, 20 Oct 2016 09:53:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.120.78 with HTTP; Thu, 20 Oct 2016 09:53:11 -0700 (PDT)
In-Reply-To: <20161020164624.12103-1-otavio@ossystems.com.br>
References: <20161020164624.12103-1-otavio@ossystems.com.br>
Date: Thu, 20 Oct 2016 14:53:11 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpCA6tuXf7Kv=RA5kabS85ju50zt8zaCrzu0kXm6CnvNw@mail.gmail.com>
Message-ID: <CAP9ODKpCA6tuXf7Kv=RA5kabS85ju50zt8zaCrzu0kXm6CnvNw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Samuli Piippo <samuli.piippo@theqtcompany.com>,
	Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5 PATCH] qmake5_paths.bbclass: Fix fonts installation path
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
X-List-Received-Date: Thu, 20 Oct 2016 16:53:15 -0000
Content-Type: text/plain; charset=UTF-8

Hello folks,

On Thu, Oct 20, 2016 at 2:46 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> As Qt internal fonts (qtbase-fonts) are not included anymore, we need
> to rely on system fonts to work.
>
> All major distributions, as well as all recipes on OE-Core and
> Meta-OE, use ${datadir}/fonts as path so we adapt the value for use
> for Qt use as well.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Please take a look at this. This fixes a customer which were trying to
use morty with Qt Virtual Keyboard.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


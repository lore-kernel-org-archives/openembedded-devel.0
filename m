Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id E51CE6012C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 12:29:11 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so190052668pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 04:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=JQwqwUyc7aPmP0B8HTZJsCuZ61UJBPLJgFrPGkFvOQE=;
	b=ynjmKqFvBfCbRFiX3NuIYVlVBuTxVSsKj5/+bNWdCPf5gLydVhezT8Le6AbtIOENDG
	EQbBIqTX6k8DE17sXkFIAgYaq/AV6Oofb6x7ddItI/0faCj+Py926ge5kx+DpRRFd862
	BvMU+T82cu25SGgX9QlbX8foFblm/8cTjcybx7Z+x+RU8CQ900cIg9FIjl4lAC65wX6A
	zUr/pdWoBtRL7uhhxxGK23ZOpK1PeXlwEa3gpH7INley1LNT0uXYK4TscbgoNLEjbTcv
	DGAt4gSI3gRiVNWjnK0EQ81LOhAqbOLCmvG5H3xg6No2bzFAYENz7epPn7YC/BkMDLxO
	+s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=JQwqwUyc7aPmP0B8HTZJsCuZ61UJBPLJgFrPGkFvOQE=;
	b=C31fXMv2ggr53NFR8nnOLl+3dSRBtfvjMTRJaN9DolzreEAKk+W+I0X6Vp8KhSYkFt
	qOXEikWSCTZq6xLQ5BV8Ws4PAIHGPQVnVOgiCpo/qm97OMiUrsz9ZiEZbJWIswBZuS00
	7vizirlrN9ZlzPbVFYAadrRWnG/yO9LUdlLJoLxRzvpQ2EdBKLYRvNUshcQlGzkEq2G/
	vd4yA9GAyZjLf3lQWCMt84f5ZMpBar6Ap49XoBOVMdX6JcYwfbb7FMz0OgW+y/r9sEFF
	8Lob4cNAizPElullEl4rvfBPMThZ2Li0B1acX+sqtZBouQ66u5DsmpQZVjAB8lgGk1ue
	saNw==
X-Gm-Message-State: ALoCoQmDL9LtyJWjwUk7o09D8VeU3fKaO50B9fY3wMYkRTkxCqDlxWQi9UHNJ8dHtRCf8ahykNb5
X-Received: by 10.68.237.98 with SMTP id vb2mr35853766pbc.26.1448281751996;
	Mon, 23 Nov 2015 04:29:11 -0800 (PST)
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com.
	[209.85.220.52]) by smtp.gmail.com with ESMTPSA id
	n6sm10401437pap.24.2015.11.23.04.29.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Nov 2015 04:29:10 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacdm15 with SMTP id dm15so190051920pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 04:29:09 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.63.33 with SMTP id d1mr35445833pas.120.1448281749920;
	Mon, 23 Nov 2015 04:29:09 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Mon, 23 Nov 2015 04:29:09 -0800 (PST)
In-Reply-To: <87h9kcoqw5.fsf@email.parenteses.org>
References: <1448279098-24980-1-git-send-email-otavio@ossystems.com.br>
	<87h9kcoqw5.fsf@email.parenteses.org>
Date: Mon, 23 Nov 2015 10:29:09 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqRoEzU_uHtuBNRzq=3tQi5Um0PV+io6bcCcfm8dfWsjQ@mail.gmail.com>
Message-ID: <CAP9ODKqRoEzU_uHtuBNRzq=3tQi5Um0PV+io6bcCcfm8dfWsjQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-ruby][meta-xfce][PATCH] Move imsettings from meta-ruby to meta-xfce
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
X-List-Received-Date: Mon, 23 Nov 2015 12:29:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 23, 2015 at 10:13 AM, Mario Domenech Goulart
<mario.goulart@gmail.com> wrote:
> On Mon, 23 Nov 2015 09:44:58 -0200 Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> The imsettings requires xfconf to run, making it dependent of XFCE. It
>> makes no sense to make meta-ruby dependent of XFCE so we move the
>> imsettings recipe to meta-xfce and add the meta-ruby dependency there.
>
> s/dependent of/dependent on/

Agreed; Martin, can you fix it when applying or do you wish me to send a v2?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


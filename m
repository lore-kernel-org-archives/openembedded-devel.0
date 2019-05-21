Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 225C07E269
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 14:52:49 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f12so8563975plt.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=x+YOc/qcG3YPF1Fv6OAg0Yx+hDJ2DVaNhIAliZikDC8=;
	b=JEI9DseTYKiCzJ8cf64L6VSOKIA4W1NgJb/ZAZM7hCmfyf3ZCwwmhfDreIaA28J19u
	vFlWj+hHy7gyyWHsUfTDiydZP90C2OKZ0K2PB8tQoSThcixf25kiCnfhYxAATW//hIp4
	mZEfx78F0BSuIq7oFWn35xnnNNVd8FKbehyncVx5AB8K56doncnv/5tj4m3yFDWp5D/7
	ytcRBnMPQQ1ao4b/04qv8woU/LfCKvQkkq/3JAsl/FCwGPaBx2HGvJu9pwb1+s/r3XpW
	go/M1wCh42CVmLMThjYEIrJ2lXcTrjO3C2yhaqfc4NPfidSa/bez7GsmO3+j6uM21Nv0
	b5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=x+YOc/qcG3YPF1Fv6OAg0Yx+hDJ2DVaNhIAliZikDC8=;
	b=SYTv7PS9hCKzi/ggDoXmnbOrmzAQNBStJvjJrB2Fg3IpChJn9rHv+q5wKzS3rpsk/E
	QlcZoAM9Mf237NB0+oXIGIIPNIuLbJz5hFx/h0TgA4miN3ehZ3aZynwVo+DHMEeyLPuQ
	zoR53oXdiDhTqHJr5UwNzhaV4x70LWD0Gz9pfMHJLUHJ58Vr8m7QhpytlMFV60PVsHHK
	jUNdizo0Q8HQ0IzAVmh0LmObb8LdHUVqfrTWhFArwb9zsLyo0S+vcF6FjFCc33KGVxKB
	jZQwG9lxlo1L/OXSFQAbSAo2F2IHgGPWm/RBMuWZqWvnXUpfZPUsMN4sS6BQZ643fgru
	4thA==
X-Gm-Message-State: APjAAAW6rGR38pMJ8q+VlKMIga2oWXAjWfLMHF9T6d0YujiSyMgVFFP6
	FczZ2y+33rfv0juKLxX5jDZvscUE
X-Google-Smtp-Source: APXvYqz35MCF47PMKqeWszW0+AKcMbh3XCbC0A9Ko2FRmmnxOMwlRyIY2G9WG8ypKYNlbN8GS76Ojw==
X-Received: by 2002:a17:902:7d8a:: with SMTP id
	a10mr62820882plm.63.1558450370862; 
	Tue, 21 May 2019 07:52:50 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:199d:e2fe:5a4f:97f4?
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	c5sm23506332pgh.86.2019.05.21.07.52.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 07:52:50 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1558410874.git.akuster808@gmail.com>
	<fd48edcd7415f4a1ca043e256585f2705b66545f.1558410874.git.akuster808@gmail.com>
	<20190521064032.GD9971@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <13e0f089-cd2e-9084-279e-1a048911e543@gmail.com>
Date: Tue, 21 May 2019 07:52:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521064032.GD9971@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][patch 02/34] python-pyasn1: upgrade 0.4.4 -> 0.4.5
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
X-List-Received-Date: Tue, 21 May 2019 14:52:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 5/20/19 11:40 PM, Adrian Bunk wrote:
> On Mon, May 20, 2019 at 08:56:02PM -0700, Armin Kuster wrote:
>> From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>>
>> -Upgrade from python-pyasn1_0.4.4.bb to python-pyasn1_0.4.5.bb.
>>
>> -Upgrade from python3-pyasn1_0.4.4.bb to python3-pyasn1_0.4.5.bb
>>
>> -License-Update: Copyright year updated to 2019.
>>
>> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ..
> No reason is provided why this should be upgraded in a stable branch.

There is no meta-openembedded process or requirements for stable
branches=C2=A0 to provide reasons in commit messages.

The precedent in the community is to provide minimal or no comments in a
commit message. So the burned is placed on the Stable branch maintainer
to do the leg work the community as whole should have done.

I looked this up before backporting and I was satisfied with the
information I found and felt no compelling reason to explain why I
choose this for backporting.

- armin

>
> cu
> Adrian
>




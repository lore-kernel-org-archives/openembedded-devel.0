Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by mail.openembedded.org (Postfix) with ESMTP id 311BB7D95E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 15:44:35 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id x144so5537498lfa.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=77W1PH/knwKFQgc3RMMeRVJMv1nj/p1CzXOktvpumVk=;
	b=C3QC6KEv4d1Dw7kW9hJhwdG/tRrHcXglj9zL5X4u4+CaTomtcZDip2faqNa0o9jDOy
	VRqZM0EyvTn3fComIgAfV3MmkdZBahCSUe1w0zoGN8xguhD0YbObTk7VonWLknR7rVu7
	/3LPtpn+wbn2sBMt1N0Qld6O4bagD73+eaULmkW/bTcJ5yjaUSGX1wiqQzC/Xas/++2R
	zcQC1+CU1kwTo4FPlBttd34eJDIh3La6Df/wVu8fHKYhFe4IgSFggVY0NDg5lemGOxu2
	hf2rTQ3RvqM72Db9QbU1v1+QmFN6FlpEQFtGsPQ0+r2QHmJ2Mh2SQmZma/BUO7llt6JH
	sSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=77W1PH/knwKFQgc3RMMeRVJMv1nj/p1CzXOktvpumVk=;
	b=DrQVwUL1Y7hK1JQkBnYZ0cLeE5pBLwevPxwe5ljkZhIL8sBiDzYrcvLnRhfi/HbMiE
	PbcZGfywp9tGMU4se2+yGv26WiD7PYHu5LvKqaLIDlXdrXYW/BH76DJXkNJka2bdXP3q
	g4SA13I7uhCfiqOP//wuge9TPR7DmS2bENJOw8sxO67deAzzvvtPvO2KRvZggRXYu5u7
	752NJ5R9xmRtBtRq4s2ItzrBQzKnGGRxXGfUuVWvh0dFVDW4VNc810dNnCiWdcG4T9Pd
	uYHhWRmj9bvcxw+TPmdqm7Hl5kje24GDPFb/agWyH0lryB7i8RiylSiC9mMRnQkL5dZZ
	2hnQ==
X-Gm-Message-State: APjAAAXFVPjb2SCvXZ3cbZuSte24LyTFieQlwDMF1R3Yy8L9qUc5i3SS
	+5XPMTbZ7BQx/51KzeL1Ff0Owg==
X-Google-Smtp-Source: APXvYqyzCugsy+oWZp0Wp7Ou5326qaLyq47wjjmWrtccudV5qSVhcDbRTkbcle0uI3IG/CbPbjPqOg==
X-Received: by 2002:a05:6512:30a:: with SMTP id
	t10mr8337800lfp.22.1561477476471; 
	Tue, 25 Jun 2019 08:44:36 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	g68sm2353876ljg.47.2019.06.25.08.44.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 08:44:35 -0700 (PDT)
To: "Valek, Andrej" <andrej.valek@siemens.com>, Adrian Bunk <bunk@stusta.de>
References: <20190622014747.8719-1-open.source@oleksandr-kravchuk.com>
	<20190622082052.GA9472@localhost>
	<D55698ECEC159B488D62A508E18D7FEC124BEBB3@ATNETS9912WMSX.ww300.siemens.net>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <ed06be6f-917c-94c2-5976-f963cdd64a89@oleksandr-kravchuk.com>
Date: Tue, 25 Jun 2019 17:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <D55698ECEC159B488D62A508E18D7FEC124BEBB3@ATNETS9912WMSX.ww300.siemens.net>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Scasny,
	Radovan" <radovan.scasny@siemens.com>
Subject: Re: [PATCH][meta-networking] dhcpcd: update to 7.2.2
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
X-List-Received-Date: Tue, 25 Jun 2019 15:44:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

You're right. I must have misunderstood the code. Thanks you for
pointing this out.

I will re-submit.

On 25/06/2019 14:02, Valek, Andrej wrote:
> Hello Oleksandr!
>
> From the maintainer webpage (https://roy.marples.name/projects/dhcpcd/features) I can see, that ipv6 feature hasn't been removed.
>
> Are you going to re-submit the correct patch?
>
> Regards,
> Andrej
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel-bounces@lists.openembedded.org> On Behalf Of Adrian Bunk
> Sent: Saturday, June 22, 2019 10:21 AM
> To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH][meta-networking] dhcpcd: update to 7.2.2
>
> On Sat, Jun 22, 2019 at 03:47:47AM +0200, Oleksandr Kravchuk wrote:
>> udev is now explicitly requested.
>> ...
> What do you mean?
>
> If udev can no longer be disabled it should no longer be a PACKAGECONFIG.
> Otherwise I do not understand what you actually want to change.
>
>> -PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>> +PACKAGECONFIG += "udev"
>> ...
> Why is ipv6 support no longer enabled?
>
> cu
> Adrian
>


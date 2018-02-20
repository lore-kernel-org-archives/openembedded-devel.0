Return-Path: <dachaac@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7160B7780A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:55:10 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id v9so5130830lfa.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 08:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=K1euFDsKwbDQNO9eHb15BIVNuGwuJ8kdRxwym0qsPiU=;
	b=sI71TFhdiSRcK84Q6p4NU75h7gkXVSp7QAoX8XrH2VggmyQhbc1K4V2lYSM9CxM63J
	kgiFG8Q1d6AVSlhbc4x6m0hzTltl1nQ3+1VlP6wDTX7MBh3taGNcRCsOvR0uyCzhhMj/
	TfjhEKjmVP+kt30IR6IY1ApnX8y0p9aCwf9/L5PdCyGD7MyrtNV68GrYq+0kQpetw4Hx
	mfIsoOPeWvuSBSWWgFFcMzny9m1WtfOwmTbYL6oQazXNYILj8Io0Ukaj2053WnSelrjc
	QYFHY9Ff4r01ZP27gQB3bOXW58vNGy1nbnxcbraH8Q3Szphc7vCHdkyBZtg4qXmOIPTR
	swcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=K1euFDsKwbDQNO9eHb15BIVNuGwuJ8kdRxwym0qsPiU=;
	b=H2gRXuefSwO/AmZYBUkTLhoOfXImXeZpBct3n2bvYxfKxrQMIBQESWdDO4uIrrQ6BA
	e69t5cAe+U8PQabqIgWx2MBVfzdnWQBDAeQZlPNLwgoYZcAjvVm/rMQqAVZ5wgONsEJ2
	cDNA0EmkF0qoVR9hSOR4QwxSRZdCGWGGlhRS20hKmSaDH+Fv1Wn9nrXzSbMxRjpjtDSW
	OszsEhI8C38FDUVS8LKVLA+l2zaFmhPJ/Gqz4WzRiTc/nuuhD6XAwF+gBpe75qmvYBkG
	YrgOJhBwwGAOvtQbkur9O7JEK9hAcuYOE5/FwyGmaVh537qwSj4LD8fyCaVtCMwFTmKM
	SKhg==
X-Gm-Message-State: APf1xPCNOKiEuG870chYNQysao1iw3fdWRYLIOKsozqSI+YTNpfQnscK
	TKDaktu2uBId6ZYVMpis6rA+iQ==
X-Google-Smtp-Source: AH8x224xkcopbhQCIssvNRLBZGDxyE8KC38/KPmaoP+2XDdMiPEY3nrpayCAP+rKP9aVTh8FdXT7/w==
X-Received: by 10.25.56.22 with SMTP id f22mr184600lfa.109.1519145710561;
	Tue, 20 Feb 2018 08:55:10 -0800 (PST)
Received: from ?IPv6:2001:14ba:806b:f800:d18f:4ece:351c:9de1?
	(dtb1-tyhvv9jp8qk8x3tt-3.rev.dnainternet.fi.
	[2001:14ba:806b:f800:d18f:4ece:351c:9de1])
	by smtp.googlemail.com with ESMTPSA id
	p77sm3321715lje.56.2018.02.20.08.55.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 08:55:09 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Message-ID: <c9fb6fbe-93d5-8638-b504-d3dd2d6fdf0b@gmail.com>
Date: Tue, 20 Feb 2018 18:54:35 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Tue, 20 Feb 2018 16:55:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 20/02/2018 12.45, Burton, Ross wrote:
> Hi,
>
> Is now a good time to talk about splitting up meta-oe?  Some layers are
> actively developed and maintained (one example: meta-python), others are
> basically bitrotting and only get touched when something else causes them
> to break world builds (one example: meta-gnome).  I've long felt that
> meta-oe should be split up and the high quality layers managed in their own
> repositories so patches to them don't get held up by breakage in other
> sub-layers.
>
> Another advantage of splitting out the high quality layers is that we'd
> like to look at running more community layers through the Yocto
> autobuilder, and granular layers make that easier to manage.
>
> Comments?
>
> Ross
Other related problem to meta layer management is that should there be 
recommended scheme for meta layer priority usage. Now they are a bit 
randomly used in different layers as there is no guidance what priority 
should be used for what purpose.

Eg. what should in-house layers use so that they fit properly in scheme 
and does not conflict with layer X that can be found from github.

Eg. we had to once re-base our layer priorities due to conflicts in 
priorities.

Thanks,
Vesa Jääskeläinen


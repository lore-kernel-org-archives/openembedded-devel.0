Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id EAB3F60079
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 01:17:50 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id y8so1669853pgr.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 17:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=f1FfmSvaHk2yygcYo0ZhkLolySJArZMitcLZt0xhoZg=;
	b=VzYAJmB3TIFj5y8dPUT3jYRwMm0j+6xT5zna40gXtheh2o5r6gmZ2LZkN+LROzAx2x
	rhlU0RPSg1dPJKI9uxbZkbN16UGNJyC8sMUoLiJOrdjpgIY0XLqLhJm1z3v2HcVek23/
	WKAJdE2FY4lkWOh3/w/syv5SN7/fS01p2OymeVBghE/DSFXEQMuH0VuLxoY+tyQ+fszN
	d757Lk/9oM7aa5txRT63jJHshrou8HRyoRDOncyRWaS9erS50lEfCwwSItc2QzefP4tb
	uN/pPNyL6+jEbfGH6Hs083uQ3dbuWfcbO9RdB1s1/17tXJdGtFGjtf7REcFmZZ0trdol
	yCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=f1FfmSvaHk2yygcYo0ZhkLolySJArZMitcLZt0xhoZg=;
	b=WmI3QLe6YmPoOVKGUqS582KoCWK+VbZNmBmLzBnGT5Q8gRJ1MNyqjLlXPSgaqNnxJj
	1C3WboFzQUJeZA3gb5B3LUfsiMdHpOXIJTDhiAYKJFbgnDlYpfB28An+Mn8fAphMr5P/
	Qmdg88dWVyAYMwDTuMvjcCdb+I+Hit4P1LoKLmtsP0mNk7jorBU2k2jut1X5EwgwQ7kI
	xAZQLAUbYbofu71BwBuD1FRzSds2rsfNVV5mpCyOiCaSlCuKxmavfrPibBXe+MEmErlm
	Ow8y/kMAz+FUN27xT+mkfSE02UB9dbQWTDQKuq5q/OUyaVGS/F6OM+5uFRN3aLFNFFXo
	UpHw==
X-Gm-Message-State: APf1xPB3JoTXPfs2R6/BOQGL99nYmJpCGPaiTrNVKzo3IC56ntNAk1d2
	0mKXcfLFtgMQx1k1H7MVD/WOnQ==
X-Google-Smtp-Source: AG47ELvYXBbAcCjAkRoL5Uj6FZ2HJzdF6aiSQnU0FLd2j7GAUO6cazXomiHlu7uVoJpPEA9ka+AOzg==
X-Received: by 10.98.153.86 with SMTP id d83mr116198pfe.46.1519867071878;
	Wed, 28 Feb 2018 17:17:51 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:b885:642e:b8e3:aa2c?
	([2601:202:4000:1184:b885:642e:b8e3:aa2c])
	by smtp.gmail.com with ESMTPSA id
	w83sm5675653pfi.171.2018.02.28.17.17.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Feb 2018 17:17:51 -0800 (PST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<17c4a7f6-c188-1a8c-2371-74ec67ebfdac@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1d48c1f1-8b2d-2f8d-ff23-31890aeadbcc@gmail.com>
Date: Wed, 28 Feb 2018 17:17:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <17c4a7f6-c188-1a8c-2371-74ec67ebfdac@linux.intel.com>
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
X-List-Received-Date: Thu, 01 Mar 2018 01:17:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 02/28/2018 09:17 AM, Alexander Kanavin wrote:
> On 02/20/2018 12:45 PM, Burton, Ross wrote:
>> Is now a good time to talk about splitting up meta-oe?=C2=A0 Some laye=
rs are
>> actively developed and maintained (one example: meta-python), others a=
re
>> basically bitrotting and only get touched when something else causes
>> them
>> to break world builds (one example: meta-gnome).=C2=A0 I've long felt =
that
>> meta-oe should be split up and the high quality layers managed in
>> their own
>> repositories so patches to them don't get held up by breakage in other=

>> sub-layers.
>>
>> Another advantage of splitting out the high quality layers is that we'=
d
>> like to look at running more community layers through the Yocto
>> autobuilder, and granular layers make that easier to manage.
>>
>> Comments?
>
> I just read the whole discussion (been on holiday), and while it seems
> that splitting layers is seen as too heavy-handed, there is still
> something that I believe should be done: a policy for blacklisting and
> removing unmaintained recipes. Such a policy should be:
>
> a) clearly defined;
> b) consistently applied.

Thank for the input. Its more of a mater of someone willing to sit down
and documenting it. Having that said, people tend not to follow process
or even read them. I thought Martin sent out an email regarding this
Blacklisting process.

>
> If that is in place, I, as an oe-core maintainer, would be a lot more
> willing to contribute to meta-oe, knowing that recipes I contribute to
> (for example by fixing issues caused by changes in oe-core) are, in
> fact, used and taken care of otherwise. However, me endlessly fixing
> well obsolete gnome2 stuff is just a fast track to not caring anymore.

We had/have a situation with the Yocto 4.12 kernel that broke wireguard
in meta-networking. Their are two patches that don't exist in K.O. which
are causing the problem.
Meta-openembedded can't fix that, do I blacklist wireguard? Wireguard
builds fine with K.O 4.12.

We are at the mercy of oe-core; kernel, toolchain and other core
changes. Most of the failures now are do to the 4.15 kernel update.

>
> So, which recipes are unmaintained?
>
> 1. Badly out of date compared to upstream development. Say, one year
> or more between version provided by meta-oe master, and latest version
> released by upstream.
> 2. Recipes which fail to build, and the situation hasn't been
> addressed, in, say, six months.
>
> Once either of these is established, the recipe enters a grace period
> before it is removed. Any objection to such removal should come with a
> patch that addresses the reason for it.

Thanks for your input.

regards,
Armin
>
>
> Alex




Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id F2B7160851
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:50:08 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id e13so82024pgn.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 08:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=NP2zUmM/JFmEnfKMRiXzxa/ESAwBgXFgdvPXdeQyUuo=;
	b=AFQAzKpH1fYLLUxYpVCkTIy627Ie0dpvJvLmjTmg8/nPthbUnS9wNIeBf74/Dbf5cQ
	3dDU8E/BBQOuD5NZblYH7y/bg6i5uT0Ehy6C+OHBzixcJ2DudI+hql1goXAhUSsYpGZ/
	YVUmUEfC5vTP2N8f1Q0F/4d6YPCA58ekFW1unhTTGe5CptIDBAEwwD98+LLVfTkR0ID8
	rRlbTeq1tzfnqoYOEe5oLql4vjwDzWjryXs0Jekk1+X4RHn2qHV6wnMLrDb56meYfJsq
	g4VT/B3M5ZguL8aN4fSb3hnezj4xQQ/4NaRsp2h+X1ekfPPql2FelU1eC6KDU0NWWwK3
	Qqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=NP2zUmM/JFmEnfKMRiXzxa/ESAwBgXFgdvPXdeQyUuo=;
	b=U+8eNTu+XWAQxc6o8WhbwYFEwWcvbX1VNU81+uFN6CRoWRBFs+z6KnucSMF7PmYjXs
	Q1fYTWqJAdCI11LR/4pIwdp1mCkCksn/iI5+EctSiUfIDuG2/0dtvFJe2+WCbzga5t6v
	RU5Z3fEXVh0hNk2UztuiB1DCq3+Fygq/WWNP3H06MmPc5biK0FqP5ruE0L35YFctkivM
	rPvc8sAGbanX9BFEIcfdFUVuxypp0kVuy6V+rBPLLYihumc4dDznWOp/aSQyhPSQA42R
	ihOf+dBJ2NOkxbeMeV1MNJJ4pc9FbDYrXw+rbz2/n1SfcSwSJmtTr3B+XysHpQB4D3yT
	gTGA==
X-Gm-Message-State: APf1xPBPfTNCf2CYgd3uY5j/prghtzBJq7Wm1dVJMVweYgeDtRdkZnw/
	8IwKh2jK1a+9KNGW3ArXgFsEOw==
X-Google-Smtp-Source: AH8x226Xe5/5Q1n7McPjbMPhDwjwNo+vTuk3GDQSHCVsD/qHJWmxDStjQatrplcxUtkcZLk7Fl9Vlg==
X-Received: by 10.98.11.194 with SMTP id 63mr244999pfl.172.1519145409833;
	Tue, 20 Feb 2018 08:50:09 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:88:5af5:94f3:78b1?
	([2601:202:4000:1184:88:5af5:94f3:78b1])
	by smtp.gmail.com with ESMTPSA id
	g186sm33925765pfb.168.2018.02.20.08.50.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 08:50:09 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
Date: Tue, 20 Feb 2018 08:50:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
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
X-List-Received-Date: Tue, 20 Feb 2018 16:50:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 02/20/2018 02:45 AM, Burton, Ross wrote:
> Hi,
>
> Is now a good time to talk about splitting up meta-oe?  Some layers are=

> actively developed and maintained (one example: meta-python), others ar=
e
> basically bitrotting and only get touched when something else causes th=
em
> to break world builds (one example: meta-gnome).  I've long felt that
> meta-oe should be split up and the high quality layers managed in their=
 own
> repositories so patches to them don't get held up by breakage in other
> sub-layers.
You make it sound like meta-oe is not a high quality layer.=C2=A0 I could=

make the same claim about oe-core master.

I don't see the connection in patches being held up due to breakage in
other sub layers. This only happens if the dependency fail to build.

You lose control over the quality in current layers that reside in
meta-openbedded just like you have no control over all the other layers
residing in the community. It makes maintaining stable versions very
difficult. Well, unless The Yocto Project takes over them.. I guess that
would work then.

>
> Another advantage of splitting out the high quality layers is that we'd=

> like to look at running more community layers through the Yocto
> autobuilder, and granular layers make that easier to manage.
=C2=A0I thought not including layers in bblayers.conf was easy enough.=C2=
=A0
>
> Comments?

What problem do you thing you are trying to solve here?

- armin
>
> Ross




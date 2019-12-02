Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 97CE87F4FE
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 21:49:09 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id k1so392984pgg.12
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 13:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QEWHPodp1rfTs77cjHQYvpx6NIKDBJuI2S95bZ5t6Qk=;
	b=EW9PEDJ4U0UIuwYmLU3SEZx4lcErQg5rogwwgV4E13gWRIYlWhwhr6EDrDptwZZwJS
	UX2I+5IH/RtaCG/+RnSSwdYhIKaS+W2OlJqnBVv1QVaLscasT7jWslziW/H4AnwoBxMa
	WYdHaKed+CFCl6F8o08kHfhGlh4s1K12VIK6m+Amdh2GxpYyno8arrrRCV9fotx9X/kM
	b/W0Hf4mH19s8XxrvvnWg56D9ZAMbuNx6t0Vsf9Xs29NS8R5KVEjdLdZVarux4heKogL
	glkxZrX3EnnwpDpkdvxBM//STc5oqrweqj6QnLxFAGDpqov9RPzQbOLotmxMrlca4Zyv
	vq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=QEWHPodp1rfTs77cjHQYvpx6NIKDBJuI2S95bZ5t6Qk=;
	b=BGQDdLa3yaxP2mfmw4QzeTxflWSjfzGxOB0WLM9Co5csZMMkVi8FqRaoq/eHcuV1jp
	nt5iqC/E5OIgBxhybXXoJbm3oe+98X279y0T58jICzIbC9tB7ZcHOZYg+5Grc+AIleCA
	OfAx0Ot3DIUK+PwwnNrQ8a4rVpNp9QjQjfgulyB+GjoXTF/fU6556o2MJ4VPp5Dpy2zv
	5WXKcxekovcI9zlbQYWrk1DiQDB8VjakEYZBDwdre4kOHMLjskEbO8FUhJggi9epCa67
	Vsm02YlWXXllWx7r3cokwizdvQZPJhxesyY421AKiAbnLaLnfTT6fvQw8S/s+t3b6Vah
	ANpQ==
X-Gm-Message-State: APjAAAUgf4Uz+xXgPY0W0NMtR9SW2mjlIh5WX2wZrDD33UUa71yt6+to
	gaS6MuzR/BCe0JyrZ0L2d/ai2LUm
X-Google-Smtp-Source: APXvYqzgZ2NP5CrfSaK24BPNQ3dZRI1HgpFTiwnwLsP7njLB5JPxAtEA9NK0ZBDSAzk+6o/H6+7ttQ==
X-Received: by 2002:a63:ec4e:: with SMTP id r14mr1388664pgj.235.1575323350330; 
	Mon, 02 Dec 2019 13:49:10 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:51a5:502e:8fc:9836?
	([2601:202:4180:a5c0:51a5:502e:8fc:9836])
	by smtp.gmail.com with ESMTPSA id a2sm480114pfg.90.2019.12.02.13.49.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Dec 2019 13:49:09 -0800 (PST)
To: Tim Orling <ticotimo@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
References: <CANx9H-Am-T-LMMr+oWpR0KM70k0TYHF2v=GdqTem4Rj1ud6srA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c61b511b-c927-c794-e208-6997e3d99ace@gmail.com>
Date: Mon, 2 Dec 2019 13:49:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-Am-T-LMMr+oWpR0KM70k0TYHF2v=GdqTem4Rj1ud6srA@mail.gmail.com>
Subject: Re: ANNOUNCEMENT: meta-python2 has been created
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
X-List-Received-Date: Mon, 02 Dec 2019 21:49:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Tim,

On 12/2/19 7:56 AM, Tim Orling wrote:
> Why?
> =3D=3D=3D=3D
> With the pending EOL (end-of-life) of Python 2 in a month [1], it is ti=
me
> to move python2 recipes to a new home. For that reason, meta-python2 [2=
]
> has been created as the home for legacy python2 recipes.

Thanks for putting in the time to get this sorted out.
>
> How?
> =3D=3D=3D=3D
> It was a design goal to keep the original history of meta-python, but o=
nly
> the python2 parts. In order to accomplish this git-filter-repo was used=

> [3]. The exact steps used can be seen in a gist [4]. After that script =
was
> run, manual merging of *.inc and *.bb files was performed to make recip=
e
> maintenance with AUH (auto upgrade helper) and devtool easier. Since th=
is
> layer does not have to support two python versions, the reason for the =
*.bb
> and *.inc split has been eliminated. Commits that upgraded recipes to
> python2-incompatible versions were reverted. Changes to make the recipe=
s
> build and ptests be runnable were also made (to master branch). The sta=
ble
> branches were also kept, to make it easier to refer back to prior histo=
ry
> and allow developers to use meta-python2 only in their workflow. NOTE: =
The
> stable branches may require work to make them usable, this was outside =
the
> scope of the immediate effort.


Should we have a separate patch work for this layer?

If the normal Stable branch format is used for patches, it should be
easy to sort out so we can see how it goes and make adjustments as we go.=


The volume for stable meta-python patches tends to be low so I don't
mind sorting things out from master to zeus between the two branches.


- armin
>
> What next?
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> Python2 recipes from meta-python will be dropped via patches sent to th=
e
> mailing list. Python2 recipes from meta-oe and meta-networking, which h=
ave
> already been added to meta-python2, will be dropped via patches to the
> mailing list. Other layers are welcome to do the same.
>
> Recipe upgrades to meta-python2 will also be coming, for instance Djang=
o
> 1.11.x LTS is the last version to support Python 2, but we are not at t=
he
> latest release of that series.
>
> The original meta-python will become Python3-only and patches for pytho=
n2
> support will be nacked and redirected to meta-python2.
>
> python2 itself will likely be moved from oe-core into meta-python2
>
> [1] https://www.python.org/doc/sunset-python-2/
> [2] https://git.openembedded.org/meta-python2/
> [3] https://github.com/newren/git-filter-repo
> [4] https://gist.github.com/moto-timo/ab70ab96ddbaf5fd1226bd21dbbfec9b




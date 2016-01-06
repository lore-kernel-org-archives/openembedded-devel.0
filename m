Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0355465CBB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 20:53:07 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id z14so19177171igp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2016 12:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bfkLlODPRd63I9RuEQWdrbE38gzB4vw2mUrK5bhadEE=;
	b=t/Xaco7ALiMUSdr7JUiaqx7pv4jLFby+p/U/ESGWohTOx9UPuUgiJkslRch5OP2TdX
	wBgOmta9IAaQ9t3CObr3U61C94/ufQgCX7hYOwEfDfI5noP6is8p60dGG1qCDPCI6Gmy
	6XmVGVlOvvRA4sfvvHhKBpVAyz9E1dSRnebR+iXu+HsfcnsjbyvaiCY19W9U5RBj+0pm
	73YuF9lnb0CKo4qsBEYuP4lOPAidRLvjjJJ2Sl3HhCXksmp9gBZSJxJhUHTJG4kAFt2Q
	8m1wJ8MEvMobZVTVj/Pfe68F3HDr5A4ZjnRQVU86V0F4+5MPERo307dZD9iu6i9RDExt
	opHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bfkLlODPRd63I9RuEQWdrbE38gzB4vw2mUrK5bhadEE=;
	b=Q8iAJfksVJolqFk3o15/o4mzmPf3DzQ68Ds8VJ8RKUaD3bGwIXjJhxzoknTqjfaHnI
	B579CDXy+laPs6RKG2vS/Tp3PNDwK4ignAPfOcsQo5BVFUDE9xD6YGFBETyPugBdRYiJ
	3cpGNXLbIPaTEVY+Ed7fp4i0wGfgFDHVhtmSvRjaLRNyCPNFokg4w7Th6akK10y0T0QB
	fZV1AlpPXhKSSCCoSOlBrEIrcdyTaOhFCKjatG3piUQHJjEsSQdPYiZ1n8NpJpizaArz
	/8DgBEdRR3CFer9bE6nsB8hy2Qvj1t/ZGECxpV38KgK5OqnbbL8WqCkEOTEmycKyhoRJ
	M9VA==
X-Gm-Message-State: ALoCoQkgMs5GHiLJd1IoKa2Asx5zso2DGRUALZT1Ht52hG+DdSw2YqMtCSDe8pFClvyfIUXODIsAGhvWmSuNcPtgWh838funsqxFBfUSJssnkMtsyjhLRCw=
X-Received: by 10.50.13.100 with SMTP id g4mr10456778igc.64.1452113588320;
	Wed, 06 Jan 2016 12:53:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 6 Jan 2016 12:52:48 -0800 (PST)
In-Reply-To: <CAMKF1sqcepBb723aJ7AAW50WyCmQT29QrJdO7QjQ3C_Lo-MxMg@mail.gmail.com>
References: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
	<CAJTo0LbB02LR=6Yyy0-3=Hg1tjcdX=DmMKN2MEJqctnvi5n0Kg@mail.gmail.com>
	<A374083C-8331-42F2-A3F5-9D5EB49538F7@gmail.com>
	<2007809.DSH5DR9lFx@peggleto-mobl.ger.corp.intel.com>
	<8AE765C7-71E0-46D1-A086-A86AEEFE3F6B@gmail.com>
	<CAJTo0LazG6N2L898BLyr0jCZ-Xv5UK=GBs0DoXP+AK4_geQouQ@mail.gmail.com>
	<CAMKF1sqcepBb723aJ7AAW50WyCmQT29QrJdO7QjQ3C_Lo-MxMg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Jan 2016 20:52:48 +0000
Message-ID: <CAJTo0LY+K=TuzR1KmZQ81WZJNQBW-djLTLpuJR+tkpfLKcV8yg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFT] glibc 2.23
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
X-List-Received-Date: Wed, 06 Jan 2016 20:53:08 -0000
Content-Type: text/plain; charset=UTF-8

On 6 January 2016 at 15:40, Khem Raj <raj.khem@gmail.com> wrote:

> fsl ppc build fails are due to glibc or some other reason
>

They're entirely down the their layer (broken fetch, broken recipes).

Ross


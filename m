Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2456E98D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 21:08:13 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id vb8so4154558obc.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 13:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LpqAw6KeRY4Kob5TF70h9pWcOYOlL5W6576qDT44r+8=;
	b=F37RzibbPkftWJRAp4CVwBBi2FLO/Vfda5q8pFsJe2Y87slggrH09BI6vFsPgT3lAZ
	j7Tx+NxregUn7Vm91gTPH+Lg3i/xmSf0xDeWlqPB6ANqUADFo4yx4SB9sw7feaeWMbbO
	StkrkR2cFsKmp3RH/X8CMMu+dO7RSJK7M4RhkJ0tZRXhv6acjedaxtn3SlY5z7YA6p5K
	LDYRkuSQd3Y/ALBSr+MeeScwgzB8g8xXCImr+D6asyUbjJozWY1GKPtEx/qL3vv+i6XS
	N9sPRJwDv/UlqTpCSM+BQM5tTrLg17aoGhgqwylirnb3MbN07kEVZcy9upP4ufBny5v+
	HfHQ==
X-Gm-Message-State: ALoCoQmJetnjBgarTWKvztDPBEV5jZr1ToZBOnHUk+W/WGhPRRAcEAnGtVvKv3dSgmSGKd137hTS
X-Received: by 10.182.250.163 with SMTP id zd3mr13603153obc.20.1391116093853; 
	Thu, 30 Jan 2014 13:08:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Thu, 30 Jan 2014 13:07:53 -0800 (PST)
In-Reply-To: <EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8EF@BLRINMSMBX01.bglrodc.lntinfotech.com>
References: <1391086167-31517-1-git-send-email-chase.maupin@ti.com>
	<CAMKF1spT1epjxfM1Nyi86wFCk23BAZ26zun-Ju94JkcYiXwE7A@mail.gmail.com>
	<EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8EC@BLRINMSMBX01.bglrodc.lntinfotech.com>
	<1761269.AxNLyBI4PD@leo>
	<EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8ED@BLRINMSMBX01.bglrodc.lntinfotech.com>
	<EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8EF@BLRINMSMBX01.bglrodc.lntinfotech.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 30 Jan 2014 13:07:53 -0800
Message-ID: <CAP71WjxE3bO7f1N9hJtY0JvLnE555z+N+jZ3mrZSWB-k6xSpCw@mail.gmail.com>
To: Ridish RA <Ridish.RA@lntinfotech.com>, Koen Kooi <koen.kooi@linaro.org>, 
	Riku Voipio <riku.voipio@linaro.org>
Cc: KalyanKumar Nagabhirava <KalyanKumar.Nagabhirava@lntinfotech.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Errors when using populate_sdk - has anyone encountered this before?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2014 21:08:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

On Thu, Jan 30, 2014 at 10:52 AM, Ridish RA <Ridish.RA@lntinfotech.com> wrote:
> I think I got the root cause of the issue, meta-linaro that we have depends on openembedded-core dylan-qt5.1, but Nicolas recently updated
> openembedded-core to dora. And I think this is the root cause of the issue of the relocatable patch being not able to apply?
>
> So do we have meta-linaro layer based openembedded-core dora?
>

yes, the problem is a misalignment between oe-core and meta-linaro.
meta-linaro is using a recent qemu upstream commit, and the list of
patches from oe-core no longer works with meta-linaro qemu_git recipe.
the 2 commits in upstream qemu responsible for the misalignment are:

53db78543e473bdf7650a406767d0901c6e26480
964c6fa16f50a607f9da5068d6bf15ccc93872c0

I am cc'ing riku and koen since that needs fixing in meta-linaro
(nativesdk-qemu does not build).

for now, it's safe to follow Khem's suggestion and use the OE-core qemu.


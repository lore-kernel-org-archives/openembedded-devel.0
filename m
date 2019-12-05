Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4756D7D534
	for <Openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 12:39:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47TFdy0mNkz40;
	Thu,  5 Dec 2019 13:39:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575549558;
	bh=395ijetk43l3UQMIVY7WetvpiLRcORNUZTof5gDaYmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rp4/iTOMjb6L1E8ZKMPA/CI91hTt9DxNNPDL0X1NRICf2R2im2Tc3aTwpn4Oyqsf0
	CHhUhdDEsVDwfQmKlNmxKcPwO5U3VEDG0MzxNfDEceSmSTcsxJ4SlyKEmjVXNIbYvG
	Xo3MDoVHZ+x8WKZuu/k0WKUFkJZ2HhTSgXUW5LnAHGVvvSKiqCGd0TmVjTQGkaWPJ0
	mDJbvq2T01l5JwTpuern2n9e9H0Vv6DyoOc+5sfSQSKU/5EkoB9UCu9WAIcjDKiHZo
	tWrS0Yb7Oy0xfKikXytYFuneVQTiHApQtFuFIHS1WQ5f++/wcYRI6yX3UuGtO/PYws
	UcfVe6DTBEILjtK1Wzm0fu/UpTQ1NckrUQNjarZJbyN+TP0N66ee0mlP8obzYcrw/U
	KK+EKCleZ7IqEk/8K5OZh27zKUUK5vJEXlrFjkfeBvvTfIF9q0jwDpQNK/7zgYCOhU
	swqOlDPv23bXY7izvCyasfmxC2iCt1TQ3DgtzRVhs+reZk7WDmPE04zEXZUoz/Sjkg
	iNlbPt+EP66VV3ez6ESJjn6868MYpd4QpJ3YZEGUmUol127kD6vBrC8MZqcVhr0/hl
	Abfly24SsAoGa78tXRvv2QHXdXllrz0xfHv5NIVVBrmHE+4AHSwFBQcbF3FeKggA+j
	Ab/OheWoh0f1HhofDOJNYoHs=
Date: Thu, 5 Dec 2019 14:39:15 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Tim Orling <ticotimo@gmail.com>
Message-ID: <20191205123915.GA3151@localhost>
References: <CANx9H-CNHDMVz4pNz=T1FpmsQ3hDcF=_nWM_a2PhM+KD3JWAPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-CNHDMVz4pNz=T1FpmsQ3hDcF=_nWM_a2PhM+KD3JWAPw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Re: [thud, warrior, zeus][meta-python] Conundrum: python-pycrypto and python-pycryptodome
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
X-List-Received-Date: Thu, 05 Dec 2019 12:39:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Dec 04, 2019 at 09:00:20PM -0800, Tim Orling wrote:
> python-pycrypto [1] is rather old and un-maintained [2].
> python-pycryptodome [3] is more modern and is basically a drop in
> replacement. However, the two cannot be installed at the same time.
> Instead, one would install python-pycryptodomex which does not conflict
> with the paths of python-pycrypto [4].
> 
> In an effort to enable packagegroup-meta-python [5] and meta-python-image
> [6], one runs into the existing python-pycrypto and python-pycryptodome
> recipes attempting to install the same files to the same locations (no
> surprise, they are providing the same libraries).
> 
> For the stable branches, should we rename python-pycryptodome to
> python-cryptodomex and PROVIDES python-pycryptodome?
>...

The minimal change for stable branches would be to add RCONFLICTS
on python{,3}-pycryptodome to python{,3}-pycrypto.

In a stable branch changing what users get installed is not really
worth it for a tiny bit of improved testing coverage.

Based on what you wrote, for master the best solution will likely 
include removing python{,3}-pycrypto.

cu
Adrian


Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.241.1595006704374858327
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 10:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=uWLnhq12;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=5hv6=a4=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B7dKm0hbpz1n;
	Fri, 17 Jul 2020 19:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1595006700;
	bh=g8eTnFdo4tpA5g/i6FlReEI5ZPLSbz9gTCtBOTXlh2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWLnhq120T0I87K4hs4jQ2J43rIsY/B7QTLJtQqH+ep1sIPFJjlc3JQWpiXPwbKER
	 2cWC0gxEwDqZGJLqDD8D4C+iZ1+cjJMr1PESGCJ1r3jjHPKteBPGh08nLlzMa3Nu1F
	 FfScuYXAlRXJ2v7kgbcdjMtjChTPl7MPZVMCbR5t1Nf1EtMXkaYxnXH59N3hLNR5X8
	 5vB7J1a4kI0wwkqwk9jU3oyJ5xjEyDj24nNcf2B7PfRk4SoVF1e7ZypMFE+KmfEuQ2
	 gT3a8/t4szbc+ux7QbyK+JXCReauv2Jn6MZXpjixLCCNak2S3AZl6kIwQu70iMVP+H
	 j1ijPmhQNaUDiVOM4l2wjuqXZhVRlXWFu3Y32hqRE1fYVNK/FRwog87zGw/uS8ZH+k
	 h3Sxl2ogQMkngEueLn0o0B1GS5L4wau/Mtb1aqKz5L1rCGmrXUXu89wUbGH2N3rMPr
	 pC5kCNO1Kr+rDeI7SZ1G/VsOoM8pRdloGnpZnAXQka4oNtcNufe1bDLBDxzhkCWaDQ
	 1UTn3td6Ln+ld75gNc4/sGNmDWCj+AeNNyOM8h3EY8NHA5ZIcr2LfTeyQIS+yVCZAU
	 uAe9xN2/0ihxjwOrNjYDXD2dXe/E3rc7/2jNtvXjZnA0Aeg6WaD36/GhNiSwoTdinn
	 KyjfeVRd95YHWoe6fQSCkcwg=
Date: Fri, 17 Jul 2020 20:24:58 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [dunfell 1/2] Revert "jsoncpp: upgrade 1.9.2 -> 1.9.3"
Message-ID: <20200717172458.GF1229@localhost>
References: <cover.1594999160.git.akuster808@gmail.com>
 <0e0b4892f50808b87223a1e8dbcd13d4e16368cf.1594999160.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0e0b4892f50808b87223a1e8dbcd13d4e16368cf.1594999160.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jul 17, 2020 at 08:20:54AM -0700, akuster wrote:
>...
> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>...

This would make the version going backwards, please add
  PV = "1.9.3+really1.9.2"

cu
Adrian

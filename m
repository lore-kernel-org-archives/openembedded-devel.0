Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.191727.1598260443910727474
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 02:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=tOgA7b9S;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=498d700d9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598260443; x=1629796443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gy7ADl5kGzjKZlHYL1VhmWCefng/TN2BVbpuEqVrOS4=;
  b=tOgA7b9SFXajNNp/pj5amWIWd4ZFDwUhlLyVcX2W5JhJWUmahAvep1s2
   pOF1DJf60HeNWSTvYeev59MZfMPitIOB1mPjKwsxIyw2IGe4SBC5jr7fP
   C9RxsBeiNqGcPZ1ndY5KxqbQkf/oCbZapKsWIhOwGJBW3/O+qjLiUtE66
   V/BVLPp7KG5udzUr+ViDQ6Z57n8XNiPcT9pWsq2wy99pDizjQjlz6Q0JP
   sA3fazIdF04CMIx/FfxhpsAXt/VB+H7+NrZ7Tg9gGmAGWat1tvB/dGdDU
   u/EXFmtCnZWplpXyDl8DRgyduIij0vq6Dn9BNmxvcuayqW6kIa1Y/o0ek
   Q==;
IronPort-SDR: 5Yy4GTKf+lYNwz7rzhzDFSw+SpKuZX4S/ZVDvjH9sUAtJIqdUlLyCCVktxkPkdCygNtbRyfHii
 8qd6MD7VhhGGOp4occBbgR1C9Tl2NiEhUpGNN2KSYStNrqg6qvgwCm2AqsBXnepQUXbG6o47nm
 Nb4TIflRgBvROBaKtMvlgvakGNMoZdHeb9GIvrts2wuFXeDkGBHnN4EcTq9edO/TJTCebrH0ZC
 XdMmPG+r0triLTHdt9/j0KCAeL9E3R2Q0g6wiigfNH61CsS99v4L/kqeQxAozEd/l2mN9hZU11
 yVw=
X-IronPort-AV: E=Sophos;i="5.76,347,1592863200"; 
   d="scan'208";a="26331231"
Date: Mon, 24 Aug 2020 11:14:01 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Jacob Kroon <jacob.kroon@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
Message-ID: <20200824091401.GB2286@pcleri>
References: <20200824062225.GD65616@pcleri>
 <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
 <20200824083345.GG65616@pcleri>
 <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 24, 2020 at 11:07:13AM +0200, Alexander Kanavin wrote:
> This message is actually from 2017, and I would hope it does not apply to
> openjdk specifically, and the site is down only temporarily. If I remember
> right, there is commitment to OpenJDK in its various flavours for years to
> come.

Oh, really? Thanks for the info, I saw the page for the first time today
and was quite shocked ;-)
Yes, I'm aware of the commitment regarding OpenJDK.

> 
> Otherwise, here are a couple of decent options:
> https://github.com/AdoptOpenJDK/openjdk-jdk8u

AdoptOpenJDK isn't an official mirror AFAIK. Do you have other
information?

> http://deb.debian.org/debian/pool/main/o/openjdk-8/

Are you aware of "stable" orig source archives of Debian? IIRC the ones
in debian/pool/main are removed/updated when the debs are updated.

regards;rl

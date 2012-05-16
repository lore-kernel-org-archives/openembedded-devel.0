Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUio4-0005CD-Tz
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 20:18:40 +0200
Received: by eekd49 with SMTP id d49so300281eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=XWMTSvGbCAC3TNFlD9pSWK4XU7VsUraVldns7dP/gMM=;
	b=kZI+Yhb3q+F+9Zzquf8fcY7AP7nNckYo8oJYvtDhVh3NSH83WdXwawcVXus24tP+bc
	ivImZAgPu8y5vWOnxSo8PAXVZUZn5HFpWXZCqfzn16CkonFTz0+ZW7uXpd43sqWLex8r
	kfGp3B4QrtdynyzvqW7vHd2MLIx6Tm9Wag0VSRTvr7JdjQHUeYNExj4Ir2HDlG6GefNX
	t1nLPG+pB312u3EaPbF6bUQxMXAtOqugJr1CsjS1YSXcYdcXvFUdvjsVyX8Dw6AzOchL
	m4i+AlmEoZyMebWM6bZ2vbDxhfYe8IQrpkrTUANW665mtU48yydXBrCOY1KJ+VEyRIQL
	T0vQ==
Received: by 10.14.47.136 with SMTP id t8mr867307eeb.84.1337191718287; Wed, 16
	May 2012 11:08:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 16 May 2012 11:08:03 -0700 (PDT)
In-Reply-To: <CADZ6=asQ37VTM9RE5b53KYn6-dMTgnnXCbC50=c7SdKvCrziXw@mail.gmail.com>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
	<4FB388F8.2000802@mlbassoc.com>
	<CADZ6=at=H9cGJcyMvSuwVieMzV0hAPx37TbBcUwGS3yTeTKk6g@mail.gmail.com>
	<4FB391D1.10607@mlbassoc.com>
	<CADZ6=av1G6NsBOZu=sCt47OoK=OPDn2MP7gZTnfD+7NdrwzG2A@mail.gmail.com>
	<4FB3A136.8020607@mlbassoc.com>
	<CADZ6=auEEjJn38PcJTaW=-HKwBz0sPj4OouQtNfCP_rc1x0xGA@mail.gmail.com>
	<CAMKF1sp4c4bvh32evDREWKQr92A4q=xFGzBdqQn1ecZYBt1kQw@mail.gmail.com>
	<CADZ6=asQ37VTM9RE5b53KYn6-dMTgnnXCbC50=c7SdKvCrziXw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2012 11:08:03 -0700
Message-ID: <CAMKF1sqJ3Bq0g0wr0i48D85n1gGGR3dtdbMUsOKnrUAr5wMvnw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [toolchain-layer][pull-request] Remove old toolchain recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 May 2012 18:18:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 16, 2012 at 9:47 AM, Thilo Fromm <fromm@dresearch-fe.de> wrote:
>
> Actually we'd like to stay on HEAD and build our own distribution on
> top of that. Hence I'm more interested in getting ti81xx-psp-2.6.37 to
> work with gcc-4.7. I'll try Martin Jansa's hint
> (-mno-unaligned-access) next.

then use the default gcc that angstrom head is using which is 4.7 and also be
ready to experience some bugs as well yes -mno-unaligned-access is
needed for kernel
in some cases but eventually I think new kernel should be able to handle them



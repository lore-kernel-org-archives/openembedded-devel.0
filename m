Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Lhnaf-0006eR-2i
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 17:17:01 +0100
Received: by fxm11 with SMTP id 11so796111fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 09:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DguTtDy93Xj0e8VoCCX3BK66loq71Ml5evx4sIBAvzY=;
	b=DAaVZtINAwEzkF5GnR3dZu4aTLpAm3Hnpu/FbWI7feTLLcjPpXZCJHDrNBx8w0K5Kd
	ucOuR5/g6xPMgdclrtuMY3zvTv4qFgAixbKtDQeAK4h0erdpT/usP8XqdCDSi3drEiJh
	s6UkQiIhAnLukMGhOJVG7CsebcQFoNA6iC9IM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=q+CKrwF3hbfMRzcc3T7cPhWqhHwXv9KhGU1JpPxu2CF4AOwiXjLOQdX4m8UOB+Nc/b
	8/wEysfNHUE+MwB16PTNomG17dRo55wGGOCUE+tUln9OZY4q/naIhBx7Bk7kSzY6Wu0J
	P3OmcikNKV/qcrZwLGPSH1w5syrmjBZvesVbQ=
MIME-Version: 1.0
Received: by 10.223.107.68 with SMTP id a4mr88814fap.104.1236874605378; Thu, 
	12 Mar 2009 09:16:45 -0700 (PDT)
In-Reply-To: <200903121633.44051.marcin@juszkiewicz.com.pl>
References: <200903121633.44051.marcin@juszkiewicz.com.pl>
Date: Thu, 12 Mar 2009 17:16:45 +0100
Message-ID: <ac9c93b10903120916v41c5b513w3cad028e081aeeb3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Benchmarks on our devices
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
X-List-Received-Date: Thu, 12 Mar 2009 16:17:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

interesting other devices:
- nslu2
- beagle board

problem with storage speeds is that it to a great extend depends on
the storage medium itself.

Frans

2009/3/12 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
>
> Hi
>
> Some time ago I wrote post about Vortex86sx device [1] and its speed. In
> it I compared results of 'hdparm -T /dev/sda' on misc devices. But many
> people thought that it touches storage controller (which it does not in
> this test) I decided to run better set of benchmarks on embedded
> devices.
>
> The question which I want to ask is: Which benchmark tools would people
> like to see in such comparison? And which devices to compare?
>
> I can do tests on:
>
> - AT91SAM9263-EK devboard (at91sam9263 180MHz)
> - BUG (i.mx31/533Mhz)
> - Openmoko Neo1973 (s3c2410/200MHz and /266MHz)
> - Nokia N810 (omap2420/400MHz)
> - Nokia 770 (omap1510)
> - Zaurus c760 (pxa255/400MHz)
> - Linksys WRT54GS (mipsel/216MHz)
>
> I want tests to cover speed of CPU, FPU, memory, SD/CF/ATA/USB storage
> (if available) - maybe also Ethernet speed.
>
> 1. http://marcin.juszkiewicz.com.pl/2009/02/20/does-vortex86sx-based-
> devices-are-worth-something/
>
> Regards,
> --
> JID: =A0 =A0 =A0hrw@jabber.org
> Website: =A0http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



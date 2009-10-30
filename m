Received: from [209.85.217.220] (helo=mail-gx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N3tZI-0006yr-Ky
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 16:39:17 +0100
Received: by gxk20 with SMTP id 20so4227494gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2009 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=UMzgAv6L4VH26jKw0/Yl+Yxl1FyIWIPjol/FYMHqmG8=;
	b=MZvvwLv9bxVpWCd/4wvD/dbzb4DNoBUasvCQ29+sgw75pYvALBCGwi1rOTHC6tnrbE
	XwawnYL1f1P66K7nrS54QIHOC3ZBryMyOEDL+kMAT9rTm9fhpvsCOTDB0wtUS/gW2+eD
	M+uKmkhBBFYDrZnTVOu4RgzMm3I557BV+9Mso=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=FW/cq0BJgt5mno998/aXRBQyX2tieNSiGYAiKzQoGW0/15DoAC4gUYv5sGIYoNSz8I
	LkGO6z1A4GC3qHjTLZ8hbncuO5p1yuevz2GpAOp+Kfg2eIzrrkfnqCM3927tY2iJbhqh
	stiO5FOUnoIjFHypZpnMiqb/F5IwUN21hB0Cs=
MIME-Version: 1.0
Received: by 10.101.54.13 with SMTP id g13mr1659489ank.158.1256917079146; Fri, 
	30 Oct 2009 08:37:59 -0700 (PDT)
Date: Fri, 30 Oct 2009 16:37:58 +0100
Message-ID: <ac9c93b10910300837j764eea76l7f9412be1d2bfeca@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.220
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: sheevaplug u-boot
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
X-List-Received-Date: Fri, 30 Oct 2009 15:39:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just noticed this commit:

commit 04bf7d5d151173ac058f4aff2e4be3ae0f98216e
Author: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Date:   Fri Oct 30 11:38:49 2009 +0100

    u-boot: added Sheevaplug support

    Marvell devices needs u-boot.kwb instead of u-boot.bin due to header for
    first stage bootloader. UBOOT_BINARY variable was introduced due of
    that.


Any particular reason not to call it u-boot.bin? I know the first
stage bootloader needs to be prefixed but as this is device specific
and ends up in the sheeva dirs only, I see no need for  a name change
(but feel free to enlighten me).

BTW: is there already also work being done for openrd u-boot?

Frans



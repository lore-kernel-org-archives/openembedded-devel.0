Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PASuO-0007nx-V4
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 21:40:41 +0200
Received: by iwn41 with SMTP id 41so1172917iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 12:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=4QF2hv6SnuaiePeJevrPebAdlCrbc87p6758iYA4AUs=;
	b=qoTujjulN4NcCuIc6FcSNx+kQkKCdi6O6QofqxWu6QAq+lEgGqufBBfrDLaumy82mM
	vwDSSL+PnbyAClqGzM71sjXl9wfl3rrAScSsYSr0PWSdlnHIV1R6ZVUy2oF/CpoQUDrm
	eYNRwl7H5CRATV1iHcnLbUKJQzTAujRI2g93M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Yl69lkWX4ipRwNb7DFVtFj/b5jaqZZi4UR4ZA6AumifUnSKIGReyJUkXkDCBeCz+hD
	fI+EUELGxoLvUHuEUj50oCM9iPAaPcEJ34wBEb5IX4r09Ak5oXWGz44SVsQMDwF1qrFZ
	M+RIuOKGamKwYk4T6dHD2mhNLQaQlAqBg9VXI=
MIME-Version: 1.0
Received: by 10.231.35.11 with SMTP id n11mr6267631ibd.168.1288035598949; Mon,
	25 Oct 2010 12:39:58 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 25 Oct 2010 12:39:58 -0700 (PDT)
In-Reply-To: <4CC5DB5F.6060002@atmel.com>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<201010181520.30454.marcin@juszkiewicz.com.pl>
	<4CBC4DD4.3010908@atmel.com> <i9hpii$gf2$1@dough.gmane.org>
	<4CBC7F6A.9040000@atmel.com>
	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>
	<4CBCD3FC.5090305@atmel.com>
	<AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>
	<4CBF81FC.3040803@atmel.com>
	<AANLkTim3ucg9ue8OoLDvZP=J-jdt2Dd1g_+Wnf_CZ6jO@mail.gmail.com>
	<4CC5A48B.40404@atmel.com>
	<AANLkTi=WLnbdQiOC4B_v5hk+ehR_hUE8hgiGoCgDkEAx@mail.gmail.com>
	<4CC5DB5F.6060002@atmel.com>
Date: Mon, 25 Oct 2010 21:39:58 +0200
Message-ID: <AANLkTikWWtc3p_OAF3n0CT=p4Nebna6H4iw759GnX04=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] Use common files for AT91SAM9 configuration
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
X-List-Received-Date: Mon, 25 Oct 2010 19:40:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/25 Ulf Samuelsson <ulf.samuelsson@atmel.com>:

>
> Except it is not obvious.
> How does anyone know which kernel version is the stable
> and which is the experimental.
> Indeed, how does anyone know that there is an experimental kernel version at
> all.
>
Make two recipes (e.g. in an overlay)
linux-stable and linux-experimental
they can have their own defconfigs etc
and you can just include the base bb file.
if you want to you can even get both kernels in a single rfs so you
can boot from either.

Have fun! Frans



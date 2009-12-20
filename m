Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NMPzW-0000GF-EZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 18:54:53 +0100
Received: by iwn32 with SMTP id 32so2762494iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2009 09:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=uXFtEPGETVYO1fOsVQZ3JfegaUFCDNNDEli7FHad1Fg=;
	b=bGPUhqlybj29y5+sOkPRLhK25+lyg/mCU940+kdtUy9z9LJDiZl5Jfk9P2AfOxXMun
	ZFKngH/tFftj8waG4f3tcIsA5IwnbiGHQp9W+YSqj1hHWhkJaNDhbeacflqCQcar5mr5
	tEBvxEtHDQ5xb/CGVY5g5GP3/xKYp83cvoOAA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pPknTKthcKXitCmkWbwmYc2d35HvjMyWHv+f2yp7GYnFj4vpXJIvQ1F2SSaviWudt9
	UvwGZjUNXiGECpUUQLfCilFJ9d9YKkb3My2fb0WsVHWX5PU/UvasvGsJB870LdtWti7t
	92fqO9g/oDSsPrToXdUNRp6iMQt91VGLDLrBA=
MIME-Version: 1.0
Received: by 10.231.159.198 with SMTP id k6mr2555339ibx.54.1261331579489; Sun, 
	20 Dec 2009 09:52:59 -0800 (PST)
In-Reply-To: <200912201021.14646.holger+oe@freyther.de>
References: <1261261596-19241-1-git-send-email-raj.khem@gmail.com>
	<200912200422.50437.holger+oe@freyther.de>
	<19c1b8a90912200101i4fa53a20q5f8f75c5e809827c@mail.gmail.com>
	<200912201021.14646.holger+oe@freyther.de>
Date: Sun, 20 Dec 2009 09:52:59 -0800
Message-ID: <19c1b8a90912200952x2e1983c7x30937d93ebb9f15d@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 3/3] minimal: Add 'mplt' to DISTRO_FEATURES.
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
X-List-Received-Date: Sun, 20 Dec 2009 17:54:53 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 20, 2009 at 1:21 AM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Sunday 20 December 2009 10:01:40 Khem Raj wrote:
>
>> I tried to use oe_filter_out but I did not succeed, I guess distro
>> conf files are too early for in place evaluation
>> and if I had to do lazy evaluation then it has to be done somewhere
>> later which I did not know what it could be
>
> did you try with := ?

 DISTRO_FEATURES := "${@oe_filter_out('mplt',
bb.data.getVar('DISTRO_FEATURES', d, 1), d))}"

If I use := I get this

NameError: name 'oe_filter_out' is not defined

and if I use something like this
DISTRO_FEATURES = "${@bb.data.setVar('DISTRO_FEATURES',
oe_filter_out('mplt', bb.data.getVar('DISTRO_FEATURES', d, 1), d))}"
that ends up in same error too

-Khem


>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



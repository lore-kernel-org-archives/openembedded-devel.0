Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1MyRnN-000549-Vf
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Oct 2009 16:59:17 +0200
Received: by fxm3 with SMTP id 3so1242485fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2009 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=SexJI9jkbj4YAQolPb8BH+ji6IqOSYVK5RbgIYPbICE=;
	b=cZmQlNZC81QY21tgLyjjZc5adZv4V7oNVxRie0bjujlt8ylNrEScZ5qhSGTfRakRf1
	hRH4fzyCbKQI0MeVik4IML7hS9y9PgFFNU7TTTz6+2ya77PsTfvr2ZPiBIF9YHdeNMxt
	akeVhcr1pymKmmf3Uoq9byFJ6lVCWZXoaIkVI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=X7t8j+CHH2qMK2Tim7g5II/XVtLKTr31FCYhTZJufV00Zbn/Mv/9NTdkpkMKTphOv/
	xk5J/VGsIuiXi+AT1jC+pZxF7z5nh7n2m8cRkuM2nMbK44u5+qrHKaCBUpXeQVR1VIg4
	ogBxwZNxATsNi0KvaeC5URcy5TWb/WDNvTidw=
MIME-Version: 1.0
Received: by 10.223.2.205 with SMTP id 13mr23304fak.83.1255618697907; Thu, 15 
	Oct 2009 07:58:17 -0700 (PDT)
In-Reply-To: <c384c5ea0910150735g8a41d59p4c40f6109a22cb47@mail.gmail.com>
References: <ac9c93b10910020010s10fc04fdy6da8c2696d412844@mail.gmail.com>
	<ha4c1o$s05$1@ger.gmane.org>
	<ac9c93b10910020328u79f48783of8f64a048484ee5a@mail.gmail.com>
	<c384c5ea0910150735g8a41d59p4c40f6109a22cb47@mail.gmail.com>
Date: Thu, 15 Oct 2009 16:58:17 +0200
Message-ID: <d1b08f940910150758k38aaee7ejab7361acb8581d92@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build inconsistency (strip)
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
X-List-Received-Date: Thu, 15 Oct 2009 14:59:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

>Some target architecture binaries can be stripped with the host strip
>command (for example, this seems to work for x86->arm, but NOT
>x86->powerpc).

Don't rely on this: I had recently a recipe (dietlibc)  failing when
using the host strip (i686) for arm binaries.

This is failing on Gentoo but reported to work on debian/Ubuntu
(multiarch-strip).



Regards

Andrea



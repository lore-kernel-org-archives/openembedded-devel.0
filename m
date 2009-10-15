Received: from [209.85.221.180] (helo=mail-qy0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MyRy8-00076r-VF
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Oct 2009 17:10:24 +0200
Received: by qyk10 with SMTP id 10so662649qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2009 08:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DbtMZWkXLAloe/+muf4UYlWPrXfgaXuw9sUHA1W7uWY=;
	b=kNNJvf8InTHCtrWb6aJ2QDyY7k5vrkAjexbI64EE7p5tmOAIsLDes+pvjB2nB7YGJ8
	PjsSdmxILH703ALYHjcqy3KA5Zbhl8u3fRyfamHLBIFaRJ4h+3EqM6LuolL37WB69/aU
	9YYWhuET3IClfUu8LP8u9Rs1gmxhcjXw7DYoE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=v8faDz/dMNm3Si8yMzb1ZbZw/E9n05Pcn1QR1qh6741mDsjVL7GTocwlq+sq4lAOnA
	PQ8R+MyCWM/dY5hE97K2xDRntUDPa4zdtikGDQGG+cZiPd8kr3P8hCmIMEXpmifHBP7G
	8Y4e0CvHjfXLJZSbaZC4ehp9BP2zbp/3HP11o=
MIME-Version: 1.0
Received: by 10.239.183.32 with SMTP id s32mr15430hbg.170.1255619363756; Thu, 
	15 Oct 2009 08:09:23 -0700 (PDT)
In-Reply-To: <d1b08f940910150758k38aaee7ejab7361acb8581d92@mail.gmail.com>
References: <ac9c93b10910020010s10fc04fdy6da8c2696d412844@mail.gmail.com>
	<ha4c1o$s05$1@ger.gmane.org>
	<ac9c93b10910020328u79f48783of8f64a048484ee5a@mail.gmail.com>
	<c384c5ea0910150735g8a41d59p4c40f6109a22cb47@mail.gmail.com>
	<d1b08f940910150758k38aaee7ejab7361acb8581d92@mail.gmail.com>
Date: Thu, 15 Oct 2009 17:09:23 +0200
Message-ID: <c384c5ea0910150809h30ab80eflc06e70e24256c401@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.180
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
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
X-List-Received-Date: Thu, 15 Oct 2009 15:10:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Oct 15, 2009 at 4:58 PM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
>>Some target architecture binaries can be stripped with the host strip
>>command (for example, this seems to work for x86->arm, but NOT
>>x86->powerpc).
>
> Don't rely on this: I had recently a recipe (dietlibc) =A0failing when
> using the host strip (i686) for arm binaries.
>
> This is failing on Gentoo but reported to work on debian/Ubuntu
> (multiarch-strip).
>
I didn't mean to say we should rely on this; I meant to say that for
some it may work, for some it may not, and thus MUST NOT BE USED.

So to summarize:

- The OpenEmbedded solution is to patch the Makefiles to remove the
"-s" flag from the install targets.
- This approach is best as the stripping is then done neatly during
packaging the debug strip-off.

Regards,
--=20
Leon



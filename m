Received: from [209.85.200.171] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LiBU3-0003tz-U8
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 18:47:48 +0100
Received: by wf-out-1314.google.com with SMTP id 28so1937600wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 10:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=snpp9uM5RuGydxp0RMOIFX6JTruE13hwmRkT8eGD+no=;
	b=cVQFZ3H5i74RUpVIDsXIt2Mk6c/YxIwnAG2c+sJ6cPSaD3NC36d3ylCdVuoFEeeqfD
	xB4vviar+9lCAhyPP5Z/Gq26YljPFcOE8EnM2H7m0Ih/KmngtHbtVvjvEWw+CZURS9Dj
	L3SDdJHzcyEElInHDMSmzkvL4rVQCtEi33PpA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qJUiYWM2JQVu2W2LOMNvOxocZDrqfCoW1K6MlaENSez1dzxbb+rVv1DzQ0lXluDMZS
	9g9wG+2+xi48U4tb3F+Zyy0Eqakk4eR4Ero+K7vvIFUQ1wRx8HTa4kfcZI2kvknRPzZF
	LdNepq9AjN/NXE5Mry7kmoXg4R3zc33onJ7r4=
MIME-Version: 1.0
Received: by 10.142.70.16 with SMTP id s16mr710956wfa.151.1236966447207; Fri, 
	13 Mar 2009 10:47:27 -0700 (PDT)
In-Reply-To: <ac9c93b10903130915m4b445d3ga007d036d9bd9888@mail.gmail.com>
References: <ac9c93b10903130915m4b445d3ga007d036d9bd9888@mail.gmail.com>
Date: Fri, 13 Mar 2009 10:47:27 -0700
Message-ID: <19c1b8a90903131047p2ef7d04if1736039a8192ad@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake warning on opensuse
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
X-List-Received-Date: Fri, 13 Mar 2009 17:47:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 13, 2009 at 9:15 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Hi,
>
> Not sure if this should go here, but if I bake a recipe on opensuse 11.1 I get:
>
> /home/frans/oe/bitbake/lib/bb/COW.py:29: DeprecationWarning: the sets
> module is deprecated
>  import types, sets
>
> Is there a fix for this (or where should I report this)?

Its because you are using python 2.6 I believe. It should be fixed in bitbake

> For now I just ignored it.

I do same for now.

>
> The same error is also reported for ubuntu 8.04.2 (under vmplayer)
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



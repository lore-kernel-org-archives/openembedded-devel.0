Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PaXR8-0001KL-G7
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 18:46:14 +0100
Received: by yxd5 with SMTP id 5so6423701yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 09:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=jKcwThd+Dh+2uOHKY8nuWQY/Cq6pej+NwBnNpXlLCbw=;
	b=u+S0RNkhZPPGdJOmAeBrE7Trs2h6msyaRpD7F5hNVusSlOb23LjKNlAid6xf+8eth+
	2ErrtibHyMA7NSu7NTR4j9a6LMUP31E11GF22bgDsWrUAzmtxvsyoXSvfA9nIm/ACf9e
	p+dEaEFEJMlPi774BwD+04TVS51QL7GBz5WAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=M3IxSsG23pZHaWefVwjR53fq898mtPQxdI05dm9Sq2Q8j0Ni6uQ4A4CsjjD1dqSTdk
	62ORSezA510UtGlRILjLWaxwYVedps9XHHsM3Lmj6p3/VAifts8XWm24JO1ugy3yEZqf
	8jEVE3DfzSWh5nvuvdfizZzKMtcsd8/pRqKSY=
Received: by 10.90.97.19 with SMTP id u19mr955743agb.166.1294249549837; Wed,
	05 Jan 2011 09:45:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 5 Jan 2011 09:45:29 -0800 (PST)
In-Reply-To: <1294240289.4307.15.camel@mill.internal.reciva.com>
References: <1294198349769396500@rkmorris.us> <ig1b7c$j8n$1@dough.gmane.org>
	<1294238916100625500@rkmorris.us>
	<1294240289.4307.15.camel@mill.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jan 2011 09:45:29 -0800
Message-ID: <AANLkTimwEsqJw1nwmqFQFF62WbLr+V4rNnn9O1D2Hx0X@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: H1940 Boot Issues -> Executable Build Problems?
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
X-List-Received-Date: Wed, 05 Jan 2011 17:46:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 5, 2011 at 7:11 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2011-01-05 at 08:48 -0600, Russell Morris wrote:
>> Just to confirm - have you run these on an armv4t target? Only asking be=
cause my build completes fine, but the executables don't seem to run on the=
 target.
>
> What exactly happens when you try to run those executables? =C2=A0Have yo=
u
> inspected them to see if they look like the right kind of thing, and/or
> compared them to working ones?
>
> p.
>
>


yes as Phil asked you should try to localize the offending code in the
faulty binary. So try to enable
kernel debugging  messages so it tells you where its faulting.
Secondly if you can take a working system
and see if the new binary faults in same way ? if not then link the
binary statically and run it again on working
system and see if it faults again. If it does then you can debug it
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



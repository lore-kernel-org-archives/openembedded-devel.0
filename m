Received: from mail-px0-f189.google.com ([209.85.216.189])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ahsan.khwaja@gmail.com>) id 1NHc7Y-0006Yo-8P
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 12:51:19 +0100
Received: by pxi27 with SMTP id 27so1810537pxi.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 03:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=9YbAX6w4O0EkczBW8C+x5BE886lml8Q4VUT0AOOt9eo=;
	b=lRmSRObcCIpbVK64y4fFtrTVsQf7v8prUaz7/ytVqXrG9MJYYgm5Gb7bn19GDBsyEz
	Iai77QSn/PQSu8//SceMxrFL5wmOCQiQRuzy7hCTVlAyKYFs9n/7dI2iGZavCVekQCyM
	o3eeJmrP8tGEHZ63mtwghrHjsSkJg+Kc9/RNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=N92ucdlJ7sSI012omH7xh79bsUDaTU3hKc4fPg28KFlxQV1gxufV5k/rvxKEjSg/Mm
	0y25j4mN1+Qdt/Jepq+nHHtUj/+yldQtDJoDZ9luFahzfl5tW+E9N8aWzp73OYRGGSVw
	KvdVGWgNw3UFZFeNLEXB8MH8+Ivwq4hF5lv/E=
MIME-Version: 1.0
Received: by 10.114.215.6 with SMTP id n6mr11458311wag.158.1260186575932; Mon, 
	07 Dec 2009 03:49:35 -0800 (PST)
In-Reply-To: <1260185987.779.70.camel@mill.internal.reciva.com>
References: <818ccfc40912070241pa211c18ibb1a556607680c6@mail.gmail.com>
	<1260185987.779.70.camel@mill.internal.reciva.com>
Date: Mon, 7 Dec 2009 16:49:35 +0500
Message-ID: <818ccfc40912070349oaee021ewc43fb1767037965c@mail.gmail.com>
From: Ahsan Khawaja <ahsan.khwaja@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.189
X-SA-Exim-Mail-From: ahsan.khwaja@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: building GCC cross compiler without building any library
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
X-List-Received-Date: Mon, 07 Dec 2009 11:51:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

sorry i missed typed it. i want to ask

Is it possible to build GCC cross compiler *without* support of any
library(eglic, glibc,uclibc and newlib) for bare metal. if yes what I have
to do in this regard.

On Mon, Dec 7, 2009 at 4:39 PM, Phil Blundell <philb@gnu.org> wrote:

> On Mon, 2009-12-07 at 15:41 +0500, Ahsan Khawaja wrote:
> > Is it possible to build GCC cross compiler with support of any library
> > (eglic, glibc,uclibc and newlib). What should I have to do in this
> regard.
>
> I'm not quite sure what you're asking.  Do you mean that you want to
> build a generic version of GCC which can then be used with any of the
> four C libraries that you mention?
>
> If so, the answer is probably "yes" so long as you restrict yourself to
> plain C only.  If you want C++ or the like, the answer is almost
> certainly no.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


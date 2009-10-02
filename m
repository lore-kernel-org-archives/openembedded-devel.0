Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1MtfNu-0007Ep-51
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 12:29:13 +0200
Received: by yxe5 with SMTP id 5so1074657yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2009 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=gSeLidjlnauC/fIWXaOdoGKEAno00rCgI52tfiye4R8=;
	b=GWj7k3xlrOuFaRZSFXaFpeTlDatNGD0cqo3QYvDPlBQme4IU2r3q8n+zQLkn0nX33Y
	F0xnbtsLeXHUQrb1XQmhoNOb8H7jd+MdLvJQ23Hw/F+P9MxTVfDboHDg+KcQRvGugPV5
	F6sHfuDAKGyGFcxvw5zdNe43TLAWlJdLRMf1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=o2I9+rpCAlt29sq+qPZkPffC6dDuL2+I9YtUJkM65r86mqQdTR6YkC4XfOoU5Jic01
	223AsEvyy6BaDnSjUnTpjG20WCAMJVY/5nmby4jazQoL5xI3jqQrvb+LBMuw0SOAK9PG
	tCEIvi2n2fKN877EDp/ErfAYybi1544dIkaMw=
MIME-Version: 1.0
Received: by 10.101.81.10 with SMTP id i10mr2536299anl.123.1254479304229; Fri, 
	02 Oct 2009 03:28:24 -0700 (PDT)
In-Reply-To: <ha4c1o$s05$1@ger.gmane.org>
References: <ac9c93b10910020010s10fc04fdy6da8c2696d412844@mail.gmail.com>
	<ha4c1o$s05$1@ger.gmane.org>
Date: Fri, 2 Oct 2009 12:28:24 +0200
Message-ID: <ac9c93b10910020328u79f48783of8f64a048484ee5a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Fri, 02 Oct 2009 10:29:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Koen, all, did some research on this.

On my system proftpd wanted to use an INSTALL macro and added the -s flag..
This macro evaluated to
/home/frans/oe/tmp_angstrom/staging/i686-linux/usr/bin/install -c
So it did strip on my system.
What I understood from Koen was that he got an error message on strip.
Either I misunderstood or there is an incompatibility here.
(and if there is an inconsistency I'd like my system to have the error
message too).

Still the following is strange to me:
I would expect
/home/frans/oe/tmp_angstrom/staging/i686-linux/usr/bin/install -s to
call the target strip (or maybe ignore the strip command).

Frans.

2009/10/2 Koen Kooi <k.kooi@student.utwente.nl>:
> On 02-10-09 09:10, Frans Meulenbroeks wrote:
>
>> At that point things became confusing. For Koen the build failed duke
>> to install wanting to strip and indeed there was something in
>> Make.Rules that eventually resulted in an install -s.
>
> To clarify: it wanted to run 'strip', not '${TARGET_PREFIX}-strip', which
> caused it to fail. Running '${TARGET_PREFIX}-strip' would have only
> inconvinienced people trying to do runtime debugging.
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



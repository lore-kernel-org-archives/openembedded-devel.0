Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OggnJ-0007ds-46
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 18:26:22 +0200
Received: by eyf5 with SMTP id 5so2098836eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 09:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=R1uWThf55iF7TbwEkOoquk5KVz98ksbbI3qLFmalbGU=;
	b=xL74GwEcSVqBWAxTBVAse2HRVWrQbpa4slhRZ1aBqPg7keKl9l10a5hnnAPrdmkocg
	Xr5pY6+/lKOAcejWB0G7V1mfkF4zhLKPpj0YIC8aDsZG2zxK7i51i46pqunySEszSge8
	1l1bTX4h6euEz4s7DzW+s4OVPZt7UzpSzuM7A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=HvgSvV1c/MiAB3qGYvS33Gr4JLPwn/9HcdH5Kg5/cz8L722dBJr9pnYWygs6s7Bakw
	YgaoT0AaPMbpMuz3y/8jmhfYkoICHkufKGBdVqFbow4xt7AcB+m3h+Pd5FpU3E02sYCQ
	Gy/J2iiyss1IOQvYNUtd1KKufTd+DTnl6ppWA=
Received: by 10.216.232.90 with SMTP id m68mr7951673weq.10.1280939172348; Wed, 
	04 Aug 2010 09:26:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.16.204 with HTTP; Wed, 4 Aug 2010 09:25:52 -0700 (PDT)
In-Reply-To: <20100804155816.GF28187@mx.loc>
References: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com> 
	<1280929918-23818-2-git-send-email-rep.dot.nop@gmail.com> 
	<201008041807.06239.khimov@altell.ru> <20100804142147.GE28187@mx.loc> 
	<AANLkTikfcpiAy2RfYEv80GYf67PbNysRw1qN3qiz0KRN@mail.gmail.com> 
	<20100804155816.GF28187@mx.loc>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 4 Aug 2010 09:25:52 -0700
X-Google-Sender-Auth: 60FU5xDsoyNmgiO3Rt62BZRzA6Y
Message-ID: <AANLkTik3K4WFiJz1oVgbGqVekeCnKTPD3Zjr4Z45DftT@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/3] perl: use only one method all_perl_packages
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
X-List-Received-Date: Wed, 04 Aug 2010 16:26:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 4, 2010 at 8:58 AM, Bernhard Reutner-Fischer <
rep.dot.nop@gmail.com> wrote:

> On Wed, Aug 04, 2010 at 07:36:01AM -0700, Chris Larson wrote:
> >On Wed, Aug 4, 2010 at 7:21 AM, Bernhard Reutner-Fischer <
> >rep.dot.nop@gmail.com> wrote:
> >
> >> On Wed, Aug 04, 2010 at 06:07:06PM +0400, Roman I Khimov wrote:
> >> >=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=
=D1=82 =D0=A1=D1=80=D0=B5=D0=B4=D0=B0 04 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=
=82=D0=B0 2010 17:51:57 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Bernhard
> >> Reutner-Fischer
> >> >=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> >> >> .. to avoid
> >> >> ERROR: Error Method already seen: all_perl_packages in'
> perl_5.8.8.bb'
> >> >> now in 'perl_5.10.1.bb'
> >> >>
> >> >> TODO: error() already prints "ERROR:" so the "Error" in above msg i=
s
> >> >> redundant
> >> >>
> >> >> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> >> >
> >> >What kind of configuration gives you such an error? Never seen that.
> >>
> >> It was applied by Chris as a5dee57033f7d9987858d2c0514f4e687ece2874
> >> >
> >> >Although the change itself looks good, I'd only probably rename
> >> >perl_helper.inc to plain perl.inc, we can merge more common things
> between
> >> >different perl versions later.
> >>
> >> fine with me, sure.
> >
> >
> >Thanks for the fix, appreciate it -- I was really surprised to see no
> >perl.inc existed yet.
>
> It would be way cool if somebody with write-access could move the
> function into some perl.inc and push that change....
> Let me know if i'm supposed to send a patch with the correct .inc name
> instead.
>
> thanks,


Done
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


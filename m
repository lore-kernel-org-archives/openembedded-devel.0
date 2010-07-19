Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OatEG-0006Cb-TW
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 18:30:10 +0200
Received: by iwn34 with SMTP id 34so4854664iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=cU4B6pGQdo5MuFiv558PZ4COJbPisDPB1WvZPHyauog=;
	b=C9iyjPOMW9oeOL+g7zqmCD8f3lEDSFsWeE8srNnQBIdNFk7BbVYOtzDfkHsIUaAtyf
	KQRmqJrHtCaxGpFLXhqMHBW21qAKSpzka4qn1MHJhfpBRl4x7NQwKDFfes5j/yd5BOkt
	jWhLBWO+7WWXhPjIYaIwEBjMLhaYLL4jFvSPo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=DD43LzfWeOJnkfbdrzFETaFszjao5xNGJBmlCyBr3nvg8UXw5b6u5IlivYRsiWlSb0
	rU+SgI5nqABTuvZqzBpWLrAqDNrORIjuVUwPpqskOlFkF/Oa49FDImFtN0giT1/0Zi0o
	p/Qn+p2/3tyT8njIUC3japZLKOvPOz2A3Vsm0=
Received: by 10.42.4.75 with SMTP id 11mr1819033icr.4.1279557001525; Mon, 19 
	Jul 2010 09:30:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.35.8 with HTTP; Mon, 19 Jul 2010 09:29:41 -0700 (PDT)
In-Reply-To: <1279549587.2345.2154.camel@mill.internal.reciva.com>
References: <1279527857-12295-1-git-send-email-raj.khem@gmail.com> 
	<1279549587.2345.2154.camel@mill.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Jul 2010 09:29:41 -0700
Message-ID: <AANLkTikuwarIRXUIOX1L2A2LBD7D-Rhglsd-Rur8QaOO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sane-toolchain.inc: THUMB_INTERWORK should not be defined for armv4 and add armv4 to ARM EABI supporting architectures.
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
X-List-Received-Date: Mon, 19 Jul 2010 16:30:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2010 at 7:26 AM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2010-07-19 at 01:24 -0700, Khem Raj wrote:
>> -THUMB_INTERWORK =3D "yes"
>> +# armv4 does not have thumb instruction set therefore no interworking i=
nstructions
>> +# so if machine is based on armv4 we dont have choice.
>> +
>> +THUMB_INTERWORK_armv4 =3D "no"
>> +THUMB_INTERWORK ?=3D "yes"
>
> I don't think this is necessary or desirable. =A0If you are building for
> v4 then the BX instructions ought to be fixed up during final link.

Yes with --fix-v4bx/--fix-v4bx-interworking its possible.


Is
> there a particular problem that you're trying to solve?
>

Not any particular case but some versions of compiler do not pass
flags to --fix-v4bx-interworking ld.

I was thinking its more apt to describe the machine with not
supporting THUMB_INTERWORK
hmmm but I now I see that we will need it for v4/EABI support. So
better fix the compiler.

> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



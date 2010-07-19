Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OazAF-00080Q-9g
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 00:50:24 +0200
Received: by iwn34 with SMTP id 34so5208635iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=/Tl9PUXzsCsHgLsgZaZt9fmBEHHA7TIbP6jQiY8OZ4g=;
	b=adBJCFSD3w1y4IaVMfzRAVJ2DXASUeXmNe9LzIIC2+IbbikgBrIiSnR1BYatvL/BaX
	PyqdFNTFnIr5LRoR4xxMPMqlQXoAJascTblKWFdq6UeQU9JM/3lGbNbcs2zFwAXreRQk
	9qPPymcju49dIW7+fNrH2K/qcP00L3U3bimnk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=fybosi8/vpRQoV/fG4AGjX3NA/Lhn00QqrjkAGP4EqJ3uTHd04iwfLI+Pk/dbOdt9j
	ydOlhx4PMMeIpIbb111nSkgdIDgC+d/Ls62WcdcvWJyC3kQIIlqVQVVrhn/+jO8oBMCT
	gfBITzSTvoQ7mWBRYUGoYLbJy8+b3b608dZJo=
Received: by 10.231.161.16 with SMTP id p16mr5959683ibx.61.1279579815133; Mon, 
	19 Jul 2010 15:50:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.35.8 with HTTP; Mon, 19 Jul 2010 15:49:55 -0700 (PDT)
In-Reply-To: <1279570852.21888.123.camel@lenovo.internal.reciva.com>
References: <1279527857-12295-1-git-send-email-raj.khem@gmail.com> 
	<1279570852.21888.123.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Jul 2010 15:49:55 -0700
Message-ID: <AANLkTikpOHsMXiR-HLJCKr7yWSsc9wRpee9Vg1WvtDQn@mail.gmail.com>
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
X-List-Received-Date: Mon, 19 Jul 2010 22:50:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2010 at 1:20 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2010-07-19 at 01:24 -0700, Khem Raj wrote:
>> =A0 =A0 =A0 import bb
>> =A0 =A0 =A0 arm_eabi_supporting_arches =3D "armv6 armv6-novfp \
>> - =A0 =A0 armv5te iwmmxt armv7a armv7 armv5teb armv4t"
>> + =A0 =A0 armv5te iwmmxt armv7a armv7 armv5teb armv4t armv4"
>> =A0 =A0 =A0 ppc_spe_supporting_arches =3D "ppce500v2 ppce500"
>
> I guess it would make more sense to enumerate here the ARM arches which
> don't support eabi. =A0All future ones will, presumably, so it's only
> ARMv3 and older which don't. =A0That way we won't have to keep adjusting
> this list for every new architecture variant that someone thinks up.
>

and I think the oldest arm architecture we support is armv4 which means we =
may
not need this check at all anymore.


> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PE2Ee-0002rV-SA
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 17:00:21 +0100
Received: by gxk26 with SMTP id 26so1581612gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=fFX/kBKn/pC3aLEQGlxFvszbfaUVTncrDqjcDZEcgo0=;
	b=bBEQtcjbnM2MROKVR3ZIah+g6pUvCwCqFVUvQ/3QemaPlY73qRIWdGHIGRLTV+ucO0
	i8MuyqsELVeIiND0uMjKe2BjcmCn3CmDOhlbFLh2c7dcdfbvdTkIjowtotxAVRdqLnyZ
	xA7qBJnDwhCp++XGYFcT8DQTErnS+53khMWlI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XRvWllmidVfyIe16ZINR6dT27XrPSn43eiLJwZ8sS6ilwGGYaGLZ2RWtBY7Sodui4z
	ChvmrjBn0OD1C8ZSg7rsG/tYrfhB/+nRq6NXTNEzlFbDLnyQmmejcMxdUQIEiuhX4n78
	HtODbvMadtsUmijI63bZvXQpGm1NnUkh61Z9M=
Received: by 10.91.44.12 with SMTP id w12mr1391427agj.64.1288886367420; Thu,
	04 Nov 2010 08:59:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 4 Nov 2010 08:59:07 -0700 (PDT)
In-Reply-To: <AANLkTin2tSJxYOwwkS4QSR=RH8VEfBp68VeHrE-GiBsO@mail.gmail.com>
References: <1288824035-27654-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=OOneV24BDurQ+ECpQJ+-U4AH=MpFZ-YM0jOJq@mail.gmail.com>
	<20101104001342.GG3440@jama>
	<AANLkTim6PdzTRY-9zANa5t90dcYaSTrCudCKYNWsUV--@mail.gmail.com>
	<AANLkTinPkXnf0iSakku7hkMHge_NqXPW_7WS1DHsqjHu@mail.gmail.com>
	<AANLkTin2tSJxYOwwkS4QSR=RH8VEfBp68VeHrE-GiBsO@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Nov 2010 08:59:07 -0700
Message-ID: <AANLkTikWb39zWvmK=4LT4W4_okpKPwVhk+rLJ6ogRC-H@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] metadata_scm.bbclass: get the metadata revision for current HEAD
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
X-List-Received-Date: Thu, 04 Nov 2010 16:00:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 4, 2010 at 7:07 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Nov 3, 2010 at 11:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> >> bitbake@jama ~/oe $ git show-ref HEAD
>> >> b3246d96069fd11caee42ec6ebcbf6dca2d62449 refs/remotes/origin/HEAD
>> >
>> >
>> > No, this is broken. =C2=A0It shouldn't be determining the METADATA_REV=
ISION
>> from
>> > a ref you don't even have checked out. =C2=A0Right now it's pulling th=
e HEAD
>> ref
>> > from upstream, it should be pulling the local HEAD ref. =C2=A0So NACK =
on this
>> > patch, the metadata revision code needs to be fixed to either not use
>> > show-ref or pass the necessary args to not operate based on a HEAD of =
a
>> > remote.
>>
>> whats wrong with this patch. or what is it that we need additionally.
>
>
> The issue is, show-ref shows all refs which match the supplied search
> string. =C2=A0show-ref HEAD will show all the HEAD refs, both local and t=
he ones
> in all your remotes, which isn't what we want for METADATA_REVISION. =C2=
=A0I'm
> testing a patch which changes it to use rev-parse to get the commit hash =
for
> HEAD rather than show-ref.

FWIW you could also use git show-ref --head <branch>

Thanks for catching this, by the way, I don't
> want to sound unappreciative, its just that this patch is more of a
> workaround, rather than a fix for the root problem. :)
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtbIa-0001Nz-ID
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 09:11:57 +0200
Received: by iwn2 with SMTP id 2so841144iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 00:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cVUhNHeEwUiN9g3rJAxZuzMXq7mRGk9zryeFnoD811M=;
	b=EULSoPPTj9TTBohnJZ34MqQOLhlYyRMGF6mZklj77mHE/JRfD0siIkdfxX5orDCQkp
	j2/2TdfaaDVk2HDWtOZKBkULoDNGac6dr+nqDeF6jrmJdUCKNHVtmcmz2vHwOeHqYyNv
	Gk+3pVTQW0yBewRMbQh4tkSWTLGO0oOjCUJto=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wBnScVXpsgV4iBYQoUU1OGY2CAcWkP5o0ERjqGhAtiTWa/kT68NOLeDuqCrWBbqP5Y
	qL5BnC7FpVX+YdgvQpzpMBq7xawmTnosl8eb5B87Twb+ayimncBpVxQ2SYzqYUNExmYb
	8N//mU3VZo9ATWJ1/iOVgoama8P1b/6ZwCVKY=
MIME-Version: 1.0
Received: by 10.231.13.140 with SMTP id c12mr497324iba.25.1284016275686; Thu,
	09 Sep 2010 00:11:15 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Thu, 9 Sep 2010 00:11:15 -0700 (PDT)
In-Reply-To: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Thu, 9 Sep 2010 09:11:15 +0200
Message-ID: <AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Thu, 09 Sep 2010 07:11:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/2 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> see http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-Septembe=
r/023680.html
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0classes/base.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 299e875..2c9ad89 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -337,7 +337,7 @@ python () {
> =A0 =A0 =A0 =A0 =A0 =A0 this_machine =3D bb.data.getVar('MACHINE', d, 1)
> =A0 =A0 =A0 =A0 =A0 =A0 if this_machine and not re.match(need_machine, th=
is_machine):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this_soc_family =3D bb.data.getVar('SOC_F=
AMILY', d, 1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if this_soc_family and not re.match(need=
_machine, this_soc_family):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (this_soc_family and not re.match(nee=
d_machine, this_soc_family)) or not this_soc_family:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 raise bb.parse.SkipPackage("incom=
patible with machine %s" % this_machine)
>
> =A0 =A0 =A0 =A0 need_target =3D bb.data.getVar('COMPATIBLE_TARGET_SYS', d=
, 1)
> --
> 1.6.4.2
>

Bump.

This is out for a week now without any feedback, although the patch is
quite trivial.

Actually I am quite disappointed by the developers who created and
pushed the SOC_FAMILY patch.
They were very eager to push this change in a day, without waiting for
the discussion on it to conclude, but they seem to be not-so-willing
to review a fix for a problem they caused (let alone resolve the
problem). What is even somewhat irritating is that one of the people
involved is often in the front seat when it comes to criticizing
others if they make a mistake.

Frans.



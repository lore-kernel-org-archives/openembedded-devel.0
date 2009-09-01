Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Mic95-0004r5-R0
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Sep 2009 00:48:18 +0200
Received: by bwz6 with SMTP id 6so335319bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2009 15:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=qNCHzTrugVVOp4C46L1qwZCyd97zG+X8tIvSmrIKack=;
	b=dvm2os+X3/Kex0GGBcPipQ3tgPZwUoS27qRejoSSSFCR/Ax3ImsEaBZmnO2sx4x2l4
	iGjIkN4nZJZdcdcVkPSprJ2NEqKdedrAUZ95hy7OjR6XQ4fWtOiEn5Of3IqEBIAsCWcM
	Si2kqGs7RqWRFXuV90ZMDr4bMHUkOobZQfo1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=vFFthGfY8uETQ9Pd0wdZGLRa952fJIIIdoMmbot0vBML4X9cE8QuTC5Q+FyyvRwp/T
	CGHiaJC7AnjftkzAkE4zVDcMmdzTnZq5eWc/gV0artuAnzP0bhlF5QNtt16K+FDi+WAG
	W5gWDpnnVALSpWstHN4kn5z7COpaQkHS2Whgw=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.170.24 with SMTP id q24mr615161hbe.2.1251844169942; Tue, 
	01 Sep 2009 15:29:29 -0700 (PDT)
In-Reply-To: <b6ebd0a50909010924u4f9a1ee5jebfae98afb2462e6@mail.gmail.com>
References: <b6ebd0a50908261905r7d839647k6fc53460301efca0@mail.gmail.com>
	<be7a9f3d0909010638h75451d65la4a599a1583c3208@mail.gmail.com>
	<b6ebd0a50909010924u4f9a1ee5jebfae98afb2462e6@mail.gmail.com>
Date: Tue, 1 Sep 2009 19:29:29 -0300
X-Google-Sender-Auth: b9a3d6277e8e9c30
Message-ID: <be7a9f3d0909011529g61920aav8c9308207ae51d3e@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: srctree & gitver
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
X-List-Received-Date: Tue, 01 Sep 2009 22:48:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

In bitbake.conf

@@ -532,6 +534,7 @@ UPDATECOMMAND_svn =3D "/usr/bin/env svn update ${SVNCOO=
PTS}"
 SRCDATE =3D "${DATE}"
 SRCREV =3D "1"
 AUTOREV =3D "${@bb.fetch.get_srcrev(d)}"
+AUTOPV =3D "${@bb.fetch.describe_revision(d)}"

 SRC_URI =3D "file://${FILE}"

On Tue, Sep 1, 2009 at 1:24 PM, Chris Larson<clarson@kergoth.com> wrote:
> Seems interesting, but how are you making use of it? =A0It wouldn't be
> particularly useful for recipes that have to fetch, since you can't
> change PV before and after fetch without things exploding.
>
> On Tue, Sep 1, 2009 at 6:38 AM, Otavio Salvador<otavio@ossystems.com.br> =
wrote:
>> Hello Chris,
>>
>> On Wed, Aug 26, 2009 at 11:05 PM, Chris Larson<clarson@kergoth.com> wrot=
e:
>> [...]
>>> gitver facilitates extraction of version information from git. =A0By
>>> default, it runs 'git describe' to get the version. =A0If that fails, i=
t
>>> will set the version to 0.0-<sha1 hash>. =A0This version is stored in
>>> the ${GITVER} variable, and can be used in the recipe's PV variable.
>>> When using this, it will automatically detect changes to .git/HEAD
>>> (i.e. commit your local changes, check out a different branch, ..) and
>>> invalidate the bitbake cache, pick up the new PV, and know that it
>>> needs to re-run the build steps.
>> [...]
>>
>> In the line of your gitver class we've been using a bitbake change for
>> it already for some time.
>>
>> What we did is to add a AUTOPV (as we have AUTOREV) to bitbake and use i=
t in OE.
>>
>> I'm attaching the diff for it here.
>>
>> --
>> Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems
>> E-mail: otavio@ossystems.com.br =A0http://www.ossystems.com.br
>> Mobile: +55 53 9981-7854 =A0 =A0 =A0 =A0 http://projetos.ossystems.com.b=
r
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>
>
>
> --
> Chris Larson
> clarson at kergoth dot com
> clarson at mvista dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Software Engineer
> MontaVista Software, Inc.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br



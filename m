Received: from mail-bw0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PTms5-0001ip-DJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 03:50:09 +0100
Received: by bwz12 with SMTP id 12so1695474bwz.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 18:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=HCb4sQhEAHaWa0AqFWvjg6A4YTrFcbXOL/IFwGWq5cw=;
	b=VPLpdJ6utBFw7e49MCMd1Hn4kpRxHqUOu4NeimOLub4fA0qwwYMylYBsDUYHTgO9Zo
	AKjpsFuNFwgunTjORSo6EYTu52z9PiJovVAqiw0DNSiSuKr8GyMOxZmq8kJEQIDCP3gj
	n9AGrZT3SfbwjsMzY9UnidKYHqLFf6zGwo5zU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=hPTVqClf9r/XeBwqrdZzW1S79biuCivONwtf3m3BkzjCp7QkCZ3C/Y5Ljm2mDVF2CF
	R/Wrs2CO/ia2oAAbOnQ9GsGF7fujMqXHUkVpyaQaVJa3kbKWq3srfPb0Wtespim6lhug
	wATiZSLkYoGpZdRCACw/oHIzwlH/7jkHBGUUg=
MIME-Version: 1.0
Received: by 10.204.122.65 with SMTP id k1mr476367bkr.80.1292583642061; Fri,
	17 Dec 2010 03:00:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.71.8 with HTTP; Fri, 17 Dec 2010 03:00:41 -0800 (PST)
In-Reply-To: <20101216215228.GB19482@jama>
References: <1292510112-32629-1-git-send-email-otavio@ossystems.com.br>
	<1292515657-15330-1-git-send-email-otavio@ossystems.com.br>
	<20101216215228.GB19482@jama>
Date: Fri, 17 Dec 2010 09:00:41 -0200
X-Google-Sender-Auth: TyJWLPfLlg-n4kOaYlIPJ2c3B8U
Message-ID: <AANLkTi=F=kgEos0ZZb+7zefOq1G2fn5w+Wf8HqafFYsh@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] classes/gitpkgv.bbclass: add GITPKGVTAG that uses 'git describe'
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
X-List-Received-Date: Sat, 18 Dec 2010 02:50:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2010 at 19:52, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Dec 16, 2010 at 02:07:37PM -0200, Otavio Salvador wrote:
>> Using ${GITPKGVTAG} allows for automatic versioning based on the
>> repository tags. For those that doesn't want to use it, ${GITPKGV} is
>> still available.
>
> Thanks for merging it to one bbclass. IMHO looks much better now.
> Consider providing examples and warning as suggested bellow.

You're welcome. Thanks for keep commenting on it and helping with good advi=
ces.

...
> # PV =3D "1.0+gitr${SRCPV}" =A0 =A0 =A0# expands to something like 1.0+gi=
tr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
> # PKGV =3D "1.0+gitr${GITPKGV}" =A0# expands also to something like 1.0+g=
itr31337+4c1c21d7dbbf93b0df336994524313dfe0d4963b

added.

...
> As we were discussing with otavio on #oe, I think there should be
> warning, that GITPKGVTAG is really sortable only if the upstream repo
> keeps consistent AND sortable tag names.
>
> For example tags in OE repo will fail, because only tested_2010-* tags
> are sortable but this sequence:
>
> tested_2010-11-04
> release-2010.12-branchpoint
> tested_2010-11-12
>
> is not. And only way to fix it when it's shiped with non-standard tag to
> targets is to bump PE :/.

Yes. I fully agree that it is something the user of the class need to
be aware of.

> Even better solution would be to set something like GITTAGFORMAT in
> recipe, to expected consistent tag scheme and if returned git describe
> prefix is different then warn builder about it or even fail or ignore
> that tag.

I like the idea but I prefer to have this merged soon so I can started
using it (for example in freerdp package) and at company.

> Proposed "warning":
>
> # or if upstream repository is always using consistent and sortable tag
> # name scheme you can get sortable version including tag name with
> # GITPKGVTAG, but be aware that ie tag sequence "v1.0, v1.2, xtest, v2.0"
> # will force you to increment PE to get upgradeable path to v2.0 revision=
s

I added it as a warning on the comment.

The final header is:

# gitpkgv.bbclass provides a GITPKGV and GITPKGVTAG variables to be
# used in PKGV, as described bellow:
#
# - GITPKGV which is a sortable version with the format NN+GITHASH, to
#   be used in PKGV, where
#
#   NN equals the total number of revs up to SRCREV
#   GITHASH is SRCREV's (full) hash
#
# - GITPKGVTAG which is the output of 'git describe' allowing for
#   automatic versioning
#
# gitpkgv.bbclass assumes the git repository has been cloned, and
# contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
# used in PV, only in PKGV.  It can handle SRCREV =3D ${AUTOREV}, as
# well as SRCREV =3D "<some fixed git hash>".
#
# WARNING: if upstream repository is always using consistent and
# sortable tag name scheme you can get sortable version including tag
# name with ${GITPKGVTAG}, but be aware that ie tag sequence "v1.0,
# v1.2, xtest, v2.0" will force you to increment PE to get upgradeable
# path to v2.0 revisions
#
# use example:
#
# inherit gitpkgv
#
# PV =3D "1.0+gitr${SRCPV}"      # expands to something like
1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
# PKGV =3D "1.0+gitr${GITPKGV}"  # expands also to something like
1.0+gitr31337+4c1c21d7d
#
# or
#
# inherit gitpkgv
#
# PV =3D "1.0+gitr${SRCPV}" # expands to something like
1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
# PKGV =3D "${GITPKGVTAG}"  # expands to something like 1.0-31337+g4c1c21d
#                           if there is tag v1.0 before this revision or
#                           ver1.0-31337+g4c1c21d if there is tag ver1.0

Does it seems good enough for pushing it?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



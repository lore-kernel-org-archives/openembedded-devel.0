Received: from mail-yw0-f177.google.com ([209.85.211.177])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NBUGK-0004rc-Hu
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 15:15:03 +0100
Received: by ywh7 with SMTP id 7so3062684ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 06:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wD+fIO7KgLhW1N/7ufuB6uKcmc5Nr9S6+1GGESK1Vn0=;
	b=wNt7HHG5qIYGbJxeJpRy1Hytz5TuPd7RONrTDGjW2+F41wHvo2LlX6UMpI58korf10
	oLFoxmaHfNexgirJBJF7l5V/h2xOFCuYikBN1xrNN+sYBYiVPpsBBNnGn87iZwGjexzk
	yvfYwZ4H9LUjE14ops3LT892LFQAAX+KECer4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=R7lb/N6OD1wBL5IoGYB30MKW3Q4JwiJn/FOWHz6zwwk85jJ8evuoyiyOXPqPaV0iSK
	Q/JkuuJDfTfBh27duRUW+2FTT+B7DPeqT4pO5DeSZUHKgSfYt2haTulhsmU0l0T6uaQ1
	kDGm9OC7EE1P88qIEhdxIRUlwBYp0lTxXUacw=
MIME-Version: 1.0
Received: by 10.101.136.29 with SMTP id o29mr1890312ann.1.1258726408655; Fri, 
	20 Nov 2009 06:13:28 -0800 (PST)
In-Reply-To: <1258645184.5229.46.camel@dax.rpnet.com>
References: <1258645184.5229.46.camel@dax.rpnet.com>
Date: Fri, 20 Nov 2009 15:13:28 +0100
Message-ID: <ac9c93b10911200613u538b43berf63c36cea61cdfb3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OE.dev staging changes - Progress so far
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
X-List-Received-Date: Fri, 20 Nov 2009 14:15:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/19 Richard Purdie <rpurdie@rpsys.net>:
> Its been 10 days since I posted the summary and started pushing some of
> the changes. There have been some bumps but the changes so far seem to
> have settled down quite well.
>
> The proposals and status is as follows:
>
> a) Adopt the removal of the layout_* variables from Poky.
>
> Done.
>
> b) Change the do_populate_staging/do_stage functions to use the results
> =A0 from the do_install step as proposed in other emails
>
> Implemented but many recipes still use the legacy path.
>
> c) Adopt the native.bbclass changes from Poky to allow use of
> =A0 BBCLASSEXTEND =3D "native"
>
> Done.
>
> d) Start removing legacy do_stage functions and convert exclusively to
> =A0 the new model
>
> Not really started yet. Poky has now converted all of its recipes to the
> new model and has no legacy staging however so there are plenty of
> examples out there.
>
> e) Start converting recipes to BBCLASSEXTEND =3D "native"
>
> Not really started yet. Poky has conversions of many recipes.
>
> f) Merge the new canadian SDK classes from Poky and start a gradual
> =A0 conversion to them with a view to obsoleting the existing sdk and
> =A0 canadian recipes.
>
> The classes have been merged.
>
> g) Rename "do_populate_staging" to "do_populate_sysroot" and
> =A0 "TMPDIR/staging" to "TMPDIR/sysroots" to reflect how much this
> =A0 directory has changed and to truly reflect its contents. The word
> =A0 "staging" confuses a lot of new users in my experience.
>
> Implemented in Poky but not ported to OE yet.
>
> h) Enable packaged staging as default, with a view to making it
> =A0 mandatory after a suitable transition period.
>
> Not done yet.
>
>
> So to summarise, the list of tasks remaining is therefore:
>
> a) Generate a list of recipes using legacy staging during parsing and
> =A0 save it into tmp?
> b) Start to convert recipes to use do_install for staging. Poky has
> =A0 many examples.
> c) Start to add BBCLASSEXTEND =3D "native" to recipes
> d) Start to add BBCLASSEXTEND =3D "nativesdk" to recipes
> e) Port the "do_populate_staging" to "do_populate_sysroot" change from
> =A0 Poky to OE.dev
> f) Enable packaged staging as default.
>
>
> Cheers,
>
> Richard

Richard, I'm more than happy to convert/update some of the recipes
(e.g. the ones I've worked on in the past), but I would appreciate it
if you could point me to one or two specific examples (to avoid the
case that I pick one which is not the best).

Thanks, Frans



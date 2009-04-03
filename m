Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LpmjI-0005ad-Pl
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 18:58:59 +0200
Received: by bwz19 with SMTP id 19so1049576bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2009 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BCWYFy+3WX2rZZ9xJwL8TwDldYGwMBHAcIPcFmOf9v0=;
	b=Az5qnRNbcP7yhz9qIU/sAZAnP0cmdBVS8PbgjKvUDHKUwMRSGNHN5gBrcAjpUVEfi3
	9MPpGuXY8MvJOwYE8cyXq2x5jEPUV9RXvWQtDN66Rq19wZ3ajauDd1e7269Zt2PUI5xA
	s8nb1z3W9+QlzRBwIkSPKbsh9ed+Rp8OkMgsw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lG0532kRcKgItVWWt6TORHzcgO1MZr+jIVlxsuSIXvg7CbWjgSL393q1WqblUkBUuD
	3Uh19RG+UoZ6KArHbKwDHeEiMoRGSX8VxNedogg69zszBH+SELwGuxnyozc0njM9n/YO
	ZHmg15fwBa1CsmHjxPOqeULe7kOc3OhOtuU9I=
MIME-Version: 1.0
Received: by 10.223.108.15 with SMTP id d15mr1253022fap.62.1238777782289; Fri, 
	03 Apr 2009 09:56:22 -0700 (PDT)
In-Reply-To: <069B6B31F6201B4389D7EEB9AD827BCA05006047@otis.burlington.evertz.tv>
References: <069B6B31F6201B4389D7EEB9AD827BCA05006047@otis.burlington.evertz.tv>
Date: Fri, 3 Apr 2009 18:56:22 +0200
Message-ID: <ac9c93b10904030956g2e8a1663g7877947b1a17775c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] Where is the python-zopeinterface recipe?
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
X-List-Received-Date: Fri, 03 Apr 2009 16:58:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

$ cd recipes; find | grep zope
/zope/zope-interfaces_3.3.0.bb
...

It used to be part of the zope recipe.

2009/4/3 Rodney Lott <rlott@evertz.com>:
> Hello.
>
> I am currently using the origins/stable/2009 branch and was trying to add=
 the python-twisted recipe to my image and I got the following dependency i=
ssues:
>
> OE Build Configuration:
> BB_VERSION =A0 =A0 =A0 =A0=3D "1.8.13"
> METADATA_BRANCH =A0 =3D "stable/2009"
> METADATA_REVISION =3D "e93bd21c7a03b0e78a3097a8f924308841970429"
> TARGET_ARCH =A0 =A0 =A0 =3D "i486"
> TARGET_OS =A0 =A0 =A0 =A0 =3D "linux"
> MACHINE =A0 =A0 =A0 =A0 =A0 =3D "x86"
> DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D "minimal"
> DISTRO_VERSION =A0 =A0=3D ".dev-snapshot-20090403"
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: '['/home/rlott/openembedded.git/recipes/python/python-twisted_8.2.=
0.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'pyth=
on-zopeinterface' but it wasn't found in any PACKAGE or RPROVIDES variables
> NOTE: Runtime target 'python-zopeinterface' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-zopeinterface']
> NOTE: Runtime target 'python-twisted' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-twisted', 'python-z=
opeinterface']
> ERROR: Required build target 'cp2210e-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['cp2210e-image', 'python-tw=
isted', 'python-zopeinterface']
>
> In the python-twisted_8.2.0.bb recipe, it references the python-zopeinter=
face recipe as a dependency. =A0I couldn't find such a recipe in the recipe=
s/python subdirectory of the git branch. =A0So, is this recipe merely a boo=
kmark or is it going to be available, pending approval?
>
> Regards.
>
> Rodney
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OoNVO-0008L7-5d
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 23:27:35 +0200
Received: by wwb31 with SMTP id 31so423862wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 14:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=EuPZEuuFsISw46xD7Cd1+sBFc3e9Vk6VtffNYZrfZMI=;
	b=R/HIhoKUVi+l2UR6TdZPLUn7KCZ3IVSzryBmddu3a3jgD1c7wXct8C7LOOqC9E8vAp
	PbtUWnpL7UoF4MCIUxJnnOgy+97p96M+69TTVO1f5b5+mc61qXmVh10YJb+GOiePkZNR
	QWSHfYkEXG8Loc8qKU2tKZv55n3KxpRNIE0zU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=FA+g/uwnswue3Q8vgx75G69RAiQ+uxFpK+0QO2Hk9MQLKlX26CImGxNjBGseK5giQ7
	wHBSb5qaC3OVbNdNGMgnvaQpOxRbxIlvDjEyR7rgceBOrOfCqLA8Q62FlVI7Ln2xFBg0
	8XUh2zsuMryhK/3tgYiaMwHRsS8i+8TcrXv6E=
Received: by 10.216.210.206 with SMTP id u56mr20565weo.23.1282770699195; Wed,
	25 Aug 2010 14:11:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Wed, 25 Aug 2010 14:11:18 -0700 (PDT)
In-Reply-To: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 25 Aug 2010 14:11:18 -0700
X-Google-Sender-Auth: Oya6lSYqlScyTUS9aESWJ2yawyk
Message-ID: <AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: how to add file to SRC_URI for target only
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
X-List-Received-Date: Wed, 25 Aug 2010 21:27:35 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 25, 2010 at 2:04 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Is it possible to add a file to SRC_URI for target only in a combined
> native/target recipe?
>
> Of course I know I can fully redefine SRC_URI, but I feel that is less
> desirable.
> The issue is that the target recipe needs an additional patch that the
> native recipe cannot use.
>
> Or do we need to introduce an _target suffix?
>
> Guess an intermediate variable also could do the trick.
> E.g.
>
> PATCH = "xx.patch"
> PATCH_virtclass-native = ""
> SRC_URI = "source and files and patches ${PATCH}"
>
> not really ideal either.
>
> I saw some other places where we need to tweak similarly with DEPENDS
> e.g.
> DEPENDS = "x"
> DEPENDS_virtclass-natvie = ""
>
> guess here _target could help too.
>
> Any ideas/comments/patches/... ?


Something like this should work:
DEPENDS += "${@['', 'foo']['${BPN}' == '${PN}']}"
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


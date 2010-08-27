Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ooxa8-0002mZ-D6
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 13:58:53 +0200
Received: by iwn2 with SMTP id 2so2466453iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 04:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Zfsl3xXb+RZV7IaiGUg9LYApvMO+8Mayn/HjVmyK5qk=;
	b=QVSh9olCxIrvWwH0tkf7BmMIY+9BtHmJocO/tPQCtXWgPhG9fqgeQ+ImVN0zi5MBZk
	Rjb/DVhYiRQB1MvXui/afrxBIgjZpWrrNG/UtPSYZCkKn3U5RDT0Uutz0p8/yjTouaGl
	oq3f1fZjIajRjb7FYtYksVXpJhWU13yv0yrR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=x75flomDx3rDzLWuStskcCucznR10oHExmR42szlTGmWGi+4Q2lrmR5cCaDKKd2ugI
	+vd5jIaIzkV28JQ+e4X7um9PBSix5vOaVxADgp2YFj02DHKH+iA/3V6Sbt4p5zmG0sy6
	seNbc+8MluJQexdaNo8i5xYjuQ+9qdWFUu/2Q=
MIME-Version: 1.0
Received: by 10.231.119.229 with SMTP id a37mr919442ibr.169.1282910304667;
	Fri, 27 Aug 2010 04:58:24 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 27 Aug 2010 04:58:24 -0700 (PDT)
In-Reply-To: <i586bt$t12$1@dough.gmane.org>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
Date: Fri, 27 Aug 2010 13:58:24 +0200
Message-ID: <AANLkTik=ke8O=5PaDRwm7jhsrgCL1+ALVtjeHNXvLnuB@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Fri, 27 Aug 2010 11:58:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/27 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 27-08-10 10:11, Khem Raj wrote:
>> * Move recipes to nonwotking which are depending upon other recipes
>> =A0 which are already in nonworking state.
>>
>> * Fix other recipes for renamed dependencies etc.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0recipes/angstrom/angstrom-bootmanager.bb =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
>
> NAK
>
>> =A0recipes/esc/esc-node-demo_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A04 +-
>
> NAK
>
>> =A0recipes/meta/meta-toolchain-arago-dvsdk.bb =A0 =A0 =A0 =A0 | =A0 =A01=
 +
>
> NAK
>
>> =A0recipes/sugar/sugar-fructose.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
>
> NAK
>
>> =A0recipes/tasks/task-arago-toolchain-target.bb =A0 =A0 =A0 | =A0 =A03 +=
-
>
> NAK
>
>> =A0recipes/tasks/task-demo-x11.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 17 ++---
>
> NAK
>
>> =A0recipes/tasks/task-gmae.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A07 ++
>
> NAK
>
>> =A0recipes/tasks/task-gpe.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A06 +-
>
> NAK
>
>> =A0recipes/udev/udev-compat141_141.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A06 ++-
>
> NAK
>
>> =A0recipes/vlc/vlc-davinci_0.8.6h.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 +-
>
> NAK
> -----BEGIN PGP SIGNATURE-----

Would it bee too much of an effort to explain why you NAK these
patches, so people can actually learn from it (or improve or fix it in
another way)?
Khem spent quit some time on it. I'm sure he fixed things for a good
reason. If this is no good he (and we) can learn from it, and if
needed the issues can be fixed.

Frans.



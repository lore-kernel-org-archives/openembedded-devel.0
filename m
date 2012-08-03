Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SxFN4-00036E-0D
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 12:44:42 +0200
Received: by yenl13 with SMTP id l13so591521yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Cd58IXv6AHlOEXQHBdBS56SHRZF6jh0uDbUbtH8Yusg=;
	b=B+bJA2B0EaNYI0E/sZzUYrvOL1z/YIm24/yHu2OBXjFHv+nWbTXmbunWC9nhuN+1EZ
	NOVIhdiOXMM10N6hUX/zuKZOhwFGHPdqFPbheBhNGETuGd/VBZmjFwuvWHe785HR3C+B
	Le33Q8WYOzkFQXCvZzUIhtH4W/jlrNbOqCJ/LKWOFA3gwxzF2VcEm4ZrYfL65CThyTnA
	j9+bQgw3jKA99075omKhkfhM68BCW4Nh1oql5HqEx+vFydrREkEJUDkGGlasXfKW3ugl
	48azKZS8u9IYJhJe93+KX5GRQC/mTesvcL8Zt2oKtawPnm6D/NIahy9xycma4TnxRv+o
	AGIg==
Received: by 10.43.124.201 with SMTP id gp9mr1946383icc.47.1343989980389;
	Fri, 03 Aug 2012 03:33:00 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	o1sm21679347igm.16.2012.08.03.03.32.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 03:32:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <671950423.c3foblMkXu@helios>
Date: Fri, 3 Aug 2012 03:32:57 -0700
Message-Id: <6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
	<671950423.c3foblMkXu@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1485)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Fri, 03 Aug 2012 10:44:42 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Aug 2, 2012, at 1:11 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Wednesday 01 August 2012 15:56:34 Khem Raj wrote:
>> On Aug 1, 2012, at 8:11 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>> Along with upgrade use the release tarballs instead of git
>>>=20
>>> For an update we need to pull in some patches from master, so a git =
recipe
>>> is still the preferred way.
>>=20
>> OK, you know more about it then me but do you know how many those =
will be ?
>> in other words does systemd releases mean much for stability yet or =
still
>> its a project moving at so fast pace ?
>>=20
>> I see that releases are rolled out almost every month, that sort of =
could
>> mean either way, we wait until the next release or just take from a =
commit
>> upstream
>>=20
>> I feel like staying with a release+patches could be one way if we are =
not
>> importing pathes too often. but I don't know how often that would be. =
For
>> the testing I did release worked well for those platforms x86, ppc =
and arm
>=20
> One might suggest, if stable releases are working and you want to live =
on the=20
> bleeding edge in your distro, you can easily do so there=85

This is moving forward from where we were so it includes all the git =
commits that
were there until cd96b3b86abb4a88cac2722bdfb6e5d4413f6831 commit so this =
update
is inclusive.

we can also think of having a stable recipe and a git recipe but systemd =
releases
are almost a month apart it would be more or less covered if we moved =
from release
to release with some patches if needed.

thirdly we can have two recipes as Paul suggested.

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre




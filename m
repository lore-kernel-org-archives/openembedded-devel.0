Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Op0uX-0006u0-3l
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 17:32:10 +0200
Received: by pwj8 with SMTP id 8so1255598pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=wpISrcfcXphxYqUpKrVJfxOVShi6ZTzIYyAUrMIb22k=;
	b=pGZMQzAMuhxZfJkpvqtxZF/tXoRkiq9Knqzn5/bI4hmBZLSXHL87x2ATgY8VAo2CIW
	QsYNv034rGfB5dy21sbhDHfL8KxGY/ehaWuQuEv7fPeaKlzZeKLmfL5ed7de8M09Py74
	6wQl+8zCIuZnzDjENb/7D2fHvSKG56zS1wb7I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=mlCmotJUqccAaik1twZ7m3nb0pHZjqU/c9sktXn6kMVCk33SOI64zFU4ro8uTKnaJ3
	3HFAPtyXZrs4myF2q6ovEPtJI/9JwLjoYq7i3g+JzZQnFpoj/lHVBcrVU7qgkbdmnHbL
	QDzWRMaAGU/RmoWcKCaN7ud4j4W7oAgmazjWo=
Received: by 10.114.73.5 with SMTP id v5mr665975waa.35.1282923098845; Fri, 27
	Aug 2010 08:31:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 27 Aug 2010 08:31:18 -0700 (PDT)
In-Reply-To: <i586bt$t12$1@dough.gmane.org>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Aug 2010 08:31:18 -0700
Message-ID: <AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Fri, 27 Aug 2010 15:32:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen

Thanks for your time to look into it and comments. It would help if
you could explain a bit more why you think
changes are not good. I have individually explained the reasons below
your comments. It would really help to
improve these if you could shed some light on the reason why you think
the changes are not good. If you think


On Fri, Aug 27, 2010 at 4:08 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
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


if you have explained whats wrong that would have helped. I certainly dont
claim to be knowing all the recipes. recipes it depends upon do not exist
so whats the best thing to do ? This same applies to your other NAKs too.

>
>> =A0recipes/esc/esc-node-demo_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 =A04 +-
>
> NAK

This depends on a recipe which is under review and I have commented the sam=
e.
Or do you see something else is wrong?

>
>> =A0recipes/meta/meta-toolchain-arago-dvsdk.bb =A0 =A0 =A0 =A0 | =A0 =A01=
 +
>
> NAK

I wonder if you really looked at this change because all it does is removes
meta-toolchain-arago-dvsdk from world build. What problem do you see here ?

>
>> =A0recipes/sugar/sugar-fructose.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
>
> NAK

Elena already explained it.

>
>> =A0recipes/tasks/task-arago-toolchain-target.bb =A0 =A0 =A0 | =A0 =A03 +=
-
>
> NAK

This change is removing libpng12-dev which is not provides. and
e2fsprogs-libs-dev
is now e2fsprogs-dev or am I missing some point here.

>
>> =A0recipes/tasks/task-demo-x11.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 17 ++---
>
> NAK

are libgles-omap3-x11demos different that non existing libgles-omap3-demos
if so then I can change it to just removing libgles-omap3-demos

>
>> =A0recipes/tasks/task-gmae.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A07 ++
>
> NAK

it uses XSERVER what doesnt really define it. What is wrong here.

>
>> =A0recipes/tasks/task-gpe.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A06 +-
>
> NAK

virtual/xserver is a virtual target you can not RDEPEND on it
but you can depend atleast thats what bitbake tells me.

>
>> =A0recipes/udev/udev-compat141_141.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A06 ++-
>
> NAK

if machine is not one of spitz akita c70x poodle then it is not needed
to RDEPEND on it. what is wrong here

>
>> =A0recipes/vlc/vlc-davinci_0.8.6h.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 +-
>
> NAK

is non existing codec-engine different then ti-codec-engine ?
if yes then I guess either these codecs should be committed to OE
or the recipe should be moved into nonworking what would you think.





> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMd5y9MkyGM64RGpERAp7CAJ9Hdw0XIynob+zbnWWDSvB2LMCR7QCggZUJ
> c4ydMxejzuOOqvU2RJYBWxA=3D
> =3DRBfq
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PV3vJ-0004Qo-BJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 16:14:45 +0100
Received: by wwi17 with SMTP id 17so4034986wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 07:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=6azOTxs0K/mK/9O+ecq7egI4MSWuYuiSrGd307iazxM=;
	b=HlVI4vGLcQQcQywqXTWO8gjNr9mlvZg1HNNci3tmIcdClF1ZO+nVGFXpDL07sAFek/
	E+kqEYJuqFg59eI2B45Vyl7ZoqpfRI3ijiPfzRs6XIKOtURKX/KXP1BSHfjS6vKqDvSo
	HeqP51lYKRTJCH5g7d21jwz3fi7YU50c+1i9s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=RuvqlgnnXzev7DFO5dXgaIKHSfMxmooqLfk22gkG2AbCRKGJY9imM9p25Z2N6IiYpp
	8LIwp2iQScPW7W+XCE6QE5P0iGpnjcyIrQVn5XeefHxkNgtA2URIa6sAgRRPGL74g3fu
	dKux19qQ6L1Vk1nC+Zf/+eZONsQy+KvMlK934=
Received: by 10.216.220.219 with SMTP id o69mr6358530wep.57.1292944478848;
	Tue, 21 Dec 2010 07:14:38 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 21 Dec 2010 07:14:13 -0800 (PST)
In-Reply-To: <4D1086EB.8020405@eukrea.com>
References: <4D1062AF.1080609@eukrea.com> <4D1086EB.8020405@eukrea.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 21 Dec 2010 08:14:13 -0700
X-Google-Sender-Auth: KYDcWda9hx1T9C9pK8iIhH-smz8
Message-ID: <AANLkTinGaP=WYqcNCifYuFQjyvB9ZYLqgDJQkTpr1Cog@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: bitbake-dev@lists.berlios.de
Subject: Re: Problem with bitbake master & OE master during fetch
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
X-List-Received-Date: Tue, 21 Dec 2010 15:14:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2010 at 3:52 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi,
>
> On 21/12/2010 09:17, Eric B=C3=A9nard wrote:
>>
>> I still haven't investigated the reason of the error.
>>
> OK the reason of the error is that the machine I'm fetching for is an arm
> and these recipes have either COMPATIBLE_MACHINE =3D "(h3600|h3900)"
> or COMPATIBLE_HOST =3D "i.86.*-linux"
> Same thing occur with recipes/apache/apache_2.0.54.bb
>
> which has :
> python () {
> =C2=A0 =C2=A0# Don't build apache unless we are building nativly
> =C2=A0 =C2=A0target =3D bb.data.getVar("TARGET_ARCH", d, 1)
> =C2=A0 =C2=A0build =3D bb.data.getVar("BUILD_ARCH", d, 1)
> =C2=A0 =C2=A0if target !=3D build:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipPackage("Apache will only b=
uild nativly
> (TARGET_ARCH =3D=3D BUILD_ARCH)")
> }
>
> Also, the problem is only present when doing bitbake -b the_recipe.bb
>
> .
> Doing bitbake the_recipe exit fine with the following message : "NoProvid=
er:
> adobe-flash".
>
> If would be great if bitbake -b the_recipe.bb
>
> could exit properly instead of looping on these errors

I just pulled over a commit from poky that fixes that.  That is, at
least it doesn't error.  Unfortunately, it just returns saying 0 tasks
were run, and not *why* it didn't run anything, but it's a step in the
right direction.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics



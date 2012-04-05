Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1SFhuK-0001zG-45
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 10:19:04 +0200
Received: by wgbdr12 with SMTP id dr12so895731wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2012 01:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ev92xPRPCnV77pnjDwxmMvafBkEGnViXABVu0S2nH5g=;
	b=g7aPIo7HvCVX1IGDdtS0mRiFCgd3apxOZwg/N0oPZ4SJdCMs0OIjtfFRwdGS2p5V9U
	biJ6m24fAdZPK9wL1Jh5hRE0T+rd9BXzWNsOVzKSVofWlt7HswCgCbl7DzWqRWBZaulq
	FrwUAO4FwEpKHXp14bj10p4NVvh6Gzf4DNOm+yBI7LdlKACeLZrmtKyAk9o6zamXNZq8
	CHh8c0/RZjg8v//gGrIrPOsPL7QmlnZJ0YBHszD5sTg7cX9AONjlOQKOstyQQJe3T0IM
	NimNi570p7nu/J1l7XFdaZ+OJRcbs2GGe/Q7ZhkJ6UJNVl8ppQGUgeD6bdcnP0Pxm6Xq
	tyLA==
MIME-Version: 1.0
Received: by 10.180.24.66 with SMTP id s2mr2456585wif.7.1333613392839; Thu, 05
	Apr 2012 01:09:52 -0700 (PDT)
Received: by 10.223.62.6 with HTTP; Thu, 5 Apr 2012 01:09:52 -0700 (PDT)
In-Reply-To: <CAGiJk9f_J_o2zkQk5TGBPHUvEt4SLVUQ=uvAY=C9j+o-B9=3dQ@mail.gmail.com>
References: <20120402210435.GA10553@hermes>
	<CAK18fxG5zusOY+WwnhBatbQ-3Kt8PUmHaafWoHTO=eWYzZ0Kyw@mail.gmail.com>
	<20120404195704.GA16410@hermes>
	<20120404200036.GI4181@jama.jama.net>
	<CAK18fxEqNka=VKjpF0yD-iExz6pBVpJuUvSCEhxtQfwmP8Qiig@mail.gmail.com>
	<CAE4k23-WKaczsEDCBohBAPpiDf9D+bk05qEPBU+qOeJ07=Fqzw@mail.gmail.com>
	<CAGiJk9f_J_o2zkQk5TGBPHUvEt4SLVUQ=uvAY=C9j+o-B9=3dQ@mail.gmail.com>
Date: Thu, 5 Apr 2012 10:09:52 +0200
Message-ID: <CAE4k239hqHFZQKy=hrds4EtRSoLh32Af4gSD-wQdNHN-+Vvieg@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Package build failure
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
X-List-Received-Date: Thu, 05 Apr 2012 08:19:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 5, 2012 at 09:57, Samuel Stirtzel <s.stirtzel@googlemail.com> w=
rote:
> 2012/4/5 Anders Darander <anders.darander@gmail.com>:
>> On Thu, Apr 5, 2012 at 09:33, Andrei Gherzan <andrei@gherzan.ro> wrote:
>>> Or you can specify a tag in =A0src_uri. Something like SRC_URI =3D
>>> "git://bla.git;protocol=3Dgit;tag=3Dmytag"
>>
>> Yes, you can, but please use SRCREV instead. (And let SRCREV point to
>> the commit that corresponds to the tagged commmit). If you use tags,
>> git will try to reach to server to verify the tag, while SRCREV lets
>> you build completely offline.
>>
>> /Anders
>
> Yes you are right, this is done because git tags can be moved.
>
> Usually I would assume that it only checks the revision while fetching.
> But currently it seems like "git ls-remote" (the tool that checks the
> remote revision) is executed at _every_ task of a tagged recipe (and
> also once while parsing).
> So if you have 10-20 recipes from the same git server that use tags,
> building them could generate heavy load on the server.
>
> Still wonders me why it has to check for the revision at do_package
> and fails me if the server is unreachable / busy.
> (git-ls-remote unable to look up anongit.kde.org/...)
>
>
> Was looking for this "issue" in the fetcher/git code, but I couldn't
> find it at the first look..

Not solving your "issue"... But anyway, git doesn't really know
whether the tag is a fixed tag or a potentially moving branch, thus it
needs to check the server to find the actual git id. Then the git id
is often used in PV, just like the svn revision was in the opkg case
(PV =3D "0.1.8+svnr${SRCPV}").

All in all, this means that we will need to talk to the git server at
least once for every incarnation of bitbake (it shouldn't be necessary
for all tasks, though, as it should be possible to cache it internally
for this execution of bitbake).

/Anders



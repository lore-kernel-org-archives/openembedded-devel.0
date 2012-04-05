Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SFiUK-0002Mx-KX
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 10:56:16 +0200
Received: by wgbds1 with SMTP id ds1so1116775wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2012 01:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=3RokkZ/xwJNHHnkB92LqpahW4BbDw/2UKEIysDrijZ4=;
	b=qQlIIG1jqjxgUJ9SfFu7/MHqs4cVhId92z1sg27COR2P0+NHWp/xddB3/wDTCYvF4V
	zzqCbF1aUOGRE6uecj5XghfdamYzs/zC7qHeo4JfcMYU1MALE6plqnp/yhlqFBYwFmkK
	FSWHlH3HE6ifzgLOCP2xCXKVDyeAtjdOUV7zwN89iC1z7/mX9//VdytQGqYg42dn+m+M
	OY5/JpUHeydrSBiWMfafyRBpq6eUwyhK+vHjEmJucibqxGwSb41ospbRb/m7WYEIdecc
	Ev2JIKCuHcY9nKbkI8pGTSHoQ38SpwGAW8xjs3RnTHc0++QtTLd1o7Uh22aqaFBaNZUG
	pIQg==
MIME-Version: 1.0
Received: by 10.216.228.165 with SMTP id f37mr1106046weq.83.1333615625119;
	Thu, 05 Apr 2012 01:47:05 -0700 (PDT)
Received: by 10.223.104.68 with HTTP; Thu, 5 Apr 2012 01:47:05 -0700 (PDT)
In-Reply-To: <CAE4k239hqHFZQKy=hrds4EtRSoLh32Af4gSD-wQdNHN-+Vvieg@mail.gmail.com>
References: <20120402210435.GA10553@hermes>
	<CAK18fxG5zusOY+WwnhBatbQ-3Kt8PUmHaafWoHTO=eWYzZ0Kyw@mail.gmail.com>
	<20120404195704.GA16410@hermes>
	<20120404200036.GI4181@jama.jama.net>
	<CAK18fxEqNka=VKjpF0yD-iExz6pBVpJuUvSCEhxtQfwmP8Qiig@mail.gmail.com>
	<CAE4k23-WKaczsEDCBohBAPpiDf9D+bk05qEPBU+qOeJ07=Fqzw@mail.gmail.com>
	<CAGiJk9f_J_o2zkQk5TGBPHUvEt4SLVUQ=uvAY=C9j+o-B9=3dQ@mail.gmail.com>
	<CAE4k239hqHFZQKy=hrds4EtRSoLh32Af4gSD-wQdNHN-+Vvieg@mail.gmail.com>
Date: Thu, 5 Apr 2012 10:47:05 +0200
Message-ID: <CAGiJk9fvBvuR8ftcLpYXcucJPX8zaJ=6UOnbDxkq409KZcGOFw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
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
X-List-Received-Date: Thu, 05 Apr 2012 08:56:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/5 Anders Darander <anders.darander@gmail.com>:
> On Thu, Apr 5, 2012 at 09:57, Samuel Stirtzel <s.stirtzel@googlemail.com>=
 wrote:
>> 2012/4/5 Anders Darander <anders.darander@gmail.com>:
>>> On Thu, Apr 5, 2012 at 09:33, Andrei Gherzan <andrei@gherzan.ro> wrote:
>>>> Or you can specify a tag in =C2=A0src_uri. Something like SRC_URI =3D
>>>> "git://bla.git;protocol=3Dgit;tag=3Dmytag"
>>>
>>> Yes, you can, but please use SRCREV instead. (And let SRCREV point to
>>> the commit that corresponds to the tagged commmit). If you use tags,
>>> git will try to reach to server to verify the tag, while SRCREV lets
>>> you build completely offline.
>>>
>>> /Anders
>>
>> Yes you are right, this is done because git tags can be moved.
>>
>> Usually I would assume that it only checks the revision while fetching.
>> But currently it seems like "git ls-remote" (the tool that checks the
>> remote revision) is executed at _every_ task of a tagged recipe (and
>> also once while parsing).
>> So if you have 10-20 recipes from the same git server that use tags,
>> building them could generate heavy load on the server.
>>
>> Still wonders me why it has to check for the revision at do_package
>> and fails me if the server is unreachable / busy.
>> (git-ls-remote unable to look up anongit.kde.org/...)
>>
>>
>> Was looking for this "issue" in the fetcher/git code, but I couldn't
>> find it at the first look..
>
> Not solving your "issue"... But anyway, git doesn't really know
> whether the tag is a fixed tag or a potentially moving branch, thus it
> needs to check the server to find the actual git id. Then the git id
> is often used in PV, just like the svn revision was in the opkg case
> (PV =3D "0.1.8+svnr${SRCPV}").

So if the recipe states:
-
SRC_URI =3D "git://anongit.kde.org/calligra.git;protocol=3Dgit;branch=3Dmas=
ter"
SRCREV =3D "92ff51b5c0f388729f466041b34ab165a7d80987"
PV =3D "2.3.87+git${SRCPV}"
-

Will it still look up the remote SRCPV instead of using the SRCREV?
Is there a "best practice" or something like that?

>
> All in all, this means that we will need to talk to the git server at
> least once for every incarnation of bitbake (it shouldn't be necessary
> for all tasks, though, as it should be possible to cache it internally
> for this execution of bitbake).

For the git repository in the temp directory this seems to be "cached"
from the DL_DIR:
-
(inside kdelibs ${S} dir)$ git ls-remote | grep -c "^"
From /work/downloads/oe-core-downloads/git2/anongit.kde.org.kdelibs.git/
417
-
But SRCPV will query the "real" origin right?

>
> /Anders
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Regards
Samuel



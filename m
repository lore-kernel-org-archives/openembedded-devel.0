Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1SKltk-0000fG-6k
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 09:35:24 +0200
Received: by lagw12 with SMTP id w12so5969885lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2012 00:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=XwZsBDvf5NAjwqCz31UpcYMO0WqHaC1Sfgh0tPXj2Vk=;
	b=z887bvqo8BBoZ2GYk+itYiroS2M8V9Vnq7acUw+PRSPhZtLuAKVMjiJUi5p2kxyJOz
	GpO+wCRQLEp3NYuH37+cxc9FFtrUDUPa/B+7V7pKIQ3EH2udIJAhGBcClx5au6S3D5Tk
	5pdLKW96qGTJEYs1s7VyhPl1robvKxDbtYeBqWLM7YMDyjeqKXFzP1E6XYjmI9CvSzqo
	WMp6ElmnX5uYHeuKUFWgaxgeBDgz6Nh5qYTBzBAYKAUJ5sgxjTbHl8RcJII/XdB/RLQR
	5HEO5rbKSxocWmVSFAWNISxyhIWONkUSOcO9JF0KxUBkBx51EnBEhrDVj4X/OSBy9HV1
	oeaA==
MIME-Version: 1.0
Received: by 10.152.112.100 with SMTP id ip4mr1012908lab.1.1334820355751; Thu,
	19 Apr 2012 00:25:55 -0700 (PDT)
Received: by 10.152.19.66 with HTTP; Thu, 19 Apr 2012 00:25:55 -0700 (PDT)
In-Reply-To: <20120418082423.25389159b88a4b29186f05b4@studenti.unina.it>
References: <4F8DF031.60109@emagii.com> <2900608.HO3vnnHahd@helios>
	<4F8E1A23.4030606@emagii.com>
	<20120418082423.25389159b88a4b29186f05b4@studenti.unina.it>
Date: Thu, 19 Apr 2012 09:25:55 +0200
Message-ID: <CAE4k238N4uXv9WxtjxrpQO6LEarauFVce71E2mwZGiW2KCscLQ@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Support for R/W git in bitbake
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
X-List-Received-Date: Thu, 19 Apr 2012 07:35:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2012 at 08:24, Antonio Ospite <ospite@studenti.unina.it> wr=
ote:
> On Wed, 18 Apr 2012 03:34:27 +0200
> Ulf Samuelsson <openembedded@emagii.com> wrote:
>
>> On 2012-04-18 01:07, Paul Eggleton wrote:
>> > On Wednesday 18 April 2012 00:35:29 Ulf Samuelsson wrote:
>> >> Today bitbake supports read only git access in recipes.
>> >> For various reasons, I would like to be able to do recipes
>> >> which would check out in a read/write mode.
>> > Could you elaborate on "various reasons"?
>> >
>> > Would the new externalsrc bbclass be useful in your case?
>> >
>> > Cheers,
>> > Paul
>> >
>>
>> 1. If I am busy working on an application, then it simplifies the
>> development process.
>> =A0 =A0 =A0I can modify the code in the tree and push.
>> =A0 =A0 =A0This is mainly for kernel development.
>>
>
> for that you can pass "protocol=3Dfile" to make the git fetcher use the
> "file" transport, see
>
> http://ao2.it/en/blog/2010/05/27/neat-compilerun-cycle-git-and-openembedd=
ed
>
> basically, in the .bb recipe, you can fetch from a local clone where
> you do your normal work.
>
>> 2. If I work on a prerelease of some S/W drivers/Applications under NDA,
>> =A0 =A0 =A0then I cannot make that code publicly available
>> =A0 =A0 =A0but I still want to put =A0that on my Internet accessible git=
 server.
>> =A0 =A0 =A0Typicailly this is before the release of a new chip and info =
about
>> the chip should not be
>> =A0 =A0 =A0made public before the chip is released.
>>
>> 3. =A0I want to be able to ship something similar to the Angstrom setup
>> scripts
>> =A0 =A0 =A0 to someone else, and have them build an image, but it should=
 not
>> be available
>> =A0 =A0 =A0 to anyone not accepted (without public key at the git server=
).
>>
>
> maybe you can pass "protocol=3Dssh" as well to the git fetcher as well,
> but I haven't tried that, when you say "R/W mode" you are basically
> saying "ssh transport" for git, right? Let us know if that works.

Ulf, any comments on Antonios ideas?

I've just checked our own git repos and recipes; we're using SRC_URI's like=
:
SRC_URI =3D "git://gitosis@server-url/linux;protocol=3Dssh "
Then it is possible to work in that git clone as usual. Though, I've
to mention that this is using oe-core, so there might be some
differences in fetchers etc.

/Anders



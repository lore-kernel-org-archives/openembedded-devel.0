Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuBVX-0008Nm-Ev
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 23:23:59 +0100
Received: by fxm8 with SMTP id 8so4034606fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 14:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=qIKE5ysGI4tGmMdySmYya9cBxKOZCcxvgj5fLv96rT8=;
	b=lLJehhX6w9+/RzAPoYdkqxSp64x72nCSSag8jst8Yp+uIbgqPHXwlMizYeUoY9Is/u
	gyjkxBk39XMYQbt5/OxV07edhNH996UEA1UoZuXHgEQi/yKCrmNwYah1Yz1dn6AAa3Xg
	GWMXrddVx9+2HVtAQ+J+LCNrbuK2oUfi9jJ4Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=jib+5ZFrfHqF0SXcPPxg4MPCw4XMADb6JJc26fLR+OmvH274+P9RzY6GDdiAc5o821
	ldAzsyi6aYSpB7tufH2JFEOVaGFEqLfjS0vyi/o7pvjZSyNZPTYl/rl/LJOI//45vUsi
	LO2m5iLq+cKqWh+TPtUX7KBE+8wVsO2/B0Cuc=
Received: by 10.223.95.199 with SMTP id e7mr7163552fan.39.1298931752744; Mon,
	28 Feb 2011 14:22:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 28 Feb 2011 14:22:03 -0800 (PST)
In-Reply-To: <4D6C067A.5020202@mentor.com>
References: <4D6BC0EA.4000207@mentor.com> <20110228160659.GG5886@jama.jama.net>
	<20110228161328.GH5886@jama.jama.net> <4D6BD384.90002@mentor.com>
	<20110228200440.GI5886@jama.jama.net> <4D6C067A.5020202@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2011 14:22:03 -0800
Message-ID: <AANLkTi=UxUu-bJQoMbC2KhppwZuBxQYPp6O1fN0BmEbp@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: shr-image failure
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
X-List-Received-Date: Mon, 28 Feb 2011 22:23:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 12:32 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 02/28/2011 01:04 PM, Martin Jansa wrote:
>>
>> On Mon, Feb 28, 2011 at 09:55:32AM -0700, Tom Rini wrote:
>>>
>>> On 02/28/2011 09:13 AM, Martin Jansa wrote:
>>>>
>>>> On Mon, Feb 28, 2011 at 05:06:59PM +0100, Martin Jansa wrote:
>>>>>
>>>>> On Mon, Feb 28, 2011 at 08:36:10AM -0700, Tom Rini wrote:
>>>>>>
>>>>>> Hey all,
>>>>>>
>>>>>> Trying to build shr/shr-image/nokia900 fails with the following:
>>>>>> http://pastebin.com/Z13aYd2Z which seems odd in that we're building:
>>>>>>
>>>>>> NOTE: Running task 5802 of 10948 (ID: 2141,
>>>>>>
>>>>>> /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/shr-image/D=
ISTRO/shr/MACHINE/nokia900/label/sb-u804/recipes/efl1/elementary_svn.bb,
>>>>>> do_setscene)
>>>>>> NOTE: package elementary-2_0.7.0+svnr56372-r11: task do_setscene:
>>>>>> Started
>>>>>>
>>>>>> And it's already past do_populate_sysroot before this starts. =C2=A0=
I do
>>>>>> see
>>>>>> some svn complaining (and not doing something...) earlier on in the
>>>>>> do_configure here.
>>>>>
>>>>> This looks like related to
>>>>> http://www.mail-archive.com/bitbake-dev@lists.berlios.de/msg00880.htm=
l
>>>>>
>>>>> which was resolved later with scmdata=3Dkeep param
>>>>>
>>>>> http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3D05cbc1d1a01=
c667c77688f36fbc5b61c5f452a3a
>>>>>
>>>>> but that patch didn't make it to bitbake-1.10.2 release, but neither
>>>>> did
>>>>> patch causing this in master/1.12
>>>>>
>>>>> http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3Df264cb6d434=
72525ad787b0887764ea696ec52ba
>>>>>
>>>>> Can you try that svnversion call in your checkout to get thath svn
>>>>> error? It seems to be working here fine.
>>>>
>>>> $ mkdir test&& =C2=A0 cd test
>>>> $ tar xzvf
>>>> ../downloads/elementary_svn.enlightenment.org_.svn.e.trunk_56372_.tar.=
gz
>>>> $ cd elementary
>>>> $ (svnversion . | grep -v export || echo 0) | awk -F :
>>>> '{printf("%s\n",$1);}' | tr -d ':MSP\n'
>>>> 56372$
>>>
>>> The error is that the svn version is too old for the checkout. =C2=A0Is=
 there
>>> a way we can figure this out without calling svn?
>>
>> I guess you have subversion< =C2=A01.6
>> and 1.6 changed the format, so if efl repo was upgraded then it needs
>> newer svn client
>>
>> http://subversion.apache.org/docs/release-notes/1.6.html
>>
>> Maybe it's time to force subversion-native as there were issues before
>> ie with -trust-server-cert.
>
> Stupid question. =C2=A0Why aren't we just using ${SRCREV} ? =C2=A0Or is t=
his really
> bitbake calling out svn to do something?

there are some packages whose configure/makefiles munges data from scm
folders to find out *stuff* if its checked out from scm and I dont
know how
they handle the same on release tarballs.

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



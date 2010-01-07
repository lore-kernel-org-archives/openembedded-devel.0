Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NShjZ-0004fF-Pg
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 03:04:24 +0100
Received: by ywh8 with SMTP id 8so17728926ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 18:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=Bg7OiIRvBnIzDMm6rgkUVTBexpcsEsmMpPhro8xKfkY=;
	b=uMjEs+5LzVabdWuTLYfCgOYmW0zypQ3nxR7njEAStbCFxTnNJRmHSISNpwUOdV89hp
	LdAZHEwdFKv6yjw+zmzVreABIof3jH3U903vsZIpleYrhVkrN5+hgK2KbLSAOXRNU+vp
	Dh5zPYoPTfSbtqbhGKuATZA1Ha5HFG5O94DCo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=HJCxVAjaZH6WMCD/aEBqKd3o8fdSUCAZpmlfK8x7U2GzgVKWoK77KxVvT/B0y3lO3W
	h2JR14PUxplh2xqnsRIwp2Fx4FUThFl6ab7OLaOzXWaWZo3gdu8+0QF4CBrrySgEIXsi
	jEE+9HGqMbBd3opXsUHa1YOJQjX9dfVlNxCYg=
Received: by 10.150.47.2 with SMTP id u2mr16146731ybu.245.1262829736407;
	Wed, 06 Jan 2010 18:02:16 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.99.142])
	by mx.google.com with ESMTPS id 21sm8532417yxe.1.2010.01.06.18.02.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Jan 2010 18:02:12 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5zi1ghgmn1qzu@guohr-laptop-ubuntu>
	<4B42044B.8050801@nospam.arcornews.de>
	<op.u51etl01mn1qzu@guohr-laptop-ubuntu>
	<201001060459.45399.holger+oe@freyther.de>
Date: Thu, 07 Jan 2010 10:02:05 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u543xk1rmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <201001060459.45399.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why we don't setup a buildbot for openembedded QA?
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
X-List-Received-Date: Thu, 07 Jan 2010 02:04:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Wed, 06 Jan 2010 11:59:45 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Tuesday 05 January 2010 03:06:47 Guo Hongruan wrote:
>> No, I am not talking about tinderbox but buildbot. I want to setup a
>> public buildbot and validate every possible combinations of  =

>> openembedded.
>> In another words, I want to do some QA jobs of openembedded.
>
> This is a nice goal, but it is probably not the biggest concern as wel=
l.  =

> E.g.
> there is little benefit of making every version of binutils work with =
 =

> glibc and
> gcc. It is certainly cool to be able to pick any GCC, BINUTILS, GLIBC =
and
> guarnatee that it will work on any host distro. But besides being  =

> totally cool
> it is also totally wasting your time (unless your goal is to learn how=
  =

> GCC,
> BINUTILS and GLIBC interact). And the next step would be to have make =
 =

> world
> build on top of that...

Yes, I agree with you. It is not worth to make sure every combinations o=
f  =

GCC, GLIBC and BINUTILS work perfectly. For example, some versions of  =

binutils is too old to work with newest glibc/gcc and there are little  =

projects using these combinations.

But, My idea is that we can maintain a table which records which version=
  =

of package A can not work with which version of package B.
(for example, glibc-2.6.1 can not work with binutils-2.20)
So that, when the user chooses these combinations, the  =

openembedded/bitbake can give them a warning or error to indicate that  =

this combination will not work.

>
>
> I have been at your point a couple of years back (seppuku, a tinderbox=
  =

> setup,
> autobuild scripts are the result). The QA that is working best is to h=
ave
> people sign up for "maintaining" certain areas.
>
> E.g.: I'm feeling responsible for:
>
> 	- QtE, meta-toolchain-qte, qmake and such
> 	- I'm also testing mipsel from time to time
>
> Other people like pb_ feel responsible for:
> 	- DISTRO micro (I think i got it wrong)
>
> Or Khem is doing kick ass work on the toolchain bits..
>
>
>> Of course, I need help and support from all of you. I want a public  =

>> server
>> which runs python and twist and I also want any volunteer can provide=

>> their machine as build slaver when it is available.
>
> Technology is not the problem here. What use is this system if no one =
is  =

> fixing
> build problems because of a too new or too old version of GCC? What us=
e  =

> is it
> to the user to have thousands of tested configurations when he can not=
  =

> navigate
> through the list of packages?
>
>
> let me write another mail about QA topics.
>
> 	z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com



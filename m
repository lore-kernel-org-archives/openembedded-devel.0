Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OEvlu-0005Lj-EQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 04:46:07 +0200
Received: by iwn2 with SMTP id 2so3531053iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 19:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Bs96qp7DgYQeQghwOHmKg742Rj8OGecNNVnOwrcDYnA=;
	b=ZEU2MxZ/oioLlHFYXT/YdkxuuI9XuBiUxBj/Y0Ggze7zfsqIgQ2p9fi74nEhd1znpu
	CUkArNX3aAulErZMSWjQBodUUKyw0RqtM0i74ZApCZE/JOgA1/dmVgCN7287SQb2G6Wh
	b5qZ52v2Ti1KqD7u9i3gfex8LOFWZZeOclB7w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=yDekjyQNukNHAzgTQEtjCYQ36mGrsEtz8FaXRpZtmtIcqZprAdMoF58A2fgc9JHCED
	ckb4cmuxaKJ+8bJZwzfhYyFdH64nd+tfP3ObFwXx65QG9PKV/Y/x2aum/z4d81pWnSwz
	n7sU2ZVcXaCclE+GuLqpueUohAUhLFxayYAIY=
MIME-Version: 1.0
Received: by 10.231.167.144 with SMTP id q16mr1834046iby.34.1274323322645; 
	Wed, 19 May 2010 19:42:02 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Wed, 19 May 2010 19:42:02 -0700 (PDT)
In-Reply-To: <4BF48F2C.8010908@mentor.com>
References: <4BF45542.2000406@freyther.de> <20100520003151.GA26630@gmail.com>
	<4BF48F2C.8010908@mentor.com>
Date: Wed, 19 May 2010 19:42:02 -0700
Message-ID: <AANLkTinEOTHhWblON8P0-Ru-AMR9wwzElgW70kx9XgZj@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of may
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
X-List-Received-Date: Thu, 20 May 2010 02:46:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2010 at 6:23 PM, Tom Rini <tom_rini@mentor.com> wrote:
> Khem Raj wrote:
>>
>> On (20/05/10 05:16), Holger Freyther wrote:
>
> [snip]
>>>
>>> Removing old versions
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> The TSC looked into the topic of when to remove versions.
>>>
>>>
>>> The TSC thinks there can not be a general rule of when to delete
>>> a package. The TSC believes that in some cases a package should
>>> never be deleted, e.g. with GCC/GLIBC to target a specific device
>>> or distribution. For a series of major releases it seems plausible
>>> to only keep the latest minor release of each release series around
>>> given that the quality should increase with each minor release but
>>> a removal of a minor release should not be done if there is a
>>> PREFERRED_VERSION set. The TSC believes that 24 months can be a good
>>> time to remove old major releases but it is certainly not the only
>>> criteria for a removal.
>>
>> gcc makes minor releases and in general they are bug fix only releases.
>> like kernel.
>>
>> I would propose that OE count such packages with major release only.
>> e.g. gcc 4.4 (indicated 4.4.x) 4.5 and so on. This will simplify the
>> maintenance and reduce duplication, with one downside that if some DISTR=
O
>> does not need a bug fix that was say done in 4.4.4 and is currently usin=
g
>> 4.4.3 as
>> preferred cross compiler. Although chances of such cases will be low.
>
> In general, I think this will be OK. =A0But the compat with __ external d=
istro
> cases (both say old compat things or as just an example, Android 1.x uses
> gcc 4.2.1 iirc as the libgcc exception was still WIP for GPLv3) are the
> exception.

hmm yeah the license change is a given case. We have to keep 4.2.1
around because it was
 as we all know last GPLv2 release. The runtime exceptions based on
GPLv3 were not placed
until January of 2009, they were under GPLv2 runtime exception until then.

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



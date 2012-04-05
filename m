Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1SFhT9-0001Hv-R9
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 09:50:59 +0200
Received: by wibhj13 with SMTP id hj13so1137947wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2012 00:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YPfPAlhjEU9XyNFyZZRHi9rToxpEVrgMRAN2xr6kwm0=;
	b=pic3Vhk6eIqF3QQndfa/ohe28qxdjld5KbB3FmpUK5X1FM5CWm4WM2nktjBS4nm7iw
	Q9KYyRb8XeV8fqpFGsbwWIhRY99In5gcroX6u2Bt7a7VMDqO8BWIBg05azoffx0nb1AL
	ohcXXAcYNWUPK6hK6qzidnh6NFLSN0JRCKobg6CIezIaG5IIhFjCTTq9G3X8RbuQdVoN
	792E9/uCzkVCQtx4Vc2gmb0BBU5CSSymELCROSePu1QIug/i3J5lMXx5CF6UZ+6RJKNw
	cGt6LueH5xczGYdWgAUV5Ia57eJrqDT+Ik015sASCypR6do4UHG3tf87zKbtkGmhMoAz
	YJlA==
MIME-Version: 1.0
Received: by 10.216.134.2 with SMTP id r2mr1056652wei.31.1333611708516; Thu,
	05 Apr 2012 00:41:48 -0700 (PDT)
Received: by 10.223.62.6 with HTTP; Thu, 5 Apr 2012 00:41:48 -0700 (PDT)
In-Reply-To: <CAK18fxEqNka=VKjpF0yD-iExz6pBVpJuUvSCEhxtQfwmP8Qiig@mail.gmail.com>
References: <20120402210435.GA10553@hermes>
	<CAK18fxG5zusOY+WwnhBatbQ-3Kt8PUmHaafWoHTO=eWYzZ0Kyw@mail.gmail.com>
	<20120404195704.GA16410@hermes>
	<20120404200036.GI4181@jama.jama.net>
	<CAK18fxEqNka=VKjpF0yD-iExz6pBVpJuUvSCEhxtQfwmP8Qiig@mail.gmail.com>
Date: Thu, 5 Apr 2012 09:41:48 +0200
Message-ID: <CAE4k23-WKaczsEDCBohBAPpiDf9D+bk05qEPBU+qOeJ07=Fqzw@mail.gmail.com>
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
X-List-Received-Date: Thu, 05 Apr 2012 07:50:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 5, 2012 at 09:33, Andrei Gherzan <andrei@gherzan.ro> wrote:
> Or you can specify a tag in =A0src_uri. Something like SRC_URI =3D
> "git://bla.git;protocol=3Dgit;tag=3Dmytag"

Yes, you can, but please use SRCREV instead. (And let SRCREV point to
the commit that corresponds to the tagged commmit). If you use tags,
git will try to reach to server to verify the tag, while SRCREV lets
you build completely offline.

/Anders

> On Apr 4, 2012 11:01 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>
>> On Wed, Apr 04, 2012 at 09:57:04PM +0200, Apelete Seketeli wrote:
>> > Le 03-Apr-12, Andrei Gherzan a =E9crit:
>> > > On Tue, Apr 3, 2012 at 00:04, Apelete Seketeli <apelete@seketeli.net=
>
>> wrote:
>> > > >
>> > > > It seems http://svn.openmoko.org is unreachable.
>> > > > How can I resolve this issue ?
>> > > >
>> > > >
>> > > You actually cant solve this issue as the upstream link is down. You
>> have
>> > > two simple choices:
>> > > 1. Find an upstream mirror
>> > > 2. Use a local archive instead.
>> >
>> > Thanks for the advice.
>> > I decided to try this upstream mirror:
>> > http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/.
>> >
>> > So I replaced the SRC_URI as follow (hereafter is the content of
>> > opkg-utils_svn.bb):
>>
>> You need at least replace SRCREV with something valid for git as error
>> suggests.. see
>>
>> http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/opkg-utils/opkg-utils_git.bb



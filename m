Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@dominion.thruhere.net>) id 1PKvHw-00057e-Dy
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 17:00:15 +0100
Received: by gwaa11 with SMTP id a11so5187373gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 07:58:58 -0800 (PST)
Received: by 10.216.50.75 with SMTP id y53mr6597112web.85.1290527936985;
	Tue, 23 Nov 2010 07:58:56 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id a2sm2933931wer.17.2010.11.23.07.58.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Nov 2010 07:58:55 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4CEBDABB.1060607@mentor.com>
Date: Tue, 23 Nov 2010 16:58:54 +0100
Message-Id: <6EB1C564-9BA3-4833-B7F3-72EA4B2F8C51@dominion.thruhere.net>
References: <20101123113706.GA3533@lit.local.igalia.com>	<4CEBD252.7000502@mentor.com>
	<20101123145713.GA3032@lit.local.igalia.com>
	<4CEBDABB.1060607@mentor.com>
To: Tom Rini <tom_rini@mentor.com>
X-Mailer: Apple Mail (2.1082)
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: koen@dominion.thruhere.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: external-toolchain-csl-1.0-r6 fails
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
X-List-Received-Date: Tue, 23 Nov 2010 16:00:15 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 23 nov 2010, om 16:16 heeft Tom Rini het volgende geschreven:

> On 11/23/2010 07:57 AM, V=EDctor M. J=E1quez L. wrote:
>> On Tue, Nov 23, 2010 at 07:40:18AM -0700, Tom Rini wrote:
>>> On 11/23/2010 04:37 AM, V=EDctor M. J=E1quez L. wrote:
>>>> I'm trying to build minimal-image with CSL toolchain, but I got =
this error:
>>>>=20
>>>> NOTE: package external-toolchain-csl-1.0-r6: task do_install: =
Started
>>>> ERROR: TaskFailed event exception, aborting
>>>> ERROR: Build of =
/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/me=
ta/external-toolchain-csl.bb do_install failed
>>>> ERROR: Task 187 =
(/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/m=
eta/external-toolchain-csl.bb, do_install) failed with 256
>>>> ERROR: =
'/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/m=
eta/external-toolchain-csl.bb' failed
>>>> ERROR: Function do_install failed
>>>> NOTE: Task failed: ('function do_install failed', =
'/media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work=
/armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_i=
nstall.22227')
>>>> ERROR: Logfile of failure stored in: =
/media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/=
armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_in=
stall.22227
>>>> Log data follows:
>>>> | cp: cannot stat =
`/media/DISK/sgpp/arm-2010q1/arm-angstrom-linux-gnueabi/libc/lib/*': No =
such file or directory
>>>> | ERROR: Function do_install failed
>>>> NOTE: package external-toolchain-csl-1.0-r6: task do_install: =
Failed
>>>> ERROR: TaskFailed event exception, aborting
>>>>=20
>>>> For some reason the variable ${TARGET_SYS} is evaluated as
>>>> arm-angstrom-linux-gnueabi instead of arm-none-linux-gnueabi which =
is the
>>>> correct value.
>>>=20
>>> Please post your local.conf settings as well as what version of
>>> openembedded (and what branch) you are using.
>>=20
>> I'm using the openembedded's branch org.openembedded.dev (HEAD)
> [snip]
>>=20
>> If I apply this patch[1] the problem seems to be solved.
>>=20
>> 1. =
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg1=
1415.html
>=20
> I thought the patch had been applied.  Koen, do you still object after =
it was explained that currently angstrom is always going to win setting =
that variable unless it's made a ?=3D ?  Thanks!

I still object to that patch, since a different solution has been =
applied already. And I still don't see why people want to use known =
broken toolchains...=



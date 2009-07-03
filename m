Received: from [209.85.221.172] (helo=mail-qy0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jhautbois@gmail.com>) id 1MMkv6-0003GK-3m
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 17:43:24 +0200
Received: by qyk2 with SMTP id 2so2587359qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jul 2009 08:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NEsqt/hT/t2DBo1W0imTdtvFWJebqx3JMZ9spPXdW8w=;
	b=bqVD87pMzYQvxHfJf00QtjHpnYCl2uKfmmU5xsAisFWZfK0GRY8VfMknTnGeF4vNrY
	VPXPLWCsp/XcHvVa4mos6DGjRt4/DwtAin9nuxyEDGNd8mmetbNQMW40IZYiH6Xszpcs
	Fl6m3xxOisI0qBPUiWGoTQ94jR/XL27ANLyjs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WhePf3iSNZhjZIIr8VJ3UWT8o6f+awlRZmXr/nBBp4HkSVSIojBxrEjm6iMPYBtKeq
	E3jWoxDc1bNPpNso1vc/wENSzOHbKHUnbSDhOD//RP0idxD26ZJEXR66QKtIfFrwoBsI
	30268BehRyhGXOyyPUfGAwFv7NjnYwkY1oOnA=
MIME-Version: 1.0
Received: by 10.224.60.195 with SMTP id q3mr2099132qah.170.1246635073968; Fri, 
	03 Jul 2009 08:31:13 -0700 (PDT)
In-Reply-To: <1246628836.2136.26.camel@mill.internal.reciva.com>
References: <8cad0aa0907030319m60d8da2awa7a5f1685db0ee9a@mail.gmail.com>
	<1246617033.26610.65.camel@mill.internal.reciva.com>
	<8cad0aa0907030502o2d6c494cq76adf8ea124161b9@mail.gmail.com>
	<1246623479.2136.15.camel@mill.internal.reciva.com>
	<8cad0aa0907030530j5223d171la360f1c5a28b213e@mail.gmail.com>
	<1246624818.2136.16.camel@mill.internal.reciva.com>
	<8cad0aa0907030558o656e8aabu403320a9b947fe37@mail.gmail.com>
	<1246628836.2136.26.camel@mill.internal.reciva.com>
Date: Fri, 3 Jul 2009 17:31:13 +0200
Message-ID: <8cad0aa0907030831v78f16708i5d6860335bf6fca4@mail.gmail.com>
From: Jean-Michel Hautbois <jhautbois@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [GLibc]Version 2.8 and timerfd_* syscalls
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
X-List-Received-Date: Fri, 03 Jul 2009 15:43:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/7/3 Phil Blundell <philb@gnu.org>:
> On Fri, 2009-07-03 at 14:58 +0200, Jean-Michel Hautbois wrote:
>> And my branche is stable/2009.
>
> I guess that's most likely the problem; I haven't checked, but it's
> quite possible that glibc 2.9 is only in the main .dev branch and not
> (yet) in stable. =A0If that's the case, you can probably just copy the
> file over from a .dev checkout.

Well, it doesn't seem to be that simple.
I have these messages:

ERROR: see log in
/opt/devel/work/angstrom-dev/work/i586-angstrom-linux/glibc-2.9-r1/temp/log=
.staging_helper.16134
NOTE: Task failed:
/opt/devel/work/angstrom-dev/work/i586-angstrom-linux/glibc-2.9-r1/temp/log=
.staging_helper.16134
ERROR: TaskFailed event exception, aborting
ERROR: Build of /opt/devel/oe/openembedded/recipes/glibc/glibc_2.9.bb
do_setscene failed
ERROR: function staging_helper failed
ERROR: see log in
/opt/devel/work/angstrom-dev/work/i586-angstrom-linux/glibc-initial-2.9-r1/=
temp/log.staging_helper.16132
NOTE: Task failed:
/opt/devel/work/angstrom-dev/work/i586-angstrom-linux/glibc-initial-2.9-r1/=
temp/log.staging_helper.16132
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/opt/devel/oe/openembedded/recipes/glibc/glibc-initial_2.9.bb
do_setscene failed
ERROR: Task 560
(/opt/devel/oe/openembedded/recipes/glibc/glibc-initial_2.9.bb,
do_setscene) failed
NOTE: Waiting for 2 active tasks to finish
NOTE: 1: /opt/devel/oe/openembedded_sg1000/recipes/sg1000/sg1000-normal-roo=
tfs_0.1.0.bb,
do_setscene (16137)
NOTE: 2: /opt/devel/oe/openembedded/recipes/glibc/glibc_2.9.bb,
do_setscene (16134)
ERROR: Task 181
(/opt/devel/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_setscene)
failed
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /opt/devel/oe/openembedded_sg1000/recipes/sg1000/sg1000-normal-roo=
tfs_0.1.0.bb,
do_setscene (16137)
NOTE: Tasks Summary: Attempted 537 tasks of which 537 didn't need to
be rerun and 2 failed.
ERROR: '/opt/devel/oe/openembedded/recipes/glibc/glibc-initial_2.9.bb' fail=
ed
ERROR: '/opt/devel/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed

Thx and Regards,
JM



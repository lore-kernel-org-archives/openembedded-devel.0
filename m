Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PgBoG-0001Gq-S0
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 08:53:29 +0100
Received: by iwn8 with SMTP id 8so1580229iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 23:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=w8ImCvNzxTIE07gHlTnKryd3MAdmepmkjFZbgYdzbVk=;
	b=iUgJTkArRKII+IguXN6SoYBRfROAXY/xRjXBhOp7DJtRKJmQ4b9IMPlI+kWA5r4MAD
	VYX2VeqTgqMJ1/qeDZp80VSs7m2Ekl3u1q+RlBAENkW/0e5Sx+IRSJanIiEJ3+SVejEe
	tb+GVzYbK8PpuX+NxRU3Voc8Sk7d4IxT0k1ic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VotkcPlRY9DfcciHEC+ezGxtQ4f9flDMNloJms/kKp3mq7AOdTWRujZ5lQQ4DL0pA5
	Uhk/wHg4qPscgwDPl7RUUV/A9+BORxGPGzJ+18zgnN0YKx6VSkK9kPYgTQHuupZTJZQ0
	FTO0caBMdq2XpD537gFUV1sxEV6e8I30LgbVQ=
MIME-Version: 1.0
Received: by 10.231.32.140 with SMTP id c12mr333034ibd.74.1295596367649; Thu,
	20 Jan 2011 23:52:47 -0800 (PST)
Received: by 10.231.34.69 with HTTP; Thu, 20 Jan 2011 23:52:47 -0800 (PST)
In-Reply-To: <4D38D77E.7070000@mentor.com>
References: <AANLkTinhZBY4ODjB9h3y+Ep-hXBu6O85cB95h4_KFxmP@mail.gmail.com>
	<AANLkTim0+yJ+oKSteOQ-22_PCPFB_KQ0NRw73VDyq478@mail.gmail.com>
	<4D38D77E.7070000@mentor.com>
Date: Fri, 21 Jan 2011 08:52:47 +0100
Message-ID: <AANLkTi=LkWW3wOXJtmQsSPcCRrofqY15osKL2u9UBYvr@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2011-01-20
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
X-List-Received-Date: Fri, 21 Jan 2011 07:53:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/21 Tom Rini <tom_rini@mentor.com>:
> On 01/20/2011 04:00 PM, Cliff Brake wrote:
>>
>> 60+ combinations tested last week!!!
>>
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtested_2011=
-01-13
>>
>> For more information on the testing effort, please see:
>>
>> http://www.openembedded.org/index.php/Testing
>>
>> Tom has enough combinations in testing now, it may be time to think
>> about a little more automation for this.
>
> All of those combinations are tested automatically of course, so I assume
> you mean data input, and, yes please! =A0BTW, it looks like Khem fixed
> uclibc+meta-toolchain so I'll be listing all of those I hope once this
> latest run finishes.
>
> --

I'd love some more automation for data input.

Meanwhile wrt testing (distro minimal, recipe console-image), there
are a few issues that I encounter (in the jan 13 build, the testing
run for yesterdays version will start tonight)

One is when building for neek. In that case gtk-doc fails:
NOTE: package gtk-doc-1.0-r3: task do_qa_staging: Started
ERROR: QA Issue with staging: libsupc++.la failed sanity test
(workdir) in path
/home/hudson/jobs/OE_test/workspace/tmp/sysroots/nios2-linux/usr/lib
ERROR: QA Issue with staging: libstdc++.la failed sanity test
(workdir) in path
/home/hudson/jobs/OE_test/workspace/tmp/sysroots/nios2-linux/usr/lib

Anyone an idea what is wrong and how to fix it? For other targets this work=
s.

The others seem to be more general. I'll copy from the sheevaplug log.

on starting the builld, I get:
Parsing .bb files, please wait...WARNING: Deprecated usage of 'patch'
url param for '/home/hudson/jobs/OE_test/workspace/openembedded/recipes/ltp=
/ltp-20100831/runalltests.patch',
please use 'apply=3D{yes,no}'

cups gives QA errors but continues to build:
ERROR: QA Issue with cups:
/home/hudson/jobs/OE_test/workspace/tmp/work/armv5te-oe-linux-gnueabi/cups-=
1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
warning: value "Application;System;X-Red-Hat-Base;" for key
"Categories" in group "Desktop Entry" contains a deprecated value
"Application"
ERROR: QA Issue with cups:
/home/hudson/jobs/OE_test/workspace/tmp/work/armv5te-oe-linux-gnueabi/cups-=
1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
warning: key "Encoding" in group "Desktop Entry" is deprecated
ERROR: QA Issue with cups:
/home/hudson/jobs/OE_test/workspace/tmp/work/armv5te-oe-linux-gnueabi/cups-=
1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
warning: value "" for key "Path" in group "Desktop Entry" does not
look like an absolute path
ERROR: QA Issue with cups:
/home/hudson/jobs/OE_test/workspace/tmp/work/armv5te-oe-linux-gnueabi/cups-=
1.2.12-r7.2/packages-split/cups/usr/share/applications/cups.desktop:
warning: key "TerminalOptions" in group "Desktop Entry" is deprecated

and similar for htop (whatever that is):
ERROR: QA Issue with htop:
/home/hudson/jobs/OE_test/workspace/tmp/work/armv5te-oe-linux-gnueabi/htop-=
0.7-r2/packages-split/htop/usr/share/applications/htop.desktop:
warning: key "Encoding" in group "Desktop Entry" is deprecated
ERROR: QA Issue with htop:
/home/hudson/jobs/OE_test/workspace/tmp/work/armv5te-oe-linux-gnueabi/htop-=
0.7-r2/packages-split/htop/usr/share/applications/htop.desktop:
error: value "0.7" for key "Version" in group "Desktop Entry" is not a
known version
ERROR: QA Issue with htop:
/home/hudson/jobs/OE_test/workspace/tmp/work/armv5te-oe-linux-gnueabi/htop-=
0.7-r2/packages-split/htop/usr/share/applications/htop.desktop:
warning: value "" for key "Path" in group "Desktop Entry" does not
look like an absolute path
ERROR: QA Issue with htop:
/home/hudson/jobs/OE_test/workspace/tmp/work/armv5te-oe-linux-gnueabi/htop-=
0.7-r2/packages-split/htop/usr/share/applications/htop.desktop:
warning: value "ConsoleOnly;System;Application;" for key "Categories"
in group "Desktop Entry" contains a deprecated value "Application"

Guess it would be nice if someone responsible for these recipes would
peek into this.

Frans



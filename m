Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S0JCh-0006q7-2C
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 21:54:23 +0100
Received: from mail1-ch1-R.bigfish.com (10.43.68.228) by
	CH1EHSOBE011.bigfish.com (10.43.70.61) with Microsoft SMTP Server id
	14.1.225.23; Wed, 22 Feb 2012 20:15:42 +0000
Received: from mail1-ch1 (localhost [127.0.0.1])	by mail1-ch1-R.bigfish.com
	(Postfix) with ESMTP id 297672605C0	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 20:15:42 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371Ic89bh1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail1-ch1 (localhost.localdomain [127.0.0.1]) by mail1-ch1
	(MessageSwitch) id 1329941740159516_26909;
	Wed, 22 Feb 2012 20:15:40 +0000 (UTC)
Received: from CH1EHSMHS027.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.254])	by mail1-ch1.bigfish.com (Postfix) with ESMTP id
	219ED18005E for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 20:15:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS027.bigfish.com
	(10.43.70.27) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 22 Feb 2012 20:15:38 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Wed, 22 Feb 2012 14:15:41 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] gcc-cross-initial patching fails
Thread-Index: AQHM8Z7AAte8Hlc6ska6ee/JtmlKTQ==
Date: Wed, 22 Feb 2012 20:15:41 +0000
Message-ID: <CAEsOVNdi-m0y=FsJ_yu8CxK=UiPYdrV8bAV3_Y0mzKc6ft+h3g@mail.gmail.com>
References: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
In-Reply-To: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: gcc-cross-initial patching fails
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
X-List-Received-Date: Wed, 22 Feb 2012 20:54:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3A0A478EF8EDCA4ABCBC7DC7B3DD5507@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 2:13 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> At build from scratch I get
>
> ERROR: Command Error: exit status: 1 =A0Output:
> Applying patch gcc45-no-add-needed.patch
> patching file gcc/config/alpha/elf.h
> patching file gcc/config/ia64/linux.h
> patching file gcc/config/linux.h
> Hunk #1 succeeded at 89 (offset -12 lines).
> patching file gcc/config/rs6000/sysv4.h
> Hunk #1 FAILED at 908.
> 1 out of 1 hunk FAILED -- rejects in file gcc/config/rs6000/sysv4.h
> Patch gcc45-no-add-needed.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in:
> /home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5-r45+svnr181733/tem=
p/log.do_patch.5367
> NOTE: package gcc-cross-initial-4.5-r45+svnr181733: task do_patch: Failed
> ERROR: Task 2829
> (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-d=
evtools/gcc/gcc-cross-initial_4.5.bb,
> do_patch) failed with exit code '1'
>
> git log does not help me much - =A0what goes wrong?

Which actual patch is it failing on? Is there a conflict between
oe-core and meta-oe patch set against gcc?

-M=




Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=VA3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RsHYT-0001MW-Q0
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 18:31:42 +0100
Received: from mail182-va3-R.bigfish.com (10.7.14.251) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.23; Tue, 31 Jan 2012 16:53:36 +0000
Received: from mail182-va3 (localhost [127.0.0.1])	by
	mail182-va3-R.bigfish.com (Postfix) with ESMTP id 569BF1E00EE	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 16:53:36 +0000 (UTC)
X-SpamScore: -19
X-BigFish: VS-19(zzbb2dI154cP9371I936eK1432N98dKzz1202hzz8275chz2dhc1bhc31hc1ah2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail182-va3 (localhost.localdomain [127.0.0.1]) by mail182-va3
	(MessageSwitch) id 1328028814965888_29174;
	Tue, 31 Jan 2012 16:53:34 +0000 (UTC)
Received: from VA3EHSMHS036.bigfish.com (unknown [10.7.14.239])	by
	mail182-va3.bigfish.com (Postfix) with ESMTP id E3C0438004D	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 16:53:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS036.bigfish.com
	(10.7.99.46) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 31 Jan 2012 16:53:31 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Tue, 31 Jan 2012 10:53:30 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 3/3] pidgin: Add gconf to RDEPENDS for
	libpurple.
Thread-Index: AQHM4Djb//dap7lLjk6uXOpRUwEfpA==
Date: Tue, 31 Jan 2012 16:53:29 +0000
Message-ID: <CAEsOVNc+FnZf4hqDrHYE3AcjPO6wM3vFReQkbppJV9uqo=+tqQ@mail.gmail.com>
References: <1327952855-28040-1-git-send-email-tworaz666@gmail.com>
	<jg6sti$vjj$1@dough.gmane.org> <4F26FD7E.5040908@gmail.com>
	<jg87do$beo$1@dough.gmane.org>
In-Reply-To: <jg87do$beo$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH 3/3] pidgin: Add gconf to RDEPENDS for libpurple.
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
X-List-Received-Date: Tue, 31 Jan 2012 17:31:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <25A4F23F8D904D4DBA2C358B9BB44754@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 2:06 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 30-01-12 21:28, Peter Tworek schreef:
>> On 01/30/2012 09:00 PM, Koen Kooi wrote: Op 30-01-12 20:47, Peter Tworek
>> schreef:
>>>>> Without it postinst script for libpurple fails when gconf is not
>>>>> installed: //var/lib/opkg/info/libpurple.postinst: line 8:
>>>>> gconftool-2: command not found
>> Why is gconf.bbclass failing to do that?
>>> As far as I understand it only adds gconf to DEPENDS. If a package
>>> contents are not linked with libgconf-2 (libpurple only needs
>>> gconftool-2) gconf won't be pulled in as a runtime dependency.
>
> That means it's a bug in gconf.bbclass and needs to get fixed there.

Really? Do you really want to automatically add gconf deps to the
misc. packages added by a recipe?

-M=




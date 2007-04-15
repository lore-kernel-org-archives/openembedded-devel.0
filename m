Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HcvNK-0006Ct-Em
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Apr 2007 05:26:04 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id EA4C5215055
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2007 23:26:04 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sat, 14 Apr 2007 23:26:02 -0400
X-Sasl-enc: aaPNBeakPMQAYzyXUJRA8Ftez5eof+N9JbqrP86mnxR1 1176607561
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 8B70333A4E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2007 23:26:01 -0400 (EDT)
Message-ID: <46219AF1.3020006@whitby.id.au>
Date: Sun, 15 Apr 2007 12:54:33 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <461F4C4A.7010401@whitby.id.au>	<200704131148.32947.openembedded@hrw.one.pl>
	<1176458438.5836.12.camel@localhost.localdomain>
In-Reply-To: <1176458438.5836.12.camel@localhost.localdomain>
Subject: Re: Where should MACHINE_TASK_PROVIDER be defined?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Apr 2007 03:26:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Fri, 2007-04-13 at 11:48 +0200, Marcin Juszkiewicz wrote:
>> Dnia pi=C4=85tek, 13 kwietnia 2007, Rod Whitby napisa=C5=82:
>>> There seems to be significant inconsistency in the way that
>>> MACHINE_TASK_PROVIDER is defined in OE (see the output of a recursive
>>> grep command in .../conf at the end of this message).
>>>
>>> It's defaulted to "task-base" in bitbake.conf, and then every man and
>>> his dog forcibly defines it to the same thing in a variety of
>>> machine.conf files and distro.conf files.
>>>
>>> Should all of these instances simply be deleted
>> Yes - most of them are from time when we had task-bootstrap as default=
.
>=20
> Agreed.
>=20
> They're from the transition period when task-bootstrap was default and
> each machine had to be tagged as it was converted. All the duplicates
> can now be removed since the default has changed.

This has now been done and committed.

-- Rod



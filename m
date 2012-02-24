Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S0zSQ-0007Im-P3
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 19:01:26 +0100
Received: from mail74-db3-R.bigfish.com (10.3.81.236) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.23; Fri, 24 Feb 2012 17:22:54 +0000
Received: from mail74-db3 (localhost [127.0.0.1])	by mail74-db3-R.bigfish.com
	(Postfix) with ESMTP id 83A5F4E0414	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 17:22:54 +0000 (UTC)
X-SpamScore: -8
X-BigFish: VS-8(zzbb2dI9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail74-db3 (localhost.localdomain [127.0.0.1]) by mail74-db3
	(MessageSwitch) id 1330104173636831_10811;
	Fri, 24 Feb 2012 17:22:53 +0000 (UTC)
Received: from DB3EHSMHS019.bigfish.com (unknown [10.3.81.244])	by
	mail74-db3.bigfish.com (Postfix) with ESMTP id 970E514001D	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 17:22:53 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS019.bigfish.com
	(10.3.87.119) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 24 Feb 2012 17:22:52 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Fri, 24 Feb 2012 11:22:51 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe] gcc-4_6-branch-linaro-backports.inc: allow
	GCC-4_6-BRANCH-LINARO-BACKPORTS to be overridden
Thread-Index: AQHM8cyN9ALMyTkHfkmhlltsZVgqTQ==
Date: Fri, 24 Feb 2012 17:22:50 +0000
Message-ID: <CAEsOVNe115uh6Lg3Hx+ioS41vCJSJcJPssKOW23ax5T2rknbJA@mail.gmail.com>
References: <1329940246-28769-1-git-send-email-msm@freescale.com>
	<CAMKF1soS46XnYge0YoU5Zt+4tUX5SJKP=BhdHhn0CR+Hi9avjQ@mail.gmail.com>
	<CAEsOVNcYjwCPq625HP3Oj5hswupj-qNnGCxKFmS2VCkYwpU_ZA@mail.gmail.com>
	<20120224082939.GC2519@sakrah.homelinux.org>
In-Reply-To: <20120224082939.GC2519@sakrah.homelinux.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe] gcc-4_6-branch-linaro-backports.inc: allow GCC-4_6-BRANCH-LINARO-BACKPORTS to be overridden
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
X-List-Received-Date: Fri, 24 Feb 2012 18:01:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2816FA4173AD484A926172FF91C78603@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 2:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On (23/02/12 01:43), McClintock Matthew-B29882 wrote:
>> On Wed, Feb 22, 2012 at 3:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Wed, Feb 22, 2012 at 11:50 AM, Matthew McClintock <msm@freescale.co=
m> wrote:
>> >> This is useful when we want to include meta-oe as is, and also
>> >> want to modify the toolchain such that these patches don't apply
>> >> cleanly
>> >
>> > I think the right thing to do is to spin this out into a layer of its
>> > own. which we discussed on another thread.
>> > if your intention is to just get non/oe-core overridden recipes from
>> > meta-oe. This patch not really incorrect
>> > but can be then avoided.
>>
>> How can I avoid this? If I add the meta-oe layer and I'm using gcc-4.6
>> then these seem to always get pulled in via SRC_URI_append? Is there a
>> better work around here?
>
> Right now no unless we move it out into a layer of its own

Can we apply this in the interim?

-M=




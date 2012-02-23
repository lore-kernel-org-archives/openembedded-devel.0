Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=VA3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S0OYR-0002Nr-7X
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 03:37:11 +0100
Received: from mail146-va3-R.bigfish.com (10.7.14.254) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.23; Thu, 23 Feb 2012 01:43:31 +0000
Received: from mail146-va3 (localhost [127.0.0.1])	by
	mail146-va3-R.bigfish.com (Postfix) with ESMTP id 234B41200A6	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 01:43:31 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail146-va3 (localhost.localdomain [127.0.0.1]) by mail146-va3
	(MessageSwitch) id 1329961408568634_24989;
	Thu, 23 Feb 2012 01:43:28 +0000 (UTC)
Received: from VA3EHSMHS032.bigfish.com (unknown [10.7.14.239])	by
	mail146-va3.bigfish.com (Postfix) with ESMTP id 84D95360049	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 01:43:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS032.bigfish.com
	(10.7.99.42) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 23 Feb 2012 01:43:28 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Wed, 22 Feb 2012 19:43:33 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe] gcc-4_6-branch-linaro-backports.inc: allow
	GCC-4_6-BRANCH-LINARO-BACKPORTS to be overridden
Thread-Index: AQHM8cyN9ALMyTkHfkmhlltsZVgqTQ==
Date: Thu, 23 Feb 2012 01:43:32 +0000
Message-ID: <CAEsOVNcYjwCPq625HP3Oj5hswupj-qNnGCxKFmS2VCkYwpU_ZA@mail.gmail.com>
References: <1329940246-28769-1-git-send-email-msm@freescale.com>
	<CAMKF1soS46XnYge0YoU5Zt+4tUX5SJKP=BhdHhn0CR+Hi9avjQ@mail.gmail.com>
In-Reply-To: <CAMKF1soS46XnYge0YoU5Zt+4tUX5SJKP=BhdHhn0CR+Hi9avjQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Feb 2012 02:37:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <460B8578DC79534C9FE649396647C415@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 3:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Feb 22, 2012 at 11:50 AM, Matthew McClintock <msm@freescale.com> =
wrote:
>> This is useful when we want to include meta-oe as is, and also
>> want to modify the toolchain such that these patches don't apply
>> cleanly
>
> I think the right thing to do is to spin this out into a layer of its
> own. which we discussed on another thread.
> if your intention is to just get non/oe-core overridden recipes from
> meta-oe. This patch not really incorrect
> but can be then avoided.

How can I avoid this? If I add the meta-oe layer and I'm using gcc-4.6
then these seem to always get pulled in via SRC_URI_append? Is there a
better work around here?

gcc-4.6.bbappend:

SRC_URI_append =3D " ${GCC-4_6-BRANCH-LINARO-BACKPORTS}"

-M=




Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T9hFD-00010f-T7
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 20:56:04 +0200
Received: from mail261-va3-R.bigfish.com (10.7.14.241) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.23; Thu, 6 Sep 2012 18:13:26 +0000
Received: from mail261-va3 (localhost [127.0.0.1])	by
	mail261-va3-R.bigfish.com (Postfix) with ESMTP id E28D013001A4;
	Thu,  6 Sep 2012 18:13:26 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275ch8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i1155h)
Received: from mail261-va3 (localhost.localdomain [127.0.0.1]) by mail261-va3
	(MessageSwitch) id 1346955205118496_11053;
	Thu,  6 Sep 2012 18:13:25 +0000 (UTC)
Received: from VA3EHSMHS001.bigfish.com (unknown [10.7.14.236])	by
	mail261-va3.bigfish.com (Postfix) with ESMTP id 108CBFC004C;
	Thu,  6 Sep 2012 18:13:25 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS001.bigfish.com
	(10.7.99.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 6 Sep 2012 18:13:18 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.37]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Thu, 6 Sep 2012 13:13:18 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][for-denzil][PATCH 3/8] kernel: Add kernel
	headers to kernel-dev package
Thread-Index: AQHNjE7IaDKrJJaX70eKlqYrWIvTW5d92a2AgAAX/wA=
Date: Thu, 6 Sep 2012 18:13:17 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6580CB@039-SN1MPN1-003.039d.mgd.msft.net>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
	<1346930610-2977-3-git-send-email-koen@dominion.thruhere.net>
	<70CC66F5C30A414DADDA6973E4CA391A657F94@039-SN1MPN1-003.039d.mgd.msft.net>
	<BE26FFE4-B5E9-4C9C-9398-4A164C12BB88@dominion.thruhere.net>
In-Reply-To: <BE26FFE4-B5E9-4C9C-9398-4A164C12BB88@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	=?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe][for-denzil][PATCH 3/8] kernel: Add kernel headers to kernel-dev package
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
X-List-Received-Date: Thu, 06 Sep 2012 18:56:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0FEA57E6FA292D4FA126669CC20FE236@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 6, 2012 at 11:47 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 6 sep. 2012, om 18:43 heeft McClintock Matthew-B29882 <B29882@freescal=
e.com> het volgende geschreven:
>
>> On Thu, Sep 6, 2012 at 6:23 AM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>>> From: Darren Hart <dvhart@linux.intel.com>
>>>
>>> [YOCTO #1614]
>>>
>>> Add the kernel headers to the kernel-dev package. This packages what wa=
s
>>> already built and kept in sysroots for building modules with bitbake.
>>> Making this available on the target requires removing some additional
>>> host binaries.
>>>
>>> Move the location to /usr/src/kernel
>>>
>>> Before use on the target, the user will need to:
>>>
>>>    # cd /usr/src/kernel
>>>    # make scripts
>>>
>>> This renders the kernel-misc recipe empty, so remove it.
>>>
>>> As we use /usr/src/kernel in several places (and I missed one in the
>>> previous version), add a KERNEL_SRC_DIR variable and use that throughou=
t
>>> the class to avoid update errors in the future.
>>>
>>> Now that we package the kernel headers, drop the
>>> kernel_package_preprocess function which removed them from PKGD.
>>>
>>> All *-sdk image recipes include dev-pkgs, so the kernel-dev package wil=
l
>>> be installed by default on all such images.
>>>
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> CC: Tom Zanussi <tom.zanussi@intel.com>
>>> CC: Khem Raj <raj.khem@gmail.com>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>
>> Why did you resent this? Are there changes or by accident? Just asking
>> before I make a patch for denzil with my previous fix.
>
> This is for the meta-oe kernel.bbclass, not the oe-core one :)

Ah! Missed that Thanks.

-M=




Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SpQaS-0007m3-TI
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2012 23:06:13 +0200
Received: from mail195-co1-R.bigfish.com (10.243.78.242) by
	CO1EHSOBE008.bigfish.com (10.243.66.71) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Jul 2012 20:24:46 +0000
Received: from mail195-co1 (localhost [127.0.0.1])	by
	mail195-co1-R.bigfish.com (Postfix) with ESMTP id D45068C0331	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2012 20:24:46 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275ch8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail195-co1 (localhost.localdomain [127.0.0.1]) by mail195-co1
	(MessageSwitch) id 1342124685127345_32364;
	Thu, 12 Jul 2012 20:24:45 +0000 (UTC)
Received: from CO1EHSMHS005.bigfish.com (unknown [10.243.78.248])	by
	mail195-co1.bigfish.com (Postfix) with ESMTP id 13CF760051	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2012 20:24:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS005.bigfish.com
	(10.243.66.15) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Jul 2012 20:24:44 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Thu, 12 Jul 2012 15:24:46 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-openembedded v2] cramfs_cvs.bb: fix compile step so
	it can be rerun without failing
Thread-Index: AQHNYGncWkoa8OzIJUKAB+J5oYS/IJcma2cAgAAAPgA=
Date: Thu, 12 Jul 2012 20:24:45 +0000
Message-ID: <CAEsOVNfHTsNfkDzFcp0b9YA0v=QTEYBbQ0Lpf+07C9pNZj1AOQ@mail.gmail.com>
References: <CAEsOVNdKQOA1bHMfptKGm7aAabpAxb7+uR7zYxp_W8T9Pf7Tdw@mail.gmail.com>
	<1341590515-9567-1-git-send-email-msm@freescale.com>
	<CAEsOVNd+w9zgA7SdEDHF24M9fNb+W2pH5rGCX0eyHdwRsFsctA@mail.gmail.com>
	<E727CCC8-CDEC-45FD-A894-70EE269EA8B3@dominion.thruhere.net>
In-Reply-To: <E727CCC8-CDEC-45FD-A894-70EE269EA8B3@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [meta-openembedded v2] cramfs_cvs.bb: fix compile step so it can be rerun without failing
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
X-List-Received-Date: Thu, 12 Jul 2012 21:06:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1BD08B7663D3994F84DAE927981E694B@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2012 at 3:23 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> I missed it in patchwork because it lacked the 'meta-oe' tag in the subje=
ct. I suck at keeping up with the mailinglist :(

Ah, I had meta-openembedded in v2 ;)

-M

>
> Op 12 jul. 2012 om 22:06 heeft McClintock Matthew-B29882 <B29882@freescal=
e.com> het volgende geschreven:
>
>> Koen,
>>
>> Did I miss something for this patch?
>>
>> -M
>>
>> On Fri, Jul 6, 2012 at 11:01 AM, Matthew McClintock <msm@freescale.com> =
wrote:
>>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>>> ---
>>> v2: - use ln -sf instead of separate unlink command
>>>
>>> meta-oe/recipes-support/cramfs/cramfs_cvs.bb |    3 ++-
>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb b/meta-oe/rec=
ipes-support/cramfs/cramfs_cvs.bb
>>> index 667097c..d9b6c06 100644
>>> --- a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
>>> +++ b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
>>> @@ -4,6 +4,7 @@ LIC_FILES_CHKSUM =3D "file://${WORKDIR}/linux/COPYING;m=
d5=3D9579385572eb40eded61dcb0
>>> DEPENDS =3D "zlib"
>>> SRCDATE =3D "20110110"
>>> PV =3D "1.1+cvs${SRCDATE}"
>>> +PR =3D "r1"
>>>
>>> SRC_URI =3D "cvs://anonymous@cramfs.cvs.sourceforge.net/cvsroot/cramfs;=
module=3Dlinux"
>>> S =3D "${WORKDIR}/linux/scripts/cramfs"
>>> @@ -16,7 +17,7 @@ EXTRA_OEMAKE =3D "\
>>>
>>>
>>> do_compile_prepend() {
>>> -        ln -s GNUmakefile Makefile
>>> +        ln -sf GNUmakefile Makefile
>>> }
>>>
>>> do_install() {
>>> --
>>> 1.7.10
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=




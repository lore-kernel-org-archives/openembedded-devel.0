Received: from tritech.se ([91.191.137.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1QjWfY-0001PY-26
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 15:18:32 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p6KDEKFq031702
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:14:25 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Wed, 20 Jul 2011 15:14:20 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Added header file to linux kernel - how to export
Thread-Index: AcxGD4ih4YSdUb0mRcCpV/r1/P2CaQADDFeKAACs9iAAIzpLAAAMqOUP
Date: Wed, 20 Jul 2011 13:14:19 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C06CB64@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C06CA55@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C06CA7F@post.tritech.se>
	<09D9BE2AC4AA764DABAA8C91E48D819E0157569991@DEMCHP99E35MSX.ww902.siemens.net>,
	<20110720090459.GA3173@mi.fu-berlin.de>
In-Reply-To: <20110720090459.GA3173@mi.fu-berlin.de>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Re: Added header file to linux kernel - how to export
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
X-List-Received-Date: Wed, 20 Jul 2011 13:18:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

@ Fabrice & Henning:=0A=
=0A=
Thank you both for your support! I ended up with:=0A=
=0A=
## Export patched in header files for access by other recipes=0A=
do_install_append_mymachine() {=0A=
        cp ${S}/arch/powerpc/include/asm/myfile.h ${STAGING_DIR_TARGET}${in=
cludedir}/asm/=0A=
}=0A=
=0A=
Works fine but I'm a bit confused about the number of "STAGING_" definition=
s in the environment. It's not always easy to pick the right one, e.g. STAG=
ING_DIR_TARGET and STAGING_DIR_HOST both points to the same location...=0A=
=0A=
Best Regards,=0A=
Mats=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Henning Heinold [heinold@inf.=
fu-berlin.de]=0A=
Sent: Wednesday, July 20, 2011 11:05 AM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] Added header file to linux kernel - how to export=0A=
=0A=
On Tue, Jul 19, 2011 at 08:14:14PM +0200, Aeschbacher, Fabrice wrote:=0A=
> Hi,=0A=
>=0A=
> Your could put something like this:=0A=
>=0A=
> do_stage_append() {=0A=
>       cp ${S}/my_ioctl.h ${STAGING_KERNEL_DIR}/include/linux=0A=
> }=0A=
>=0A=
> in your recipes/linux<xxx>.bb=0A=
>=0A=
> With kind regards,=0A=
>    Fabrice=0A=
=0A=
Hi,=0A=
=0A=
do_stage shouldn't be used anymore. Do it via do_install method.=0A=
=0A=
=0A=
Bye Henning=0A=
=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=



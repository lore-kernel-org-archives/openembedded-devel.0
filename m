Received: from tritech.se ([91.191.137.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1QjnIP-0000Su-TA
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 09:03:46 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p6L6xXEg000964
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 08:59:38 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Thu, 21 Jul 2011 08:59:33 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Added header file to linux kernel - how to export
Thread-Index: AcxGD4ih4YSdUb0mRcCpV/r1/P2CaQADDFeKAACs9iAAIzpLAAAMqOUPAACMLCAAImt/tg==
Date: Thu, 21 Jul 2011 06:59:32 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C06CC57@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C06CA55@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C06CA7F@post.tritech.se>
	<09D9BE2AC4AA764DABAA8C91E48D819E0157569991@DEMCHP99E35MSX.ww902.siemens.net>,
	<20110720090459.GA3173@mi.fu-berlin.de>
	<ED3E0BCACD909541BA94A34C4A164D4C06CB64@post.tritech.se>,
	<09D9BE2AC4AA764DABAA8C91E48D819E0157569AF9@DEMCHP99E35MSX.ww902.siemens.net>
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819E0157569AF9@DEMCHP99E35MSX.ww902.siemens.net>
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
X-List-Received-Date: Thu, 21 Jul 2011 07:03:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

@ Fabrice=0A=
OK, I hear what you're saying.=0A=
I've read about "packaged staging" and it seem to be "a good thing" (http:/=
/marcin.juszkiewicz.com.pl/2008/07/01/packaged-staging-and-what-it-gives/).=
=0A=
I did try using "oe_stage_append_mymachine()" but got an error saying somet=
hing like "there is no oe_stage so you can't append, use oe_stage() instead=
". So I tried "oe_stage_mymachine()" but still got the same error... Then I=
 tried "oe_stage()" that worked but I don't wan't to do it "unqualified". (=
I'm using OE "tested_2010-12-30", maybe this is fixed in later releases.)=
=0A=
=0A=
@ Henning=0A=
Regarding not using "do_stage" I found this: "https://wiki.yoctoproject.org=
/wiki/Merging_packages_from_OpenEmbedded" and know that Yocto and OE are ge=
tting closer involved. Also I found posts about "kernel_do_stage()" from ke=
rnel.bbclass but I have no such function in my OE version.=0A=
This info "http://openembedded.org/index.php/Legacy_staging" suggests STAGI=
NG_INCDIR -> ${D}${includedir} but that doesn't make sense to me because I =
want the file where other recipes could reach it.=0A=
I have seen your comments on other posts also saying "don't use do_stage". =
Could you please point me off to somewhere where I could get the background=
 and what would be "the right" way to do this?=0A=
=0A=
Best regards,=0A=
Mats=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Aeschbacher, Fabrice [Fabrice=
.Aeschbacher@siemens.com]=0A=
Sent: Wednesday, July 20, 2011 3:28 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] Added header file to linux kernel - how to export=0A=
=0A=
Mats,=0A=
=0A=
Installing myfile.h during do_install() certainly works for you right now.=
=0A=
=0A=
But it won't if you plan to use packaged-staging in the future. Hence my ad=
vice to do this rather during do_stage()=0A=
=0A=
With kind regards,=0A=
   Fabrice=0A=
=0A=
> -----Urspr=FCngliche Nachricht-----=0A=
> Von: openembedded-devel-bounces@lists.openembedded.org=0A=
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im=0A=
> Auftrag von Mats K=E4rrman=0A=
> Gesendet: Mittwoch, 20. Juli 2011 15:14=0A=
> An: openembedded-devel@lists.openembedded.org=0A=
> Betreff: Re: [oe] Added header file to linux kernel - how to export=0A=
>=0A=
> @ Fabrice & Henning:=0A=
>=0A=
> Thank you both for your support! I ended up with:=0A=
>=0A=
> ## Export patched in header files for access by other recipes=0A=
> do_install_append_mymachine() {=0A=
>         cp ${S}/arch/powerpc/include/asm/myfile.h=0A=
> ${STAGING_DIR_TARGET}${includedir}/asm/=0A=
> }=0A=
>=0A=
> Works fine but I'm a bit confused about the number of=0A=
> "STAGING_" definitions in the environment. It's not always=0A=
> easy to pick the right one, e.g. STAGING_DIR_TARGET and=0A=
> STAGING_DIR_HOST both points to the same location...=0A=
>=0A=
> Best Regards,=0A=
> Mats=0A=
>=0A=
> ________________________________________=0A=
> From: openembedded-devel-bounces@lists.openembedded.org=0A=
> [openembedded-devel-bounces@lists.openembedded.org] on behalf=0A=
> of Henning Heinold [heinold@inf.fu-berlin.de]=0A=
> Sent: Wednesday, July 20, 2011 11:05 AM=0A=
> To: openembedded-devel@lists.openembedded.org=0A=
> Subject: Re: [oe] Added header file to linux kernel - how to export=0A=
>=0A=
> On Tue, Jul 19, 2011 at 08:14:14PM +0200, Aeschbacher, Fabrice wrote:=0A=
> > Hi,=0A=
> >=0A=
> > Your could put something like this:=0A=
> >=0A=
> > do_stage_append() {=0A=
> >       cp ${S}/my_ioctl.h ${STAGING_KERNEL_DIR}/include/linux=0A=
> > }=0A=
> >=0A=
> > in your recipes/linux<xxx>.bb=0A=
> >=0A=
> > With kind regards,=0A=
> >    Fabrice=0A=
>=0A=
> Hi,=0A=
>=0A=
> do_stage shouldn't be used anymore. Do it via do_install method.=0A=
>=0A=
>=0A=
> Bye Henning=0A=
>=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=
>=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=
>=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=



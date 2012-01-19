Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1Rnq88-0001Hl-0n
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 12:26:08 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id q0JB3Ef4013289
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 12:03:19 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0247.003; Thu, 19 Jan 2012 12:03:14 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [2011.03-maintenance] Packaged staging -- dependency problem
Thread-Index: AQHM1pnVxfoD9k6Qw0Wtdyefw0bbVA==
Date: Thu, 19 Jan 2012 11:03:14 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4023595B@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.38]
MIME-Version: 1.0
Subject: Re: [2011.03-maintenance] Packaged staging -- dependency problem
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
X-List-Received-Date: Thu, 19 Jan 2012 11:26:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Tom Rini [tom.rini@gmail.co=
m]=0A=
> Sent: Wednesday, January 18, 2012 7:56 PM=0A=
> To: openembedded-devel@lists.openembedded.org=0A=
> Subject: Re: [oe] [2011.03-maintenance] Packaged staging -- dependency  p=
roblem=0A=
> =0A=
> On Wed, Jan 18, 2012 at 8:51 AM, Mats K=E4rrman <Mats.Karrman@tritech.se>=
 wrote:=0A=
> > Well, now at least it pulls packages from the mirror instead of buildin=
g them but there is a but.=0A=
> >=0A=
> > When building glib-2.0, do_configure uses autotools and the configure s=
cript of glib-2.0 wants to use sed from sysroots. sed-native exists in the =
mirror but has not been installed in sysroots. I am uncertain where the dep=
endency on sed (or sed-native?) is missing/should be added. In the glib rec=
ipe or for autotools class? (this time i looked in master but found no rele=
vant patches.)=0A=
> >=0A=
> > Any advice?=0A=
> =0A=
> I think you're going to find that without a lot of additional work,=0A=
> packaged-staging isn't going to be helpful beyond you and your=0A=
> machine.  A lot of the lessons learned in making packaged-staging work=0A=
> better are found in sstate-cache in oe-core.  The easiest fix here is=0A=
> to add ASSUME_PROVIDED +=3D "sed-native" to your local.conf / similar so=
=0A=
> that sed-native isn't built and your host one is used.=0A=
> =0A=
> --=0A=
> Tom=0A=
> =0A=
=0A=
I am keeping it to one machine and still there is problems.=0A=
After cleaning everything and starting over using ASSUME_PROVIDED for sed-n=
ative and excluding some other stuff from the image that I could do without=
 I finally got it to build all the way.=0A=
=0A=
Not something I will use for the build server but perhaps usable for day-to=
-day development work; I did manage to cut the build time in half! :)=0A=
=0A=
Since the package-staging.bbclass patch worked as supposed I will submit a =
pull request for that and you may take it if you think it's useful for othe=
rs.=0A=
=0A=
Thanks,=0A=
Mats=0A=
=0A=
> =0A=



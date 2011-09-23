Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1R74NP-0003sj-2t
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 13:57:07 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p8NBpeXw032272
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2011 13:51:46 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Fri, 23 Sep 2011 13:51:40 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] How to track custom packages during development?
Thread-Index: Acx5xJktpO6UYXyJTAmSVuV3TjLD1f//49YAgABfhcM=
Date: Fri, 23 Sep 2011 11:51:40 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C40135037@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C40134FF1@post.tritech.se>,
	<20110923080330.GB9004@jama.jama.net>
In-Reply-To: <20110923080330.GB9004@jama.jama.net>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Re: How to track custom packages during development?
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
X-List-Received-Date: Fri, 23 Sep 2011 11:57:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks Martin!=0A=
=0A=
Now I don't have the source in a separate SCM repo but instead in the "file=
s" sub folder of the recipe in my local OE overlay (that is in SCM of cours=
e). However your suggestion set me of in the right direction, just adding=
=0A=
=0A=
PV .=3D ".dev2"=0A=
=0A=
to my recipe accomplished what I wanted. I just didn't realize that it was =
so simple.=0A=
=0A=
// Mats=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Martin Jansa [martin.jansa@gm=
ail.com]=0A=
Sent: Friday, September 23, 2011 10:03 AM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] How to track custom packages during development?=0A=
=0A=
On Fri, Sep 23, 2011 at 07:48:06AM +0000, Mats K=E4rrman wrote:=0A=
> Hi!=0A=
>=0A=
> I'm using OE classic for a product I'm developing. Included in the produc=
t are some proprietary software applications that I build using OE recipes.=
 In an Agile development spirit :) these applications are frequently update=
d and distributed to the customer using .ipk's. Now to the question:=0A=
>=0A=
> How do I best manage versions of these packages without having to create =
a new recipe for each?=0A=
>=0A=
> E.g. can I have a recipe xxxx-1.0 that has a variable that is included in=
 the ipk filename and version?=0A=
=0A=
If they are built from SCM then SRCPV should be included in PV and it=0A=
will end in filename and version :).=0A=
=0A=
Also you can use AUTOREV to build always the latest HEAD if needed.=0A=
=0A=
>=0A=
> All suggestions are welcome!=0A=
>=0A=
> Thanks,=0A=
> Mats=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=
=0A=
--=0A=
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com=0A=



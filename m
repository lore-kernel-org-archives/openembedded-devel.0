Return-Path: <rcagle@omnitron-systems.com>
Received: from mail01.omnitron-systems.com (mail01.omnitron-systems.com
	[70.169.247.114])
	by mail.openembedded.org (Postfix) with ESMTP id 097E271A31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 04:47:31 +0000 (UTC)
Received: from OSCAR.ostdom.com ([fe80::2158:4d9b:82b3:313d]) by
	oscar.ostdom.com ([fe80::2158:4d9b:82b3:313d%14]) with mapi id
	14.03.0319.002; Mon, 12 Dec 2016 20:47:32 -0800
From: Robert Cagle <rcagle@omnitron-systems.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] bitbake dependency question
Thread-Index: AdJU5iU1LANZZXXMQKOKaHr7Dnu+lQARkN2A//+VNKs=
Date: Tue, 13 Dec 2016 04:47:31 +0000
Message-ID: <44E60BE3F360494194A33E0B8411CB9A62AE16@oscar.ostdom.com>
References: <44E60BE3F360494194A33E0B8411CB9A62ADD8@oscar.ostdom.com>,
	<eb581f04-c965-f26c-97c2-3b04fd639515@windriver.com>
In-Reply-To: <eb581f04-c965-f26c-97c2-3b04fd639515@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [108.184.166.78]
MIME-Version: 1.0
Subject: Re: bitbake dependency question
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2016 04:47:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Try something like:=0A=
> In recipeD.bb:=0A=
> PLUGIN_RECIPES ??=3D "A" (or b, c)=0A=
> DEPENDS =3D "${PLUGIN_RECIPES} other..."=0A=
=0A=
> In local.conf:=0A=
> PLUGIN_RECIPES =3D "A" (or b, c).=0A=
=0A=
Hi Robert,=0A=
Thanks for the response! My current solution is similar to what you suggest=
:=0A=
=0A=
local.conf=0A=
PLUGIN_RECIPES =3D "recipeA recipeB recipeC"=0A=
=0A=
recipeD.bb:=0A=
DEPENDS =3D "${PLUGIN_RECIPES} other"=0A=
=0A=
I'm assuming the weak reference in 'PLUGIN_RECIPES ??=3D "A" (or b, c)'  is=
 to prevent errors if someone forgets to define PLUGIN_RECIPES in local.con=
f?=0A=
=0A=
I was hoping to do something like this in an image recipe:=0A=
my-image.bb:=0A=
   IMAGE_INSTALL_append =3D " recipeA  recipeB recipeC recipeD"=0A=
and have the rest happen automatically based on the contents of those recip=
es.=0A=
=0A=
However, maybe I could at least do:=0A=
my-image.bb:=0A=
   IMAGE_INSTALL_append =3D " ${PLUGIN_RECIPES} recipeD  other..."=0A=
=0A=
and have everything controlled from local.conf by one variable. I'd rather =
have it the other way around (defined once in my-image.bb), but I can live =
with this. Thanks again!=0A=
=0A=
-Bob=0A=
________________________________________=0A=
From: Robert Yang [liezhi.yang@windriver.com]=0A=
Sent: Monday, December 12, 2016 6:33 PM=0A=
To: openembedded-devel@lists.openembedded.org; Robert Cagle=0A=
Subject: Re: [oe] bitbake dependency question=0A=
=0A=
Hi Robert=0A=
=0A=
On 12/13/2016 10:10 AM, Robert Cagle wrote:=0A=
> I'm trying to figure out a reasonable way to specify dependencies on an u=
nknown/virtual set of other recipes.=0A=
> For example,=0A=
>=0A=
> Recipe A: Plugin #1 (installs a plugin spec somewhere in /usr/share)=0A=
> Recipe B: Plugin #2 (same)=0A=
> Recipe C: Plugin #3 (same).=0A=
> Recipe D: Host Application (C based), which needs to be compiled last sin=
ce it generates C code based on the spec files.=0A=
>=0A=
> I'd rather not hard-code dependencies in Recipe D since the specific set =
of plugins may be different depending on the specified distribution layer o=
r machine type. I can define a variable in local.conf and use it to define =
D's dependencies, but that means I'll have to define the set twice: in the =
distribution layer and in local.conf. Based on what I've read and experimen=
ted with, this seems be my only choice (other than restructuring the applic=
ation).=0A=
>=0A=
=0A=
Try something like:=0A=
In recipeD.bb:=0A=
PLUGIN_RECIPES ??=3D "A" (or b, c)=0A=
DEPENDS =3D "${PLUGIN_RECIPES} other..."=0A=
=0A=
In local.conf:=0A=
PLUGIN_RECIPES =3D "A" (or b, c).=0A=
=0A=
// Robert=0A=
=0A=
> I really just wanted to expand a variable in each of A,B,C=0A=
>    PLUGIN_RECIPES +=3D "${PN}"=0A=
>=0A=
> And have D declare=0A=
>   DEPENDS =3D "${PLUGIN_RECIPES} other..."=0A=
>=0A=
> But that doesn't seem possible. Am I missing another way? (Python datasto=
re maybe?)=0A=
>=0A=
> Thanks,=0A=
> Bob=0A=
>=0A=


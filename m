Return-Path: <rcagle@omnitron-systems.com>
X-Greylist: delayed 309 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Dec 2016 02:16:08 UTC
Received: from mail01.omnitron-systems.com (mail01.omnitron-systems.com
	[70.169.247.114])
	by mail.openembedded.org (Postfix) with ESMTP id 47DA1600EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 02:16:08 +0000 (UTC)
Received: from OSCAR.ostdom.com ([fe80::2158:4d9b:82b3:313d]) by
	oscar.ostdom.com ([fe80::2158:4d9b:82b3:313d%14]) with mapi id
	14.03.0319.002; Mon, 12 Dec 2016 18:10:59 -0800
From: Robert Cagle <rcagle@omnitron-systems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: bitbake dependency question
Thread-Index: AdJU5iU1LANZZXXMQKOKaHr7Dnu+lQ==
Date: Tue, 13 Dec 2016 02:10:59 +0000
Message-ID: <44E60BE3F360494194A33E0B8411CB9A62ADD8@oscar.ostdom.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.25.105]
MIME-Version: 1.0
Subject: bitbake dependency question
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
X-List-Received-Date: Tue, 13 Dec 2016 02:16:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm trying to figure out a reasonable way to specify dependencies on an unk=
nown/virtual set of other recipes.
For example,

Recipe A: Plugin #1 (installs a plugin spec somewhere in /usr/share)
Recipe B: Plugin #2 (same)
Recipe C: Plugin #3 (same).
Recipe D: Host Application (C based), which needs to be compiled last since=
 it generates C code based on the spec files.

I'd rather not hard-code dependencies in Recipe D since the specific set of=
 plugins may be different depending on the specified distribution layer or =
machine type. I can define a variable in local.conf and use it to define D'=
s dependencies, but that means I'll have to define the set twice: in the di=
stribution layer and in local.conf. Based on what I've read and experimente=
d with, this seems be my only choice (other than restructuring the applicat=
ion).

I really just wanted to expand a variable in each of A,B,C=20
   PLUGIN_RECIPES +=3D "${PN}"

And have D declare
  DEPENDS =3D "${PLUGIN_RECIPES} other..."

But that doesn't seem possible. Am I missing another way? (Python datastore=
 maybe?)

Thanks,
Bob


Return-Path: <rcagle@omnitron-systems.com>
Received: from mail01.omnitron-systems.com (mail01.omnitron-systems.com
	[70.169.247.114])
	by mail.openembedded.org (Postfix) with ESMTP id 59D5E7321C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 21:02:39 +0000 (UTC)
Received: from OSCAR.ostdom.com ([fe80::2158:4d9b:82b3:313d]) by
	oscar.ostdom.com ([fe80::2158:4d9b:82b3:313d%14]) with mapi id
	14.03.0319.002; Wed, 14 Dec 2016 13:02:39 -0800
From: Robert Cagle <rcagle@omnitron-systems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [oe] bitbake dependency question
Thread-Index: AdJU5iU1LANZZXXMQKOKaHr7Dnu+lQARkN2A//+VNKuAAZypgP//hYX5gAIFaID//4R5fg==
Date: Wed, 14 Dec 2016 21:02:39 +0000
Message-ID: <44E60BE3F360494194A33E0B8411CB9A62C002@oscar.ostdom.com>
References: <44E60BE3F360494194A33E0B8411CB9A62ADD8@oscar.ostdom.com>
	<eb581f04-c965-f26c-97c2-3b04fd639515@windriver.com>
	<44E60BE3F360494194A33E0B8411CB9A62AE16@oscar.ostdom.com>
	<2668593.4cPb1u5Jh3@peggleto-mobl.ger.corp.intel.com>
	<44E60BE3F360494194A33E0B8411CB9A62BEDC@oscar.ostdom.com>,
	<CAMKF1soi+D3OBPeJkBYAyGxAhGw6ua8qhCX_TttT1quh9ZGWnQ@mail.gmail.com>
In-Reply-To: <CAMKF1soi+D3OBPeJkBYAyGxAhGw6ua8qhCX_TttT1quh9ZGWnQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.25.105]
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Wed, 14 Dec 2016 21:02:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

That's a great idea, I hadn't thought of bbappending my own package.
I'll give that a try. Thanks!

--Bob=20

________________________________________
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Khem Raj [raj.khem@gmail.com]
Sent: Wednesday, December 14, 2016 12:22 PM
To: openembeded-devel
Cc: Paul Eggleton
Subject: Re: [oe] bitbake dependency question

On Tue, Dec 13, 2016 at 3:39 PM, Robert Cagle
<rcagle@omnitron-systems.com> wrote:
> Hi Paul,
> Thanks for the response.
>
>> Another way to handle this kind of situation with plugins is to simply b=
uild
>> them all with all dependencies, and have the runtime design such that it=
's
>> fully flexible as to which plugins are installed - then you just make th=
e
>> choice in the image. (Perhaps what you're building is already that way a=
nd
>> you're just trying to save on build time?)
>
> Unfortunately in this particular case it is more of a "compile-time plugi=
n". RecipeD
> generates and compiles a C file based on artifacts left in /usr/share by =
its
> dependencies (Recipes A, B, and/or C), so runtime configuration isn't an =
option.
> In this case including unused plugins would cause incorrect results.

you can insert the DEPENDS from distribution layer via a bbappend into reci=
pe
of packageD and ensure that plugin packages install the needed spec files d=
uring
do_install so they get staged into staging sysroot before packageD
starts to configure
itself. you might even use PACKAGECONFIG to control it.

>
> It appears this form of dependency isn't supported in OE, so I'll either =
use a
> variable defined in local.conf or more likely restructure the app so the =
plugins
> and their host are all built within a single recipe/build.
>
> Thanks for the info though, it is all very interesting.
>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>
> -Bob
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


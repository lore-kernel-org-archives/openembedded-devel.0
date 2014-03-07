Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id D30B36F60E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 08:38:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,606,1389740400"; d="scan'208";a="42293342"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 07 Mar 2014 09:38:48 +0100
Received: from COSNADEXC11.usr.ingenico.loc (10.31.4.211) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Fri, 7 Mar 2014 09:38:48 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC11.usr.ingenico.loc ([10.31.4.211]) with mapi id
	14.02.0328.009; Fri, 7 Mar 2014 09:38:48 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] using OE efficiently for development
Thread-Index: AQHPOWp5zWucTPx/g0K05vC0t3p1lZrVTYaw
Date: Fri, 7 Mar 2014 08:38:46 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B57548141@COSNADEXC13.usr.ingenico.loc>
References: <CAP71WjxZnBfp3agkiw+yGbLWE2p2gzgXGSQ+SBZi9zu+7-cpEQ@mail.gmail.com>
	<CAOd_LFyAkzdc4T-FjWh20-iNd7omPEwdhvJecKapUUo3pC0XaA@mail.gmail.com>
In-Reply-To: <CAOd_LFyAkzdc4T-FjWh20-iNd7omPEwdhvJecKapUUo3pC0XaA@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: using OE efficiently for development
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Mar 2014 08:38:51 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi there,

I like it! I have just a small remark:
conf/bblayers.conf should be patched according to .gitmodules file.

Regards,
Matt


-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Cliff Brake
Envoy=E9=A0: jeudi 6 mars 2014 19:32
=C0=A0: openembedded-devel
Objet=A0: Re: [oe] using OE efficiently for development

Hi Nicolas,

This is the template I use for most projects:

https://github.com/cbrake/oe-build

Custom parts of the system that are under heavy development (kernel, u-boot=
, apps) go in an externalsrc directory.

I use git submodules to manage everything, but repo would work as well.

One of my goals was to have everything in separate directories for easy gre=
pping:

sources
downloads
build/tmp
externalsrc
...

Here is another example using repo: https://github.com/kraj/angstrom-manife=
st

The OE build system is complex, but is very flexible and works very well.  =
The flexibility of fetching sources in different ways is nice, as different=
 parts of the system really need different tools (are they under heavy deve=
lopment, etc) vs forcing everything to be in git, etc.

Note sure if this helps, but may generate ideas.

Cliff

On Thu, Jan 16, 2014 at 6:25 PM, Nicolas Dechesne <nicolas.dechesne@linaro.=
org> wrote:
> hi there,
>
> i understand the subject is a bit weird.. i am seeking for advice or=20
> best practices. how would you recommend to deploy OE in a large team=20
> of devs where it is the main 'build' engine for the entire Linux=20
> system which is *being developed*. e.g. the developers are the=20
> 'upstream' developer, but the product/system can only be built with=20
> OE.
>
> e.g. an OE build does the right thing from an 'integration'
> perspective (fetch from SCM, apply patches, cleanup workspace, ...)=20
> but are there any recommendations or good practices to use OE in a=20
> 'development' workflow?
>
> I am familiar with externalsrc of course, but for a very large system=20
> with 100+ recipes this isn't very practical. for the project I am=20
> referring the current/legacy workflow is:
>
> 1- checkout all source code required to build the entire system (repo,=20
> gclient, ...)
> 2- for any development item hack anywhere in any component
> 3- use a top level 'build script'
> 4- iterate until code ready, and push to SCM
>
> Basically, that looks like Android development workflow to illustrate eve=
n more.
>
> Now, how do we plug OE in such a workflow? any experience with=20
> concrete product development would be very much appreciated.
>
> My initial idea (not implemented, just an idea) was to create a conf=20
> file (or a layer) that has the externalsrc definition for all the=20
> recipes in the layers under development (typically all the proprietary=20
> system bits). the idea is to create a workspace such as:
>
> myproduct
> |- oe
> |- upstream
>
> and in 'oe' folder put all the recipes, and in 'upstream' all the=20
> source code under development (git clone, svn checkout, ...). the=20
> entire workspace can be checkout with repo/gclient or anything else.
>
> the externsrc variables can point to project in 'upstream' folder such=20
> that switching from 'integration' mode to 'developer' mode would=20
> require to include the conf file.
>
> i am thinking that such a 'developer' pattern must be so common, that=20
> they should be a good solution for it already. of course i am assuming=20
> that doing (large) development in WORKDIR is not very practical, and=20
> that would 'force' a large team of developers to become very familiar=20
> with the inner working of OE (task, clean, rebuild, ..).
>
> any good story to share about how OE is used in such 'developer'
> workflow? if we compare to the Android workflow (no troll please!) an=20
> OE workflow is more 'difficult' to grasp, i hope you see what i mean.
>
> More generally, i also curious to discuss other typical developer use=20
> case, such as developing upstream using 'feature branches', ...
>
> thanks
>
> nicolas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


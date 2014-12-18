Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 025F472775
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 05:46:57 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y1TvM-0005Kj-W9 from Awais_Belal@mentor.com ;
	Wed, 17 Dec 2014 21:46:57 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.55]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0181.006; Thu, 18 Dec 2014 05:46:56 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "mike.looijmans@topic.nl"
	<mike.looijmans@topic.nl>
Thread-Topic: [oe] [meta-oe][PATCH v2 2/2] mplayer2: cleanup empty directories
Thread-Index: AQHQEtPb2iasIFVWV0amQJwwNYR9UJyR3XpugAARdQCAAe1k2IABCar8
Date: Thu, 18 Dec 2014 05:46:55 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28E9FE3386@EU-MBX-03.mgc.mentorg.com>
References: <1418035371-3544-1-git-send-email-awais_belal@mentor.com>,
	<1418035371-3544-2-git-send-email-awais_belal@mentor.com>
	<2021B186DC632746BD5A3CE32F12BD28E9FE2BDA@EU-MBX-03.mgc.mentorg.com>,
	<548FED38.40802@topic.nl>,
	<2021B186DC632746BD5A3CE32F12BD28E9FE3113@EU-MBX-03.mgc.mentorg.com>
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28E9FE3113@EU-MBX-03.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 2/2] mplayer2: cleanup empty directories
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
X-List-Received-Date: Thu, 18 Dec 2014 05:46:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On second though I believe we should keep it as-is. The reason being that o=
nce the install is fixed this should fail ideally so we know that this need=
s to be stripped out of the recipe at the same time.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Wednesday, December 17, 2014 6:55 PM=0A=
To: mike.looijmans@topic.nl=0A=
Cc: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] [meta-oe][PATCH v2 2/2] mplayer2: cleanup empty directori=
es=0A=
=0A=
Hi Mike,=0A=
=0A=
Thanks for the feedback. Do you think=0A=
=0A=
if [ -d ${D}/usr/lib ]; then=0A=
        rmdir ${D}/usr/lib=0A=
fi=0A=
=0A=
would be a better solution here?=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Mike Looijmans [mike.looijman=
s@topic.nl]=0A=
Sent: Tuesday, December 16, 2014 1:28 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] [meta-oe][PATCH v2 2/2] mplayer2: cleanup empty directori=
es=0A=
=0A=
On 12/16/2014 08:26 AM, Belal, Awais wrote:=0A=
> ping!=0A=
>=0A=
> BR,=0A=
> Awais=0A=
>=0A=
>=0A=
=0A=
Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Systems=0A=
Eindhovenseweg 32-C, NL-5683 KH Best=0A=
Postbus 440, NL-5680 AK Best=0A=
Telefoon: (+31) (0) 499 33 69 79=0A=
Telefax:  (+31) (0) 499 33 69 70=0A=
E-mail: mike.looijmans@topic.nl=0A=
Website: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
=0A=
Topic zoekt gedreven (embedded) software specialisten!=0A=
http://topic.nl/vacatures/topic-zoekt-software-engineers/=0A=
=0A=
________________________________________=0A=
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
> Sent: Monday, December 08, 2014 3:42 PM=0A=
> To: openembedded-devel@lists.openembedded.org=0A=
> Subject: [oe] [meta-oe][PATCH v2 2/2] mplayer2: cleanup empty directories=
=0A=
>=0A=
> The mplayer "make install" phase leaves an empty=0A=
> /usr/lib directory seemingly regardless of the setting=0A=
> of libdir.  Remove it to avoid a packaging warning.=0A=
>=0A=
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>=0A=
> Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
> ---=0A=
>   meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    1 +=0A=
>   1 file changed, 1 insertion(+)=0A=
>=0A=
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe=
/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
> index 6b3d120..a68a2ba 100644=0A=
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
> @@ -141,4 +141,5 @@ do_install() {=0A=
>       install ${S}/etc/input.conf ${D}/usr/etc/mplayer/=0A=
>       install ${S}/etc/example.conf ${D}/usr/etc/mplayer/=0A=
>       install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/=0A=
> +    [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib=0A=
=0A=
This will cause the script to fail when someone fixes the install and /usr/=
lib=0A=
was not created, because "test -e ${D}/usr/lib" would return failure.=0A=
=0A=
=0A=
>   }=0A=
> --=0A=
> 1.7.9.5=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=
>=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=


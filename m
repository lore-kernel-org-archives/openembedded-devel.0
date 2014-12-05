Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 64DD071F47
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 21:46:41 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Xx0i1-0007DR-Sk from Awais_Belal@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Dec 2014 13:46:42 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.55]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0181.006; Fri, 5 Dec 2014 21:45:36 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 2/2] mplayer2: cleanup empty directories
Thread-Index: AQHQEIBfNJe81q9s3EWCm49vBtBFP5yA8nEAgACU8BI=
Date: Fri, 5 Dec 2014 21:45:35 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28E9FDF8FD@EU-MBX-03.mgc.mentorg.com>
References: <1417779660-18387-1-git-send-email-awais_belal@mentor.com>
	<1417779660-18387-2-git-send-email-awais_belal@mentor.com>,
	<20141205124810.GA2446@jama>
In-Reply-To: <20141205124810.GA2446@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 2/2] mplayer2: cleanup empty directories
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
X-List-Received-Date: Fri, 05 Dec 2014 21:46:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Martin,=0A=
=0A=
I am using an x86_64 machine, the latest world build qa.log from http://log=
s.nslu2-linux.org/buildlogs/oe/world//log.world.20141203_140839.log// does =
not seem to be building mplayer2.=0A=
=0A=
I have libav PREFFERED_VERSION set and PNBLACKLIST[mplayer2] set empty as y=
ou've indicated.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Martin Jansa [martin.jansa@gm=
ail.com]=0A=
Sent: Friday, December 05, 2014 5:48 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] [meta-oe][PATCH 2/2] mplayer2: cleanup empty directories=
=0A=
=0A=
On Fri, Dec 05, 2014 at 04:41:00PM +0500, Awais Belal wrote:=0A=
> The mplayer "make install" phase leaves an empty=0A=
> /usr/lib directory seemingly regardless of the setting=0A=
> of libdir.  Remove it to avoid a packaging warning.=0A=
=0A=
Any idea why I'm not using both these issues in world builds?=0A=
=0A=
Are you using the recipe exactly as is with PNBLACKLIST removed in your=0A=
distro and PREFERRED_VERSION for newer libav?=0A=
=0A=
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>=0A=
> Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
> ---=0A=
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    1 +=0A=
>  1 file changed, 1 insertion(+)=0A=
>=0A=
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe=
/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
> index 4656057..7e6ff0d 100644=0A=
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
> @@ -142,4 +142,5 @@ do_install() {=0A=
>      install ${S}/etc/input.conf ${D}/usr/etc/mplayer/=0A=
>      install ${S}/etc/example.conf ${D}/usr/etc/mplayer/=0A=
>      install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/=0A=
> +    [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib=0A=
>  }=0A=
> --=0A=
> 1.7.9.5=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=
=0A=
--=0A=
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com=0A=


Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 805 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Jun 2019 12:16:20 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id E29667E4E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 12:16:20 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5PC2tJM002959
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 25 Jun 2019 14:02:55 +0200
Received: from atvies991u6msx.ww300.siemens.net
	(atvies991u6msx.ww300.siemens.net [158.226.163.40])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTPS id x5PC2sZZ020269
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 25 Jun 2019 14:02:55 +0200
Received: from ATNETS9912WMSX.ww300.siemens.net ([169.254.10.82]) by
	atvies991u6msx.ww300.siemens.net ([158.226.163.40]) with mapi id
	14.03.0439.000; Tue, 25 Jun 2019 14:02:54 +0200
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: Adrian Bunk <bunk@stusta.de>, Oleksandr Kravchuk
	<open.source@oleksandr-kravchuk.com>
Thread-Topic: [oe] [PATCH][meta-networking] dhcpcd: update to 7.2.2
Thread-Index: AQHVKJySAJzwLOJwwEmES+xvi0IFP6anNA8AgAUVXCA=
Date: Tue, 25 Jun 2019 12:02:54 +0000
Message-ID: <D55698ECEC159B488D62A508E18D7FEC124BEBB3@ATNETS9912WMSX.ww300.siemens.net>
References: <20190622014747.8719-1-open.source@oleksandr-kravchuk.com>
	<20190622082052.GA9472@localhost>
In-Reply-To: <20190622082052.GA9472@localhost>
Accept-Language: en-US, de-AT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.13]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Scasny,
	Radovan" <radovan.scasny@siemens.com>
Subject: Re: [PATCH][meta-networking] dhcpcd: update to 7.2.2
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
X-List-Received-Date: Tue, 25 Jun 2019 12:16:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Oleksandr!

From the maintainer webpage (https://roy.marples.name/projects/dhcpcd/featu=
res) I can see, that ipv6 feature hasn't been removed.

Are you going to re-submit the correct patch?

Regards,
Andrej

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel=
-bounces@lists.openembedded.org> On Behalf Of Adrian Bunk
Sent: Saturday, June 22, 2019 10:21 AM
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH][meta-networking] dhcpcd: update to 7.2.2

On Sat, Jun 22, 2019 at 03:47:47AM +0200, Oleksandr Kravchuk wrote:
> udev is now explicitly requested.
>...

What do you mean?

If udev can no longer be disabled it should no longer be a PACKAGECONFIG.
Otherwise I do not understand what you actually want to change.

> -PACKAGECONFIG ?=3D "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d=
)}"
> +PACKAGECONFIG +=3D "udev"
>...

Why is ipv6 support no longer enabled?

cu
Adrian

--=20

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


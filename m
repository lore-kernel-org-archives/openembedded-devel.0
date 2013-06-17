Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CEF236A5DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 11:11:56 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1UoXLo-0006qD-Hx from Noor_Ahsan@mentor.com ;
	Mon, 17 Jun 2013 04:11:56 -0700
Received: from SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 17 Jun 2013 04:11:56 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.178]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.02.0247.003; Mon, 17 Jun 2013 12:11:55 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [oe] [meta-gnome][PATCH] gvfs: Handle samba dependency based
	on GPLv3 license.
Thread-Index: AQHOa0FLyTSzhXZ0LE+IyHsFhh33G5k5wGHw
Date: Mon, 17 Jun 2013 11:11:54 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994DE4C3FDB@EU-MBX-01.mgc.mentorg.com>
References: <1371457230-6773-1-git-send-email-noor_ahsan@mentor.com>
	<1891782.GSdHg1ETcy@helios>
In-Reply-To: <1891782.GSdHg1ETcy@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 17 Jun 2013 11:11:56.0953 (UTC)
	FILETIME=[7AEF1090:01CE6B4B]
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] gvfs: Handle samba dependency based on GPLv3 license.
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
X-List-Received-Date: Mon, 17 Jun 2013 11:11:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks. I'll update it.

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Monday, June 17, 2013 2:58 PM
To: Ahsan, Noor
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-gnome][PATCH] gvfs: Handle samba dependency based o=
n GPLv3 license.

On Monday 17 June 2013 13:20:30 Noor, Ahsan wrote:
> +PACKAGECONFIG =3D "${@base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', '',
> 'samba', d)}" +

This needs to use ?=3D or ??=3D so that it can be overridden easily.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


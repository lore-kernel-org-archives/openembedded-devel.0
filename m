Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8039271144
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 09:35:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 21 Jan 2015 01:29:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="443104838"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2015 01:22:01 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.81]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.2]) with mapi id
	14.03.0195.001; Wed, 21 Jan 2015 09:35:19 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: connman + wpa_supplicant
Thread-Index: AdAv2ZrEyOJZ/4VQTuKJyV3JpT1KogFg1ZjQ
Date: Wed, 21 Jan 2015 09:35:19 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F419387@irsmsx105.ger.corp.intel.com>
References: <F48900D76F0D8349918584FEEFEB4BCA06272BF2@SEXCHANGE0100.lpg.priv>
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA06272BF2@SEXCHANGE0100.lpg.priv>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: connman + wpa_supplicant
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
X-List-Received-Date: Wed, 21 Jan 2015 09:35:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,
Your issue description is very light on details.
Can you add some logs to it, the detailed versions of connman and wpa_suppl=
icant, maybe some logs from these components, etc?

I don't remember such an issue being reported, but everything is possible.

Regards,
Cristian Iorga
Yocto Project
Intel Corporation

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of MONDON Daniel
Sent: Wednesday, January 14, 2015 11:08 AM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] connman + wpa_supplicant

Hi,

I've got a angstrom v2012.05 based system with 3.2.30 kernel (forbidden to =
full update!).

My application is using connmanctl (and wpa_supplicant) for wifi communicat=
ion.
In fact, the application is looking for wifi hot spot, connect if needed an=
d the make tcp communication.

When no network is present, of after user is disconnected, the application =
is going more and more slowly.

I found wpa_supplicant process which use more and more cpu.
If I kill and restart the process, everything is ok.

In fact, more I use connmanctl command, more the wpa_supplicant process use=
 CPU.
When connexion is established, there is no access to connmanctl, and no pro=
blem occurs.
But users may or may not use wifi.
Then I have to correct the problem.

Is it a known problem ? and solved ?

Thanks
Daniel.
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


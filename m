Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id 14B2C71144
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 10:17:05 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id 29EA71A73A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:17:05 +0100 (CET)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0224.002; Wed, 21 Jan 2015 11:17:04 +0100
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: connman + wpa_supplicant
Thread-Index: AdAv2ZrEyOJZ/4VQTuKJyV3JpT1KogFg1ZjQAADPigA=
Date: Wed, 21 Jan 2015 10:17:02 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA06275074@SEXCHANGE0100.lpg.priv>
References: <F48900D76F0D8349918584FEEFEB4BCA06272BF2@SEXCHANGE0100.lpg.priv>
	<969F26A8BAB325438E7EB80D3C3134FB2F419387@irsmsx105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F419387@irsmsx105.ger.corp.intel.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.31]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejkedrtdehgddugecutefuodetggdotefrucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffuthffkfhfjghitgfgggesthhqtddttddtudenucfhrhhomhepoffqpfffqffpucffrghnihgvlhcuoeffrghnihgvlhdroffqpfffqffpsehlphhgshihshhtvghmshdrtghomheqnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrgh
X-VRSPAM-EXTCAUSE: mhhouggvpehsmhhtphhouhht
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
X-List-Received-Date: Wed, 21 Jan 2015 10:17:14 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Cristian,

In angstr=F6m v2012.05:
Wpa_supplicant v1.0
Connman v1.23=20

Many calls to connmanctl (services ...) in order to find the network or its=
 strength ...

You can see that without doing anything, wpa_supplicant use almost 0.3 more=
 % CPU after a few calls to connman.
If you wait a few hours (our application looks if wifi is here every time e=
ach 10 seconds), wpa_supplicant use more and more %cpu.
Even if wifi is stopper - started.

The only way to reduce wpa_supplicant %CPU is to kill and restart it.

How can i add logs?

If nobody has ever see this problem, perhaps is it still alive in the last =
release ?

Thanks
Daniel.

-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Iorga, Cristian
Envoy=E9=A0: mercredi 21 janvier 2015 10:35
=C0=A0: openembedded-devel@lists.openembedded.org
Objet=A0: Re: [oe] connman + wpa_supplicant

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
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


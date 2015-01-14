Return-Path: <Daniel.MONDON@lpgsystems.com>
X-Greylist: delayed 838 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Jan 2015 09:22:04 UTC
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id 63E68722E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2015 09:22:04 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id 847492FE95
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2015 10:08:06 +0100 (CET)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0224.002; Wed, 14 Jan 2015 10:08:05 +0100
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: connman + wpa_supplicant
Thread-Index: AdAv2ZrEyOJZ/4VQTuKJyV3JpT1Kog==
Date: Wed, 14 Jan 2015 09:08:04 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA06272BF2@SEXCHANGE0100.lpg.priv>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.31]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejjedrheefgddufeduucetufdoteggodetrfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufhtfffkihgtgfggsehtqhdttddttddvnecuhfhrohhmpefoqffpfffqpfcuffgrnhhivghluceoffgrnhhivghlrdfoqffpfffqpfeslhhpghhshihsthgvmhhsrdgtohhmqe
X-VRSPAM-EXTCAUSE: mhhouggvpehsmhhtphhouhht
Subject: connman + wpa_supplicant
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
X-List-Received-Date: Wed, 14 Jan 2015 09:22:05 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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


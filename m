Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id 8BAAE6F7A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 16:17:20 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id CEAF73300C4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 17:17:19 +0100 (CET)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0174.001; Fri, 14 Mar 2014 17:17:19 +0100
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Meta java
Thread-Index: Ac85K1ou8F/UCLIgTuOpKrpmTJ/BpQAAM8KAADf7MaAABOYVAACGPlnQANmebkA=
Date: Fri, 14 Mar 2014 16:17:18 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA060AE963@SEXCHANGE0100.lpg.priv>
References: <F48900D76F0D8349918584FEEFEB4BCA060AD0D0@SEXCHANGE0100.lpg.priv>
	<20140306120645.GB4680@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA060AD4C2@SEXCHANGE0100.lpg.priv>
	<20140307170947.GB25806@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA060AD8AC@SEXCHANGE0100.lpg.priv>
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA060AD8AC@SEXCHANGE0100.lpg.priv>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.36]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejuddrvdegucetufdoteggodetrfcurfhrohhfihhlvgemuceonhhonhgvqeenuceurghilhhouhhtmecufedttdenuc
Subject: Re: Meta java
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
X-List-Received-Date: Fri, 14 Mar 2014 16:17:20 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>>Hi,
>>
>>okay seems I have to add libffi native to the depends of jamvm and "inher=
it pkgconfig".
>>For now try to bitbake libffi-native before your bitbake command.
>>
>>Bye Henning
>
>Hi,
>
>Starting from zero
>bitbake libffi-native ok.
>
>New (error) results joined.
>
>Thanks,
>Bye
>Daniel.
---------------------------------------------------------------------------=
--------------------------------------------------------------
Hi,

Is there any git repository (or configuration) to add ?
I've just do:
  git clone git://git.openembedded.org/openembedded-core oe-core
  cd oe-core
  git clone git://git.openembedded.org/bitbake bitbake
  git clone git://git.openembedded.org/meta-openembedded
  git clone https://github.com/woglinde/meta-java.git

Following meta-java ReadMe Instructions:
conf/local.conf:
  PREFERRED_PROVIDER_virtual/java-initial =3D "cacao-initial"
  PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
  PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
  PREFERRED_VERSION_openjdk-7-jre =3D "25b30-2.3.12"
  PREFERRED_VERSION_icedtea7-native =3D "2.1.3"
# option PREFERRED_PROVIDER_openjdk-7-jre =3D "openjdk-7-jre"

conf/bblayers.conf:
BBLAYERS ?=3D " \
  path_to_source /oe-core/meta \
  path_to_source /oe-core/meta-openembedded/meta-oe \
  path_to_source /oe-core/meta-java \
  "

Thanks,
Good weekend

Daniel.
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


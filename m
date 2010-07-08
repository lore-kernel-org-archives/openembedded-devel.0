Received: from mailde1.eads.com ([80.156.44.82])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OWt2j-0000nA-2o for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 17:29:42 +0200
Received: from de-gate1.mailhub.intra.corp ([53.154.243.33]) by
	mailde1.eads.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 8 Jul 2010 17:24:27 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 8 Jul 2010 17:22:41 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 8 Jul 2010 17:22:41 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 8 Jul 2010 17:22:38 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819D67@deimsg40.de.net.world>
In-Reply-To: <4C2C8F31.2050107@freyther.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Creating a Own Tool chain,
	some referenced packages are not included into the SDK archive
Thread-Index: AcsZHC+E0DTGfCoYQUmetzsd3F6ypwFkbyqw
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819743@deimsg40.de.net.world>	<4C2A07C5.9060909@freyther.de><0B51A1E7C61D114DAE6FC10B0FD0ABA50181975A@deimsg40.de.net.world>
	<4C2C8F31.2050107@freyther.de>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 08 Jul 2010 15:22:41.0202 (UTC)
	FILETIME=[67F00920:01CB1EB1]
X-SA-Exim-Connect-IP: 80.156.44.82
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Creating a Own Tool chain, some referenced packages are not included into the SDK archive
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jul 2010 15:29:42 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello, I have found the problems of creating the toolchain =
meta-toolchain-qte.bb (and my derived one) !

First problem:

There is a conflict in packages "cups" and "libpam-base-files" (same =
file "cups" in "/etc/pam.d" was deployed by the packages) this results =
in a bailing out while installing the packages.

My workaround was: local modified libpam-base-files w/o file "cups" in =
"libpam-base-files/pam.d"
(does libpam-base-files really have to install this file and some other =
package dependent ones ?)

Second problem:
meta-toolchain-qte.bb contains following line in =
do_populate_sdk_append():

  >script =3D "${SDK_OUTPUT}/${SDKPATH}/environment-setup"<

this have to be changed to:

  >script=3D"${SDK_OUTPUT}/${SDKPATH}/environment-setup"<

because the code is used as shell commands and not as python code !

The issue above results in a call of "script" with arguments "=3D" and =
"${SDK_OUTPUT}/${SDKPATH}/environment-setup".
"script" opens a "bash -i" and wait for commands. Therefore the =
processing blocks until this shell exits.

Is there somebody out there having commit access who will fix that =
second problem in org.openembedded.dev ?

regards
Wolfgang Hauser

-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Holger Freyther
Gesendet: Donnerstag, 1. Juli 2010 14:51
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] Creating a Own Tool chain, some referenced packages =
are not included into the SDK archive

On 06/29/2010 11:20 PM, Hauser, Wolfgang (external) wrote:
> Hello Holger Freyther,
>=20
> here are the diffs for my changes:
>=20
> diff of meta-toolchain-qte.bb <> meta-toolchain-xxx.bb

sorry, this diff is not readable, please use a unified diff for the =
changes.

>=20
> The qte toolchain has created properly, my own do not.

So you say bitbake meta-toolchain-qte is working?

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OTcgB-0000eI-Ab for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 17:24:56 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 29 Jun 2010 17:12:33 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Tue, 29 Jun 2010 17:20:11 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 29 Jun 2010 17:20:11 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 29 Jun 2010 17:20:07 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA50181975A@deimsg40.de.net.world>
In-Reply-To: <4C2A07C5.9060909@freyther.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Creating a Own Tool chain,
	some referenced packages are not included into the SDK archive
Thread-Index: AcsXmmi2536ihBTKSDm982ITeBpj1QAAmfeA
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819743@deimsg40.de.net.world>
	<4C2A07C5.9060909@freyther.de>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 29 Jun 2010 15:20:11.0676 (UTC)
	FILETIME=[91186DC0:01CB179E]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Tue, 29 Jun 2010 15:24:57 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Holger Freyther,

here are the diffs for my changes:

diff of meta-toolchain-qte.bb <> meta-toolchain-xxx.bb
>>>>>>>>=20
1c1
< # Qt Embedded toolchain
---
> # xxx Qt Embedded toolchain
3,4c3,4
< TOOLCHAIN_HOST_TASK =3D "task-qte-toolchain-host"
< TOOLCHAIN_TARGET_TASK =3D "task-qte-toolchain-target"
---
> TOOLCHAIN_HOST_TASK =3D "task-xxx-toolchain-host"
> TOOLCHAIN_TARGET_TASK =3D "task-xxx-toolchain-target"
6,8c6,8
< require meta-toolchain.bb
< SDK_SUFFIX =3D "toolchain-qte"
< SDK_SUFFIX_angstrom =3D "toolchain-qte-${ANGSTROM_QT_VERSION}"
---
> require recipes/meta/meta-toolchain.bb
> SDK_SUFFIX =3D "toolchain-xxx"
> SDK_SUFFIX_angstrom =3D "toolchain-xxx-${ANGSTROM_QT_VERSION}"
<<<<<<<<<

diff of task-qte-toolchain-host.bb <> task-xxx-toolchain-host.bb=20
>>>>>>
1c1
< require task-sdk-host.bb
---
> require recipes/tasks/task-sdk-host.bb
<<<<<<

diff of task-qte-toolchain-target.bb <> task-xxx-toolchain-target.bb
>>>>>>>
< DESCRIPTION =3D "Target packages for Qt Embedded SDK"
---
> DESCRIPTION =3D "Target packages for xxx Qt Embedded SDK"
6a7,10
> PACKAGES =3D "${PN}"
>=20
> DEPENDS =3D "task-sdk-bare"
>=20
8a13,17
>         alsa-lib-dev \
>         libpng-dev \
>         net-snmp-dev \
>         ftplib-dev \
>         libgles-omap3-dev \
13d21
<         libqt-embeddedclucene4-dev \
22,24d29
<         libqt-embeddedscript4-dev \
<         libqt-embeddedscripttools4-dev \
<         libqt-embeddedsql4-dev \
27d31
<         libqt-embeddedwebkit4-dev \
29,31d32
<         libmysqlclient-dev \
<         sqlite-dev \
<         libsqlite-dev \
33d33
<         expat-dev \
<<<<<<<

The qte toolchain has created properly, my own do not.

The single packages are building properly.

Regards,
Wolfgang Hauser

-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Holger Freyther
Gesendet: Dienstag, 29. Juni 2010 16:49
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] Creating a Own Tool chain, some referenced packages =
are not included into the SDK archive

On 06/29/2010 10:04 PM, Hauser, Wolfgang (external) wrote:
> Hello,=20

> I use an private overlay, referencing org.openembedded.dev and using
> DISTRO =3D "angstrom-2008.1" and MACHINE =3D "omap3evm"=20
> The meta-toolchain-xxx is derived from meta-toolchain-qte.=20

Hi,
to make it more easy for me. What is the difference between
meta-toolchain-xxxx and meta-toolchain-qte? Does meta-toolchain-qte work
properly?


The general advice I can give is to log at the opkg installation log and
see if the tasks were installed, and if it picked up the dependencies...

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



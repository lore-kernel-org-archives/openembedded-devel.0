Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Krr30-0006T8-FT
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 11:27:35 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 2EBED16DF7D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 11:34:45 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id B33B72A420A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 11:35:49 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 20 Oct 2008 11:27:01 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF473@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF470@hiob.intern.dresearch.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] vmware.conf problem
Thread-Index: AckyiZ+JqISHPA6BS6+WiyrzGhQ8YwADEsTg
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF470@hiob.intern.dresearch.de>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: vmware.conf problem
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
X-List-Received-Date: Mon, 20 Oct 2008 09:27:35 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> For rapid prototyping purposes we want to build Angstrom=20
> distro for a VMware machine. This fails because=20
> conf/machine/vmware.conf requires=20
> conf/machine/include/pentiumpro.inc which does not exist in=20
> the OE tree. :(

This patch seems to fix this problem:

diff --git a/conf/machine/vmware.conf b/conf/machine/vmware.conf
index 4822c38..d318bb7 100644
--- a/conf/machine/vmware.conf
+++ b/conf/machine/vmware.conf
@@ -22,4 +22,4 @@ OLDEST_KERNEL =3D "2.6.17"
 GLIBC_ADDONS =3D "nptl"
 GLIBC_EXTRA_OECONF =3D "--with-tls"
=20
-require conf/machine/include/pentiumpro.inc
+require conf/machine/include/tune-pentiumpro.inc




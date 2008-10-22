Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1KsZ1c-0006Nj-Ip
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Oct 2008 10:25:04 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 2BE7816DEFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2008 10:32:12 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 748512A420E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2008 10:33:17 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 22 Oct 2008 10:24:42 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF484@hiob.intern.dresearch.de>
In-Reply-To: <gdknoe$186$2@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] support another hardware
Thread-Index: Ackzh4v7mVrEiBL1TzGcMeWTDyIGmAAk7hmw
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF480@hiob.intern.dresearch.de>
	<gdknoe$186$2@ger.gmane.org>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: support another hardware
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
X-List-Received-Date: Wed, 22 Oct 2008 08:25:04 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I've created/changed oxe810.conf and linux_2.6.24.bb in the described =
way and tried to build the angstrom distro using minimal-image.bb.

The good news is that the kernel build without problems. :)

The bad one that building the root_fs fails with:

| Collected errors:
|  * ERROR: Cannot satisfy the following dependencies for task-boot:
|        *  base-passwd *  busybox *  initscripts *  =
modutils-initscripts *  netbase *  udev *  sysvinit *  sysvinit-pidof *  =
tinylogin *

Hmmmm? What's wrong here? Building the same image for other machines =
works fine.

Steffen



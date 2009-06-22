Received: from [128.222.32.20] (helo=mexforward.lss.emc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Lin_Lynn@emc.com>) id 1MIa2a-0003DT-I6
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 05:17:52 +0200
Received: from hop04-l1d11-si01.isus.emc.com (HOP04-L1D11-SI01.isus.emc.com
	[10.254.111.54])
	by mexforward.lss.emc.com (Switch-3.3.2/Switch-3.1.7) with ESMTP id
	n5M36t0m004529
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 21 Jun 2009 23:06:55 -0400
Received: from mailhub.lss.emc.com (numailhub.lss.emc.com [10.254.144.16]) by
	hop04-l1d11-si01.isus.emc.com (Tablus Interceptor) for
	<openembedded-devel@openembedded.org>;
	Sun, 21 Jun 2009 23:06:48 -0400
Received: from corpussmtp2.corp.emc.com (corpussmtp2.corp.emc.com
	[128.221.14.146])
	by mailhub.lss.emc.com (Switch-3.3.2/Switch-3.3.2) with ESMTP id
	n5M36mLb023981 for <openembedded-devel@openembedded.org>;
	Sun, 21 Jun 2009 23:06:48 -0400
Received: from CORPUSMX100C.corp.emc.com ([128.222.76.57]) by
	corpussmtp2.corp.emc.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 21 Jun 2009 23:06:47 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Sun, 21 Jun 2009 23:06:45 -0400
Message-ID: <065E68EB87448440A3E75B4DBB5E871C635A3B@CORPUSMX100C.corp.emc.com>
In-Reply-To: <20090621184902.GY15477@smtp.west.cox.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH] update IMAGE_ROOTFS variable to
	fixinconsistent	IMAGE_ROOTFS variable content in apt-native
	package
Thread-Index: AcnyoWhOL+w7iKYmRoa70wkbZnR0RAAROolw
References: <065E68EB87448440A3E75B4DBB5E871C26C83A@CORPUSMX100C.corp.emc.com>
	<20090621184902.GY15477@smtp.west.cox.net>
From: <Lin_Lynn@emc.com>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 22 Jun 2009 03:06:47.0827 (UTC)
	FILETIME=[7B16EE30:01C9F2E6]
X-EMM-EM: Active
Subject: Re: [PATCH] update IMAGE_ROOTFS variable to fixinconsistent	IMAGE_ROOTFS variable content in apt-native package
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
X-List-Received-Date: Mon, 22 Jun 2009 03:17:52 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: openembedded-devel-bounces@openembedded.org
[mailto:openembedded-devel-bounces@openembedded.org] On Behalf Of Tom
Rini
Sent: Monday, June 22, 2009 2:49 AM
To: openembedded-devel@openembedded.org
Subject: Re: [oe] [PATCH] update IMAGE_ROOTFS variable to
fixinconsistent IMAGE_ROOTFS variable content in apt-native package

On Sun, Jun 21, 2009 at 06:32:32AM -0400, Lin_Lynn@emc.com wrote:

> From 5f5d0a311692a114360b7bd3037534a5ec839f33 Mon Sep 17 00:00:00 2001
> From: Lynn Lin <Lin_Lynn@emc.com>
> Date: Sun, 21 Jun 2009 18:15:06 +0800
> Subject: [PATCH] update IMAGE_ROOTFS variable to fix inconsistent
IMAGE_ROOTFS variable content in apt-native package
>
http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=3D2343808f7=
3
86cbd4c7b43f1b24e65e173f5ddf15
> This commit change IMAGE_ROOTFS from "${TMPDIR}/rootfs" to
"${TMPDIR}/rootfs/${PN},so it cause
> that it expand IMAGE_ROOTFS to ${TMPDIR}/rootfs/apt-native in
apt.conf.sample,however rootfs_deb.class use
> apt.conf.sample to generate apt-rootfs.conf ,here IMAGE_ROOTFS is
different from that in apt-native package

Acked-by: Tom Rini <trini@embeddedalley.com>

Tangentally, have you checked the apt.conf that's used for any other
variables we should be setting or that are wrong?  Thanks!

I don't find any more variables need to be reset in apt.conf

--=20
Tom Rini

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




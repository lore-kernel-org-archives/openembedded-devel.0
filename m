Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1SkAr2-00010K-J6 for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 11:17:36 +0200
Received: from gsx3072-vs5.mxchg.m.corp ([53.147.176.149])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id q5S8pnpC015061
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:51:50 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3072-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 28 Jun 2012 10:51:54 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 28 Jun 2012 10:51:54 +0200
Message-ID: <0C757E680E33864AB113392C7E83F91001980550@GSX300A.mxchg.m.corp>
In-Reply-To: <4FEB67F4.5030400@emagii.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Missing kernel modules in OE 2011.03
Thread-Index: Ac1UoPfK+kAZPxRqR2GxZNhXsxygWQAZ8QEg
References: <4FEAE2BE.9010707@emagii.com><0C757E680E33864AB113392C7E83F9100198054F@GSX300A.mxchg.m.corp>
	<4FEB67F4.5030400@emagii.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 28 Jun 2012 08:51:54.0561 (UTC)
	FILETIME=[447C4B10:01CD550B]
Subject: Re: Missing kernel modules in OE 2011.03
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
X-List-Received-Date: Thu, 28 Jun 2012 09:17:36 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

>Wasn't aware that you need to include that in an image.
>Thought this was simply bitbake magic.

the package kernel-modules-xxxx.ipk is a meta package containing runtime
dependencies to all modules compiled with the kernel, created while
bitbaking a kernel (kernel.bbclass).
It should trigger an install of all configured modules to the image.

>Is there ever a case when you do not want to have the modules
>that you so cunningly configured for your kernel build???

It may be someone wants to have a "general" modulized kernel, but
depending on the machine/distro capabilities/needs only some of the
modules should be available, then you are able to install the needed
kernel-module-xxx.ipk packages only. This mainly saves space and limits
the available functionality to the needs.

If the system is running well, it may be better to compile all modules
into the kernel.

If the image includes task-boot, the modules to be installed are
configured in <machine>.conf.

Regards
Wolfgang



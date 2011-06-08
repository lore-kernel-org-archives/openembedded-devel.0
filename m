Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1QULNo-0004Hx-PU for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 18:13:28 +0200
Received: from gsx3072-vs5.mxchg.m.corp ([53.147.176.149])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p58GAEBV028183
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jun 2011 18:10:15 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3072-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 8 Jun 2011 18:10:08 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 8 Jun 2011 18:10:08 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE5187@GSX300A.mxchg.m.corp>
In-Reply-To: <20110608155211.GA29476@denix.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Amend recipes which do not contain a (new) target
	machine	in COMPATIBLE_MACHINE
Thread-Index: Acwl9CMFhPw5vk0hQQqAu77/DBLweAAAgXRg
References: <1307535707.2529.4783.camel@phil-desktop><0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
	<20110608155211.GA29476@denix.org>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 08 Jun 2011 16:10:08.0669 (UTC)
	FILETIME=[898B44D0:01CC25F6]
Subject: Re: Amend recipes which do not contain a (new) target machine	in COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 08 Jun 2011 16:13:28 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


>COMPATIBLE_MACHINE is a regular expression, so you need to make sure
the=20
>syntax is not broken when you append to it. In the case of
linux-omap-psp, you=20
>can try adding "|mymachine"...

Well, COMPATIBLE_MACHINE_append_pn-linux-omap-psp =3D "|mymachine" is =
the
working one.

Thanks to all, helped me getting forward.



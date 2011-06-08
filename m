Received: from mail.eads.net ([80.156.45.113])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1QUL0n-0008RY-Lw for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 17:49:41 +0200
Received: from gsx3072-vs5.mxchg.m.corp ([53.147.176.149])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p58FkJOY016592
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jun 2011 17:46:20 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3072-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 8 Jun 2011 17:46:18 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 8 Jun 2011 17:46:19 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
In-Reply-To: <1307535707.2529.4783.camel@phil-desktop>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Amend recipes which do not contain a (new) target machine
	in COMPATIBLE_MACHINE
Thread-Index: Acwl1r9qm3PlrIzzQc+df6jhMxIFbAAGIH/g
References: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp><1307534514.2529.4780.camel@phil-desktop><0C757E680E33864AB113392C7E83F910BE5185@GSX300A.mxchg.m.corp>
	<1307535707.2529.4783.camel@phil-desktop>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 08 Jun 2011 15:46:18.0694 (UTC)
	FILETIME=[35366660:01CC25F3]
Subject: Re: Amend recipes which do not contain a (new) target machine in COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 08 Jun 2011 15:49:41 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>I guess you might not be able to append to COMPATIBLE_MACHINE from
>amend.inc since amend.bbclass probably doesn't get run early enough.
>But you should be able to use COMPATIBLE_MACHINE_append_pn-... in your
>layer.conf, or COMPATIBLE_MACHINE +=3D in a .bbappend file.  Are those
not
>working for you?

The .bbappend files don't work with bitbake version 1.10.2 which is
required by OE release 2011.03.

I want to use linux-omap-psp_2.6.32.bb as kernel recipe, how is the
exact format for COMPATIBLE_MACHINE_append_pn-... ?

I tried COMPATIBLE_MACHINE_append_linux-omap-psp =3D "mymachine" and
COMPATIBLE_MACHINE_append_pn-linux-omap-psp =3D "mymachine", both don't
work for me.



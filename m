Received: from [64.251.82.10] (helo=mail.tranzeo.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <DWatkins@tranzeo.com>) id 1IaHV2-0003nv-Nk
	for openembedded-devel@openembedded.org; Tue, 25 Sep 2007 22:59:20 +0200
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Tue, 25 Sep 2007 13:54:48 -0700
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1093F16BB@tranzeo-mail2.12stewart.tranzeo.com>
In-Reply-To: <1190722797.46f8fced3640a@www.emile.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] How should OE be used?
Thread-Index: Acf/b88Vf3X4adrpRDeDK1eRi61vkwARRHAg
References: <46F587F7.4060501@balister.org><D61182AC8012EA4EBC531B3AF23BE1093F1639@tranzeo-mail2.12stewart.tranzeo.com>
	<1190722797.46f8fced3640a@www.emile.com>
From: "Darcy Watkins" <DWatkins@tranzeo.com>
To: <openembedded-devel@openembedded.org>
Subject: Re: How should OE be used?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2007 20:59:21 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Stelios,

I did the following:

   Updated my copy to OE upstreams using monotone
   Set my distro to oplinux-uclibc
   Set my machine to dht-walnut

Let the distro and machine setup ARCH and TARGET_OS as suggested.

The build didn't complete...

  adjtimex.c:14 error '__adjtimex' aliased to undefined symbol
'adjtimex'
  adjtimex.c:15 error 'ntp_adjtime' aliased to undefined symbol
'adjtimex'

Somewhere inside uclibc task do_compile

Are you using a different machine file?

I am using an AMCC Taihu but I'll be happy just to be pointed to any
PPC405 machine / distro that builds without errors as a start.


Darcy



>As we needed a stable tree for our devices/projects we have
>our distro called
>OPLinux and OPlinux-uclibc with gcc 4.1.1 glibc 2.5 or uclibc 0.9.28
>We push the changes back to OE on a regular bases and recently
>provided Koen
>with a 405 board so he can do more test on Angstrom which uses
>newer .versions
>of gcc/uclibc.
>If you (or any other) want a copy of what we use just let me know.=20




Received: from [209.172.120.180] (helo=skymoon.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ckamas@finesse.com>) id 1MBESY-0003ae-5P
	for Openembedded-devel@lists.openembedded.org;
	Mon, 01 Jun 2009 22:50:21 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 1 Jun 2009 13:41:24 -0700
Message-ID: <C62896630644CE43BF64B0FF0AC27F0E05B4D2@mail.ad.skymv.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: bitbake virtual/kernel -c menuconfig
Thread-Index: Acni+VQiKmDhUTS9QsiWV0OV/CUcvw==
From: "Chuck Kamas" <ckamas@finesse.com>
To: <Openembedded-devel@lists.openembedded.org>
Subject: bitbake virtual/kernel -c menuconfig
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
X-List-Received-Date: Mon, 01 Jun 2009 20:50:27 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have recently upgraded from using the Angstrom distribution to the
minimal and now micro distribution.  One thing that now fails in both of
these distros is:

bitbake virtual/kernel -c menuconfig

They both now complain that it can not open a display.  I have traced
this to the fact that DISPLAY is not set to 0.0 in either the minimal or
the micro distributions.  The only place I can find display set in the
recopies is in xqtlauncher and startxqt.  So how do I set up an export
DISPLAY=3D0.0 such that menuconfig gets it?

Also I noticed that the patch files are being applied before menuconfig
in Angstrom but not in minimal and micro.  How do I fix this?

Thanks!
Chuck






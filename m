Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KvBFT-0001jv-TZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 14:38:12 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KvBEX-0006SL-O2
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 13:37:13 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1KvBEX-0002Hx-Eg
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 13:37:13 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Oct 2008 13:37:12 +0000
Message-Id: <1225287432.3822.51.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: experiments with thumb on gta01
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
X-List-Received-Date: Wed, 29 Oct 2008 13:38:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Over the past week or so, I've been doing a few experiments to compare
the relative behaviour of ARM-state vs Thumb-state userspace on the
openmoko gta01 (ARM920T core and hence ARMv4 architecture).

Although I haven't yet run the full freesmartphone software stack in
Thumb state, the initial results are fairly encouraging.  Some headline
numbers are as follows:

The average reduction in binary size is about 12%.  Some binaries do
significantly better than this, for example busybox shrinks by 25%;
libxml2 shrinks by 24%; libgstffmpegcolorspace.so shrinks by 34%.  The
only binary which seems to have actually increased in size is the tslib
corgi.so plugin, which was only 3060 bytes to start with.

Performance is slightly harder to quantify but, according to lmbench,
the /bin/sh overhead (busybox sh) is down from 35ms to 30ms, an
improvement of 16%.  Python is up from 954 to 1043 pystones/second, an
improvement of 9%.  (These numbers were actually measured with different
kernels, which might have distorted the figures for sh slightly; I don't
think pystone is very much influenced by kernel behaviour so that number
is probably more representative.)

Building for Thumb should, nowadays, be as simple as making sure that
you have tune-thumb.inc included from your MACHINE.conf (which, courtesy
Koen, should now be automatically true for most people), then setting:

ARM_INSTRUCTION_SET = "thumb"
THUMB_INTERWORK = "yes"

in some appropriate place.  Note that tune-thumb.inc needs to override
CFLAGS, so including this file directly from local.conf will probably
not do what you need.

Note also that you need a fairly recent toolchain, in particular
binutils, for interworking to do the right thing on ARMv4T.  Binutils
2.18 seems to be OK for me but I have not tried older versions.  For
ARMv5 and newer, more or less any version ought to be fine since
interworking is much easier on the newer architectures.

Thanks as ever to Mickey and Holger for their kind assistance in getting
this to work.

Share and enjoy

p.





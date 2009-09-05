Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mk6uE-00009C-Mw
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 03:51:02 +0200
Received: from tamarin.localnet (unknown [211.48.194.125])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 235461B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2009 01:37:11 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 6 Sep 2009 01:31:25 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.1; i686; ; )
MIME-Version: 1.0
Message-Id: <200909060131.26060.holger+oe@freyther.de>
Subject: glibc and MIPS compile issue
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
X-List-Received-Date: Sun, 06 Sep 2009 01:51:03 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hey,

I tried to compile for MIPS again and glibc fails with the below error:


/home/ich/build/mipsel/db1200/tmp/work/mipsel-angstrom-linux/glibc-2.9-
r35.2/build-mipsel-angstrom-linux/libc_pic.os: In function `_mcount':
=2E./sysdeps/generic/unwind-pe.c:(.debug_macinfo+0x5b398c0): relocation=20
truncated to fit: R_MIPS_HI16 against `_gp_disp'
collect2: ld gab 1 als Ende-Status zur=FCck


has anyone a idea?

	z.



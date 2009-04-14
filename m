Received: from [65.55.90.34] (helo=snt0-omc1-s23.snt0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <huru_ukko@hotmail.com>) id 1LtpL3-0007EM-7n
	for openembedded-devel@openembedded.org; Tue, 14 Apr 2009 22:34:39 +0200
Received: from SNT105-W20 ([65.55.90.7]) by snt0-omc1-s23.snt0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 14 Apr 2009 13:30:52 -0700
Message-ID: <SNT105-W20AA5F2E8A600866EEDD6D907C0@phx.gbl>
X-Originating-IP: [91.153.31.117]
From: Mauri Sandberg <huru_ukko@hotmail.com>
To: <openembedded-devel@openembedded.org>
Date: Tue, 14 Apr 2009 23:30:49 +0300
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Apr 2009 20:30:52.0243 (UTC)
	FILETIME=[E7917A30:01C9BD3F]
X-SA-Exim-Connect-IP: 65.55.90.34
X-SA-Exim-Mail-From: huru_ukko@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,HTML_MESSAGE,
	RDNS_NONE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: uclibc build error
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
X-List-Received-Date: Tue, 14 Apr 2009 20:34:39 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


There are two peculiarities when I am trying to build uclibc for DNS-323 us=
ing angstrom stable/2009.

For some reason OE chooses version 0.9.30 over 0.9.30.1. I had to specifica=
lly choose the latter.

Anyhow=2C both of these fail miserably with something that does not really =
tell me much.

<clip>
NOTE: make STRIPTOOL=3Dtrue LD=3Darm-angstrom-linux-uclibcgnueabi-ld LOCALE=
_DATA_FILENAME=3DuClibc-locale-030818.arm.tgz CC=3Dccache arm-angstrom-linu=
x-uclibcgnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork =
-mthumb HOSTCFLAGS=3D-I/home/maukka/oe/dns323/build/tmp-dns323/staging/i686=
-linux/usr/include
  GEN include/bits/sysnum.h
  GEN include/bits/uClibc_config.h
  LN include/pthread.h
...
  CC ldso/ldso/ldso.oS
ldso/ldso/dl-elf.c: In function '_dl_dprintf':
ldso/ldso/dl-elf.c:913: error: unable to find a register to spill in class =
'LO_REGS'
ldso/ldso/dl-elf.c:913: error: this is the insn:
(insn 121 120 122 6 (set (reg/f:SI 406)
        (plus:SI (reg/f:SI 25 sfp)
            (reg:SI 405))) 5 {*thumb_addsi3} (nil)
    (expr_list:REG_DEAD (reg:SI 405)
        (nil)))
ldso/ldso/dl-elf.c:913: confused by earlier errors=2C bailing out
make: *** [ldso/ldso/ldso.oS] Error 1
FATAL: oe_runmake failed
</clip>

Full log at http://tinderbox.openembedded.net/builds/138258/

-- Mauri


_________________________________________________________________
Show them the way! Add maps and directions to your party invites.=20
http://www.microsoft.com/windows/windowslive/products/events.aspx=


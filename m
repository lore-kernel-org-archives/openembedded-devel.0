Received: from gn237.zone.eu ([217.146.67.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <plaes@plaes.org>) id 1SQiS5-0003hX-OP
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 May 2012 19:07:25 +0200
Received: from wow (184-146-131-46.internet.emt.ee [46.131.146.184])
	(Authenticated sender: plaes@plaes.org)
	by gn237.zone.eu (Postfix) with ESMTPSA id 6F4FBDEB0B36
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 May 2012 19:57:35 +0300 (EEST)
Received: by wow (sSMTP sendmail emulation); Sat, 05 May 2012 19:57:13 +0300
From: "Priit Laes" <plaes@plaes.org>
Message-ID: <1336237032.22405.2.camel@localhost.localdomain>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 05 May 2012 19:57:12 +0300
X-Mailer: Evolution 3.4.1 
Mime-Version: 1.0
Subject: [meta-handheld] Troubles building kernel for h2200
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
X-List-Received-Date: Sat, 05 May 2012 17:07:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey!
       =20
Has anyone recently tried to build (HP iPAQ) h2200 target?
       =20
I'm currently getting following build failure when trying to compile
kernel via `bitbake virtual/kernel`:
       =20
[snip]
  SYSMAP  System.map
  SYSMAP  .tmp_System.map
  MODPOST vmlinux
  OBJCOPY arch/arm/boot/Image
  Kernel: arch/arm/boot/Image is ready
  AS      arch/arm/boot/compressed/head-h2200.o
  GZIP    arch/arm/boot/compressed/piggy.gz
  CC      arch/arm/boot/compressed/misc.o
In file included from arch/arm/boot/compressed/misc.c:30:0:
include/asm/arch/uncompress.h:20:20: warning: conflicting types for built-i=
n function 'putc'
  AS      arch/arm/boot/compressed/head-xscale.o
  AS      arch/arm/boot/compressed/piggy.o
  LD      arch/arm/boot/compressed/vmlinux
arch/arm/boot/compressed/head-h2200.o:(.start+0x0): undefined reference to =
`no symbol'
make[2]: *** [arch/arm/boot/compressed/vmlinux] Error 1
make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
make: *** [zImage] Error 2
ERROR: oe_runmake failed
[/snip]



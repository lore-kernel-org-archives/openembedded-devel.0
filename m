Received: from gn237.zone.eu ([217.146.67.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <plaes@plaes.org>) id 1SQvpS-0005rs-By
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 May 2012 09:24:26 +0200
Received: from wow (198-8-131-46.internet.emt.ee [46.131.8.198])
	(Authenticated sender: plaes@plaes.org)
	by gn237.zone.eu (Postfix) with ESMTPSA id 434D4DEB0B36
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 May 2012 10:14:35 +0300 (EEST)
Received: by wow (sSMTP sendmail emulation); Sun, 06 May 2012 10:14:11 +0300
From: "Priit Laes" <plaes@plaes.org>
Message-ID: <1336288450.2971.4.camel@localhost.localdomain>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 06 May 2012 10:14:10 +0300
In-Reply-To: <CAMKF1so7oUWmrYROtvk-1x9o6cfNJhgNUgibnc+YpwAv+tDm6g@mail.gmail.com>
References: <1336237032.22405.2.camel@localhost.localdomain>
	<4FA58128.7030906@gmail.com>
	<1336248354.26091.4.camel@localhost.localdomain>
	<CAMKF1so7oUWmrYROtvk-1x9o6cfNJhgNUgibnc+YpwAv+tDm6g@mail.gmail.com>
X-Mailer: Evolution 3.4.1 
Mime-Version: 1.0
Subject: Re: [meta-handheld] Troubles building kernel for h2200
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
X-List-Received-Date: Sun, 06 May 2012 07:24:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=9Chel kenal p=C3=A4eval, L, 05.05.2012 kell 16:32, kirjutas Khem Raj:
> On Sat, May 5, 2012 at 1:05 PM, Priit Laes <plaes@plaes.org> wrote:
> > =C3=9Chel kenal p=C3=A4eval, L, 05.05.2012 kell 12:36, kirjutas Khem Ra=
j:
> >> On 05/05/2012 09:57 AM, Priit Laes wrote:
> >> > include/asm/arch/uncompress.h:20:20: warning: conflicting types for
> >> > built-in function 'putc'
> >>
> >> what version of binutils+gcc is in play and which version of kernel is
> >> it ?
> > binutils-2.20.1-r9
> > gcc-4.5-r49+svnr184907
> >
> > And kernel is linux-handhelds-2.6-2.6.21-hh20-r27
> >
> > It's quite possible that I'm posting to the wrong place because I've se=
t
> > up the system using Angstrom's setup-scripts
> > ( https://github.com/angstrom-distribution/setup-scripts )
> > using the following tutorial:
> > http://www.angstrom-distribution.org/building-angstrom
> >
> >
>=20
> OK what does arch/arm/boot/compressed/head-h2200.s looks like ?
> it could be a linker problem. If you have option of chosing a
> different version of binutils then please try that to confirm
I've yet to figure out the proper steps to change the toolchain (which I
assume is the culprit), though head-h2200.s looks like this, after I
removed the header comments:

[snip]
#include <asm/mach-types.h>
		.section	".start", "ax"
		b	0x1000
		.org	0x40
		.ascii	"ECEC"
		.org	0x1000
		mov	r0, #0
		mov	r1, #(MACH_TYPE_H2200 & 0xff)
		orr	r1, r1, #(MACH_TYPE_H2200 & 0xff00)
		mov	r2, #0

#include "head.S"
[/snip]




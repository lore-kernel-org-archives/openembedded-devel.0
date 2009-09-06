Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MkEGX-00031C-GM
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 11:42:33 +0200
Received: from tamarin.localnet (unknown [211.48.194.125])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 771211B10C0F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2009 09:28:40 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 6 Sep 2009 09:22:52 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.1; i686; ; )
References: <200909060131.26060.holger+oe@freyther.de>
	<19c1b8a90909060116g521271b5ycf40bd83b76c0f64@mail.gmail.com>
In-Reply-To: <19c1b8a90909060116g521271b5ycf40bd83b76c0f64@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200909060922.52648.holger+oe@freyther.de>
Subject: Re: glibc and MIPS compile issue
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
X-List-Received-Date: Sun, 06 Sep 2009 09:42:33 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 06 September 2009 10:16:14 Khem Raj wrote:
> On Sat, Sep 5, 2009 at 4:31 PM, Holger Hans Peter
>
> Freyther<holger+oe@freyther.de> wrote:
> > Hey,
> >
> > I tried to compile for MIPS again and glibc fails with the below error:
> >
> >
> > /home/ich/build/mipsel/db1200/tmp/work/mipsel-angstrom-linux/glibc-2.9-
> > r35.2/build-mipsel-angstrom-linux/libc_pic.os: In function `_mcount':
> > ../sysdeps/generic/unwind-pe.c:(.debug_macinfo+0x5b398c0): relocation
> > truncated to fit: R_MIPS_HI16 against `_gp_disp'
> > collect2: ld gab 1 als Ende-Status zur=C3=BCck
> >
> >
> > has anyone a idea?
>
> what binutils version are you using.
> Does it happen with eglibc too ?

Oh sorry, I didn't try. This was a stock Angstrom but I put .-fno-omit-fram=
e-
pointer into my CFLAGS and this doesn't really work... It looks like I can =
not=20
compile glibc with a gcc that was compiled with -fno-omit-frame-pointer.

during the next weeks I will try eglibc but it will take some time as I tra=
vel
	z.



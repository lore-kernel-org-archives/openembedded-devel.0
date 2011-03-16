Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PzrLo-0001fn-ET
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 15:05:24 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PzrK0-0002Wd-SK
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 15:03:33 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300282755.3840.69.camel@mattotaupa>
References: <1300264546.3840.9.camel@mattotaupa>
	<4D80791E.2040803@gmail.com>  <1300265560.3840.10.camel@mattotaupa>
	<1300269370.2132.13010.camel@phil-desktop>
	<1300282755.3840.69.camel@mattotaupa>
Date: Wed, 16 Mar 2011 14:06:52 +0000
Message-ID: <1300284412.2132.13266.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: minimal-uclibc: gnutls-2.10.4-r11.0: task compile fails with `make[4]: *** [coding.lo] Error 1`
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
X-List-Received-Date: Wed, 16 Mar 2011 14:05:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-16 at 14:39 +0100, Paul Menzel wrote:
>         arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c coding.c -o coding.o
>         coding.c: In function 'asn1_length_der':
>         coding.c:101:1: internal compiler error: in dwarf2out_frame_debug_expr, at dwarf2out.c:2221
>         Please submit a full bug report,
>         with preprocessed source if appropriate.
>         See <http://gcc.gnu.org/bugs.html> for instructions.
>         {standard input}: Assembler messages:

From the looks of the error, you could probably work around the crash by
compiling without -g.  Obviously you'd lose debuggability but that might
or might not be a problem for your particular use case.

> I am wondering if the latest GCC 4.5 changes are causing this, but as
> always this is just an uneducated guess.

Could be.  Or it's possible that the bug has been latent for a long time
and has just been tickled by a recent change to CFLAGS.  I think the
inclusion of -g in the default opts is a relatively recent innovation.
You could bisect the recent changes if you want but, unless you want to
debug this for yourself, the best way to proceed is probably to follow
the directions in the error message and submit a bug report to upstream
GCC.

p.




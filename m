Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PznR3-00069e-9Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 10:54:33 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PznPQ-0002SD-Gy
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 10:52:52 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300265560.3840.10.camel@mattotaupa>
References: <1300264546.3840.9.camel@mattotaupa>
	<4D80791E.2040803@gmail.com>  <1300265560.3840.10.camel@mattotaupa>
Date: Wed, 16 Mar 2011 09:56:10 +0000
Message-ID: <1300269370.2132.13010.camel@phil-desktop>
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
X-List-Received-Date: Wed, 16 Mar 2011 09:54:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-16 at 09:52 +0100, Paul Menzel wrote:
> I am sorry. But I could not find an error message anywhere in
> `log.do_compile`. Please find the log file attached.

One of libtool's less endearing features is that it runs the compiler
for shared objects with errors directed to /dev/null.  I guess this is
to avoid getting repeated warnings for objects that are compiled both
shared and nonshared, but it does make it more tedious to debug this
kind of crash.  Anyway, the line in question is this one from your log
file:

arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c coding.c -o coding.o >/dev/null 2>&1

If you run that compile command manually with the ">/dev/null 2>&1" bit
removed then you should be able to see the errors.  Given that it's
apparently happening only with -fPIC enabled I would suspect that it's
an ice of some kind, rather than being uclibc's fault directly, but once
we have the error message it should be fairly obvious what's gone wrong.

p.





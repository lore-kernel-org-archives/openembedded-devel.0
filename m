Received: from [212.227.126.186] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>) id 1KljB9-0008BP-Lr
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Oct 2008 13:50:39 +0200
Received: from [10.0.0.200] (M9501.m.pppool.de [89.49.149.1])
	by mrelayeu.kundenserver.de (node=mrelayeu5) with ESMTP (Nemesis)
	id 0ML25U-1Klj6v1wOe-0006QS; Fri, 03 Oct 2008 13:46:18 +0200
Message-ID: <48E60608.4060105@linuxdevelopment.de>
Date: Fri, 03 Oct 2008 13:46:16 +0200
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.16 (X11/20080720)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, ulf.samuelsson@atmel.com
References: <4883BCB1.7020102@atmel.com>
In-Reply-To: <4883BCB1.7020102@atmel.com>
X-Enigmail-Version: 0.95.7
X-Provags-ID: V01U2FsdGVkX18uFPHEhpVxW103ZBK1/qfUUo3qKbMC1cjygpH
	OGTNoDcMt7dX0FNet11wIl2HMhrfcl7oVxlbl3d/vWeHhQN5bM
	sAf7caGXiUScOYfks1sXpZGkKlegsJyZzy7Uw54e6w=
Subject: Re: binutils fails for AVR32
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
X-List-Received-Date: Fri, 03 Oct 2008 11:50:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


> | Configuring in ./intl
> | configure: warning: build_alias=i686-linux: invalid host type
> | configure: warning: host_alias=i686-linux: invalid host type
> | configure: error: can only configure for one host and one target at a
> time
> | make[1]: *** [configure-intl] Error 1
> | make[1]: Leaving directory
> `/mnt/home/ulf/OpenEmbedded/build-avr32/tmp/work/avr32-angstrom-linux-uclibc/binutils-cross-2.17-r6/binutils-2.17/build.i686-linux.avr32-angstrom-linux-uclibc'
> 
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> 
> These problems seems to be caused by build_alias, host_alias and
> target_alias beeing passed to "configure", but these are only
> supported by binutils-2.18 and not 2.17 which is used by the AVR32.
> 
> I am adding
> ~ (cd ${B} && sed -i -e "s,'host_alias=i686-linux',," Makefile)
> ~ (cd ${B} && sed -i -e "s,'build_alias=i686-linux',," Makefile)
> ~ (cd ${B} && sed -i -e "s,'target_alias=avr32-angstrom-linux-uclibc',,"
> Makefile)
> 
> to the do_avr32_configure_bfd
> 
Did you add this as prepend to this stage ? in which bb file did you add
it ?
Did the whole toolchain work out for you now ?



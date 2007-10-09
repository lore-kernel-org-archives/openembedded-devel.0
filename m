Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1IfDgI-0000kf-TV
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2007 13:55:22 +0200
Received: from aquilonia ([::ffff:62.220.14.162])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Tue, 09 Oct 2007 12:49:35 +0100
	id 00064059.470B6ACF.000054E2
Date: Tue, 9 Oct 2007 13:49:29 +0200
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071009134929.0ebdf0ce@aquilonia>
In-Reply-To: <20071009131812.0f55c4d2@aquilonia>
References: <1191494488.2516.34.camel@toontown>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown>
	<EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>
	<D61182AC8012EA4EBC531B3AF23BE10947F630@tranzeo-mail2.12stewart.tranzeo.com>
	<4704F01B.70104@klever.net> <4705D99D.6070209@miromico.ch>
	<f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
	<f96d234e0710081320s567bf1bfie56eebca83afb6b2@mail.gmail.com>
	<1191918523.470b3bbb10a47@dominion.kabel.utwente.nl>
	<74d0deb30710090202i61cdd25n22f3519ebfd9147a@mail.gmail.com>
	<1191926182.20582.22.camel@localhost.localdomain>
	<20071009131812.0f55c4d2@aquilonia>
X-Mailer: Claws Mail 3.0.1 (GTK+ 2.10.11; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: oe for two target boards at the same time
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2007 11:55:23 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 9 Oct 2007 13:18:12 +0200
Graeme Gregory <dp@xora.org.uk> wrote:

> On Tue, 09 Oct 2007 12:36:22 +0200
> Richard Purdie <rpurdie@rpsys.net> wrote:
> > The issue should be fixed. I regularly make builds with a MACHINE ?=
> > entry but with MACHINE set in the environment too and it all seems
> > to work.
> > 
> > People keep telling me there is a problem but I've not seen any
> > reproducible test case...
> > 
> 
> NOTE: package binutils-cross-2.18-r0: task do_populate_staging:
> completed
> 
> looks fixed to me, I never used to be able to do this.
> 
Spoke too soon

checking for libc-friendly stddef.h... yes
checking whether we need to use -P to assemble .S files... no
checking whether .text pseudo-op must be used... yes
checking for assembler global-symbol directive... .globl
checking for .set assembler directive... no
checking for assembler .type directive prefix... %
checking for .symver assembler directive... yes
checking for ld --version-script... no
*** WARNING: You should not compile GNU libc without versioning. Not
using *** versioning will introduce incompatibilities so that old
binaries *** will not run anymore.
*** For versioning you need recent binutils (binutils-2.8.1.0.23 or
newer). checking for .previous assembler directive... yes
checking for .protected and .hidden assembler directive... yes
checking whether __attribute__((visibility())) is supported... yes
checking for broken __attribute__((visibility()))... no
checking for broken __attribute__((alias()))... no
checking whether to put _rtld_local into .sdata section... no
checking for arm-angstrom-linux-gnueabi-readelf...
arm-angstrom-linux-gnueabi-re adelf
checking for .preinit_array/.init_array/.fini_array support... no
configure: error: Need linker with .init_array/.fini_array support.
FATAL: oe_runconf failed

This is what happens if MACHINE=spitz bitbake angstrom-devel-image

Graeme



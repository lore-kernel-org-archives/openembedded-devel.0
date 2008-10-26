Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KuB3x-0002Ct-Hw; Sun, 26 Oct 2008 20:14:09 +0100
Received: from 88-111-134-150.dynamic.dsl.as9105.com ([88.111.134.150]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KuB3B-0008DS-FT; Sun, 26 Oct 2008 19:13:21 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gdv0a2$u5k$1@ger.gmane.org>
References: <gdv0a2$u5k$1@ger.gmane.org>
Date: Sun, 26 Oct 2008 19:13:19 +0000
Message-Id: <1225048399.4235.340.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: Making thumb builds easier in OE
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
X-List-Received-Date: Sun, 26 Oct 2008 19:14:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-10-25 at 13:35 +0200, Koen Kooi wrote:
> Hi,
> 
> I noticed that Phil fixed thumb interworking in glibc for armv4t which 
> spurred me to do this:
> 
> arm tune files: include tune-thumb by default
> * it defaults to non-thumb, so no functional change

Sadly it is not true to say that there is no functional change.
Including tune-thumb.inc with no further changes will set interworking
on by default: this is fairly transparent at ARMv5 and higher, but not
for ARMv4T.  It is probably not a good idea to default interworking on
for the latter architecture, which is to say that I think your changes
to tune-arm920t.inc and tune-arm9tdmi.inc should probably be undone.
(The same might be true for others: for example, I'm not sure offhand
what architecture ep9312 uses.)

> So people can now set ARM_INSTRUCTION_SET = "thumb" and resulting ARM 
> builds will be in thumb mode.
> 
> This does raise a few issues:
> 
>   1) How can we handle thumb2? I only changed the arm9 and arm11 tune 
> files, how should we do the arm1176 and cortex ones?

I'm not really sure what sort of 'handling' you are thinking of here.
Can you elaborate?

>   2) Since thumb packages are compatible with non-thumb ones we don't 
> really need a seperate arch, but keeping them same feels wrong and is a 
> QA nightmare.

I'm not sure that this is any worse than, say, -O2 vs -Os vs -O0, or
using different compilers.  There are already plenty of ways you can get
different output binaries in a way that isn't reflected in PACKAGE_ARCH,
and I have no real desire to see PACKAGE_ARCH become a sort of sha1 hash
of everything that went into the build environment.  Ultimately, I think
this is just something that DISTROs need to be grown-up about: they
should pick a set of policies for each nominal architecture, stick to
them, and be responsible for QAing any interoperability issues that
arise if they decide to change.

p.





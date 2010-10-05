Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P3E0e-0001QD-Jr
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 22:21:13 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id DEFAC1B10C05;
	Tue,  5 Oct 2010 20:24:38 +0000 (UTC)
Message-ID: <4CAB88A4.8000209@freyther.de>
Date: Wed, 06 Oct 2010 04:20:52 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
References: <4CAB2FBD.6060401@freyther.de>	<AANLkTikFS-A1T_tiu5_4ajBk=BKJU3Q=O4wqP2XcTxwf@mail.gmail.com>	<4CAB48A1.6050807@freyther.de>
	<AANLkTinnQ75Ytjz+dhQxfsqFVsGNw4CJbTViNEZz=eAP@mail.gmail.com>
In-Reply-To: <AANLkTinnQ75Ytjz+dhQxfsqFVsGNw4CJbTViNEZz=eAP@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Latest qt4-sdk-tools* patch is wrong
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
X-List-Received-Date: Tue, 05 Oct 2010 20:21:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/06/2010 04:13 AM, Dmitry Eremin-Solenikov wrote:

> 
> Prehistory: I'm building OE on the Debian lenny box with nearly no
> development packages
> installed (no X11 headers, etc.). qt4 configure script was trying to
> build xlib test.
> Compilation went OK (as there are X11 headers in the chroot). However
> during linkage,
> came a problem: xlib.o required libX11 which in turn required
> libxcb.so (with some symbols
> that were not available in the version in /usr/lib on my lenny) and
> libpthread-stubs.so.
> As configuration test did not pass rpath-link to gcc, linker failed to
> resolve libxcb.so from
> OE sysroot and thus failed link stage with undefined symbols.

> 
> I ain't sure that this description is very clear, but I hope this
> helps. At least I know for sure
> how to reproduce the problem.

Hi Dmitry,

I think you have figured out the root cause of why we were adding other libs
to the link line as well. In general this extra dependency is fixed when using
the -embedded option (or as someone pointed out... might be -no-x11 for stuff
< 4.7.). It would be good if your patch would contain this information itself.

thanks a lot

	z


PS: Your message does not seem to make it to the list, so I am not removing
parts of your email.



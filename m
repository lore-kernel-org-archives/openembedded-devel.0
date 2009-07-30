Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1MWQie-0006uy-Lg
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 10:10:33 +0200
Received: from tamarin.localnet (static.233.147.46.78.clients.your-server.de
	[78.46.147.233])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id DD94E1B10C13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2009 07:57:38 +0000 (UTC)
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jul 2009 09:35:16 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.2.98; i686; ; )
References: <20090728072202.GA5422@gmail.com>
	<200907290800.39598.holger+oe@freyther.de>
	<19c1b8a90907291055n67d716dh60fba8f064d99932@mail.gmail.com>
In-Reply-To: <19c1b8a90907291055n67d716dh60fba8f064d99932@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200907300935.16945.zecke@selfish.org>
Subject: Re: [RFC] Adding TLS selection choice to metadata
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
X-List-Received-Date: Thu, 30 Jul 2009 08:10:34 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 29 July 2009 19:55:38 Khem Raj wrote:

> > To cite my patch:
> >
> > +# The tls/ntpl support in uclibc is work in progress. For the current
> > +# targets we should build gcc with --enable-tls=no. In the future we
> > +# might want to enable TLS for certain architectures and uclibc versions
> > +# so this is why this method exists.
> > +def get_gcc_uclibc_tls_setting(bb, d):
> > +    return "--enable-tls=no"
>
> I was thinking of a case when say nptl is supported on mips
> but someone still wants to build with linuxthreads. In your patch you
> rely upon the target triplet to decide where to enable it and where
> not to. 

In my patch I solely rely on the power of a turing complete language called 
python. In this python method you can place a:

      if bb.data.getVar("TARGET_TLS", d, True)
           return ""

and be done, in analogue to the FPU setting (hence it is right below the FPU 
code). do you agree?

z.




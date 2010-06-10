Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OMoLE-0000c5-2Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 22:27:08 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1OMoH0-0007Gz-1x; Thu, 10 Jun 2010 21:22:46 +0100
From: Phil Blundell <philb@gnu.org>
To: Chris Larson <clarson@kergoth.com>
In-Reply-To: <AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
	<1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com>
Date: Thu, 10 Jun 2010 21:22:51 +0100
Message-ID: <1276201371.13179.20.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
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
X-List-Received-Date: Thu, 10 Jun 2010 20:27:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-06-10 at 12:55 -0700, Chris Larson wrote:
> Should this (ipv6 at least) use COMBINED_FEATURES, since it requires
> kernel/machine support for it to be useful, along with distro support?

I don't think it's machine dependent in any meaningful way; there is, to
my knowledge, no OE-supported hardware which is actually incapable of
supporting ipv6.  Any distro that wants to use it just needs to make
sure that the kernel support is present (either built-in or as a module)
on all the supported targets.  In any case, most packages will cope
gracefully with ipv6 being selected on in the configuration and then
found to be absent at runtime.

If you start factoring MACHINE_FEATURES into that kind of decision then,
logically, the package needs to have PACKAGE_ARCH=${MACHINE}.  I don't
think it would be a very good thing to start forcing packages down that
path unnecessarily.

p.





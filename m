Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MW4K7-00012w-Qs
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2009 10:15:43 +0200
Received: from tamarin.localnet (123-192-154-148.dynamic.kbronet.com.tw
	[123.192.154.148])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 00CF21B10C0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2009 08:02:56 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jul 2009 08:00:39 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.2.98; i686; ; )
References: <20090728072202.GA5422@gmail.com>
	<200907290614.40124.holger+oe@freyther.de>
	<19c1b8a90907290002i1a80a99fqfbb42128472f3299@mail.gmail.com>
In-Reply-To: <19c1b8a90907290002i1a80a99fqfbb42128472f3299@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200907290800.39598.holger+oe@freyther.de>
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
X-List-Received-Date: Wed, 29 Jul 2009 08:15:43 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 29 July 2009 09:02:39 Khem Raj wrote:
> On Tue, Jul 28, 2009 at 9:14 PM, Holger Hans Peter
>
> Freyther<holger+oe@freyther.de> wrote:
> > On Tuesday 28 July 2009 09:22:02 Khem Raj wrote:
> >> Hi
> >>
> >> Enabling TLS support on uclibc/glibc is not sound enough in out build.
> >> Reason is we depend upon various autotools tests to find out if the
> >> software combination we chose can support it or not and these tests are
> >> not doing the correct think many times.
> >
> > Have you seen the patch I sent? The title was
> > [oe] [PATCH] gcc: Pass --enable-tls=no on uclibc builds...
>
> I did however nptl/uclibc builds we need TLS support to be enabled
> and there is no way to differentiate the triplets for a NPTL uclibc
> toolchain from non NPTL toolchain. In future not all arches will get
> NPTL support
> on uclibc at once so we wil have few arches where NPTL will be there and
> that will require TLS whereas others will use Linux Threads and will
> have to disable TLS.

To cite my patch:

+# The tls/ntpl support in uclibc is work in progress. For the current
+# targets we should build gcc with --enable-tls=no. In the future we
+# might want to enable TLS for certain architectures and uclibc versions
+# so this is why this method exists.
+def get_gcc_uclibc_tls_setting(bb, d):
+    return "--enable-tls=no"


we are basically talking about the same thing? e.g. with the proposed 
TARGET_TLS you would add a if to the above and return "". right?

z.



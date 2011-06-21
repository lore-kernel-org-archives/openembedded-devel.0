Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1QZ4Hj-0007PB-80
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2011 18:58:57 +0200
Received: (qmail 12040 invoked from network); 21 Jun 2011 18:55:03 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 21 Jun 2011 18:55:03 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id V5HOykEQeofU
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:54:51 +0200 (CEST)
Received: (Qmail 11963 invoked from network); 21 Jun 2011 18:54:51 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 21 Jun 2011 16:54:51 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1QZ4Dy-0000ud-Ur
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:54:50 +0200
Date: Tue, 21 Jun 2011 18:54:50 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110621165450.GA1953@mi.fu-berlin.de>
References: <201106211432.22700.embedded@gmx.net>
	<1308660560.21613.16.camel@phil-desktop>
	<201106211519.23045.embedded@gmx.net>
MIME-Version: 1.0
In-Reply-To: <201106211519.23045.embedded@gmx.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: openssl-native-1.0.0d-r14.0 compile fails
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
X-List-Received-Date: Tue, 21 Jun 2011 16:58:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 21, 2011 at 03:19:22PM +0200, A. Schallenberg wrote:
> Hi,
> 
> Am Dienstag, 21. Juni 2011, um 14:49:20 schrieb Phil Blundell:
> > ...
> > It isn't likely that your choice of toolchain is causing this problem,
> > since the package in question is a -native one.  From the error you
> > pasted it looks as though the recipe has simply failed to unpack any
> > source code, or at least not the complete source code.  What do you have
> > in the WORKDIR at that point?
> > ...
> 
> Is this the directory in question?
> 
> > setup-scripts$ find sources/openembedded/recipes/openssl/
> sources/openembedded/recipes/openssl/
> sources/openembedded/recipes/openssl/ocf-linux_20100325.bb
> sources/openembedded/recipes/openssl/openssl.inc
> sources/openembedded/recipes/openssl/openssl-native_1.0.0d.bb
> sources/openembedded/recipes/openssl/openssl_0.9.8m.bb
> sources/openembedded/recipes/openssl/ocf-linux.inc
> sources/openembedded/recipes/openssl/openssl_1.0.0d.bb
> sources/openembedded/recipes/openssl/openssl-native_0.9.8m.bb
> sources/openembedded/recipes/openssl/openssl-1.0.0d
> sources/openembedded/recipes/openssl/openssl-1.0.0d/engines-install-in-libdir-
> ssl.patch
> sources/openembedded/recipes/openssl/openssl-1.0.0d/shared-libs.patch
> sources/openembedded/recipes/openssl/openssl-1.0.0d/oe-ldflags.patch
> sources/openembedded/recipes/openssl/openssl-1.0.0d/libdeps-first.patch
> sources/openembedded/recipes/openssl/openssl-1.0.0d/debian.patch
> sources/openembedded/recipes/openssl/openssl-1.0.0d/configure-targets.patch
> sources/openembedded/recipes/openssl/openssl-0.9.8m
> sources/openembedded/recipes/openssl/openssl-0.9.8m/shared-libs.patch
> sources/openembedded/recipes/openssl/openssl-0.9.8m/oe-ldflags.patch
> sources/openembedded/recipes/openssl/openssl-0.9.8m/Configure-nios2.patch
> sources/openembedded/recipes/openssl/openssl-0.9.8m/debian.patch
> sources/openembedded/recipes/openssl/openssl-0.9.8m/configure-targets.patch
> 
> Best,
> Andreas

No,

if you would have read the oe-manual, you would have found
that the workdir is TMPDIR(set in local.conf)/work/arch-tripple/recipename-version

Bye Henning



Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <embedded@gmx.net>) id 1QZ11R-0003Gq-TU
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2011 15:29:41 +0200
Received: (qmail invoked by alias); 21 Jun 2011 13:19:26 -0000
Received: from mx.3alitydigital.de (EHLO gport016linuxx64.localnet)
	[212.144.240.82]
	by mail.gmx.net (mp018) with SMTP; 21 Jun 2011 15:19:26 +0200
X-Authenticated: #118086913
X-Provags-ID: V01U2FsdGVkX1+0zul/VVS0nsy+8SkhZZUObiO4phEVyLeQv6y/aC
	iWmwAWPWFsnnyd
From: "A. Schallenberg" <embedded@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jun 2011 15:19:22 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-28-generic; KDE/4.5.5; x86_64; ; )
References: <201106211432.22700.embedded@gmx.net>
	<1308660560.21613.16.camel@phil-desktop>
In-Reply-To: <1308660560.21613.16.camel@phil-desktop>
MIME-Version: 1.0
Message-Id: <201106211519.23045.embedded@gmx.net>
X-Y-GMX-Trusted: 0
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
X-List-Received-Date: Tue, 21 Jun 2011 13:29:42 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

Am Dienstag, 21. Juni 2011, um 14:49:20 schrieb Phil Blundell:
> ...
> It isn't likely that your choice of toolchain is causing this problem,
> since the package in question is a -native one.  From the error you
> pasted it looks as though the recipe has simply failed to unpack any
> source code, or at least not the complete source code.  What do you have
> in the WORKDIR at that point?
> ...

Is this the directory in question?

> setup-scripts$ find sources/openembedded/recipes/openssl/
sources/openembedded/recipes/openssl/
sources/openembedded/recipes/openssl/ocf-linux_20100325.bb
sources/openembedded/recipes/openssl/openssl.inc
sources/openembedded/recipes/openssl/openssl-native_1.0.0d.bb
sources/openembedded/recipes/openssl/openssl_0.9.8m.bb
sources/openembedded/recipes/openssl/ocf-linux.inc
sources/openembedded/recipes/openssl/openssl_1.0.0d.bb
sources/openembedded/recipes/openssl/openssl-native_0.9.8m.bb
sources/openembedded/recipes/openssl/openssl-1.0.0d
sources/openembedded/recipes/openssl/openssl-1.0.0d/engines-install-in-libdir-
ssl.patch
sources/openembedded/recipes/openssl/openssl-1.0.0d/shared-libs.patch
sources/openembedded/recipes/openssl/openssl-1.0.0d/oe-ldflags.patch
sources/openembedded/recipes/openssl/openssl-1.0.0d/libdeps-first.patch
sources/openembedded/recipes/openssl/openssl-1.0.0d/debian.patch
sources/openembedded/recipes/openssl/openssl-1.0.0d/configure-targets.patch
sources/openembedded/recipes/openssl/openssl-0.9.8m
sources/openembedded/recipes/openssl/openssl-0.9.8m/shared-libs.patch
sources/openembedded/recipes/openssl/openssl-0.9.8m/oe-ldflags.patch
sources/openembedded/recipes/openssl/openssl-0.9.8m/Configure-nios2.patch
sources/openembedded/recipes/openssl/openssl-0.9.8m/debian.patch
sources/openembedded/recipes/openssl/openssl-0.9.8m/configure-targets.patch

Best,
Andreas



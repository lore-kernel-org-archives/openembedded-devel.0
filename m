Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MBOwl-000635-JW
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 10:02:11 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MBOoB-000865-PY
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 08:53:20 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <C62896630644CE43BF64B0FF0AC27F0E05B4D2@mail.ad.skymv.com>
References: <C62896630644CE43BF64B0FF0AC27F0E05B4D2@mail.ad.skymv.com>
Date: Tue, 02 Jun 2009 08:53:18 +0100
Message-Id: <1243929198.5049.45.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: bitbake virtual/kernel -c menuconfig
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
X-List-Received-Date: Tue, 02 Jun 2009 08:02:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-06-01 at 13:41 -0700, Chuck Kamas wrote:
> They both now complain that it can not open a display.  I have traced
> this to the fact that DISPLAY is not set to 0.0 in either the minimal or
> the micro distributions.  The only place I can find display set in the
> recopies is in xqtlauncher and startxqt.  So how do I set up an export
> DISPLAY=0.0 such that menuconfig gets it?

I'd have thought you would be able to put it in the environment, but
failing that local.conf should work.

> Also I noticed that the patch files are being applied before menuconfig
> in Angstrom but not in minimal and micro.  How do I fix this?

That's a bit odd.  Which particular kernel are you trying to build?

p.





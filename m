Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NForb-0003Q9-6G
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 14:03:26 +0100
Received: from tamarin.localnet (unknown [122.181.150.106])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A34C81B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2009 13:14:20 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 2 Dec 2009 14:01:42 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <4B0CC1A4.1060401@gmail.com>
	<200912020749.50936.holger+oe@freyther.de>
	<4B163ABC.6010008@gmail.com>
In-Reply-To: <4B163ABC.6010008@gmail.com>
MIME-Version: 1.0
Message-Id: <200912021401.42124.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Making simple QTE application, cannot find libpthread_nonshared.a
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
X-List-Received-Date: Wed, 02 Dec 2009 13:03:26 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 02 December 2009 11:00:28 Dmitry Vinokurov wrote:

> Here is search results:
> --------
> [14:50]raydan@t46x[build]$ find tmp | grep libpthread_nonshared.a
> tmp/staging/armv5te-oe-linux-gnueabi/usr/lib/libpthread_nonshared.a
> tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/staging-pkg/staging/armv
> 5te-oe-linux-gnueabi/usr/lib/libpthread_nonshared.a
>  tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/image/usr/lib/libpthrea
> d_nonshared.a
>  tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/package/usr/lib/libpthr
> ead_nonshared.a
>  tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/build-arm-oe-linux-gnue
> abi/nptl/libpthread_nonshared.a --------

ah eglibc... so your finding is that this library is not in any glibc-* 
package? So when building glibc you must get a warning like unpackaged 
content...   could you take a look at the log?

In high level terms. The library should be in a package (like -dev) and it 
should be installed. If that is not the case it must be fixed.


thanks
	z.



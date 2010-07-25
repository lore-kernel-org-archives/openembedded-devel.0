Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Od6GU-0006Tc-0V
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 20:49:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id EA0B81416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 20:54:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82fZ8Tq0VKRN
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 20:54:46 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id B95ED1416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 20:54:46 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinYV5jJRxJVqU83HNe0z2ywBpVBiJiNZVCxXYca@mail.gmail.com>
References: <E1OcfGN-0007DB-9C@melo.openembedded.org>
	<AANLkTik35dsZ6rMfu8KJNo7ZoKd6071ELAhYmzr6T7Y+@mail.gmail.com>
	<1280009695.11135.21.camel@utx.lan>
	<AANLkTinYV5jJRxJVqU83HNe0z2ywBpVBiJiNZVCxXYca@mail.gmail.com>
Date: Sun, 25 Jul 2010 20:49:19 +0200
Message-ID: <1280083759.29269.8.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Stanislav Brabec : akita.conf, spitz.conf: Set PREFERRED_PROVIDER for udev-compat to udev-compat141.
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
X-List-Received-Date: Sun, 25 Jul 2010 18:49:34 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Bernhard Reutner-Fischer wrote:
> Just curious.. but wouldn't the logical scheme be that linux-2.6.26 sets the
> preferred udev version?

Kernel is machine specific package, udev has machine independent
version.

If you do this, you cannot use armv5te feed and all machines that do it
must be considered as a separate platform:

- If you subscribe to armv5te, then opkg upgrade will upgrade back to
  udev-151 and your system will fail to boot.

If you unsibscribe from armv5te and create new platform armv5teoldudev
then:

- Old udev does not support libudev and libgudev. Application that
  depend on it can't be built.

=> udev-compat is still the simplest solution

Another simple solution would be forcing of udev as machine specific
package for all machines and remove it from the platform feed.

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




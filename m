Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NwayG-0002F8-6v
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 14:55:05 +0200
Received: from host86-159-44-123.range86-159.btcentralplus.com
	([86.159.44.123] helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Nwav7-0004Vi-IO
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 13:51:50 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1Nwav6-0003oD-CM
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 13:51:48 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hosrca$7qu$1@dough.gmane.org>
References: <1269730499.4033.176.camel@mattotaupa>
	<hon5i2$8iq$1@dough.gmane.org> <1269797481.8018.80.camel@mattotaupa>
	<hooat6$p3d$1@dough.gmane.org> <1269949824.4103.38.camel@mattotaupa>
	<hosrca$7qu$1@dough.gmane.org>
Date: Tue, 30 Mar 2010 13:51:45 +0100
Message-ID: <1269953505.14554.2.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] autotool.bbclass: Remove `EXTRA_AUTORECONF = "--exclude=autopoint"`.
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
X-List-Received-Date: Tue, 30 Mar 2010 12:55:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-03-30 at 14:38 +0200, Koen Kooi wrote:
> I wonder if we only should run autopoint if there are AM_GNU_GETTEXT*
> macros in configure.{in,ac}, or does autopoint take care of that
> automagically?

Autoreconf has some (limited) logic to figure out whether autopoint is
needed.  I think that ought to be sufficient.

p.





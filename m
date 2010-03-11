Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NphaV-0007jT-Kj
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 13:34:07 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NphXY-0004E7-H8
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 12:31:00 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NphXY-0000NY-5t
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 12:31:00 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <738913.90211.qm@web88207.mail.re2.yahoo.com>
References: <738913.90211.qm@web88207.mail.re2.yahoo.com>
Date: Thu, 11 Mar 2010 12:30:56 +0000
Message-ID: <1268310656.14566.1084.camel@mill.internal.reciva.com>
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
Subject: Re: [oe-commits] Phil Blundell : gtk+: build gtk-demo and package it appropriately
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
X-List-Received-Date: Thu, 11 Mar 2010 12:34:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've managed to reproduce this problem now, and I have checked in an
extra patch (as well as the previous ones) which fixes it for me.  Does
that work for you?

p.

On Wed, 2010-03-10 at 15:53 -0800, JOSEPH KORTJE wrote:
> Hi Phil and Steve:
> 
> If we *either* install 
> 
> sudo apt-get install libgtk2.0-dev
> 
> or if we do
> 
> bitbake gdk-pixbuf-csource-native
> 
> FIRST 
> 
> 
> Then the
> 
>     bitbake gtk+
> 
> succeeds.
> 
> Otherwise, with the same tree used by Steve, same results as Steve mentions.
> 
> Any ideas why?
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





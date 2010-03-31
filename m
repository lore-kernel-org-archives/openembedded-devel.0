Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Nwwno-0004DV-7q
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 14:13:44 +0200
Received: from host86-159-44-123.range86-159.btcentralplus.com
	([86.159.44.123] helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Nwwkf-0008FI-0Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 13:10:29 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1Nwwke-0000G2-0i
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 13:10:28 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <y2oac9c93b11003310445gb3deec55va9bd2664d0336584@mail.gmail.com>
References: <1270034881.1681.965.camel@rex>
	<y2oac9c93b11003310445gb3deec55va9bd2664d0336584@mail.gmail.com>
Date: Wed, 31 Mar 2010 13:10:24 +0100
Message-ID: <1270037424.14554.47.camel@mill.internal.reciva.com>
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
Subject: Re: gcc Recipes
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
X-List-Received-Date: Wed, 31 Mar 2010 12:13:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-31 at 13:45 +0200, Frans Meulenbroeks wrote:
> But still I wonder what is e.g. the use of recipes like 4.1.1 (which
> btw was released in may 2006).

Binary compatibility with existing distributions which use that version
of gcc.  This is particularly important for kernel modules where the
exact compiler version needs to match, and it is also something of an
issue for folks using C++.

p.





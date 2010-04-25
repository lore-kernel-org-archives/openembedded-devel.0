Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1O66zK-0001rm-W4
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 20:55:31 +0200
Received: from 88-108-80-109.dynamic.dsl.as9105.com ([88.108.80.109]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1O66vk-0008Dw-PK
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 19:51:48 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1272217739.3865.546.camel@trini-m4400>
References: <1272217739.3865.546.camel@trini-m4400>
Date: Sun, 25 Apr 2010 19:51:47 +0100
Message-ID: <1272221507.4544.13.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The coreutils-native race...
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
X-List-Received-Date: Sun, 25 Apr 2010 18:55:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-04-25 at 10:48 -0700, Tom Rini wrote:
> Hey all.  I thought I would try and explain what Chris has been up to
> There's a few ways out of this:
> 1) Don't rely on 'cp' and 'md5sum' anymore but use python for it.
> 2) Make an oe_cp and oe_md5sum to go with oe_sha256sum
> 3) IIRC, the big part of coreutils-native was a fully functional,
> always, 'install'.  We could just copy the install we build or provide
> an install wrapper (oe_install) or so
> 4) ???

How about making the coreutils-native staging process be atomic, i.e.
install binaries as cp.new (or whatever) and then do "mv cp.new cp"?
Or, more generally I guess, arrange for new-style staging to do that for
all binaries it installs.

If (3) is sufficient then it seems like we might just as well exhume the
old install-native package and ditch coreutils-native altogether.  That
would avoid the race since it doesn't install anything other than
install.

p.





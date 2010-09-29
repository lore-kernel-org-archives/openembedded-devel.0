Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P0y6d-0004g1-9s
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 16:58:04 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 2168F1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 15:01:06 +0000 (UTC)
Message-ID: <4CA353EE.8040605@freyther.de>
Date: Wed, 29 Sep 2010 22:57:50 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285771725-32231-1-git-send-email-t.fromm@dresearch.de>
In-Reply-To: <1285771725-32231-1-git-send-email-t.fromm@dresearch.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qemu-0.12.5: add ncurses, gnutls dependencies
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
X-List-Received-Date: Wed, 29 Sep 2010 14:58:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/29/2010 10:48 PM, Thilo Fromm wrote:
> QEmu build breaks occassionally because some of the libraries required
> have not been built at the time qemu is being built. I ran into problems
> with the "qemu-native" build which tried to link against host libraries
> and subsequently failed:

> | /usr/lib/gcc/x86_64-linux-gnu/4.4.3/../../../../lib/libgnutls.so: undefined reference to `gcry_cipher_setkey@GCRYPT_1.2'
> | /usr/lib/gcc/x86_64-linux-gnu/4.4.3/../../../../lib/libgnutls.so: undefined reference to `gcry_cipher_setiv@GCRYPT_1.2'

hmm no... the bug is more with libgnutls of your system not linking to gcrypt.
I have this with JHBUILD building GNOME 3.x.




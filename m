Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QOcgS-0004fu-VA
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 23:29:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 325F11416BB2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 23:28:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sChbJ1e-+Vc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 23:28:40 +0200 (CEST)
Received: from [192.168.1.2] (233-15-80-78.tmcz.cz [78.80.15.233])
	by ns.penguin.cz (Postfix) with ESMTP id 028D41416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 23:28:39 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 May 2011 23:26:05 +0200
Message-ID: <1306185965.5948.19.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Subject: RFC: Remove -e from default EXTRA_OEMAKE
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
X-List-Received-Date: Mon, 23 May 2011 21:29:05 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Hallo.

EXTRA_OEMAKE contains -e by default for years (in bitbake.conf). In my
opinion it causes more bad than good.

It makes live simpler in (rare) cases when Makefile proposes its own
default CFLAGS without chance to easily change them from outside, but it
causes subtle (and often overseen) breakages in many other cases. For
example "-e" in EXTRA_OEMAKE caused breakage of crda (tested with GNU
make 3.82):
ifeq ($(USE_OPENSSL),1)
CFLAGS += -DUSE_OPENSSL
endif

As you can check, there are several hundreds of recipes that need to
override this default. Also autotools.bbclass,
distutils-common-base.bbclass, qmake_base.bbclass and kernel.bbclass
remove "-e" from default make flags. It means that at least 6000 recipes
remove "-e" from EXTRA_OEMAKE.

That is why I think that "-e" should not be a default. If needed, it
would be easy to add it for particular recipes.

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




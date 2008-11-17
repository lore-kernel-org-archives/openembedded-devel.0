Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L25uv-0007j4-CC
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 16:21:40 +0100
Received: from c120.apm.etc.tu-bs.de ([134.169.174.120] helo=localhost)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1L25sc-0000xj-SR by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2008 16:19:13 +0100
Received: from stefan by localhost with local (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L25sc-00067v-0O
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 16:19:10 +0100
Date: Mon, 17 Nov 2008 16:19:09 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081117151909.GG11401@datenfreihafen.org>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Moving fontconfig cache out of tmpfs
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
X-List-Received-Date: Mon, 17 Nov 2008 15:22:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Raster found out a pretty interestesting optimization option.

At the moment we refer to the fontconfig cahc elike this in
/etc/fonts/fonts.conf:

<cachedir>/var/cache/fontconfig</cachedir>

/var/cache is a symlink to var/volatile/cache which is mounted as tmpfs.

This means that the cache has to regenerated on every boot. This can cost up to
20s.

What do people think about pointing this to something not mounted as tmpfs? Any
problems I'm not aware of?

regards
Stefan Schmidt



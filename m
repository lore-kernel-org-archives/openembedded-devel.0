Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L2XhK-0005pB-Ux
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 22:01:23 +0100
Received: from p5b036248.dip.t-dialin.net ([91.3.98.72]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1L2Xew-0003Qb-A1 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2008 21:58:57 +0100
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1L2Xgi-0000fJ-9H for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 22:00:44 +0100
Date: Tue, 18 Nov 2008 22:00:44 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081118210044.GA2528@dodger.lab.datenfreihafen.org>
References: <20081117151909.GG11401@datenfreihafen.org>
	<c384c5ea0811171047oa367b5bg25d01e3f50a9592f@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0811171047oa367b5bg25d01e3f50a9592f@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: Moving fontconfig cache out of tmpfs
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
X-List-Received-Date: Tue, 18 Nov 2008 21:01:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2008-11-17 at 19:47, Leon Woestenberg wrote:
> 
> /var/lib/ looks fine to me.

Luckily fontconfig already has a configure option for the cache dir. Only some
small EXTRA_OECONF fiddeling was needed.

People are fine with this?

diff --git a/packages/fontconfig/fontconfig.inc b/packages/fontconfig/fontconfig.inc
index 252b843..9af3540 100644
--- a/packages/fontconfig/fontconfig.inc
+++ b/packages/fontconfig/fontconfig.inc
@@ -18,7 +18,7 @@ inherit autotools pkgconfig
 
 export HASDOCBOOK="no"
 
-EXTRA_OECONF = " --disable-docs"
+EXTRA_OECONF = " --disable-docs --with-cache-dir=/var/lib/fontconfig"
 EXTRA_OEMAKE = "FC_LANG=fc-lang FC_GLYPHNAME=fc-glyphname"
 
 # The tarball has some of the patched files as read only, which
diff --git a/packages/fontconfig/fontconfig_2.6.0.bb b/packages/fontconfig/fontconfig_2.6.0.bb
index 3f7eca4..d6c1019 100644
--- a/packages/fontconfig/fontconfig_2.6.0.bb
+++ b/packages/fontconfig/fontconfig_2.6.0.bb
@@ -24,7 +24,7 @@ inherit autotools pkgconfig
 
 export HASDOCBOOK="no"
 
-EXTRA_OECONF = " --disable-docs --with-arch=${HOST_ARCH}"
+EXTRA_OECONF = " --disable-docs --with-arch=${HOST_ARCH} --with-cache-dir=/var/lib/fontconfig"
 EXTRA_OEMAKE = "FC_LANG=fc-lang FC_GLYPHNAME=fc-glyphname"
 
 # The tarball has some of the patched files as read only, which

regards
Stefan Schmidt



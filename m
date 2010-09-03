Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <plagnioj@jcrosoft.com>) id 1OrZcq-0002IK-7H
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 19:00:28 +0200
Received: (qmail 28877 invoked by uid 503); 3 Sep 2010 17:21:53 -0000
Received: from b6.ovh.net (HELO mail180.ha.ovh.net) (213.186.33.56)
	by 63.mail-out.ovh.net with SMTP; 3 Sep 2010 17:21:53 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 3 Sep 2010 18:59:53 +0200
Received: from ns32433.ovh.net (HELO localhost)
	(plagnioj%jcrosoft.com@213.251.161.87)
	by ns0.ovh.net with SMTP; 3 Sep 2010 18:59:52 +0200
Date: Fri, 3 Sep 2010 18:59:17 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100903165917.GJ17702@game.jcrosoft.org>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<AANLkTin7HBBUQk0STC=zAPgbceC+dfLFB=3eaYORr7Ws@mail.gmail.com>
	<20100903164708.GI17702@game.jcrosoft.org>
MIME-Version: 1.0
In-Reply-To: <20100903164708.GI17702@game.jcrosoft.org>
X-PGP-Key: http://uboot.jcrosoft.org/plagnioj.asc
X-PGP-key-fingerprint: 6309 2BBA 16C8 3A07 1772 CC24 DEFC FFA3 279C CE7C
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Ovh-Tracer-Id: 2992641954150067017
X-Ovh-Remote: 213.251.161.87 (ns32433.ovh.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: plagnioj@jcrosoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to extend SRC_URI_append?
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
X-List-Received-Date: Fri, 03 Sep 2010 17:00:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18:47 Fri 03 Sep     , Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 07:44 Fri 03 Sep     , Chris Larson wrote:
> > The append syntax you're referring to uses OVERRIDES.  FOO_somevalue
> > replaces FOO if somevalue is in OVERRIDES.  FOO_append_somevalue is added to
> > FOO if somevalue is in OVERRIDES.  I don't think SOC_FAMILY is in overrides
> > at this time.
> how can I extend it?
is this ok?

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 677c76a..ecdf245 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -677,9 +677,9 @@ BUILDCFG_NEEDEDVARS ?= "TARGET_ARCH TARGET_OS"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
+OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:${SOC_FAMILY}:${TARGET_ARCH}_${SOC_FAMILY}:build-${BUILD_OS}:fail-fast:pn-${PN}"
 # Alternative OVERRIDES definition without "fail fast", usually only for native building and Scratchbox toolchains.
-#OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}"
+#OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:${SOC_FAMILY}:${TARGET_ARCH}_${SOC_FAMILY}:build-${BUILD_OS}:pn-${PN}"
 
 ##################################################################
 # Include the rest of the config files.

Best Regards,
J.



Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <plagnioj@jcrosoft.com>) id 1Ouz4L-00029t-3w
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 04:46:57 +0200
Received: (qmail 14421 invoked by uid 503); 13 Sep 2010 02:59:37 -0000
Received: from b6.ovh.net (HELO mail21.ha.ovh.net) (213.186.33.56)
	by 31.mail-out.ovh.net with SMTP; 13 Sep 2010 02:59:37 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Sep 2010 04:46:11 +0200
Received: from ns32433.ovh.net (HELO localhost)
	(plagnioj%jcrosoft.com@213.251.161.87)
	by ns0.ovh.net with SMTP; 13 Sep 2010 04:46:10 +0200
Date: Mon, 13 Sep 2010 04:45:12 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100913024512.GA11822@game.jcrosoft.org>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
	<i6i1v8$kif$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i6i1v8$kif$1@dough.gmane.org>
X-PGP-Key: http://uboot.jcrosoft.org/plagnioj.asc
X-PGP-key-fingerprint: 6309 2BBA 16C8 3A07 1772 CC24 DEFC FFA3 279C CE7C
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Ovh-Tracer-Id: 10408381690008283977
X-Ovh-Remote: 213.251.161.87 (ns32433.ovh.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.10
X-SA-Exim-Mail-From: plagnioj@jcrosoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make it global
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
X-List-Received-Date: Mon, 13 Sep 2010 02:46:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10:11 Sun 12 Sep     , Koen Kooi wrote:
> On 04-09-10 05:14, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > add global OVERRIDES ${TARGET_SOC_FAMILY} and ${TARGET_ARCH}_${TARGET_SOC_FAMILY}
> 
> NAK, introducing a new override that combines 2 existing overrides with
> a '_', is not allowed. And it isn't needed as Chase has tried to point
> out already
except I do point case where it's really needed
and I'm working on adding new soc to oe and I do need it
> 
> You're also changing the overrides order, which needs a lot more testing
> and ACKs from the people using it.
currently only TI package use it
and here the idea is not to change the order but extend it
> 
> ANd furthermore you're renaming it to have more underscores (adding
> 'TARGET_', while it was decided at OEDEM that using underscored should
> be avoided, since it's out override seperator.
so we need to rename all TARGET_ to TARGET-???

Best Regards,
J.



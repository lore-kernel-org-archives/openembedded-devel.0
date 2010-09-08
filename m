Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <plagnioj@jcrosoft.com>) id 1OtBeB-00023s-8U
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 05:48:34 +0200
Received: (qmail 6974 invoked by uid 503); 8 Sep 2010 03:47:32 -0000
Received: from b9.ovh.net (HELO mail194.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 8 Sep 2010 03:47:32 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 8 Sep 2010 05:47:49 +0200
Received: from ns32433.ovh.net (HELO localhost)
	(plagnioj%jcrosoft.com@213.251.161.87)
	by ns0.ovh.net with SMTP; 8 Sep 2010 05:47:48 +0200
Date: Wed, 8 Sep 2010 05:47:02 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100908034702.GH30509@game.jcrosoft.org>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFA4BD@dlee06.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310BFA4BD@dlee06.ent.ti.com>
X-PGP-Key: http://uboot.jcrosoft.org/plagnioj.asc
X-PGP-key-fingerprint: 6309 2BBA 16C8 3A07 1772 CC24 DEFC FFA3 279C CE7C
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Ovh-Tracer-Id: 532550657819126601
X-Ovh-Remote: 213.251.161.87 (ns32433.ovh.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.30.210
X-SA-Exim-Mail-From: plagnioj@jcrosoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make it	global
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
X-List-Received-Date: Wed, 08 Sep 2010 03:48:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 09:43 Tue 07 Sep     , Maupin, Chase wrote:
> > add global OVERRIDES ${TARGET_SOC_FAMILY} and
> > ${TARGET_ARCH}_${TARGET_SOC_FAMILY}
> > 
> For my part I would ask why you are renaming SOC_FAMILY to TARGET_SOC_FAMILY?  Why not leave the name the way it is since others may be using it in overlays, etc?
to be consistant it's the TARGET SOC FAMILY not the host
as the ARCH
> 
> Also, you might want to make sure your patch would include Fran's fix to base.bbclass that he mentioned at http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-September/023680.html
> 
> For what my input is worth I would NAK this patch because:
> 
> 1.  I don't see a reason to add this to the generic set of overrides.
because you need for SoC support and it's not distrib related but hardware
related (SoC familly)
> 2.  I don't understand why the name of the variable SOC_FAMILY needs to be changed.  I know this will break existing overlays and I don't see any reason why the change is made.
> 3.  I disagree with the ${TARGET_ARCH}_${TARGET_SOC_FAMILY} override.  If you have two patch series for different architectures then you should have two SOC_FAMILY settings or use the MACHINE setting for the override.  I think this override is confusing and redundant.
no as I describe already the same doc familly can be run on two or more ARCH
so this make sens and no it's no the machine to handle this but each receipe

and no it's not redundant at all it's more precises as at receipe level you
may we do this

SRC_URI_arm += patches

SRC_URI_arm_mnt += patches

SRC_URI_mnt += patches

SRC_URI_mips += patches

SRC_URI_mips_mnt += patches

so yes it's need

Best Regards,
J.



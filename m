Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OeCgN-0001UG-3f for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 21:52:52 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OeCg4-0000t2-Cw for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 21:52:32 +0200
Received: from a88-112-42-160.elisa-laajakaista.fi ([88.112.42.160])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 21:52:32 +0200
Received: from matti.kaasinen by a88-112-42-160.elisa-laajakaista.fi with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 21:52:32 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Matti Kaasinen <matti.kaasinen@gmail.com>
Date: Wed, 28 Jul 2010 19:52:20 +0000 (UTC)
Message-ID: <loom.20100728T213036-290@post.gmane.org>
References: <op.u7dv44vqmn1qzu@camelguo>
	<201002011021.47660.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 88.112.42.160 (Mozilla/5.0 (X11; U; Linux i686; fi-FI;
	rv:1.9.2.7) Gecko/20100715 Ubuntu/10.04 (lucid) Firefox/3.6.7)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: circular dependency when building virtual/kernel (linux_2.6.30)
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
X-List-Received-Date: Wed, 28 Jul 2010 19:52:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi!
I faced with "ERROR: Unbuildable tasks were found" when building virtual/kernel 
for linux_2.6.25 using at91sam overlay over org.openembedded.dev branch:

Problem seems similar to the one described in:
"Re: [oe] circular dependency when building linux_2.6.25.bb"
by Marcin Juszkiewicz <marcin <at> juszkiewicz.com.pl>

Problem was fixed by replacing ./oe_at91sam/recipes/linux/linux.inc line:
"addtask devicetree_image after do_deploy before do_package"

with line:
"addtask devicetree_image after do_install before do_package do_deploy"

found from ./org.openembedded.dev/recipes/linux/linux.inc 

I hope at91sam users can find this useful when switching to OE dev branch.
Regards,
Matti





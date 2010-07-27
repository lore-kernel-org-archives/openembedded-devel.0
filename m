Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdmBb-00045b-Aa for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 17:35:20 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdmBL-0001gt-O5 for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 17:35:03 +0200
Received: from a88-112-42-160.elisa-laajakaista.fi ([88.112.42.160])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 17:35:03 +0200
Received: from matti.kaasinen by a88-112-42-160.elisa-laajakaista.fi with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 17:35:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Matti Kaasinen <matti.kaasinen@gmail.com>
Date: Tue, 27 Jul 2010 15:18:04 +0000 (UTC)
Message-ID: <loom.20100727T163112-808@post.gmane.org>
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
Subject: circular dependency when building linux_2.6.30.bb
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
X-List-Received-Date: Tue, 27 Jul 2010 15:35:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Re: [oe] circular dependency when building linux_2.6.25.bb below
Marcin Juszkiewicz <marcin <at> juszkiewicz.com.pl> writes:

> 
> Dnia niedziela, 31 stycznia 2010 o 07:25:42 Guo Hongruan napisał(a):
> > Hi guys,
> >    I tried to build openembedded with the following configration in my
> > local.conf
> > MACHIN=at91-l9260
> > DISTRO=micro
> > LIBC=glibc
> > 
> > But I failed to start building and met the following error:
> > ERROR: Unbuildable tasks were found.
> > These are usually caused by circular dependencies and any circular
> > dependency chains found will be printed below. Increase the debug level to
> > see a list of unbuildable tasks.
> 
> Try this patch:
> 
> 10:21 hrw <at> home:linux$ git diff .
> diff --git a/recipes/linux/linux_2.6.25.bb b/recipes/linux/linux_2.6.25.bb
> index a89374a..38e651b 100644
> --- a/recipes/linux/linux_2.6.25.bb
> +++ b/recipes/linux/linux_2.6.25.bb
> @@ -98,5 +98,5 @@ python do_compulab_image() {
>  }
> 
> -addtask compulab_image after do_deploy before do_package
> +addtask compulab_image after do_deploy before do_build
> 
> As we moved deploy task to be *after* package.
> 
> Regards, 
-------------------------------------
Hi,

I tried to build linux_2.6.30.bb, i.e. virtual/kernel using 
linux4sam.org overlay with settings:
MACHINE = "at91sam9260ek"
DISTRO = "angstrom-2008.1"
ANGSTROMLIBC = "glibc"
and org.openembedded.dev

I faced similar problems as described above 
(Re: [oe] circular dependency when building linux_2.6.25.bb)
and thanks to the answer above I also managed finding solution as follows:

oe_at91sam/...../linux.inc had line:
addtask devicetree_image after do_deploy before do_package

I replaced it to line below found from org.openembedded.dev/..../linux.inc:
addtask devicetree_image after do_install before do_package do_deploy

This solved the problem.
I hope someone can find this useful,
-Matti








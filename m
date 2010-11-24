Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PLAbP-0004R1-6p for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 09:21:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PLAaC-0002xc-PB for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 09:20:04 +0100
Received: from ua-83-227-238-68.cust.bredbandsbolaget.se ([83.227.238.68])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 09:20:04 +0100
Received: from a.tqvist by ua-83-227-238-68.cust.bredbandsbolaget.se with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 09:20:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Anders =?utf-8?b?VMO2cm5xdmlzdA==?= <a.tqvist@gmail.com>
Date: Wed, 24 Nov 2010 08:17:57 +0000 (UTC)
Message-ID: <loom.20101124T090626-312@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 83.227.238.68 (Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.3) Gecko/20100423 Ubuntu/10.04 (lucid) Firefox/3.6.3)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Source distribution broken?
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
X-List-Received-Date: Wed, 24 Nov 2010 08:21:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

Is the source distribution functionality broken?

This is set in local.conf:
SRC_DIST_LOCAL = "copy"
INHERIT += "src_distribute_local"

New checkout of OE from git.
Have tried different builds for MACHINE=beagleboard and images minimal-image and
base-image.

The only thing that is stored in the TMPDIR/deploy/glibc/sources is a MIT
directory with the minimal-image/minimal-image.bb file.


In src_distribute.bbclass there is a line
addtask distribute_sources before do_build after do_fetch
Does do_build actually get run for every task?

If set to something else instead of "do_build" like "do_compile" will trigger a
lot of src_distribute calls and copying of files for a lot of licenses to
TMPDIR/deploy/glibc/sources.

Any ideas?

/Anders




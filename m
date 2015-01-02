Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id F0DF8727A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jan 2015 17:10:50 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Y75kP-0000IC-90 for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jan 2015 18:10:49 +0100
Received: from 167.127.187.81.in-addr.arpa ([81.187.127.167])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jan 2015 18:10:49 +0100
Received: from bluelightning by 167.127.187.81.in-addr.arpa with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jan 2015 18:10:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Paul Eggleton <bluelightning@bluelightning.org>
Date: Fri, 2 Jan 2015 17:10:34 +0000 (UTC)
Message-ID: <loom.20150102T180131-945@post.gmane.org>
References: <cover.1420190530.git.paul.eggleton@linux.intel.com>
	<5a7e4d1f909cba9ca5ff38262fcf638fc880028a.1420190530.git.paul.eggleton@linux.intel.com>
	<20150102124942.GH2469@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 81.187.127.167 (Mozilla/5.0 (X11; Ubuntu; Linux x86_64;
	rv:34.0) Gecko/20100101 Firefox/34.0)
Subject: Re: [meta-oe][PATCH 03/11] php: integrate modphp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Jan 2015 17:10:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Martin Jansa <martin.jansa <at> gmail.com> writes:
> On Fri, Jan 02, 2015 at 09:31:58AM +0000, Paul Eggleton wrote:
> > Build the mod-php Apache module within the main php recipe; this avoids
> > files in the sysroot from stepping on eachother and therefore avoids the
> > resulting build failure.
> > 
> > Changes made:
> > * Add an "apache2" PACKAGECONFIG, default enabled. This does mean that
> >   apache2 is a build dependency by default; if you don't want this,
> >   set your own PACKAGECONFIG value for the php recipe.
> 
> I think it should be disabled by default, because meta-oe layer doesn't
> depend on meta-webserver layer where apache2 lives.

You're right, somehow I completely missed that - sorry. I'll fix in v2 on
Monday.
 
> meta-webserver can have .bbappend which will add it to PACKAGECONFIG for
> xdebug to work with default php recipe.

As you may recall I'm of the opinion that software layers should not be
setting the policy of other layers, so I don't think this is really
appropriate; I'll just have to live with the fact that users who want it
will need to enable it themselves. In any case by the end of the patchset,
xdebug depends on php rather than modphp so it should still build fine
without apache2 in PACKAGECONFIG.

Cheers,
Paul



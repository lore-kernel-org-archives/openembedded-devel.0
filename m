Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NAQKN-0006o0-LZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 16:50:51 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 29A2B11001F8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 16:49:26 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id ACBFD110009B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 16:49:23 +0100 (CET)
Received: from rhein.familie-heinold.de (g225004015.adsl.alicedsl.de
	[92.225.4.15]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 16:49:23 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 1EF183C10C; Tue, 17 Nov 2009 16:49:18 +0100 (CET)
Date: Tue, 17 Nov 2009 16:49:18 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091117154916.GB4401@rhein.zuhause.netz>
References: <hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com>
	<hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com>
	<20091116134339.GC23383@jama>
	<1258379748.16625.8.camel@dax.rpnet.com>
	<20091117085518.GF23383@jama>
	<20091117101802.GA26627@mrdenker.localdomain>
MIME-Version: 1.0
In-Reply-To: <20091117101802.GA26627@mrdenker.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Tue, 17 Nov 2009 15:50:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2009 at 11:18:02AM +0100, mok@mnet-online.de wrote:
> On Tue, 17 Nov 2009, Martin Jansa wrote:
> 
> > BTW: SRCPV seems to be expanded in PV a bit sooner than SRCREV was,
> > which with combination with BB_GIT_CLONE_FOR_SRCREV means that all git
> > repositories are checked during recipe parsing (Klaus Kurzmann has a
> > list of git repositories used in OE recipes which are not accessible)
> 
> this is the list of recipes, which are failing when enabling
> BB_GIT_CLONE_FOR_SRCREV and using SRCPV... either because the SRC_URI is
> not correct, or there is a srcrev set somewhere that does not exist
> anymore...
> 
> recipes/avahi/mango-lassi_git.bb
> recipes/clutter/clutter-gtk-0.6_git.bb
> recipes/clutter/clutter-gtk_git.bb
> recipes/clutter/clutter-gtk-0.8_git.bb
> recipes/clutter/moblin-proto_git.bb
> recipes/disko/disko_git.bb
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ah thanks I will take care about disko.

Bye Henning



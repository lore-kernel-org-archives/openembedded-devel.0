Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 69F5B60172
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 14:59:17 +0000 (UTC)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
	([174.114.100.179]:57536 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jEwdh-00CNXu-II; Thu, 19 Mar 2020 10:59:18 -0400
Date: Thu, 19 Mar 2020 10:59:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20200319134213.GA29515@localhost>
Message-ID: <alpine.LFD.2.21.2003191058290.13214@localhost.localdomain>
References: <alpine.LFD.2.21.2003190907590.10468@localhost.localdomain>
	<20200319134213.GA29515@localhost>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: proper way to report(?) conflicting files being installed?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2020 14:59:17 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Mar 2020, Adrian Bunk wrote:

> On Thu, Mar 19, 2020 at 09:22:54AM -0400, Robert P. J. Day wrote:
> >...
> > +# ax_code_coverage.m4 and ax_check_enable_debug.m4 are in gnome-common only
> > +# because older versions of autoconf-archive didn't have them yet. Now they
> > +# are in autoconf-archive from OE-core. We depend on that below to ensure
> > +# that recipes which only depend on gnome-common still get them.
> > +do_install_append () {
> > +    rm -f ${D}${datadir}/aclocal/ax_code_coverage.m4
> > +    rm -f ${D}${datadir}/aclocal/ax_check_enable_debug.m4
> > +}
> > +RDEPENDS_${PN} += "autoconf-archive"
> > +DEPENDS_append_class-native = " autoconf-archive-native"
> > +
> >
> >   it *appears* that solved the problem, which raises the question --
> > should this patch be applied to the current gnome-common recipe? that
> > patchwork entry dates back to 2017 ... should it have been applied at
> > some point?
>
> The currently implemented solution is:
> # Default to enable autoconf-archive to avoid conflicts
> PACKAGECONFIG ??= "autoconf-archive"
> PACKAGECONFIG[autoconf-archive] = "--with-autoconf-archive, --without-autoconf-archive, autoconf-archive"
>
> It is not clear to me why this gives the user to disable it
> instead of unconditionally enabling it.

  i was a bit confused by that as well, but i figured i just didn't
read it carefully enough.

rday


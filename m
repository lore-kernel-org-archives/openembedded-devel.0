Received: from [85.33.3.5] (helo=smtp-OUT05A.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MCZ4h-0002ow-Cj
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 15:03:11 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 5 Jun 2009 14:54:00 +0200
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Fri, 5 Jun 2009 14:53:59 +0200
Received: from [192.168.1.166] ([80.117.37.182]) by FBCMCL01B06.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 5 Jun 2009 14:53:59 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
	<1244144325.6678.0.camel@port4>
	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
Date: Fri, 05 Jun 2009 14:53:53 +0200
Message-Id: <1244206438.6643.46.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 05 Jun 2009 12:53:59.0332 (UTC)
	FILETIME=[B1AE3640:01C9E5DC]
Subject: Re: How to convert OE hardware platform from ARM into X86
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
X-List-Received-Date: Fri, 05 Jun 2009 13:03:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-06-05 at 10:12 +0800, =E5=88=98=E8=8A=B3=E5=8D=8E wrote:
> NOTE: Runtime target 'gnome-system-tools' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['gnome-system-tools',
> 'liboobs-1']
> ERROR: Required build target 'millos-image' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['millos-image',
> 'gnome-system-tools', 'liboobs-1']
I've done a fake recipe named gnutoo with a non-existent rdepend and I
got:
$ bitbake gnutoo
__builtin__:74: DeprecationWarning: the sets module is deprecated
__builtin__:74: DeprecationWarning: the sets module is deprecated
NOTE: Handling BitBake files: - (6881/6881) [100 %]
NOTE: Parsing finished. 6602 cached, 1 parsed, 278 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
ERROR:
'['/home/embedded/oe/local_recipes/recipes/test/gnutoo_1.0.0.bb']'
RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
'aslkjdalskdj' but it wasn't found in any PACKAGE or RPROVIDES variables
NOTE: Runtime target 'aslkjdalskdj' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['aslkjdalskdj']
ERROR: Required build target 'gnutoo' has no buildable providers.
Missing or unbuildable dependency chain was: ['gnutoo', 'aslkjdalskdj']
so...it seems that you don't have gnome-system-tools and liboobs-1
already built(by the way I don't find them in oe) or at all
Denis.





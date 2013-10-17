Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 637886CF14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 12:16:10 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VWmUs-0005N1-VB for openembedded-devel@lists.openembedded.org;
	Thu, 17 Oct 2013 14:16:10 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:16:10 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:16:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 Oct 2013 14:16:04 +0200
Message-ID: <l3okdo$e0u$1@ger.gmane.org>
References: <1381795394-21464-1-git-send-email-schnitzeltony@googlemail.com>
	<1381795394-21464-2-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
In-Reply-To: <1381795394-21464-2-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-gnome/meta-systemd 1/2] orbit2: fix build after automake 1.13.4 update
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
X-List-Received-Date: Thu, 17 Oct 2013 12:16:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-10-13 02:03, Andreas Müller schreef:
> fixes: | test/everything/Makefile.am:81: error: using '$(srcdir)' in
> TESTS is currently broken: '$(srcdir)/test.sh' |
> test/inhibit/Makefile.am:4: warning: 'INCLUDES' is the old name for
> 'AM_CPPFLAGS' (or '*_CPPFLAGS') | test/poa/Makefile.am:1: warning:
> 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS') |
> autoreconf: automake failed with exit status: 1 | ERROR: autoreconf
> execution failed. | WARNING:
> /home/superandy/tmp/oe-core-eglibc/work/x86_64-linux/orbit2-native/2.14.19-r0/temp/run.do_configure.14800:1
> exit 1 from |   exit 1 | ERROR: Function failed: do_configure (log file
> is located at
> /home/superandy/tmp/oe-core-eglibc/work/x86_64-linux/orbit2-native/2.14.19-r0/temp/log.do_configure.14800)
>
> 
ERROR: Task 6208
(virtual:native:/home/superandy/data/oe-core/sources/meta-openembedded/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb,
do_configure) failed with exit code '1'
> 
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>

Applied, thanks!

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSX9UDMkyGM64RGpERAsFSAKC5S+2nljBJc6tD6/vS+fD4letp3gCggZZp
K0RjMUV6W1SUOHVN6gkTjj8=
=ET3y
-----END PGP SIGNATURE-----



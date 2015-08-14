Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id E69D260043
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 18:17:30 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ZQJXg-0004Gs-Cc for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2015 20:17:24 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 20:17:24 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 20:17:24 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 14 Aug 2015 20:17:05 +0200
Message-ID: <mqlbb1$css$1@ger.gmane.org>
References: <1439544527-6806-1-git-send-email-rongqing.li@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
In-Reply-To: <1439544527-6806-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][meta-oe] collectd: upgrade to 5.5.0
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
X-List-Received-Date: Fri, 14 Aug 2015 18:17:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-08-15 om 11:28 schreef rongqing.li@windriver.com:
> From: Roy Li <rongqing.li@windriver.com>
> 
> 1. remove two patch glibc-2.20-compatiblity.patch and 
> 0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch, which 
> have been merged into 2. update collectd-version.patch 3. redefine the
> collectd dependence 4. update the checksum

Could you also add a PACKAGECONFIG for libatasmart? Collectd finally stopped
using hddtemp and switched to libatasmart for 5.5.x.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFVzjChMkyGM64RGpERApehAJ9T5j14amJRLb4UXs4RdmmQsnAkiACgllzN
4RlxlVEPpYNKEgEcOrddAjE=
=ayit
-----END PGP SIGNATURE-----



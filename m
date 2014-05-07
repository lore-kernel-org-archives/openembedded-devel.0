Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC92605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 08:29:31 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WhxEI-0006sj-HP for openembedded-devel@lists.openembedded.org;
	Wed, 07 May 2014 10:29:30 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 10:29:30 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 10:29:30 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 07 May 2014 10:29:21 +0200
Message-ID: <lkcqt0$j26$1@ger.gmane.org>
References: <1399445635-29373-1-git-send-email-koen.kooi@linaro.org>
	<CAMKF1so17ynGToCMO_i8mw+UpUdnZC3NL_797JJbbrbMOd=_-w@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <CAMKF1so17ynGToCMO_i8mw+UpUdnZC3NL_797JJbbrbMOd=_-w@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] openldap: fix build against gnutls3
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
X-List-Received-Date: Wed, 07 May 2014 08:29:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef op 07-05-14 09:47:
> On Tue, May 6, 2014 at 11:53 PM, Koen Kooi <koen.kooi@linaro.org> wrote:
>> ++                              TLS_LIBS="-lgnutls -lgcrypt"
> 
> Does this mean we need something more in DEPENDS or DEPENDS part of 
> PACKAGECONFIG too ?

Should be automatic since gnutls depends on it. It's not a new dependency.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTae7hMkyGM64RGpERAlsXAJ46k4UMzSXDOuDVC5j4o/5gCpXN4ACaAjif
2fplxwMdF1anRHDfNJDNt2I=
=bGia
-----END PGP SIGNATURE-----



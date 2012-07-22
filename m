Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SsqWe-0001mz-FP for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jul 2012 09:24:24 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SsqLb-0003Ir-BJ for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jul 2012 09:12:59 +0200
Received: from 92.69.213.29 ([92.69.213.29])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 09:12:59 +0200
Received: from koen by 92.69.213.29 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 09:12:59 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 22 Jul 2012 09:12:41 +0200
Message-ID: <jug959$3gr$1@dough.gmane.org>
References: <1342899684-4450-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 92.69.213.29
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
In-Reply-To: <1342899684-4450-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-systemd][PATCH] systemd_git.bb: Dont inherit vala and gitpkgv
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
X-List-Received-Date: Sun, 22 Jul 2012 07:24:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-07-12 21:41, Khem Raj schreef:
> In an effort to use meta-systemd without meta-oe layer (purely on
> OE-Core) I ran into these classes not being there in OE-Core

The vala one isn't needed anymore, the GUI bits are a seperate project now,
but the gitpkgv needs to stay. We can symlink the class from meta-oe into
meta-systemd

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQC6fpMkyGM64RGpERAq6pAKCr+1GPYZLT4WeM0CZP+Amt/8e1kwCeLbUO
YgNIUkEEms/mtTUB2Qat2Sg=
=oLXc
-----END PGP SIGNATURE-----




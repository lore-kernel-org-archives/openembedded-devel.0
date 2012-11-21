Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Tb7v7-0001FL-OS for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 11:52:41 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Tb7hg-0003GH-NN for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 11:38:48 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 11:38:48 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 11:38:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 21 Nov 2012 11:38:29 +0100
Message-ID: <k8iauv$8f3$1@ger.gmane.org>
References: <1353320857-14067-1-git-send-email-marcin.juszkiewicz@linaro.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1353320857-14067-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH] mysql: make it work after $libexec change - LP: #1068759
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
X-List-Received-Date: Wed, 21 Nov 2012 10:52:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-11-12 11:27, Marcin Juszkiewicz schreef:
> Mysql start scripts assumed that mysqld is in /usr/libexec/ directory. It
> was true until 406bd38b4232f9f399ef5ffe0b4fac72ed605a23 landed in 
> OE-Core.
> 
> This changeset fixes mysqld start and initial databases population 
> scripts.

This replaces one hardcode with another, which breaks DISTROs that keep
/usr/libexec. Can you sed it in do_install_append?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQrK8lMkyGM64RGpERAv1kAKCrIxpHbF8yzZMIufZjeZkxxAxipwCfUJtA
jb1oTnFXIvpqk/IQVYazAe8=
=tdxb
-----END PGP SIGNATURE-----




Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLVwx-0001cD-5J for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 11:18:03 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLVkN-0007BS-Ed for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 11:05:03 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 11:05:03 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 11:05:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 09 Oct 2012 11:03:44 +0200
Message-ID: <k50p99$558$3@ger.gmane.org>
References: <1349580035-28194-1-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1349580035-28194-1-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH] xbmc: Fix serveral build errors and install missing dependencies
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
X-List-Received-Date: Tue, 09 Oct 2012 09:18:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-10-12 05:20, Otavio Salvador schreef:
> This allow the package to build fine. On the test board it didn't show 
> anything in display but it seems to be hardware specific issue.

> @@ -71,7 +79,7 @@ RRECOMMENDS_${PN}_append = " libcec \ python \ 
> python-lang \ python-re \ +                             python--netclient
> \ +                             libcurl \

I suspect things like curl-certs will be needed as well. Do you know why the
shlib code doesn't pick up the curl dep?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQc+hwMkyGM64RGpERArvPAJ9A4tvXJVF++EwRrg/JszPOIIpJQgCeMeX0
Ph5yRyWlhNemxVbTLGTUv2U=
=QC/E
-----END PGP SIGNATURE-----




Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2B77A65D59
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 12:36:25 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1XUawi-0007ly-8i; Thu, 18 Sep 2014 14:36:24 +0200
Received: from host-87-242-31-61.prtelecom.hu ([87.242.31.61]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1XUawd-0006jM-Du; Thu, 18 Sep 2014 14:36:22 +0200
Message-ID: <541AD1C0.8000008@pr.hu>
Date: Thu, 18 Sep 2014 14:36:16 +0200
From: Boszormenyi Zoltan <zboszor@pr.hu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org, 
	openembedded-devel@lists.openembedded.org
X-Spam-Score: 1.1 (+)
X-Scan-Signature: 02d3abc61471e6dd9f9388029c518d83
X-Spam-Tracer: backend.mail.pr.hu 1.1 20140918123622Z
Cc: Christian Betz <cbetz@sicom.com>
Subject: SSL crypto broken in Daisy?
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
X-List-Received-Date: Thu, 18 Sep 2014 12:36:31 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hi,

I have built systemd-gnome-image from Daisy-based Angström using instructions from

http://wp.angstrom-distribution.org/?page_id=53

The set of layers include "meta-intel" and I use the "genericx86" CPU.

The image I have has curl installed and whenever I want to use an https:// URL from
the internal LAN it fails with:

========================================
curl: (35) gnutls_handshake() failed: Handshake failed
========================================

The same happens with and without option "-k" (or "--insecure") to curl.

The webserver's cert is not actually right, as I get this when I use curl from Fedora 19,
20 or 21Alpha:

========================================
curl: (60) Peer's Certificate issuer is not recognized.
More details here: http://curl.haxx.se/docs/sslcerts.html

curl performs SSL certificate verification by default, using a "bundle"
 of Certificate Authority (CA) public keys (CA certs). If the default
 bundle file isn't adequate, you can specify an alternate file
 using the --cacert option.
If this HTTPS server uses a certificate signed by a CA represented in
 the bundle, the certificate verification probably failed due to a
 problem with the certificate (it might be expired, or the name might
 not match the domain name in the URL).
If you'd like to turn off curl's verification of the certificate, use
 the -k (or --insecure) option.
========================================

But using "curl -k" with the same URL from the *Fedora client* fetches the data properly.

Is this problem already known in Daisy or Daisy-based Angström?

Thanks in advance,
Zoltán Böszörményi



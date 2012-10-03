Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TJwwb-0002T0-Vm for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 03:43:14 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TJwk0-000110-01 for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 03:30:12 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 03:30:11 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 03:30:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Oct 2012 21:01:10 +0200
Message-ID: <k4i21g$he8$1@ger.gmane.org>
References: <cover.1349283829.git.paul.eggleton@linux.intel.com>
	<25ba859ab6ca18fb0391802a39300c408ab13420.1349283829.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <25ba859ab6ca18fb0391802a39300c408ab13420.1349283829.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-webserver][PATCH v2 2/4] apache2: add from OE-Classic, update to version 2.4.2 and fix
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
X-List-Received-Date: Fri, 05 Oct 2012 01:43:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-10-12 19:08, Paul Eggleton schreef:

> * Clean out some cruft and move packaging stuff after do_install

> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb new file mode
> 100644 index 0000000..15c4d02 --- /dev/null +++
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb @@ -0,0 +1,130
> @@ +DESCRIPTION = "The Apache HTTP Server is a powerful, efficient, and
> \ +extensible web server." +SUMMARY = "Apache HTTP Server" +HOMEPAGE =
> "http://httpd.apache.org/" +DEPENDS = "libtool-native apache2-native
> openssl expat pcre apr apr-util" +RDEPENDS_${PN} += "openssl libgcc"


^^^^^^^^^^^

Missed some "packaging stuff" to move below do_install

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQbIt2MkyGM64RGpERAkP6AJ9OUNRyfLyE7XgSscK8wuKvAyvqnwCgnhOX
fZZRGu5Klw+O8reOcuwfb8k=
=mg1u
-----END PGP SIGNATURE-----




Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SqrCJ-0007em-12 for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 21:43:11 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Sqr1O-0002fr-LL for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 21:31:54 +0200
Received: from 188.207.89.201 ([188.207.89.201])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 21:31:54 +0200
Received: from koen by 188.207.89.201 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 21:31:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 16 Jul 2012 21:31:44 +0200
Message-ID: <ju1q70$k0a$1@dough.gmane.org>
References: <1342466698-9473-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 188.207.89.201
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <1342466698-9473-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-browser][PATCH] chromium: restrict COMPATIBLE_MACHINE to any armv6 or armv7a MACHINE
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
X-List-Received-Date: Mon, 16 Jul 2012 19:43:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-07-12 21:24, Martin Jansa schreef:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> recipes-browser/chromium/chromium_19.0.1049.3.bb |    5 +++++ 
> recipes-browser/chromium/chromium_20.0.1086.0.bb |    5 +++++ 2 files
> changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes-browser/chromium/chromium_19.0.1049.3.bb
> b/recipes-browser/chromium/chromium_19.0.1049.3.bb index 4c9de8e..e657c48
> 100644 --- a/recipes-browser/chromium/chromium_19.0.1049.3.bb +++
> b/recipes-browser/chromium/chromium_19.0.1049.3.bb @@ -10,6 +10,11 @@
> SRC_URI =
> "http://commondatastorage.googleapis.com/chromium-browser-official/${P 
> file://softfloat-fix.patch \ "
> 
> +# include.gypi exists only for armv6 and armv7a and there isn't
> something like COMPATIBLE_ARCH afaik +COMPATIBLE_MACHINE = "(-)" 
> +COMPATIBLE_MACHINE_armv6 = "(.*)" +COMPATIBLE_MACHINE_armv7a = "(.*)" + 
> PR = "r1"
> 
> SRC_URI[md5sum] = "0cdd94b2be21180af93f719e9a9a2883" diff --git
> a/recipes-browser/chromium/chromium_20.0.1086.0.bb
> b/recipes-browser/chromium/chromium_20.0.1086.0.bb index 47f0173..527f317
> 100644 --- a/recipes-browser/chromium/chromium_20.0.1086.0.bb +++
> b/recipes-browser/chromium/chromium_20.0.1086.0.bb @@ -7,6 +7,11 @@
> SRC_URI =
> "http://commondatastorage.googleapis.com/chromium-browser-official/${P 
> file://include.gypi \ "
> 
> +# include.gypi exists only for armv6 and armv7a and there isn't
> something like COMPATIBLE_ARCH afaik

COMPATIBLE_HOST
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQBGwgMkyGM64RGpERAkalAJ9L4B9WgeMXcqgJkYZIu1QgbQ2bvgCfRpFB
C4ukDSjXiVL0tSjgxFePQUA=
=Wnan
-----END PGP SIGNATURE-----




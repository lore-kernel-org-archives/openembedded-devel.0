Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Syh9k-00078y-0N for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 12:36:56 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SygyM-0006kd-Lm for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 12:25:10 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 12:25:10 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 12:25:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 07 Aug 2012 12:22:40 +0200
Message-ID: <jvqq8v$p32$1@dough.gmane.org>
References: <1343660648-20358-1-git-send-email-gary@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1343660648-20358-1-git-send-email-gary@mlbassoc.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [PATCH] [meta-oe] glibmm: Fix compile error with latest glib
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
X-List-Received-Date: Tue, 07 Aug 2012 10:36:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-07-12 17:04, Gary Thomas schreef:
> Internal <glib/XXX.h> files should not be included directly.
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com> --- 
> .../glib-2.0/glibmm/fix-compile-error.patch        |   13 +++++++++++++ 
> meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb     |    5 ++++- 2 files
> changed, 17 insertions(+), 1 deletion(-) create mode 100644
> meta-oe/recipes-core/glib-2.0/glibmm/fix-compile-error.patch
> 
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/fix-compile-error.patch
> b/meta-oe/recipes-core/glib-2.0/glibmm/fix-compile-error.patch new file
> mode 100644 index 0000000..33c6215 --- /dev/null +++
> b/meta-oe/recipes-core/glib-2.0/glibmm/fix-compile-error.patch @@ -0,0
> +1,13 @@ +Index: glibmm-2.28.2/glib/glibmm/varianttype.cc 
> +=================================================================== +---
> glibmm-2.28.2.orig/glib/glibmm/varianttype.cc ++++
> glibmm-2.28.2/glib/glibmm/varianttype.cc +@@ -23,7 +23,7 @@ + + #include
> <glibmm/varianttype.h> + #include <glibmm/utility.h> +-#include
> <glib/gvarianttype.h> ++#include <glib.h> + + namespace Glib + { diff
> --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
> b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb index 6604091..7ec0be2
> 100644 --- a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb +++
> b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb @@ -6,4 +6,7 @@
> SRC_URI[archive.md5sum] = "cf33d1861d09fb2952a6a1d69e0502e3" 
> SRC_URI[archive.sha256sum] =
> "7b67178363f8494c94f8b3dd704a4c8db7ad75a253fc84a4ad229e5e179ec192"
> 
> SRC_URI += " file://remove-examples.patch \ -
> file://glib-2.32.patch" +             file://fix-compile-error.patch \ 
> +" + +


Missing PR bump

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQIOxwMkyGM64RGpERAkycAJ4hOFLKhAA8mTFHrfBhqUdoJgEUlwCgiUzJ
zpg2yHjwZv9RFJEdV4DCmE8=
=7PlM
-----END PGP SIGNATURE-----




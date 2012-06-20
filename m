Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ShJNE-0001Up-9r for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2012 13:47:00 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ShJCl-00076u-Ll for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2012 13:36:11 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2012 13:36:11 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2012 13:36:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 20 Jun 2012 13:35:59 +0200
Message-ID: <jrsciv$ro6$1@dough.gmane.org>
References: <1339759019-3272-1-git-send-email-sbabic@denx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <1339759019-3272-1-git-send-email-sbabic@denx.de>
X-Enigmail-Version: 1.4.1
Subject: Re: [meta-oe][PATCH V2] Added recipe for libconfig
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
X-List-Received-Date: Wed, 20 Jun 2012 11:47:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-06-12 13:16, Stefano Babic schreef:
> libconfig can be used to parse a configuration file in a structured
> language, but still compact and more suitable for embedded devices
> compared to XML.
> 
> Signed-off-by: Stefano Babic <sbabic@denx.de> ---
> 
> - V1 was sent to oe-core, comments redirect it as right place to meta-oe 
> - Drop PR to use the default value
> 
> .../recipes-support/libconfig/libconfig_1.4.8.bb   |   13 +++++++++++++ 1
> file changed, 13 insertions(+) create mode 100644
> meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb
> 
> diff --git a/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb
> b/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb new file mode
> 100644 index 0000000..ffde91f --- /dev/null +++
> b/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb @@ -0,0 +1,13 @@ 
> +SUMMARY = "C/C++ Configuration File Library" +DESCRIPTION = "processing
> of structured configuration files" +SECTION = "libs" +LICENSE =
> "LGPLv2.1" +LIC_FILES_CHKSUM =
> "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29" + +SRC_URI =
> "http://www.hyperrealm.com/libconfig/libconfig-1.4.8.tar.gz \

s/1.4.8/${PV}/
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJP4bWfAAoJEHZqAkdh1vT6rDIP/jM0/A8zTYwcrcZs2OIc1WSC
l0gWcViWtL0AliDzV82Dpck7Bdwv77aPqQBO3pQS7wQ9w7I/SNqYM1Whmt5Mq+2V
tueA4PB/MuLT5Bh63uO7Ga6OnBVY1LWSAVAqreGIKHqYfOMMvFQ9aXs73wWy0kgd
wAeqmH8hjt9XG20KGm42FBvGXiPe0bitwg3p8m7Ox8NQ5YbKfzr8JjpbePWjNTv1
xCZgBbTgRI6SfIkJnZA63VmMpXZJkAppL63iRhpP7P9chivA3qNzUk7zMftIgzuf
WaXQlAefAGK/QX6vso8TuPuENbXzJvrM8iVPnBkdHFxeWTB1mgvAXS4z4nV9qV4u
GAcGq5Zxdbx2F3uspJMi2ulntPoPabpGpc7nG46K/V5tuYXwmcyyXCcP1RgSKmkW
2RgPrBNQahueYXtYo0EKUS50CwR8UW4gSxNM7xXtBMrn8oHi6Z5ewRoyNeLHRHEw
MfpOykP0fr1PpwVdUQeVV9NXpumFPac54s3VcKrC1XHoW4X4mwiI8qWCdkb+JW1Z
tgHKphARmfpPM7E4lOPyBF8DXfg5tUMsSFnVBTB6cHFa5FKBzpHbcCruc6Inrf8d
jSpdJaFmkfG5j6BwKUjQ+CRcTlvXSrX3o6BzGxgJigPsMf11RufCP0R4mwj3NUhP
QIiNT8fQLNdbZH/c92nq
=1Xq9
-----END PGP SIGNATURE-----




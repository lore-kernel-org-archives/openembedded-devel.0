Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0584261F47
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 11:39:52 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UfqLg-0002mU-10 for openembedded-devel@lists.openembedded.org;
	Fri, 24 May 2013 13:39:52 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 13:39:52 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 13:39:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 24 May 2013 13:39:43 +0200
Message-ID: <knnjhp$9v4$1@ger.gmane.org>
References: <1369388677-15423-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
In-Reply-To: <1369388677-15423-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.5.1
Subject: Re: [meta-qt5][PATCH 1/2] qtjsbackend: fix hardfloat detection in v8
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
X-List-Received-Date: Fri, 24 May 2013 11:39:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 24-05-13 11:44, Eric Bénard schreef:
> Signed-off-by: Eric Bénard <eric@eukrea.com> --- 
> recipes-qt/qt5/qtjsbackend.inc                     |    1 + 
> .../qtjsbackend/0001-Fix-hardfloat-detection.patch |   33
> ++++++++++++++++++++ 2 files changed, 34 insertions(+) create mode 100644
> recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patch
> 
> diff --git a/recipes-qt/qt5/qtjsbackend.inc
> b/recipes-qt/qt5/qtjsbackend.inc index 4479654..a0dc632 100644 ---
> a/recipes-qt/qt5/qtjsbackend.inc +++ b/recipes-qt/qt5/qtjsbackend.inc @@
> -13,4 +13,5 @@ INC_PR = "r0"
> 
> SRC_URI += " \ 
> file://0002-v8.pro-respect-external-host-bindir-when-set.patch \ +
> file://0001-Fix-hardfloat-detection.patch \ " diff --git
> a/recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patch
> b/recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patch new file
> mode 100644 index 0000000..3d86fbf --- /dev/null +++
> b/recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patch @@ -0,0
> +1,33 @@ +From 05a87fccb76447ce3cb4b926128af929f26469bb Mon Sep 17
> 00:00:00 2001 +From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com> 
> +Date: Wed, 22 May 2013 18:50:01 +0200 +Subject: [PATCH] Fix hardfloat
> detection + +based on the same patch for nodejs which says : + +gcc has a
> builtin define to denote hard abi when in use, e.g. when +using
> -mfloat-abi=hard it will define __ARM_PCS_VFP to 1 and therefore +we
> should check that to determine which calling convention is in use +and
> not __VFP_FP__ which merely indicates presence of VFP unit + +The fix has
> been provided by Khem Raj <raj.khem@gmail.com>

Does chromium need a similar patch?



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRn1F/MkyGM64RGpERAljbAJ9SkkFECqTmkYc8gxj/5KwjR726IACfd5O7
oNta6Xz+YZDKhT/tnsZEwEI=
=P43l
-----END PGP SIGNATURE-----



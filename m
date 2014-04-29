Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 59F96609B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 07:45:17 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Wf2j4-0002wY-KW for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2014 09:45:14 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 09:45:14 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 09:45:14 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 29 Apr 2014 09:45:05 +0200
Message-ID: <ljnl9v$2fs$1@ger.gmane.org>
References: <1398756121-13263-1-git-send-email-Chong.Lu@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
In-Reply-To: <1398756121-13263-1-git-send-email-Chong.Lu@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH V6] rrdtool: enable perl and python bindings
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
X-List-Received-Date: Tue, 29 Apr 2014 07:45:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chong Lu schreef op 29-04-14 09:22:
> 1. default enable perl and python bindings 2. rrdtool uses perl.real,
> perl.real doesn't know where the PERL5LIB should be when prebuilts are
> used. Use the wrapper perl instead, perl sets PERL5LIB and invokes
> perl.real 3. While using dash as /bin/sh, subsequent commands in
> functions will not use the environment variables passed to the function
> call line unless explicitly run "export ENV_VAR". 4. delete unrecognized
> options: "--enable-local-libpng" and "--enable-local-zlib"
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com> --- 
> meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb |   92
> +++++++++++++++++++-- 1 file changed, 86 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb index
> 533451f..e337529 100644 ---
> a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb +++
> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb @@ -15,25 +15,105 @@
> SRC_URI = "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \

> +PACKAGES += "${PN}-perl ${PN}-python"

That needs to move below do_install, since it's a packaging var
(PACKAGE_CONFIG is actually recipe-config, so those go above do_configure).
Also, do you need =+ here instead of +=?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTX1iBMkyGM64RGpERAg1aAJ0YiuDvRTjWQzenMhHx9RSdCmW1aQCdF/zD
Ow07E6UIg9o56HoTzQrQ14U=
=fzFu
-----END PGP SIGNATURE-----



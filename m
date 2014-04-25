Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 91CF265D1B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 07:44:49 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id z2so2254969wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 00:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=xTsja0f9pTFEkcRCupxhh+xrbPQ+BRLYa6c/nZuNUww=;
	b=a7cDgI7QnTB91GEYlrc88GxmJmTzHx4cxeCsVMm9wAPz5S5apFTw9v+JD1yB7YYB3u
	z/UmEi/ex38omksUQ7j29n4P97udYtJm1/yPrZsXl76UEXup2wFN8ZGAPK9K3ASjWx8w
	1S3q7pOvuR8/o1FIeqrQB/KRUaxtS8HGi29VxV04uX3DeEpV7lPRh56/YuSGAD34g0FE
	Kegr84+cAvUMQSd5q1os6k7ZA+1vlkPuaIO0p6p9KaHaRHY9ufBiOLxSQHLd6Nk5EQtj
	bn9x/4GvYIfYogp7Z9Xxvdu0D6oqM6PrDuMQPL/bISbONKVFN6ArYswcZINosgBzXo2b
	icLA==
X-Gm-Message-State: ALoCoQl/uuDpDbNXBHpbtI5AABngDNSmhcbjpbaa+i2JrptEI5MsXCZiMf+j+mY3RR23/LEN/cqB
X-Received: by 10.180.21.180 with SMTP id w20mr2502821wie.34.1398411890298;
	Fri, 25 Apr 2014 00:44:50 -0700 (PDT)
Received: from iMac.local ([2001:610:612:0:a1a4:84fc:3c62:77b2])
	by mx.google.com with ESMTPSA id ft8sm4166518wib.13.2014.04.25.00.44.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Apr 2014 00:44:49 -0700 (PDT)
Message-ID: <535A126F.1010300@dominion.thruhere.net>
Date: Fri, 25 Apr 2014 09:44:47 +0200
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1398392569-1412-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1398392569-1412-1-git-send-email-Chong.Lu@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH V5] rrdtool: enable perl and python bindings
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
X-List-Received-Date: Fri, 25 Apr 2014 07:44:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chong Lu schreef op 25-04-14 04:22:
> 1. default enable perl and python bindings 2. rrdtool uses perl.real,
> perl.real doesn't know where the PERL5LIB should be when prebuilts are
> used. Use the wrapper perl instead, perl sets PERL5LIB and invokes
> perl.real 3. While using dash as /bin/sh, subsequent commands in
> functions will not use the environment variables passed to the function
> call line unless explicitly run "export ENV_VAR". 4. delete unrecognized
> options: "--enable-local-libpng" and "--enable-local-zlib"
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com> --- 
> meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb |  129
> ++++++++++++++++++++- 1 file changed, 123 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb index
> 533451f..36785cd 100644 ---
> a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb +++
> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb @@ -15,25 +15,142 @@
> SRC_URI = "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \ 
> SRC_URI[md5sum] = "ffe369d8921b4dfdeaaf43812100c38f" SRC_URI[sha256sum] =
> "956aaf431c955ba88dd7d98920ade3a8c4bad04adb1f9431377950a813a7af11"
> 
> -inherit autotools gettext +inherit autotools gettext pythonnative
> perlnative python-dir
> 
> EXTRA_AUTORECONF = "-I m4"
> 
> -PACKAGECONFIG ??= "" +PACKAGECONFIG ??= "python perl" + 
> +PACKAGES_DYNAMIC += "^${PN}-perl ^${PN}-python"

No, just no. Martin said 'Add it to PACKAGES'.


> +python populate_packages_prepend() { +    def fill_more(name,
> rdep=None): +        if name is None or name.strip() == "": +
> return + +        fpack=d.getVar('PACKAGES') or "" +
> fpack="${PN}-" + name + " " + fpack +        d.setVar('PACKAGES', fpack) 
> +        if rdep is not None: +
> prdep=d.getVar('RDEPENDS_${PN}-' + name) or "" +            prdep=rdep +
> " " + prdep +            d.setVar('RDEPENDS_${PN}-' + name, prdep) + +
> prdep=d.getVar('RDEPENDS_${PN}-' + name) or "" +            bb.debug(1,
> "RDEPENDS_${PN}-" + name + "=" + prdep) + +
> conf=(d.getVar('PACKAGECONFIG', True) or "").split() +
> pack=d.getVar('PACKAGES') or "" +    bb.debug(1, "PACKAGECONFIG=%s" %
> conf) +    bb.debug(1, "PACKAGES1=%s" % pack ) + +    if "perl" in conf
> : +        fill_more("perl") + +    if "python" in conf: +
> fill_more("python") + +    pack=d.getVar('PACKAGES', True) or "" +
> bb.debug(1, "PACKAGES after=%s" % pack) + +    #debug code +
> #prdep=d.getVar('RDEPENDS_${PN}') or "" +    #bb.debug(1,
> "RDEPENDS_${PN}" + "=" + prdep) +    #prdep=d.getVar('RDEPENDS') or "" +
> #bb.debug(1, "RDEPENDS" + "=" + prdep) +}

What is this?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTWhJvMkyGM64RGpERArXTAJ4u1918rurp4h7aTEX6wW2/J0C+IgCeLLQc
ALaeAdoJhjuntnDEx23edT0=
=0QxD
-----END PGP SIGNATURE-----


Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id C121461639
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:51:22 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so762066wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 02:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=xMORGuXuL/9ASAT2uFLxBh7rgtR0fveMAEq3csmm+9w=;
	b=PXkoWvOF+tbjxpyvV4os0xwQu6ncWU5LiNljuvxvM46YXDNFSQZNA+NajHIANQn3ec
	/6Pu2tt3Hrr9r30bTTHXCe9nNqqBDV1kt+jbezf7KLYN4ymGKOpGTx7AoTp3ClZYhDVj
	Lc0tqwz0r1VRvu3u7BLgj5LddVwUZzpI4x4RdMh5hZZwk5W81KsbRM4Gjg1ecRBzSHvg
	DefDjB/y6U3ONI5Sp153wDy66Iz6Zm1w0qdDiWlq7lG+hv4K5H76+mvNG2MoP8y5/On8
	JjOBUEJbN/dwygKkgrf1p80+K4oTYe6HVIRbXAEiWKHS9NcDIWYIn2TE6uLHDSylxWng
	sulQ==
X-Gm-Message-State: ALoCoQkJif1l/TW+tqrsTFNVvmD8XRhDbeEHWaXNsDRKZVR2mla6LAIHorMtcivo6X3HHLl4Ek1R
X-Received: by 10.194.189.201 with SMTP id gk9mr756342wjc.13.1398333082760;
	Thu, 24 Apr 2014 02:51:22 -0700 (PDT)
Received: from iMac.local (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	ga10sm5435337wjb.23.2014.04.24.02.51.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Apr 2014 02:51:21 -0700 (PDT)
Message-ID: <5358DE99.40604@dominion.thruhere.net>
Date: Thu, 24 Apr 2014 11:51:21 +0200
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1398323681-19373-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1398323681-19373-1-git-send-email-Chong.Lu@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH V4] rrdtool: enable perl and python bindings
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
X-List-Received-Date: Thu, 24 Apr 2014 09:51:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chong Lu schreef op 24-04-14 09:14:
> 1. default enable perl and python bindings 2. rrdtool uses perl.real,
> perl.real doesn't know where the PERL5LIB should be when prebuilts are
> used. Use the wrapper perl instead, perl sets PERL5LIB and invokes
> perl.real 3. While using dash as /bin/sh, subsequent commands in
> functions will not use the environment variables passed to the function
> call line unless explicitly run "export ENV_VAR". 4. delete unrecognized
> options: "--enable-local-libpng" and "--enable-local-zlib"
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com> ---

> +DESCRIPTION_${PN}-perl = \ +"The ${PN}-perl package includes RRDtool
> bindings for perl." +FILES_${PN}-perl =
> "${libdir}/perl/vendor_perl/*/*.pm ${datadir}/${PN}/examples \ +
> ${libdir}/perl/vendor_perl/*/auto/RRDs/RRDs.*" +RDEPENDS_${PN}-perl =
> "perl perl-module-lib perl-module-getopt-long perl-module-time-hires \ +
> perl-module-io-file perl-module-ipc-open2 perl-module-io-socket" 
> +RPROVIDES_${PN} += "${PN}-perl"

Why do you need RPROVIDES?


> + +DESCRIPTION_${PN}-python = \ +"The ${PN}-python package includes
> RRDtool bindings for python." +FILES_${PN}-python =
> "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*" 
> +RDEPENDS_${PN}-python = "python" +RPROVIDES_${PN} += "${PN}-python"

Why do you need RPROVIDES?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTWN6ZMkyGM64RGpERAiAuAKCSrfa70haQRDE5fE8JNW4ggq280gCeP1Va
ZhT7mk+HdHXQQXu7MKk17jw=
=QukM
-----END PGP SIGNATURE-----


Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA8065D58
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 08:28:10 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id k14so573736wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Apr 2014 01:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=veHYhwZ58W94lxBPQLTvr9MdaL40O3tojRd6bs4hjHk=;
	b=cTObnLMoHK53SlI4S9kH1TxRHgek4LUZEHIkavB/K9k6ey+dBQ6uHek6djhNIYoKWx
	MTVEnCPeRgfAuUi9G59haqqv9wid28wlzT7ZdGSVXZ2ATEeQ3u3OwQm+9WPPhFo2OOJv
	m5JhNzGSqrvkUONlIbb3ejXKNFxFK+Qt9IlXBuM4pCvtZo+BZtRz05iXap91yCUBvSj0
	diFg+SzdINyXFa7YmdQ+toTvTExJj79QvTT8LG02XLVsmgJyIdXA4+tbWq+1aZgBG5Hw
	BMIF3uCXWOa1x/Yx23+OYLM2zFcVLFetrjFfjA/g9/ZXToIC0R8znb9+xqgCLLmU5crF
	tKeQ==
X-Gm-Message-State: ALoCoQn9USugLnjn1XN5EiW8g+o+oL7S29/LtnwWVroRH4BW2vSu2uwJQ3Yk1PXJdp2SPMRFN8Gi
X-Received: by 10.180.8.170 with SMTP id s10mr30324178wia.35.1396945690600;
	Tue, 08 Apr 2014 01:28:10 -0700 (PDT)
Received: from iMac.local (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id vp5sm2072059wjc.31.2014.04.08.01.28.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Apr 2014 01:28:09 -0700 (PDT)
Message-ID: <5343B315.2070508@dominion.thruhere.net>
Date: Tue, 08 Apr 2014 10:28:05 +0200
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1396941241.git.jackie.huang@windriver.com>
	<b9df73e738c282a73199a2d9361550aa259f1eb8.1396941241.git.jackie.huang@windriver.com>
In-Reply-To: <b9df73e738c282a73199a2d9361550aa259f1eb8.1396941241.git.jackie.huang@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH 3/3] collectd: explicitly disable libsensors support
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
X-List-Received-Date: Tue, 08 Apr 2014 08:28:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

jackie.huang@windriver.com schreef op 08-04-14 09:54:
> From: Ming Liu <ming.liu@windriver.com>
> 
> To avoid an implicit build result.

Should this be a PACKAGECONFIG option?

> 
> Signed-off-by: Ming Liu <ming.liu@windriver.com> Signed-off-by: Jackie
> Huang <jackie.huang@windriver.com> --- 
> .../recipes-extended/collectd/collectd_5.2.2.bb    |    1 + 1 file
> changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb index
> 4eed2b6..00010c7 100644 ---
> a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb +++
> b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb @@ -35,6 +35,7 @@
> EXTRA_OECONF = " \ --disable-perl --with-libperl=no
> --with-perl-bindings=no \ 
> --with-libgcrypt=${STAGING_BINDIR_CROSS}/libgcrypt-config \ 
> --disable-notify_desktop \ +                --with-libsensors=no \ "
> 
> do_install_append() {
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTQ7MVMkyGM64RGpERAmj+AJ4rqJPUBZ4FIn97cJQZbe7N+dplBwCeJY3v
vw+CKp3dZdL5QvuP/4jReao=
=yGBZ
-----END PGP SIGNATURE-----


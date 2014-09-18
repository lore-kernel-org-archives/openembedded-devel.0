Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id AEFD46FC4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 07:42:22 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id rd3so903316pab.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 00:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=i29YglWys6uP1K3zzpvN4cLiSGAOxR1J1Z4bEQnirNw=;
	b=tbJzw8oR2r0T/acP7bzvPy8/T+sgIiD7/qZ2ZOTcfrai/sJDduUraT8K/bSsGTlD4F
	m2CManTce4M3lGhoipb59IS9m8/ZKlKBg2sE17gWwKR8SrFfkrhbGxHYuT00C6VpfJ2O
	yM1omaA4s5bQM89BirciZVkpGQaAxKWLk+ThxgLQ5uDvdmjznTXhqF6j++J461d8yWvG
	4UlKlPGYGlUNgZCOunBZmJfeZbJkl0uc45YxLcUmOp9WRGHk/nfH2pYU7MO2FgKC0piZ
	fXtX7jnRpqJw+VGVhzfLISH4ZlaJlguyA/gjDsMQkmVsrM2ajXJ8BZGtm1uyW1gER4/W
	ETeg==
X-Received: by 10.70.135.137 with SMTP id ps9mr3387276pdb.13.1411026143026;
	Thu, 18 Sep 2014 00:42:23 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:9:3580:7a5:c0c6:c4a3:f3e7:1968])
	by mx.google.com with ESMTPSA id
	gr5sm18875274pbc.33.2014.09.18.00.42.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Sep 2014 00:42:22 -0700 (PDT)
Message-ID: <541A8CDD.6000303@gmail.com>
Date: Thu, 18 Sep 2014 00:42:21 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1409584344.git.liezhi.yang@windriver.com>
	<1ab2a6a84a7ad1e930aadb138a807a58ee65d065.1409584344.git.liezhi.yang@windriver.com>
In-Reply-To: <1ab2a6a84a7ad1e930aadb138a807a58ee65d065.1409584344.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 03/13] arptables: add bash to RDEPENDS_arptables
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
X-List-Received-Date: Thu, 18 Sep 2014 07:42:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 9/1/14 8:18 AM, Robert Yang wrote:
> Bashism:
> possible bashism in arptables/etc/init.d/arptables line 14 (should be '.', not 'source'):
> source /etc/init.d/functions
> possible bashism in arptables/etc/init.d/arptables line 96 ($"foo" should be eval_gettext "foo"):
>         echo $"Usage $0 {start|stop|restart|condrestart|save|status}"

could these be patched instead of rdepending on bash
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../recipes-support/arptables/arptables_0.0.3-4.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> index 74f81b5..94920f9 100644
> --- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> +++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> @@ -5,7 +5,7 @@ SECTION = "console/network"
>  
>  PR = "r2"
>  
> -RDEPENDS_${PN} += "perl"
> +RDEPENDS_${PN} += "perl bash"
>  
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
>  SRC_URI = " \
> 

- -- 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlQajN0ACgkQuwUzVZGdMxSHuACdFnp3LZpRjZsN3IVLm2tCCb8L
y2kAnRFWsf2R9HDvvAp1xUoSnQB9bZfQ
=ZfQX
-----END PGP SIGNATURE-----


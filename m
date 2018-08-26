Return-Path: <yisooan@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id CF8DC78DC9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 11:34:42 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id w14-v6so2904433plp.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 04:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/bg1sabbXagLM2MsG+T7kU0aDcd0W7jzg2SDUyazlIM=;
	b=OgXNFMpvkcpXRUnCrXTx9oZxoZpF0AUav/rTbLH+mUvGjcd4Yvxxig6EtNOoyfZnE/
	6hQMAtzruC+L4ydK/cWQm6H2zPY46vj3wIVtNDJ8lF11tBsXJJalLW6CwgkgtHyyT2ZL
	cXLMu/oEdGoUVea17Ut4hgP0CpUpzFxO+PFCrocbW8xFTnyYu/1o1dn+olftx4rNt7I+
	58VDD1XcTsNd88VUABGCDC4231vMJKXJuzqWxtO+KYmJPsA71Nyg8gND1ydRsxZoycQJ
	w5Qsb55towpHoBCO997SsVBLZC26kFEU4t9Gsxwv+m5tuLv5+ntgScA4KXf5S2CQ7fHn
	qTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/bg1sabbXagLM2MsG+T7kU0aDcd0W7jzg2SDUyazlIM=;
	b=rEf+mdF6IUsoh8UlVXAIgj3fYzk0yEFaAbieHCGw57POB8qLFj1D6ZjCVaemvP4LQl
	psj8vDIPIa/KB0pj08z9wNhKoERIzrJ6d0Tnedqj2u0yk58Fw6MEr6swxrvyiz3R+KsY
	wEbdJQDkT/tF2HSIaloHJqBvAFPWpYOr9O4A2JdU15iwYQQkGcSI4+NtsrT7QH/xpJl7
	C1GdSbrpfNWePWwp3gyCqOsjKWyEPObrudteRXFFDY55z5ErvnaBD4fXE4f7KmpRI+S6
	YXbUE0ys3mNjBGRSBYloI2vvaktLXtRibgYxZFs5ee3o0VY6wgLj9ijBwC5466SGXSxw
	jXSw==
X-Gm-Message-State: APzg51B9LTd+rJ2n5rLLqvcgFqY4WzWGjrgjER657GNv6XgMNH7jsucz
	BK4kJCZqJo7GmdrWxSODpt11/W2qv2k=
X-Google-Smtp-Source: ANB0VdZhNcMVofwKtVMkrL1lYSdFyztu8Pn5b2g+yq9Vw40bBxnpsbJ3Cb0+9rn+rqQN1Qde4FLTJw==
X-Received: by 2002:a17:902:a413:: with SMTP id
	p19-v6mr8778165plq.220.1535283283557; 
	Sun, 26 Aug 2018 04:34:43 -0700 (PDT)
Received: from localhost.localdomain ([118.42.82.236])
	by smtp.gmail.com with ESMTPSA id
	p11-v6sm1211931pgv.70.2018.08.26.04.34.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Aug 2018 04:34:43 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180826045735.7732-1-yisooan@gmail.com>
	<CA+chaQeMuN4+wxyyA_jvJonCtSiLO614uWt7LqjvK3CwBeo2Lg@mail.gmail.com>
From: Yi-Soo An <yisooan@gmail.com>
Message-ID: <c25b4db3-f7c9-1de7-d5df-a9c6b9320168@gmail.com>
Date: Sun, 26 Aug 2018 20:34:39 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQeMuN4+wxyyA_jvJonCtSiLO614uWt7LqjvK3CwBeo2Lg@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][morty][PATCH v2] libconfig: fix SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Aug 2018 11:34:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Thank you for the email.

I have a question.

Since hyperrealm has moved to github and the library is maintained there.
Is it better to replace the current SRC_URI with git? as below.
SRC_URI = "git://github.com/hyperrealm/libconfig.git;tag=v1.5"
archive seems to need extra information, like checksum.

Best regards,
Yi-Soo An

On 08/26/2018 03:00 PM, Martin Jansa wrote:
> Don't use github archives which are regenerated from time to time with 
> different checksum.
> 
> To fix it in morty all newer release needs to be fixed as well and then 
> the fix backported to morty (or explained in commit message why the fix 
> is needed only for morty).
> 
> On Sun, Aug 26, 2018 at 7:01 AM Yi-Soo An <yisooan@gmail.com 
> <mailto:yisooan@gmail.com>> wrote:
> 
>     It causes a fetch error since hyperrealm has moved to github
>     and the current SRC_URI is not available any longer.
> 
>     To fix the error, use github repository.
> 
>     Signed-off-by: Yi-Soo An <yisooan@gmail.com <mailto:yisooan@gmail.com>>
>     ---
>       meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>     <http://libconfig_1.5.bb> | 8 ++++----
>       1 file changed, 4 insertions(+), 4 deletions(-)
> 
>     diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>     <http://libconfig_1.5.bb>
>     b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>     <http://libconfig_1.5.bb>
>     index fb6e50e51..a0b3a9471 100644
>     --- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>     <http://libconfig_1.5.bb>
>     +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>     <http://libconfig_1.5.bb>
>     @@ -1,14 +1,14 @@
>       SUMMARY = "C/C++ Configuration File Library"
>       DESCRIPTION = "Library for manipulating structured configuration
>     files"
>     -HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
>     +HOMEPAGE = "https://hyperrealm.github.io/libconfig"
>       SECTION = "libs"
> 
>       LICENSE = "LGPLv2.1"
>       LIC_FILES_CHKSUM =
>     "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
> 
>     -SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz
>     <http://www.hyperrealm.com/$%7BBPN%7D/$%7BBP%7D.tar.gz>"
>     +SRC_URI = "https://github.com/hyperrealm/libconfig/archive/v1.5.tar.gz"
> 
>       inherit autotools-brokensep pkgconfig
> 
>     -SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
>     -SRC_URI[sha256sum] =
>     "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
>     +SRC_URI[md5sum] = "e92a91c2ddf3bf77bea0f5ed7f09e492"
>     +SRC_URI[sha256sum] =
>     "cae5c02361d8a9b2bb26946c64f089d2e5e599972f386203fbc48975c0d885c8"
>     -- 
>     2.17.1
> 
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 


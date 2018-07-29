Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2476F747E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 14:25:28 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id e11-v6so4314728plb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Hkad0hGRNf4DrophSOJU+cCT8HshGVvt6VWqAtCeK78=;
	b=VDqH5vTrA+wS3AOhphqvFN3hpzrmrbj4q/7eVhtqMOZpFFCnMNBhuNXpjk7lxL0JnD
	WdX8CMSdLnYWygefpNW76p4Yl+Zj2R9k4TYiSxpvzlpjrMtnaWpC53mLRqcbrLfTJRDN
	np52j708HGOp83F8T1cBejjHhvJtOMtXE7iDnDLcqVi6qmHc7CjtUA7Ki2PjZCTxWqYI
	8tMIikeW//yF8yH4iy/2CNZa3qCsCl4mPSjYCT2vbHLADy7O6oVWCYDdw4uagaXGpGCr
	4au2C1jVieyJwHbj6QcDW1YOvygWSrhpruYnoHgkb8g4yONwQwwz8A2hHYW2elS4rW/j
	3VpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Hkad0hGRNf4DrophSOJU+cCT8HshGVvt6VWqAtCeK78=;
	b=cQy19tT56QgFdnjwXvnOc8sCrXte4Kh+7mmh1+xwg3X2hx2aSDn8vQBw+Uu8Zp4Xk6
	y18LklWGTIo+NBCXrVRqLEn1Cs+130u4PW0Js52z8XY03xHJs/o8y0eJUnqE3L6/g+zK
	evhizYu6EHomt7zO+Edr3fBMvDEhKR2hAeCz5ejiNZRTvUjdqsWmGck6nA7P5jCFA8qo
	ZH8/Cx6/KVnqRrcOQ83W2A66DCDhTFRJB8fq1pb3vNVRWwaaSavjfZtDnB7apTyBLUTF
	OffrKJTu31lVYQob1GoOV8NR4wqy/tEe1YpWPnDib7m/qtStY3WCl1U9k8dldvA76rlO
	I9zQ==
X-Gm-Message-State: AOUpUlF2AUnn+ToDvCrldN8WeZOnsM0PmRwYKDt2WY/2tCYTeO7wFOo9
	rXbc2KEOcX+2p9is+sQZ2IqfS5FZ
X-Google-Smtp-Source: AAOMgpfoIMPr7Z7W4eret/cO94NnBPluDWYykxZAtR074kNUaeaS4fr/mr0luwaUil82Zlhjo0ZYuA==
X-Received: by 2002:a17:902:e088:: with SMTP id
	cb8-v6mr13100938plb.189.1532874329067; 
	Sun, 29 Jul 2018 07:25:29 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:1dbe:76c2:a88c:b8ab?
	([2601:202:4180:c33:1dbe:76c2:a88c:b8ab])
	by smtp.gmail.com with ESMTPSA id
	j71-v6sm14172843pgd.23.2018.07.29.07.25.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jul 2018 07:25:28 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1532823130-27823-1-git-send-email-akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f7a61655-a833-f5b9-a1e5-1e7970a0bf7e@gmail.com>
Date: Sun, 29 Jul 2018 07:25:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1532823130-27823-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-networking][V2][PATCH] wireshark: update to 2.6.2
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
X-List-Received-Date: Sun, 29 Jul 2018 14:25:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Found out the  "wireshark-gtk" is not being built with the way the new
cmake options are being set. I will be sending v3. Note: I never built
the QT version so I don't intend on addressing this at this time as it
supports qt4 & 5

- armin

On 07/28/2018 05:12 PM, Armin Kuster wrote:
> [v2]
> Fix native build, lemon is the only one needed natively
>
> [v1]
> includes security fixes:
>
> wnpa-sec-2018-34 BGP dissector large loop. Bug 13741. CVE-2018-14342.
> wnpa-sec-2018-35 ISMP dissector crash. Bug 14672. CVE-2018-14344.
> wnpa-sec-2018-36 Multiple dissectors could crash. Bug 14675. CVE-2018-14340.
> wnpa-sec-2018-37 ASN.1 BER dissector crash. Bug 14682. CVE-2018-14343.
> wnpa-sec-2018-38 MMSE dissector infinite loop. Bug 14738. CVE-2018-14339.
> wnpa-sec-2018-39 DICOM dissector crash. Bug 14742. CVE-2018-14341.
> wnpa-sec-2018-40 Bazaar dissector infinite loop. Bug 14841. CVE-2018-14368.
> wnpa-sec-2018-41 HTTP2 dissector crash. Bug 14869. CVE-2018-14369.
> wnpa-sec-2018-42 CoAP dissector crash. Bug 14966. CVE-2018-14367.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../wireshark/{wireshark_2.6.1.bb => wireshark_2.6.2.bb}          | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_2.6.1.bb => wireshark_2.6.2.bb} (94%)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
> similarity index 94%
> rename from meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
> index 91c5e96..91ad639 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
> @@ -14,8 +14,8 @@ SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
>  
>  UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>  
> -SRC_URI[md5sum] = "b0e9e5fe22e96d9fdfad18f750fa8f55"
> -SRC_URI[sha256sum] = "ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbcd88"
> +SRC_URI[md5sum] = "086d235509717190d06554b2ab870209"
> +SRC_URI[sha256sum] = "49b2895ee3ba17ef9ef0aebfdc4d32a778e0f36ccadde184516557d5f3357094"
>  
>  PE = "1"
>  
> @@ -35,7 +35,6 @@ PACKAGECONFIG[libnl] = ",,libnl"
>  PACKAGECONFIG[portaudio] = "-DENABLE_PORTAUDIO=ON,-DENABLE_PORTAUDIO=OFF, portaudio-v19"
>  PACKAGECONFIG[gtk2] = "-DENABLE_GTK=ON,-DENABLE_GTK=OFF, gtk+"
>  PACKAGECONFIG[gtk3] = "-DENABLE_GTK3=ON,-DENABLE_GTK3=OFF, gtk+3"
> -PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qtbase"
>  PACKAGECONFIG[graphics] = ",-DENABLE_GTK=OFF,"
>  PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF, gnutls"
>  PACKAGECONFIG[ssl] = ",,openssl"
> @@ -50,6 +49,7 @@ PACKAGECONFIG[lz4] = "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
>  
>  # these next two options require addional layers
>  PACKAGECONFIG[c-ares] = "-DENABLE_CARES=ON,-DENABLE_CARES=OFF, c-ares"
> +PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qtbase"
>  
>  EXTRA_OECMAKE += "-DBUILD_wireshark=ON \
>                    -DENABLE_NETLINK=ON \
> @@ -62,7 +62,7 @@ EXTRA_OECMAKE += "-DBUILD_wireshark=ON \
>                   "
>  do_install_append_class-native() {
>  	install -d ${D}${bindir}
> -	for f in make-dissectors lemon make-taps
> +	for f in lemon
>  	do
>  		install -m 0755 ${B}/run/$f ${D}${bindir}
>  	done



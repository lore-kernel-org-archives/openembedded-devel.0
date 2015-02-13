Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 92C5F65C85
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 15:11:14 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u56so17134033wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=fXAv0NfawaHywCvLKtwiY1ydyHei2MzKJDKRFJLiVs0=;
	b=YDCoh7HodIArC8mckPhP/WnRmOIF5zY0lmumJerfiMJqFC0mU1oj6xURjDjbOU38Kv
	EKwSTB1T1csIzTLvW7M4EkexZIbzyHbQldevIm+UgkXPEU1NskbbeMDmytso2sIEM3x1
	12UWTC8VOrb5UgVxMSK97LI6CxGQC3nmcxqI5SJuRfR7eoXoWcJD2kZCWS1Wv0MIyx1R
	F0GiGb099ylsKmI9Risgf9ykz7N67FERQqYSjj1p3js5UR1DhnfaOouz8hWp5/FyJsHi
	PRtB/xMSKW/RFy0E9vPEi/0t41pKlfVHaU/YScdH18YHicXcFGq6+81IWb4QKFiFqzuk
	Wx+A==
X-Received: by 10.194.120.40 with SMTP id kz8mr19547042wjb.21.1423840275339;
	Fri, 13 Feb 2015 07:11:15 -0800 (PST)
Received: from [192.168.50.198] (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id mx4sm7287250wic.24.2015.02.13.07.11.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Feb 2015 07:11:14 -0800 (PST)
Message-ID: <54DE1411.5010902@gmail.com>
Date: Fri, 13 Feb 2015 16:11:13 +0100
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1423651677-15387-1-git-send-email-sven.ebenfeld@gmail.com>
In-Reply-To: <1423651677-15387-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: Re: [meta-oe][PATCH] stunnel: Update to 5.10
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
X-List-Received-Date: Fri, 13 Feb 2015 15:11:19 -0000
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit

If you accept this patch, can you as well backport it to dizzy?

Am 11.02.2015 um 11:47 schrieb Sven Ebenfeld:
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  .../recipes-support/stunnel/stunnel_4.56.bb            | 17 -----------------
>  .../recipes-support/stunnel/stunnel_5.10.bb            | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.bb
>  create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.10.bb
> 
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> deleted file mode 100644
> index 74f2234..0000000
> --- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY = "Program for providing universal TLS/SSL tunneling service"
> -DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
> -SECTION = "net"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
> -DEPENDS = "openssl zlib tcp-wrappers"
> -
> -RDEPENDS_${PN} += "perl"
> -
> -SRC_URI = "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
> -
> -SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
> -SRC_URI[sha256sum] = "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
> -
> -inherit autotools
> -
> -EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.10.bb b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
> new file mode 100644
> index 0000000..0feacc1
> --- /dev/null
> +++ b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Program for providing universal TLS/SSL tunneling service"
> +DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
> +SECTION = "net"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=866cdc7459d91e092b174388fab8d283"
> +
> +DEPENDS = "openssl zlib tcp-wrappers"
> +
> +RDEPENDS_${PN} += "perl"
> +
> +SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] = "a0edda805eb7d6ea600a230fb0979ea1"
> +SRC_URI[sha256sum] = "032bfc1854f8a0b9e452343c36ec6b52c7e0daef0863423c6b13a61a7c92eb23"
> +
> +inherit autotools
> +
> +EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
> \ No newline at end of file
> 


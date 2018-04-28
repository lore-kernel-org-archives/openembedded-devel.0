Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 652C57198F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2018 16:53:17 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j5so3735370pfh.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2018 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=4I0AM2uYYCB27Gih+W1vbc2gG6hPorBaBH7TbOqmhhM=;
	b=MgA9kzFQiquUPZpvNfqDaRRIbgBs2KCvpTUTd9cZXv3o95e6gbYjzrzuaEjJImw0M7
	UkwB8dhXwn1h8pRyEEEF0uBtNSh0AJJc3oU8dl28NGdpnWJfACWyVsYlCtRuyghjERKA
	FAujWJLIaFSfKtWvJ3Sn8vtKat4Xxj7E6Y94jeM+pk6IpzFvZpE1xM3HZXQqjiYOWBw/
	ivhJCt5vJ/NlBIcxAqBjjw7bIA+ScoIjufFKkh3PsmghBOKYfvPnOWoEYtLQ+woZP6mt
	C0oPkFNGdnMagK71yx71pE0AZxJ5BgrNYgQLod7QToGPD08skr34X59Gs7IW4EpZjUy1
	xKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=4I0AM2uYYCB27Gih+W1vbc2gG6hPorBaBH7TbOqmhhM=;
	b=cpIk4Z5moAZ6/I/DVGO10OyiLBgCM0zx/1hpd+906mzijau55FprZ8zcvIhaSUPiM+
	Z8U0PwvGB1FvsF0BqTYMnUmQNX6sL8mclUbubAwcTEUdYAR0aLhtbiJZuEwk8Xi/Ew6S
	XXx5dNRfsHebsB8P/RcXv6bvhFD+AmtBwa2ZncjzvVb4KDiIeWg10ch7rNcwgEkuCnXL
	uQ2C5bEEYYQNr0yIedCtS71CpYQr52uDav8hNjRkPVR62M+jTszBgj4UObeI8uNdUnym
	yv0tq9cNe3znX/DTRGxmioHYZX0iJ+Iat46uKvaZz/elD9lvBMKya57As50xAVNngY5g
	vVZw==
X-Gm-Message-State: ALQs6tBa8MvRBYlsFLRvwd2DVcjKNJN9DByVkIwde0hAx/J5uy3ScE0R
	e8XaeZBEZL1iQrOjqsIsmlc=
X-Google-Smtp-Source: AB8JxZq3gXaZd7wYPyrpYh+IxziMVuKcS2gh4OiLzYdx5Rloe1NXpemUvQQ5zFj0ZBMXRvO9IqRNUA==
X-Received: by 10.98.17.220 with SMTP id 89mr6378839pfr.18.1524934398977;
	Sat, 28 Apr 2018 09:53:18 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:e849:397b:8351:da78?
	([2601:202:4000:1184:e849:397b:8351:da78])
	by smtp.gmail.com with ESMTPSA id s8sm7343993pfh.30.2018.04.28.09.53.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 28 Apr 2018 09:53:18 -0700 (PDT)
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180419171207.5020-1-costamagnagianfranco@yahoo.it>
	<20180419171207.5020-2-costamagnagianfranco@yahoo.it>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a68089fd-8d61-207a-ee32-b89516b30c1a@gmail.com>
Date: Sat, 28 Apr 2018 09:53:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180419171207.5020-2-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: Re: [meta-oe][PATCH 2/2] cpprest: add new recipe based on Debian packaging
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
X-List-Received-Date: Sat, 28 Apr 2018 16:53:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 04/19/2018 10:12 AM, Gianfranco Costamagna wrote:
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
> ---
>  .../cpprest/cpprest-2.10.2/fix-cmake-install.patch      | 17 +++++++++++++++++
>  meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb       | 17 +++++++++++++++++

This recipe really belongs in the meta-networking layer.

fix-cmake-install.patch is missing the proper patch message. Please see


https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


- armin
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
>  create mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
>
> diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
> new file mode 100644
> index 000000000..0feafef5b
> --- /dev/null
> +++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
> @@ -0,0 +1,17 @@
> +Description: install cmake files into /usr/lib/cmake/cpprestsdk
> +Author: Gianfranco Costamagna <locutusofborg@debian.org>
> +Upstream-Status: https://github.com/Microsoft/cpprestsdk/pull/737
> +Forwarded: https://github.com/Microsoft/cpprestsdk/pull/737
> +Last-Update: 2018-04-19
> +
> +--- cpprest-2.10.2.orig/CMakeLists.txt
> ++++ cpprest-2.10.2/CMakeLists.txt
> +@@ -18,7 +18,7 @@ enable_testing()
> + set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
> + set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets functionality.")
> + set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression functionality.")
> +-set(CPPREST_EXPORT_DIR lib/cpprestsdk CACHE STRING "Directory to install CMake config files.")
> ++set(CPPREST_EXPORT_DIR lib/cmake/cpprestsdk CACHE STRING "Directory to install CMake config files.")
> + set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
> + set(CPPREST_INSTALL ON CACHE BOOL "Add install commands.")
> + 
> diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> new file mode 100644
> index 000000000..2ba6fc66c
> --- /dev/null
> +++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
> +SECTION = "libs/network"
> +HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${S}/../license.txt;md5=a2e15b954769218ff912468eecd6a02f"
> +DEPENDS = "openssl websocketpp zlib boost"
> +
> +SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master"
> +
> +SRC_URI += "file://fix-cmake-install.patch"
> +
> +# tag 2.10.2
> +SRCREV= "fea848e2a77563cf2a6f28f8eab396fd6e787fbf"
> +
> +S = "${WORKDIR}/git/Release"
> +
> +inherit cmake



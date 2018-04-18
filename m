Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9259160574
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 07:40:48 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id e9so457685pgr.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 00:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fXk6STkfKLQVKfmmJ1Uww2EBhyJ2G/txh3xmZFd5v6M=;
	b=GsdenvKrBlcQfBXgJ9w+Uh8a9x1/33FGnXF2jzrdwnIkLHJJJhp1NgOSiZzFuMfAiU
	QKLUvYtgD50h2W6Lglm5l4ovGxsfDdx9lshA8ZoznEJDCXtYOm0KDKhV/fUjWeOEw9cc
	4YLcoJ9qMmiSVKSmR2T4cu0E7z36nFtm7cZmrLHWUJcxt/zZ8x0BLZglKKC7ECSLizde
	dHhbL2lBJh5Bhyed0g+prSsHOrG9sKZwOsRzzzn/9RvTn9xzWAiLnVw0ahaby018AAtH
	i88pYWrjFcD6AqbazOWtY3V97EeWRm+jMMVCX+7uH5NYmjzeF48Ju2mtjsNnneUNN08w
	TIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=fXk6STkfKLQVKfmmJ1Uww2EBhyJ2G/txh3xmZFd5v6M=;
	b=nBOme8sJdqP8ULJfsik8nvVvOjwcz/CW+PiP4X0yY6/+LbvpOYFRMIeHe5vOqwhvHq
	4Gv45/fPwbdgpANqz4kuULBrvLobSEFk1XJUeCAvWuknmj9NJ4aKUwTBwVKzCPxYb2eU
	ppMg97eSratq/d08uDswgWrB1n+Svs0qaTu2yWD0ZlCFKNAYm7MZK9fxPqv/OpGy1/rA
	vjQAX7d+cl6asGxRj/MdRIRD9QGGfQF9Zsz+RhZK9jGwyR7XLr3Ph6fN0WNLDjNGik+F
	a3z78zRm00hnbx2pqWwi2GZ9gyUxexf3RNHB7A0K80KGHJvmWgQIQyiYV6smMSREfged
	9xrQ==
X-Gm-Message-State: ALQs6tB3a92Rfbwgq8nEdF8fMhAQnX1KL1FZzhPt6meKDsHRbFQkag8E
	7mD319a1i8+vAls/MCUhNyYy9kms
X-Google-Smtp-Source: AIpwx49MIln1QS9+5dUfDv8xoM8tg1RB3kcNROHoAMZlJd13KkWLojdvT1MvrSz5GLfONP6pXHfyBw==
X-Received: by 10.98.89.70 with SMTP id n67mr1024824pfb.150.1524037249273;
	Wed, 18 Apr 2018 00:40:49 -0700 (PDT)
Received: from hermes.local ([2601:646:8880:466c:68e6:e447:164c:d4e7])
	by smtp.gmail.com with ESMTPSA id
	v16sm1488523pfl.14.2018.04.18.00.40.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Apr 2018 00:40:48 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	openembedded-devel@lists.openembedded.org
References: <1523967357-4158-1-git-send-email-krzk@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <efd852d7-daec-1d1e-8743-ae43d03d2560@gmail.com>
Date: Wed, 18 Apr 2018 00:40:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1523967357-4158-1-git-send-email-krzk@kernel.org>
Subject: Re: [meta-networking][rocko][PATCH] civetweb: Add new recipe for v1.10 version
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
X-List-Received-Date: Wed, 18 Apr 2018 07:40:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/17/18 5:15 AM, Krzysztof Kozlowski wrote:
> Add recipe for CivetWeb: easy to use, powerful, C/C++ embeddable web
> server with optional CGI, SSL and Lua support, under MIT license.
> 
> CivetWeb provides C and C++ libraries and a standalone server binary.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   .../recipes-connectivity/civetweb/civetweb_1.10.bb | 34 ++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb
> 
> diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb
> new file mode 100644
> index 000000000000..35af45680818
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.10.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Civetweb embedded web server"
> +HOMEPAGE = "https://github.com/civetweb/civetweb"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=da079d81be91ff1d1ca56dcd751f897f"
> +
> +SRC_URI = " \
> +    git://github.com/civetweb/civetweb.git;tag=v${PV} \

its better to use SHA version corresponding to this tag, tags result in 
fetcher n/w access and builds might fail when n/w access is disabled, 
secondly tags are floating types and can be moved.

> +"
> +S = "${WORKDIR}/git"
> +
> +# civetweb supports building with make or cmake (although cmake lacks few features)
> +inherit cmake
> +
> +# Disable Lua and Duktape because they do not compile from CMake (as of v1.8, v1.9 and v1.10)
> +EXTRA_OECMAKE = " \
> +    -DBUILD_SHARED_LIBS=ON \
> +    -DCIVETWEB_ENABLE_DUKTAPE=OFF \
> +    -DCIVETWEB_ENABLE_LUA=OFF \
> +"
> +
> +PACKAGECONFIG ??= "asan caching cgi cpp debug ipv6 server websockets"
> +PACKAGECONFIG[asan] = "-DCIVETWEB_ENABLE_ASAN=ON,-DCIVETWEB_ENABLE_ASAN=OFF,gcc-sanitizers"
> +PACKAGECONFIG[caching] = "-DCIVETWEB_DISABLE_CACHING=OFF,-DCIVETWEB_DISABLE_CACHING=ON,"
> +PACKAGECONFIG[cgi] = "-DCIVETWEB_DISABLE_CGI=OFF,-DCIVETWEB_DISABLE_CGI=ON,"
> +PACKAGECONFIG[cpp] = "-DCIVETWEB_ENABLE_CXX=ON,-DCIVETWEB_ENABLE_CXX=OFF,"
> +PACKAGECONFIG[debug] = "-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=ON,-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=OFF,"
> +PACKAGECONFIG[ipv6] = "-DCIVETWEB_ENABLE_IPV6=ON,-DCIVETWEB_ENABLE_IPV6=OFF,"
> +PACKAGECONFIG[server] = "-DCIVETWEB_INSTALL_EXECUTABLE=ON,-DCIVETWEB_INSTALL_EXECUTABLE=OFF,"
> +# As of v1.10, SSL does not work. Bring it back with v1.11:
> +# PACKAGECONFIG[ssl] = "-DCIVETWEB_ENABLE_SSL=ON -DCIVETWEB_SSL_OPENSSL_API_1_1=ON -DCIVETWEB_ENABLE_SSL_DYNAMIC_LOADING=OFF,-DCIVETWEB_ENABLE_SSL=OFF,openssl"
> +PACKAGECONFIG[websockets] = "-DCIVETWEB_ENABLE_WEBSOCKETS=ON,-DCIVETWEB_ENABLE_WEBSOCKETS=OFF,"
> +
> +BBCLASSEXTEND = "native nativesdk"
> 


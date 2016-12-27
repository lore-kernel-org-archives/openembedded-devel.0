Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wj0-f174.google.com (mail-wj0-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7C80D71B37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2016 12:35:08 +0000 (UTC)
Received: by mail-wj0-f174.google.com with SMTP id sd9so132191370wjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2016 04:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=kJOLPTvfRsIacYdyMN024Bzu0C7OL2ZzeHI3kN4O97Q=;
	b=Pc9Hiw/ctXqbP1xuoM1UgVy/sjn9Y60/wfw53cqDLmxENHqAW9vNcfydl7CPPHDrto
	ABTKoybMINXTnMTG+aY39i1LKX0wjwTyvKOL78YBmzgdX0AgHP+S+71q/uPpl9N0T1r3
	qaNjfTyrDcHEUczoQwFt01sf+UQxMyrGM4Rj+RaffB0ErSbfX4LwJNebjot3iJm+RFg5
	8HszyxnkDtwVRiwy+6917d6eob7dfIJZUmlxyBXwNANc/i6G8jBRposhRlhRhCCk+tNU
	6r/wDhzJSJUAXiBnbnM/BAPeU+atycp7ENbwa9OBLB3Ww9rTLS+Mu+h5tgt3lBqYScx4
	fByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=kJOLPTvfRsIacYdyMN024Bzu0C7OL2ZzeHI3kN4O97Q=;
	b=dMNrc6DBVomHzC3Tcft4rjiLL62j3tcyYFcbOcVB9Qh5pI9RmrMeE26gMeHomHCqgK
	mc24isTf+jK9S+goEStwZ6nDc7XWMmht++IDx0tL6Tp+4ka66nO9XTDBnQES2GAilAC0
	VP2mePkGyouuMXR/KsBhe0CT0eus7esH7vwjY6khO8hmcn8g99Vixi6yBoUmatfASqFG
	ko4hN7o0MpMKEY2PU8/QYVyXuyedxXRlhUnb3TCiTtrntdSXmE+GJJ4l18wf3jnr0r19
	DghTx7c4bzWb8ZikDSstlno6VOfAJ9PMRVhw0QL0fvlxAgZySEgR65M5FfC0ATpnTyJ7
	NkNA==
X-Gm-Message-State: AIkVDXKzrxOT/MgRZgOnrL1w5ED87rVi6TQgvqH1rjqWF6+YAh+n4NfU+nPT+hoQRRBJ/w==
X-Received: by 10.194.78.179 with SMTP id c19mr17516548wjx.72.1482842109825;
	Tue, 27 Dec 2016 04:35:09 -0800 (PST)
Received: from [192.168.2.176] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	197sm55828573wmy.16.2016.12.27.04.35.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Dec 2016 04:35:09 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1482531919-26391-1-git-send-email-derek@asterius.io>
From: Piotr Lewicki <piotr.lewicki@elfin.de>
Message-ID: <453469e0-21ec-6bb0-d87d-0e298613ccbc@elfin.de>
Date: Tue, 27 Dec 2016 13:35:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1482531919-26391-1-git-send-email-derek@asterius.io>
Subject: Re: [meta-webserver][PATCH] apache2: always use the archive.apache.org to ensure older releases are always available
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
X-List-Received-Date: Tue, 27 Dec 2016 12:35:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Can this also be merged to "morty" branch?

Currently build of morty branch fails because of this.


BR,

Piotr


On 23.12.2016 23:25, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb | 2 +-
>   meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb        | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> index ca8ebaf..7a2b236 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> @@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
>   
>   inherit autotools pkgconfig native
>   
> -SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
> +SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
>              file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
>             "
>   
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> index 3bd8579..9446082 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> @@ -6,7 +6,7 @@ DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
>   SECTION = "net"
>   LICENSE = "Apache-2.0"
>   
> -SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
> +SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
>              file://server-makefile.patch \
>              file://httpd-2.4.1-corelimit.patch \
>              file://httpd-2.4.4-export.patch \



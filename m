Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B47C271979
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2016 19:48:26 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m203so2829330wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2016 11:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=oTVZ+70UE7Vy9StF6rJBM2gAk5LUh9hF9Llff9b2jDY=;
	b=rISSMTcL2AkPgWY/bBIYzNfsJFE/9bK7tj/GGjGPVzK2rKzQKfY8gWnS8ZFJGBMi42
	G1Z6VsaIjE66gbQFGaaSXqZ4ns8RpD13LVN9HvZ4HmrfisgA+Hc7WwuDW9t3l7yCI9HF
	Itj4V0jOli6qU0J7urYKJa3dde+JHxnqwF4xE1sXyXYYkGVfbCYkycfdCM1bufj7xy1I
	7Wu/ihOYkfKXyVn8OvGQaPvmVt5Fm0/rqhIWxaZYPGHC0zZHzXZlbo3cMWQMjhahhy6z
	WzS/OElC5dhHO/FGnsv4pwQtmnebZpCcBdy2hZZyKuB6WEnL81+gv5RmS7EtB0P0rERQ
	2XwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=oTVZ+70UE7Vy9StF6rJBM2gAk5LUh9hF9Llff9b2jDY=;
	b=g02sUz8jMAhAj6iqR/GbIWowFpyQCwLjQLgz5GXx08/EZubIQB6e7MO6pXVBFULx2c
	2eMNxmlu09QTzbtdziEAsLKfygD/ccUTEN4YyFRDT069b8P5yXHa90/hKDNirq1PsSfP
	RxPLYg2QU3ahWqQtFLjORtMdn9HhBXx0h5aCPimYnCYSSV7Hd5BpDfDfVUmsefQBa8yp
	zBur8ieYSLBa2AUa2Fneraas2C5f9M3F5AwlmGNVHxlSWJ8y3mPQqmqUy1ObW/H092gr
	MWaiNWe8v7emf8Zc8vBOPlhiPfWU+kPfojwqY3IPRRCi6voIJyPI59x/ZmUaOobyocUc
	qt0w==
X-Gm-Message-State: AKaTC03iaENEtZkm7opV4Byt+FUhkNUGZ/9cXxZOhoUARsZNmCmfe3otJAcu7I09qmKn4k4PacnKr3lkNNVvRg==
X-Received: by 10.28.39.199 with SMTP id n190mr11149644wmn.124.1481399307577; 
	Sat, 10 Dec 2016 11:48:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Sat, 10 Dec 2016 11:48:27 -0800 (PST)
In-Reply-To: <20161203030422.17285-7-raj.khem@gmail.com>
References: <20161203030422.17285-1-raj.khem@gmail.com>
	<20161203030422.17285-7-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 10 Dec 2016 20:48:27 +0100
Message-ID: <CA+chaQf447Syhn6GMRJQFL_sw5tS4eO23OXvzUdvUzYOrsq9aw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 7/8] avro: Add recipe
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
X-List-Received-Date: Sat, 10 Dec 2016 19:48:29 -0000
Content-Type: text/plain; charset=UTF-8

What is supposed to provide lzma?

https://layers.openembedded.org/layerindex/recipe/53191/

On Sat, Dec 3, 2016 at 4:04 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/avro/avro-c_1.8.1.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-support/avro/avro-c_1.8.1.bb
>
> diff --git a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
> b/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
> new file mode 100644
> index 0000000..ebaab4f
> --- /dev/null
> +++ b/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Apache Avro data serialization system."
> +HOMEPAGE = "http://apr.apache.org/"
> +SECTION = "libs"
> +
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=73bdf70f268f0b3b9c5a83dd7a6f3324"
> +
> +DEPENDS = "jansson zlib lzma"
> +
> +SRC_URI = "${APACHE_MIRROR}/avro/avro-${PV}/c/avro-c-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "b268348536714541e10411823a1b59b0"
> +SRC_URI[sha256sum] = "e5042088fa47e1aa2860c5cfed0bd0
> 61d81f9e96628f8b4d87a24d9b8c5e4ecc"
> +
> +LDFLAGS_append_libc-uclibc = " -lm"
> +
> +inherit cmake
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id B5E7A7981D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 05:22:40 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id d1-v6so13250696pgo.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 22:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=KSIofrkVkk4JtgyBmLgfsCP4PLEYU8HhZ4ddoMtmlS0=;
	b=Hs0UeHKlDV0GUHTs4Z81rK1203E6ep+dC7NZBQdMSb1tcGq9t0f8tgmTtUfERAJM+j
	BiqKBls0ACxdHK7Uynvr/YZUDCa7cYtXV0j6b51Zl8k/IonBMdILu/m82NmiEzEdX21u
	97Gq/RAhLffJzGoT5gf0Z3US3tSDrc8hcqDEbouQ4EotiJwkDn94zKAjlxNnZ76ldntS
	bRlbpxx/B60rL768HI1NalN1qOoSKPHWrZ84MxBZaF6C33qNQZsKbOvwSl6wPBRZDCXO
	9XzxzeBphl8YhUWrMELxXO2jkwrbpqMn5DOcwNLREuZlHIu4YPyDPiuchwdJIrjdgGBy
	lAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=KSIofrkVkk4JtgyBmLgfsCP4PLEYU8HhZ4ddoMtmlS0=;
	b=O3PrsuPpPugM25EWR0ESdy9TG2ZNN50JZcwBSCNiDcJas52cTW8FI1z0Yy5O7YAQDm
	5VndmyvJ3lHvqB6hy3g1SDQELh6DB5OUP7r9CmdtA+O7AbQlfpuElWL89gMQY9OuTbh1
	GNKI5I8E5eRe2VgrIv5YfajcMKWfRnftMuUEtS9pNJACPowNGMQAtm5s/4prHmzAvMpT
	S0jCflrIjG40NkmRVAHVjjHKQ9KnFV4QebQ9hDY4+4SyO9g9kadGjIJrDu7NyUo6OS9m
	S7epTqNqMgepyviS3J4aVlISdzjYkHBnhZH6G1PiX52u/HUbA074MUAxwyyHRwHg7wA3
	XmyQ==
X-Gm-Message-State: ABuFfojsc0LA3/MdBko3tUn/25/MsXZWnqF7dhZxpI1lA3wjvv7zPxQo
	bHt411tUZEwDtdcRvyOhZz/dRDSi
X-Google-Smtp-Source: ACcGV6306Vi/wgaMJ/VnGNL2U12yfPOsTSIbhGP6myY+N/vDcy4dILQEShSWZ8COx6da1Q1kLTeYrQ==
X-Received: by 2002:a17:902:c8:: with SMTP id
	a66-v6mr4251578pla.269.1537939361574; 
	Tue, 25 Sep 2018 22:22:41 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:48c:9f78:37fc:8835?
	([2601:202:4180:c33:48c:9f78:37fc:8835])
	by smtp.gmail.com with ESMTPSA id
	187-v6sm5836814pfu.184.2018.09.25.22.22.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 22:22:40 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
References: <20180926015309.18538-1-paul.eggleton@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <79302b54-c3e3-9476-461e-3c7dd60176c2@gmail.com>
Date: Tue, 25 Sep 2018 22:22:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180926015309.18538-1-paul.eggleton@linux.intel.com>
Subject: Re: [meta-oe][PATCH] protobuf: make python-protobuf dependency optional and default to off
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
X-List-Received-Date: Wed, 26 Sep 2018 05:22:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/25/2018 06:53 PM, Paul Eggleton wrote:
> A dependency on python-protobuf was added in commit
> 5f6fcfd36272768a3ff9078c07c572cf5dc01ccd for the sole purpose of
> providing a ptest, however python-protobuf is in meta-python and thus
> this means that meta-oe would depend on meta-python by default (assuming
> your distro enables ptest by default), and we don't want that - meta-oe
> isn't supposed to depend upon any layer other than openembedded-core.
> Luckily we can still have a ptest even without the python support, so
> add a PACKAGECONFIG and leave it disabled by default.
>
> Note: the PACKAGECONFIG here is not particularly useful since it's only
> about what goes into the -ptest package and thus also the dependency. I
> contemplated just using LANG_SUPPORT instead, but PACKAGECONFIG does
> have the advantage that it's introspectable and fairly well understood
> so in the end I went with it.
thanks. with backport to sumo ?

>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> index f8498c4c8..cf72d9ca7 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> @@ -22,10 +22,13 @@ S = "${WORKDIR}/git"
>  
>  inherit autotools-brokensep pkgconfig ptest
>  
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[python] = ",,"
> +
>  EXTRA_OECONF += "--with-protoc=echo"
>  
>  TEST_SRC_DIR = "examples"
> -LANG_SUPPORT = "cpp python"
> +LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
>  
>  do_compile_ptest() {
>  	# Modify makefile to use the cross-compiler
> @@ -78,7 +81,7 @@ FILES_${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
>  
>  RDEPENDS_${PN}-compiler = "${PN}"
>  RDEPENDS_${PN}-dev += "${PN}-compiler"
> -RDEPENDS_${PN}-ptest = "bash python-protobuf"
> +RDEPENDS_${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python-protobuf', '', d)}"
>  
>  MIPS_INSTRUCTION_SET = "mips"
>  



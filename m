Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8F87B79BD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 17:23:41 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id f18-v6so6157624pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=9P8AwaVsOGO4Fd8HBDxnXGxAbtVo9hv7UGtB45qA+Jc=;
	b=YEXM8+pXAi+vTybB6kRYEvrC89UudCI7SWhiukkv7w1Gj15ghyBCN9LfGoOctZDV4w
	WMrqqf9rFzHkXA4R1YX+mW1rOJWL2k+JzM5g7lPwCEz+OXOylIiNiFjsMy0M9j1BTmDA
	XhSPWFRUucqeDaFz3HeTcnkzsYHUGujSP/17ag3sRpAz8IFOQ9qCiGSyjImFgSVjqQE0
	ujg1P1ItUy+IUDqK/JY+iRcqfAPse/ffxHSf7iwRzEI0LvH87KJWVT5j5fmpmLkt/Pzy
	8Tm2NPMLaK7fc2DmpE5kkjaY6gG9XO/pst+BdmCPlX45SCO9g6zNfcFgoJW0cBYmR1Gb
	1hVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=9P8AwaVsOGO4Fd8HBDxnXGxAbtVo9hv7UGtB45qA+Jc=;
	b=L673mWQ78814KIQJAWpbAA/89fN+A3Iav3A5j4a7MAAb1Nj69QOKeqiI6y9RV6RTLJ
	1qelplJUINdgdcxd5kpoaQLatljR0NhdvjFMhw2sZAmQ7Aej02lseKjpaPDDT0iArXFg
	3NljqP82O0si48bOMwjp1zYg22esaA3sAyYpmeAF7ZClIYc5pqmHdnLLkGWnFCkcqUny
	i4+LOqYq1Hba7iSQZpcG/xj4wopPGw6bwXV4hBSdB8fGX84y5S8KBzk8rrWvK/v6HT4Z
	KaaNCJYJnicHWdtgPG5nkigvm1x7Px4JEyRteEr6LKEO6JJvq2flD0l49NvVQPPR297I
	0UYw==
X-Gm-Message-State: ABuFfohykWuZWGa1PC2GVYiBDcsFUhYGFOSLC6wJVMS0RPj317nEwvQ/
	sRs6ebJLaGHmcz4Zn46SL2bYc9IP
X-Google-Smtp-Source: ACcGV63Mimn3b50obpOENlsIIlyHDZQKvwWMDrVa5n4Qo4CzqytSnXG6OjsNn3pchWs24fPHCoxwdQ==
X-Received: by 2002:a63:b709:: with SMTP id
	t9-v6mr6054366pgf.366.1539365022365; 
	Fri, 12 Oct 2018 10:23:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:1074:2cb7:7274:2f54?
	([2601:202:4180:c33:1074:2cb7:7274:2f54])
	by smtp.gmail.com with ESMTPSA id
	d18-v6sm4849084pfk.163.2018.10.12.10.23.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 10:23:41 -0700 (PDT)
To: Yi-Soo An <yisooan@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20181011093307.5530-1-yisooan@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2316cca8-bdb5-5e73-d486-5f7136bfa4fe@gmail.com>
Date: Fri, 12 Oct 2018 10:23:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181011093307.5530-1-yisooan@gmail.com>
Subject: Re: [meta-networking, sumo, rocko, pyro, morty][PATCH] babeld: Add Babel routing protocol recipe
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
X-List-Received-Date: Fri, 12 Oct 2018 17:23:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Yi-soo,



On 10/11/2018 02:33 AM, Yi-Soo An wrote:
> Babel is a loop-avoiding distance-vector routing protocol for
> IPv6 and IPv4 with fast convergence properties.
>
> Signed-off-by: Yi-Soo An <yisooan@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
I don't add new packages to stable branches.

- armin
> ---
>  .../recipes-protocols/babeld/babeld_1.8.3.bb  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb
>
> diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb b/meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb
> new file mode 100644
> index 000000000..8f028474f
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "Babel is a loop-avoiding distance-vector routing protocol"
> +DESCRIPTION = "\
> +Babel is a loop-avoiding distance-vector routing protocol for IPv6 and \
> +IPv4 with fast convergence properties. It is based on the ideas in DSDV, AODV \
> +and Cisco's EIGRP, but is designed to work well not only in wired networks \
> +but also in wireless mesh networks, and has been extended with support \
> +for overlay networks. Babel is in the process of becoming an IETF Standard. \
> +"
> +HOMEPAGE = "https://www.irif.fr/~jch/software/babel/"
> +SECTION = "net"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
> +
> +SRC_URI = "git://github.com/jech/babeld.git;protocol=git"
> +SRCREV = "535184173fcde5ddc43020cd197d01d1ea0e9a8b"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile () {
> +	oe_runmake babeld
> +}
> +
> +do_install () {
> +	oe_runmake install.minimal PREFIX=${D}
> +}
> +



Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B885F6011F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 20:06:22 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id s2so12575897pge.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=RK08+/giVVHOj5ZrF+vSlka1NGKZKm6HoBKzm/MeFiQ=;
	b=gskn4prdaVegRRh65GjoYAVBstQ/Fdi1Ul8giJ1NpZE0i2qppUVrHCASB5u1nSawFS
	UVIj8nF/TNbSyo2tATAkQLKiALXJylP7ADppKsrN3o7XB3QBhzf71cVFDLDc9bSCfG8Q
	p+lneVI6UY0Zz6tWWbSlk1aIz4nduarG7RR13p5gx1cxA/PqpuqXt02PbW27KbceNoVS
	pv52b8r/DacUdymidciLhqevRMeGp6WXkRNlwfZIpxTg8+rnvWS0K9iBgqBp1J1En8PO
	Uhj7mnlyIE37u0UDO8dITfKPCE7LFppF/N8C6BzhUNGFuHR9zY7mI4wEdZfhyMXhRZXi
	PGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=RK08+/giVVHOj5ZrF+vSlka1NGKZKm6HoBKzm/MeFiQ=;
	b=O54rIjC2AiKLqCdD4f3NI84noHK7xmnEwj0L13LurH3Sonb8J1yL14RCPVg7tJosVF
	Mdj0L8MbTP07nkaClwr0SYy7qsDohihS8ubO3nP7QDtZsm62vPON0wf/S0RBCKlpDRl/
	A3QQqD2jo+o15j5N4ZaEjDBg2D8ScksfgHJFmAe70QzAnTZd+NMEeG2sWsqvSNdabpP6
	GZcFIdlsLhiu/2b4/6bKx8K8gI6fjIcRMy+TQdwct19E5Tm8S7nWGlAKxxXfbT98lMYO
	6k4Idl17IHnbtU2caT3U09rtX10CdVAqP3JH0eGXTc3Rk0SJkjXfebW5L57Acd9lM7db
	cQLQ==
X-Gm-Message-State: AMCzsaXdJ6ZsvERTlv7R2tsbzv3RGLjUS8uKCGA/cU3Zjcex8WK3Rf/t
	bJyvLib7mQ2FPMUxul/4JTVbEw==
X-Google-Smtp-Source: ABhQp+TaBBrb0dZbznK1KUXnYfe7zOSy9xaD3mCXUhqhsxqPYV0wnqwuOps78OhCH0DG4EFabmcOsg==
X-Received: by 10.98.133.10 with SMTP id u10mr9939956pfd.22.1509393983425;
	Mon, 30 Oct 2017 13:06:23 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:28d1:6486:c536:9d44?
	([2601:202:4001:9ea0:28d1:6486:c536:9d44])
	by smtp.gmail.com with ESMTPSA id
	i11sm29620578pgc.88.2017.10.30.13.06.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Oct 2017 13:06:22 -0700 (PDT)
To: Fan Xin <fan.xin@jp.fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <CAMKF1sohPCP07Hx-aHdoKDqtrTXWO+3atWDX-MMLP80RsdxRNg@mail.gmail.com>
	<1509338753-23099-1-git-send-email-fan.xin@jp.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d2eb9f63-12b3-387a-c9a4-572c52231c3b@gmail.com>
Date: Mon, 30 Oct 2017 13:06:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1509338753-23099-1-git-send-email-fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH v3] spi-tools: Add version info
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
X-List-Received-Date: Mon, 30 Oct 2017 20:06:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/29/2017 09:45 PM, Fan Xin wrote:
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  meta-oe/recipes-support/spitools/spitools_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
> index f808125..168f0f3 100644
> --- a/meta-oe/recipes-support/spitools/spitools_git.bb
> +++ b/meta-oe/recipes-support/spitools/spitools_git.bb
> @@ -4,6 +4,8 @@ AUTHOR = "Christophe BLAESS"
>  LICENSE="GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
>  
> +PV = "0.8.1"
> +
>  S = "${WORKDIR}/git"

Should we think of converting these kinds recipes to spitools_0.8.1.bb
to avoid the need for PV ?  Maybe a best practices on the recipes naming??

- armin
>  
>  SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"



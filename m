Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id A903971AD1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 16:06:42 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id y26so7410490pfi.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 08:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=q/2fPe58ZYUjVkKGOf8wj5q7UygolArkpXwmpdBC71M=;
	b=bdjtfXUNK+JAQTHf8ecR4TjZcBCxjkhJQl/fxNLKDVww7piIrZ5qsH8LnE/5Y6qokw
	GP847tljR0dIyPgWFD0NuoSL81bRpgYERE8gA0+KYMZfPDRwdHMLHGB66rgZqA9wMWUU
	kUkT1me8zN9y5HNW9tVqsHYeD7llaRuv5fwd0AHi0L0C77WKviDni+fBnOyxEq7AdPK8
	L9ulvvw1CnWXWptKd2s6iKKFZ1C9Zdhk4TY7GYQm5CnE0b5QfiZG9WQnsBCAQ97CYQTC
	cG17giZzRKlXK5fMhvMCM03AIPEeNoNz/jx1V7JnK28HIGfpqQSjtA/RWrmxYNpdQTzg
	ysiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=q/2fPe58ZYUjVkKGOf8wj5q7UygolArkpXwmpdBC71M=;
	b=Eyc1FhXZ0IHR3gaeGBXp0xcYfbyFKfH7Ruci4f5TvR195wGXozYl26FEipHaIrjl2n
	UfUYN0Rn5lsymmb5WyNyoIlJFg5COi3tt70UFl472AVg9l510CGdyRep6ncnCI1udjTf
	XJsyIhnaMgnogSz8e5qgk6CtW/QPTFE/cykU2tdFIx7//gvQmQOa5HJ9A7EFcLBa5v32
	tr3FAjcgVlcNE9XsXZDDfP7aiZDrzga/zeeyLGjFun3pcI5IroDAGMUd9LQjCpMqMYEW
	35RXu/nh+xwK5M0KfFIxXB4+sFEG+Dv8fmukOaLLh/6264T38JAY6jc54KYzMXZdRgnM
	p2Kw==
X-Gm-Message-State: AKwxytcHLMiQ3VzAoc/w5bt4SCRIeYKkKMCxJyZVNTVe62U1603cfNxi
	vnVqfVvA3tjrQzajYt6arJFzmQ==
X-Google-Smtp-Source: AH8x224X0lEkK39neCOZHgjZunQkMuYjy1UZaRCOfy4D9yTmRmZqpP3307gAtM69a64sAOCUDM/NZg==
X-Received: by 2002:a17:902:6881:: with SMTP id
	i1-v6mr3943777plk.323.1516637203456; 
	Mon, 22 Jan 2018 08:06:43 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:c85d:e2c0:793e:901c?
	([2601:202:4000:1184:c85d:e2c0:793e:901c])
	by smtp.gmail.com with ESMTPSA id
	p14sm1274826pff.108.2018.01.22.08.06.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 08:06:42 -0800 (PST)
To: "Mariia Movchan -X (mmovchan - GLOBALLOGIC INC@Cisco)" <mmovchan@cisco.com>, "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
References: <1516206797987.39279@cisco.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2719dbc0-2769-20b3-ddd8-51b4ad4540db@gmail.com>
Date: Mon, 22 Jan 2018 08:06:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1516206797987.39279@cisco.com>
Subject: Re: [meta-networking] [PATCH] ipcalc: add initial recipe for version 0.2.0
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
X-List-Received-Date: Mon, 22 Jan 2018 16:06:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 01/17/2018 08:30 AM, Mariia Movchan -X (mmovchan - GLOBALLOGIC INC at
Cisco) wrote:
> Signed-off-by: Mariia Movchan <mmovchan@cisco.com>
> ---
>  .../recipes-support/ipcalc/ipcalc_0.2.0.bb            | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Failed to build successfully. please see
http://errors.yoctoproject.org/Errors/Details/164986/
>  create mode 100644 meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb
>
> diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb
> new file mode 100644
> index 0000000..bb283c8
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Tool to assist in network address calculations for IPv4 and IPv6."
> +HOMEPAGE = "https://github.com/nmav/ipcalc"
> +
> +SECTION = "net"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> +
> +SRC_URI = "https://github.com/nmav/ipcalc/archive/${PV}.tar.gz;downloadfilename=ipcalc-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "edbfc4cb64632e0c4f87cf81c7d8302d"
> +SRC_URI[sha256sum] = "c965c1296172a6acc50d54dfe81f7e5d589f9762b5d9ae459eee00349675336b"
> +
> +export USE_GEOIP = "no"
> +
> +do_install() {
> +    install -d ${D}/${bindir}
> +    install -m 0755 ${S}/ipcalc ${D}/${bindir}
> +}
> --
> 2.10.3.dirty



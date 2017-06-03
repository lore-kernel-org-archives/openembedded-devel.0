Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 92C447198D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jun 2017 15:18:39 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n23so15785225pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jun 2017 08:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=M3ap/MAnYRzy3mDM6DaHRoDhZS1UQ8+iGBeo7X1IYj4=;
	b=rr1rzlcnMgZJ3QQD+LQvdO+4yNqEssd8O2DO0/5uKeGRoRITlaNQiIE7G4C4J048Cm
	cQe3GsFDBoYGa0V0sY/ypbbCdUlan0cAxwHq5npdF09I+eZ/s9SN/G7SeM4K4OkRpE4M
	wOceYzH1w+opIIZoAd8HGm2bcbxvl3r3aR0yOQp6J89QPe18PWr515IdBf0Fc4y1zRJX
	ZvLdtZKIxEAeb9Zt+GL8ZdCoOnta2802ArYKMEEJ9W8itmdq+saVwiVvIzDPtpxPtnpJ
	0LmyolhaY4Pqzg+QXT37NQknN0C4CwS1Nw2wIE9CHBBo2lvo71P+zX6JciBIEkgN3kpr
	j3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=M3ap/MAnYRzy3mDM6DaHRoDhZS1UQ8+iGBeo7X1IYj4=;
	b=HkqEQpnU0rrhNH/G56UmH6EzOk9pLWZK8P2p/R1LVhRnBcjI4ribrLcRRyflwo93gx
	OedBw4c6YNNicViXLXCuZLQzHEutm2xD24YfhgTENt+JQ+5VF3cFoiriESMeKL0w2KZ/
	vITPw2WLb9+sJAcjqLpQD6u3oWuqiTeIm6F05bHR13H3b0WgAh2sGJAWkM0o5X+/OV89
	UTH3A/r1HENcgmwfuF/i3QHd7Gv/LCkXs6A0FGT/yAMaoqHZmbL1AE3X6WgRHj9+fvan
	00i2Uz2Z/p8xxuGU7H9WA9GKe5VPFkx0bNg97cUb4kNc2UIEhg675bCBbH3zNBXx1Yhk
	AzEA==
X-Gm-Message-State: AODbwcCx4T4Up7TEzobk+v3H7QQUWcllINSSQpltUrygeItS4oar4Q55
	pDY524blLNTYJRiNuwo=
X-Received: by 10.99.96.81 with SMTP id u78mr5902353pgb.101.1496503120908;
	Sat, 03 Jun 2017 08:18:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:b844:8676:377:81ac?
	([2601:202:4001:9ea0:b844:8676:377:81ac])
	by smtp.gmail.com with ESMTPSA id b1sm6027554pfl.70.2017.06.03.08.18.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Jun 2017 08:18:40 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20170603045833.8120-1-raj.khem@gmail.com>
	<20170603045833.8120-3-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <65800ef8-cd22-49bf-92ae-164339fc0179@gmail.com>
Date: Sat, 3 Jun 2017 08:18:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170603045833.8120-3-raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH 3/4] openipmi: Fix build with musl
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
X-List-Received-Date: Sat, 03 Jun 2017 15:18:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Khem,


On 06/02/2017 09:58 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../openipmi/files/include_sys_types.patch              | 17 +++++++++++++++++
>   meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb     |  1 +
>   2 files changed, 18 insertions(+)
>   create mode 100644 meta-oe/recipes-support/openipmi/files/include_sys_types.patch
>
> diff --git a/meta-oe/recipes-support/openipmi/files/include_sys_types.patch b/meta-oe/recipes-support/openipmi/files/include_sys_types.patch
> new file mode 100644
> index 000000000..58ec5d883
> --- /dev/null
> +++ b/meta-oe/recipes-support/openipmi/files/include_sys_types.patch
isn't this missing Upstream-Status and Signed-off-by?

- armin
> @@ -0,0 +1,17 @@
> +include sys/types.h for u_int32_t
> +
> +ui.c:340:5: error: unknown type name 'u_int32_t'; did you mean 'uint32_t'?
> +     u_int32_t     addr;
> +     ^~~~~~~~~
> +Index: OpenIPMI-2.0.22/ui/ui.c
> +===================================================================
> +--- OpenIPMI-2.0.22.orig/ui/ui.c
> ++++ OpenIPMI-2.0.22/ui/ui.c
> +@@ -42,6 +42,7 @@
> + #include <fcntl.h>
> + #include <time.h>
> + #include <sys/time.h>
> ++#include <sys/types.h>
> + #include <ctype.h>
> +
> + #include <OpenIPMI/selector.h>
> diff --git a/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb b/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb
> index 82e8cac3e..9f4b0ff26 100644
> --- a/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb
> +++ b/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb
> @@ -30,6 +30,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
>              file://ipmi-init-fix-the-arguments.patch \
>              file://makefile-add-ldflags.patch \
>              file://do-not-install-pyc-and-pyo.patch \
> +           file://include_sys_types.patch \
>              file://openipmi-helper \
>              file://ipmi.service \
>              "



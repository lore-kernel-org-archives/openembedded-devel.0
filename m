Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 660E36E667
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 14:33:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g202so4906053pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=u7NEoeSpR86qdWN8fNmwK44yTYmWtoYaA85tksQj3yA=;
	b=r8V/r9UcV3tugcY3zLTlyc25LKZZtWTuOt9LyEIAQ9VP0hr3Of+Tp/aF9qpLyIK1ts
	WaQOiqY4zX6V24LaitMGDbtKytsF7OL+jooEwzGg2KUPaWOW3KqVr0z1ElAZOeLMjuWN
	3mBqm048ZZ0L2oUGGeK9BXOASiP0TQrmG7iRHxDTYGP2TWWgE/e3zjkPMcF3W3mKvAwo
	XdJmXJoyHnY5B/8uSarUsNTb+EaT+aBoJX7zld5ty6W/s/vLA6e9ugAn8CcSo997bczi
	8eOyKeJ/l3Vq4H+DklbFQknWcr2SzumJj8Ea90qNSXJIN2hrhFM7s1bJmd+8GHLlORl/
	8Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=u7NEoeSpR86qdWN8fNmwK44yTYmWtoYaA85tksQj3yA=;
	b=OJSi6PHVUsNPJzskdBC4GRlHR+FW7mkjWiURLZ+XjnIQazzhZ2cckhjAMmn5NNrQFk
	lclNHQ8Bj3xIIF6Bt4Pd3fgLpj2kAxyj3GvS/nxKGlx1pS0i9C4C6K3RAmUECYKZrjqE
	+vhd8n/EbTgRLby4elHjKRiT0IZkn8fOsyxP5LxLgN5lGivxn7qUK4lT787THE2WY05x
	Yu91mN7BauE1VvxoFskC8rCl98dkvYV6eY4RhITR5savULNwR9SH85A/QPl2aUIIXq1V
	J2mF/FEJnNy/bQGos7PVl5qoHTL3cO91iA2QGkxil8bb13geUenxHhOI12k0nLv+ipYg
	z0ww==
X-Gm-Message-State: ALyK8tILW4jpLh3ep/gCVhZ92pRqyIXuDUacTQyrumIR38cZMndUeWNgYfMJaJZUQKQG/g==
X-Received: by 10.98.90.193 with SMTP id o184mr13015694pfb.101.1468506779893; 
	Thu, 14 Jul 2016 07:32:59 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:ab:9240:fd9e:fe24?
	([2601:202:4001:9ea0:ab:9240:fd9e:fe24])
	by smtp.googlemail.com with ESMTPSA id
	h189sm4533722pfc.52.2016.07.14.07.32.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jul 2016 07:32:58 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1464599876-108961-1-git-send-email-catalin.enache@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5787A291.80603@gmail.com>
Date: Thu, 14 Jul 2016 07:32:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1464599876-108961-1-git-send-email-catalin.enache@windriver.com>
Subject: Re: [PATCH] squid: CVE-2016-4554
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
X-List-Received-Date: Thu, 14 Jul 2016 14:33:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

ping

On 05/30/2016 02:17 AM, Catalin Enache wrote:
> mime_header.cc in Squid before 3.5.18 allows remote attackers
> to bypass intended same-origin restrictions and possibly
> conduct cache-poisoning attacks via a crated HTTP Host header,
> aka a header smuggling issue.
> 
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4554
> 
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> ---
>  .../squid/files/CVE-2016-4554.patch                | 35 ++++++++++++++++++++++
>  .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-4554.patch
> 
> diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2016-4554.patch b/meta-networking/recipes-daemons/squid/files/CVE-2016-4554.patch
> new file mode 100644
> index 0000000..c02b67e
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/squid/files/CVE-2016-4554.patch
> @@ -0,0 +1,35 @@
> +From a5d62fe9d7326b8aef2ebcb700d4a228c8b2681a Mon Sep 17 00:00:00 2001
> +From: Catalin Enache <catalin.enache@windriver.com>
> +Date: Thu, 26 May 2016 10:31:48 +0300
> +Subject: [PATCH] Require exact match in Host header name lookup
> +
> +Upstream-Status: Backport
> +CVE: CVE-2016-4554
> +
> +Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> +---
> + src/mime_header.cc | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/mime_header.cc b/src/mime_header.cc
> +index 4190b37..db18764 100644
> +--- a/src/mime_header.cc
> ++++ b/src/mime_header.cc
> +@@ -36,11 +36,11 @@ mime_get_header_field(const char *mime, const char *name, const char *prefix)
> + 
> +     debugs(25, 5, "mime_get_header: looking for '" << name << "'");
> + 
> +-    for (p = mime; *p; p += strcspn(p, "\n\r")) {
> +-        if (strcmp(p, "\r\n\r\n") == 0 || strcmp(p, "\n\n") == 0)
> ++    for (p = mime; *p; p += strcspn(p, "\n")) {
> ++        if (strcmp(p, "\n\r\n") == 0 || strcmp(p, "\n\n") == 0)
> +             return NULL;
> + 
> +-        while (xisspace(*p))
> ++        if (*p == '\n')
> +             ++p;
> + 
> +         if (strncasecmp(p, name, namelen))
> +-- 
> +2.7.4
> +
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> index d0e1b16..7fe41ee 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> @@ -30,6 +30,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
>             file://run-ptest \
>             file://volatiles.03_squid \
>             file://CVE-2016-3947.patch \
> +           file://CVE-2016-4554.patch \
>  "
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
> 


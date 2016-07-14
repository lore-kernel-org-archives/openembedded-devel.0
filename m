Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6785F73166
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 14:26:37 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g202so4898567pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=tFpAYL0nIOEtSfOZZzPjPhQ/IvcjgITSyZol+R1J4TE=;
	b=ixOA5jsVIHV84dAj4w3lahyWkg4EYcjFgagztQ63yadfnguzl0O7RW6nNhSOj1y/7O
	ThUEmg1KwJICemdRTEI/x/CAAQq2JT+HDuBEyMqrhUGxnk3k1SGlaNM7SeBvuVnvhPmp
	TwfiK7Q92bJHPXNKPl4arLy0zOvQ8sVVyZ62f2gyZieUwm1nulFIcr+AqiY1XnOwBqDz
	6p3wG5uJVOnCRZ4RejlgobovtTm+c71TdNf463s/e97zbNtIKKHcAubZD+Qg9LyugkFu
	7RlrHeC3/uhZCFEwJJifJSEIWlZDVrGqBhfY3AMQrxdR+Hpxa4KRU+2ojEFW5VlfSq30
	Murg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=tFpAYL0nIOEtSfOZZzPjPhQ/IvcjgITSyZol+R1J4TE=;
	b=iLhWHrqKaYZtL7AY/wlBPsOBzzVMhlqL+YVuk4Nn7uzrd2qqaSoeAYy2dqnznf4McI
	gdnntkldvjjwIRvkh6zTuDmyvHh3VK/06Zop7cTAAJMMwJP1LwTMpAm9szMj/pg3UqOH
	oKuX/4SQj1Vpafi0yR9PQe14fOutzLhxYybJrBaM0CFbaFfDLjW+Bo/23wg01yiBOS4o
	utkZwzEsVbAdtzJuIgzcJmYH/i92zUNDYNSPFbUBwt9in3MwJBZulaysktrw1XDFXuYe
	TPEW1WqU6Trq4Y2sUFByx3IryVPmWixNmvsaZc8l7F/Ej0OfUHzp2x6jULCq3+wBCRaw
	/RMg==
X-Gm-Message-State: ALyK8tLk64vnwRqbuh7GbsomyKhT/RLUvwxAZdbPWHM2a/w9LukTiWqQaA/zKb2bLUmVtw==
X-Received: by 10.98.10.148 with SMTP id 20mr12963556pfk.154.1468506397804;
	Thu, 14 Jul 2016 07:26:37 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:ab:9240:fd9e:fe24?
	([2601:202:4001:9ea0:ab:9240:fd9e:fe24])
	by smtp.googlemail.com with ESMTPSA id
	191sm7310353pfx.68.2016.07.14.07.26.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jul 2016 07:26:36 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1464681014-17612-1-git-send-email-catalin.enache@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5787A113.3030305@gmail.com>
Date: Thu, 14 Jul 2016 07:26:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1464681014-17612-1-git-send-email-catalin.enache@windriver.com>
Subject: Re: [PATCH] squid: CVE-2016-4556
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
X-List-Received-Date: Thu, 14 Jul 2016 14:26:39 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

ping. this should be backported

- armin

On 05/31/2016 12:50 AM, Catalin Enache wrote:
> Double free vulnerability in Esi.cc in Squid 3.x before 3.5.18
> and 4.x before 4.0.10 allows remote servers to cause a denial
> of service (crash) via a crafted Edge Side Includes (ESI) response.
> 
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4556
> 
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> ---
>  .../squid/files/CVE-2016-4556.patch                | 96 ++++++++++++++++++++++
>  .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
>  2 files changed, 97 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-4556.patch
> 
> diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2016-4556.patch b/meta-networking/recipes-daemons/squid/files/CVE-2016-4556.patch
> new file mode 100644
> index 0000000..e990c4a
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/squid/files/CVE-2016-4556.patch
> @@ -0,0 +1,96 @@
> +From ee68ec6602f88ee588ac01d440b45af2a1ac2614 Mon Sep 17 00:00:00 2001
> +From: Catalin Enache <catalin.enache@windriver.com>
> +Date: Tue, 31 May 2016 09:17:40 +0300
> +Subject: [PATCH] Fix SIGSEGV in ESIContext response handling
> +
> +HttpReply pointer was being unlocked without heving been locked.
> +Resulting in a double-free. Make it use RefCount instead of
> +manual locking to ensure locked/unlock is always symmetrical.
> +
> +Upstream-Status: Backport
> +CVE: CVE-2016-4556
> +
> +Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> +---
> + src/esi/Context.h |  3 ++-
> + src/esi/Esi.cc    | 14 +++++++-------
> + 2 files changed, 9 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/esi/Context.h b/src/esi/Context.h
> +index 6d15bfe..9982d5c 100644
> +--- a/src/esi/Context.h
> ++++ b/src/esi/Context.h
> +@@ -13,6 +13,7 @@
> + #include "err_type.h"
> + #include "esi/Element.h"
> + #include "esi/Parser.h"
> ++#include "HttpReply.h"
> + #include "http/StatusCode.h"
> + 
> + class ESIVarState;
> +@@ -91,7 +92,7 @@ public:
> +     err_type errorpage; /* if we error what page to use */
> +     Http::StatusCode errorstatus; /* if we error, what code to return */
> +     char *errormessage; /* error to pass to error page */
> +-    HttpReply *rep; /* buffered until we pass data downstream */
> ++    HttpReply::Pointer rep; /* buffered until we pass data downstream */
> +     ESISegment::Pointer buffered; /* unprocessed data - for whatever reason */
> +     ESISegment::Pointer incoming;
> +     /* processed data we are waiting to send, or for
> +diff --git a/src/esi/Esi.cc b/src/esi/Esi.cc
> +index 768b139..338e90b 100644
> +--- a/src/esi/Esi.cc
> ++++ b/src/esi/Esi.cc
> +@@ -573,7 +573,7 @@ ESIContext::send ()
> + 
> + #endif
> + 
> +-    if (!(rep || (outbound.getRaw() &&
> ++    if (!(rep != NULL || (outbound.getRaw() &&
> +                   outbound->len && (outbound_offset <= outbound->len)))) {
> +         debugs(86, 5, "ESIContext::send: Nothing to send.");
> +         return 0;
> +@@ -618,18 +618,18 @@ ESIContext::send ()
> +     flags.clientwantsdata = 0;
> +     debugs(86, 5, "ESIContext::send: this=" << this << " Client no longer wants data ");
> +     /* Deal with re-entrancy */
> +-    HttpReply *temprep = rep;
> ++    HttpReply::Pointer temprep = rep;
> +     rep = NULL; /* freed downstream */
> + 
> +-    if (temprep && varState)
> +-        varState->buildVary (temprep);
> ++    if (temprep != NULL && varState)
> ++        varState->buildVary(temprep.getRaw());
> + 
> +     {
> +         StoreIOBuffer tempBuffer;
> +         tempBuffer.length = len;
> +         tempBuffer.offset = pos - len;
> +         tempBuffer.data = next->readBuffer.data;
> +-        clientStreamCallback (thisNode, http, temprep, tempBuffer);
> ++        clientStreamCallback (thisNode, http, temprep.getRaw(), tempBuffer);
> +     }
> + 
> +     if (len == 0)
> +@@ -1259,7 +1259,7 @@ ESIContext::parse()
> +         ++parserState.stackdepth;
> +     }
> + 
> +-    if (rep && !parserState.inited())
> ++    if (rep != NULL && !parserState.inited())
> +         parserState.init(this);
> + 
> +     /* we have data */
> +@@ -1398,7 +1398,7 @@ ESIContext::freeResources ()
> + {
> +     debugs(86, 5, HERE << "Freeing for this=" << this);
> + 
> +-    HTTPMSGUNLOCK(rep);
> ++    rep = NULL; // refcounted
> + 
> +     finishChildren ();
> + 
> +-- 
> +2.7.4
> +
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> index 6040171..83a0b45 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> @@ -32,6 +32,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
>             file://CVE-2016-3947.patch \
>             file://CVE-2016-4554.patch \
>             file://CVE-2016-4555.patch \
> +           file://CVE-2016-4556.patch \
>  "
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
> 


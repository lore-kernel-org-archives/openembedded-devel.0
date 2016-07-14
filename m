Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id E26526E667
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 14:29:04 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hh10so4686727pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=mHMKH+l8h7UC9sH+pDq7xzORsIyrWVJOV3tDp2nPwpg=;
	b=uVpMLPBNWmhJoVWzG4OrgNEz/pLIknhy3utrwvGVurrS+JWkFh1p7Nc3lW9ucayzGp
	vlAyeKEmjmBaSjH9vEjlQzyVFV/joiumNIwc1+wlIx3fgkP31DI61TG1B57IQc+r1gaD
	p8Idubpen9ZeOF1VHmNv4O0DiFHaE45hDFrWqLwDayK66eVJB3TGCvfhmIFJgCnIg6bD
	GpICyDXpdU99x6iynF2gFovh4X3ebyFPHCpmV00hY1nLgQtroKhS0jOQtewedtjqqUyq
	pXq4FMswlDZfMGrZOCoqja91BXDZMLEypKYCRAirX079JxiBeK9j0BtAxmYNcKNqc2sr
	PRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=mHMKH+l8h7UC9sH+pDq7xzORsIyrWVJOV3tDp2nPwpg=;
	b=cWDPUY7uSYyEt2llwT62dyXm4Go60kbo0LwgCNmD5T2Jm1Yju0RDbtbG0Wa4V+oze/
	F7BFzWLEftTfNVYcdLdtxiZVB+bBp3GLnHLQm1zGGDK+Wv3nt6MZyJwOiYQKdtq1bBC9
	xLp+TpkPX9Ck9ps8cVkJI60DjYFx/J0M9D0EHSoHa3yO6Ffisg6wLFnvhmlWn5Vcf8yT
	TLwrFaWuCyb4ifAHLhpE2vq40Br1fl1jEaknTdlNLBjjs9UQ5dgz+RY+eXcVi7sRHcwt
	uB/JnsAMUkOdf1iUt8D5pkrLHnb11s9tgG++1HDoY5ChjPxhIEt95sYdv3NYnEpPNgTf
	lwIw==
X-Gm-Message-State: ALyK8tIDZwDxh/GpSfdpVB8N/6y7J6wFRxWeiBnkfNFpHhH+U+oml67cFvqajy8EzdsamA==
X-Received: by 10.66.13.200 with SMTP id j8mr22968053pac.150.1468506544910;
	Thu, 14 Jul 2016 07:29:04 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:ab:9240:fd9e:fe24?
	([2601:202:4001:9ea0:ab:9240:fd9e:fe24])
	by smtp.googlemail.com with ESMTPSA id
	p129sm3530324pfb.73.2016.07.14.07.29.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jul 2016 07:29:03 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1464681000-17571-1-git-send-email-catalin.enache@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5787A1A6.3090707@gmail.com>
Date: Thu, 14 Jul 2016 07:28:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1464681000-17571-1-git-send-email-catalin.enache@windriver.com>
Subject: Re: [PATCH] squid: CVE-2016-4555
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
X-List-Received-Date: Thu, 14 Jul 2016 14:29:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

ping

On 05/31/2016 12:50 AM, Catalin Enache wrote:
> client_side_request.cc in Squid 3.x before 3.5.18 and 4.x
> before 4.0.10 allows remote servers to cause a denial of
> service (crash) via crafted Edge Side Includes (ESI) responses.
> 
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4555
> 
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> ---
>  .../squid/files/CVE-2016-4555.patch                | 46 ++++++++++++++++++++++
>  .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-4555.patch
> 
> diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2016-4555.patch b/meta-networking/recipes-daemons/squid/files/CVE-2016-4555.patch
> new file mode 100644
> index 0000000..eeabbcd
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/squid/files/CVE-2016-4555.patch
> @@ -0,0 +1,46 @@
> +From f7aabf74e4f274b107d52cb62dfa2f9899f410ac Mon Sep 17 00:00:00 2001
> +From: Catalin Enache <catalin.enache@windriver.com>
> +Date: Tue, 31 May 2016 09:11:53 +0300
> +Subject: [PATCH] Bug 4455: SegFault from ESIInclude::Start
> +
> +Upstream-Status: Backport
> +CVE: CVE-2016-4555
> +
> +Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> +---
> + src/client_side_request.cc | 16 +++++++++-------
> + 1 file changed, 9 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/client_side_request.cc b/src/client_side_request.cc
> +index 6a8f921..8b1e147 100644
> +--- a/src/client_side_request.cc
> ++++ b/src/client_side_request.cc
> +@@ -141,16 +141,18 @@ ClientHttpRequest::ClientHttpRequest(ConnStateData * aConn) :
> +     setConn(aConn);
> +     al = new AccessLogEntry;
> +     al->cache.start_time = current_time;
> +-    al->tcpClient = clientConnection = aConn->clientConnection;
> +-    al->cache.port = aConn->port;
> +-    al->cache.caddr = aConn->log_addr;
> ++    if (aConn) {
> ++        al->tcpClient = clientConnection = aConn->clientConnection;
> ++        al->cache.port = aConn->port;
> ++        al->cache.caddr = aConn->log_addr;
> + 
> + #if USE_OPENSSL
> +-    if (aConn->clientConnection != NULL && aConn->clientConnection->isOpen()) {
> +-        if (SSL *ssl = fd_table[aConn->clientConnection->fd].ssl)
> +-            al->cache.sslClientCert.reset(SSL_get_peer_certificate(ssl));
> +-    }
> ++        if (aConn->clientConnection != NULL && aConn->clientConnection->isOpen()) {
> ++            if (SSL *ssl = fd_table[aConn->clientConnection->fd].ssl)
> ++                al->cache.sslClientCert.reset(SSL_get_peer_certificate(ssl));
> ++        }
> + #endif
> ++    }
> +     dlinkAdd(this, &active, &ClientActiveRequests);
> + #if USE_ADAPTATION
> +     request_satisfaction_mode = false;
> +-- 
> +2.7.4
> +
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> index 7fe41ee..7e1f62e 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> @@ -31,6 +31,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
>             file://volatiles.03_squid \
>             file://CVE-2016-3947.patch \
>             file://CVE-2016-4554.patch \
> +           file://CVE-2016-4555.patch \
>  "
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
> 


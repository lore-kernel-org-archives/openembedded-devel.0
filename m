Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE2260232
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2014 07:20:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9R7KNJq020672
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2014 00:20:23 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 27 Oct 2014 00:20:22 -0700
Message-ID: <544DF233.3000503@windriver.com>
Date: Mon, 27 Oct 2014 15:20:19 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1413972433-31546-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1413972433-31546-1-git-send-email-Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [meta-networking][PATCH] squid: Add a PACKAGECONFIG for libnetfilter-conntrack
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Oct 2014 07:20:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

-Chong

On 10/22/2014 06:07 PM, Chong Lu wrote:
> This solves the following warning:
>
> WARNING: QA Issue: squid rdepends on libnetfilter-conntrack, but it isn't a
> build dependency? [build-deps]
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   recipes-daemons/squid/squid_3.4.7.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> index 37e4bba..cd10bd0 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> @@ -35,6 +35,8 @@ inherit autotools useradd ptest
>   USERADD_PACKAGES = "${PN}"
>   USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --shell /bin/false --user-group squid"
>   
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
>   EXTRA_OECONF += "--with-default-user=squid"
>   
>   TESTDIR = "test-suite"



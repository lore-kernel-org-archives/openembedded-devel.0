Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5840C6B891
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2013 04:43:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB24hWfm013440
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 1 Dec 2013 20:43:32 -0800 (PST)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 1 Dec 2013 20:43:32 -0800
Message-ID: <529C0FF6.5060404@windriver.com>
Date: Mon, 2 Dec 2013 12:43:34 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1385951256-5645-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1385951256-5645-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] proftpd: use /bin/false as the login shell
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
X-List-Received-Date: Mon, 02 Dec 2013 04:43:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Drop it, I will fix the commit log

On 12/02/2013 10:27 AM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Use /bin/false as the login shell, just like what Ubuntu does,
> otherwise there might be secure issue.
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> index 6537b77..0006a2a 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> @@ -62,6 +62,7 @@ INITSCRIPT_PARAM = "defaults 85 15"
>
>   USERADD_PACKAGES = "${PN}"
>   GROUPADD_PARAM_${PN} = "--system ${FTPGROUP}"
> -USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} ${FTPUSER}"
> +USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} --home-dir /var/lib/ftp --no-create-home \
> +                       --shell /bin/false ${FTPUSER}"
>
>   FILES_${PN} += "/home/${FTPUSER}"
>

-- 
Best Reagrds,
Roy | RongQing Li


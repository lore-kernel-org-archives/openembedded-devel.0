Return-Path: <sledz@dresearch-fe.de>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 672777212A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 07:24:54 +0000 (UTC)
Received: by wesu56 with SMTP id u56so31420542wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2015 23:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=a54GsPf9kkPTqeKqnzgSo/tZiSSmtPz8eBEDD6NWiqI=;
	b=e9t67cLCTr33gTCkzuOvErTIgvg0SZBaGeqtDppu+ZLIp14zy0IM83FVPukK63Ft7+
	ZR49EFb8xFtT4U+xKqbHK+Rsw157eVNo6qDDcBsQbldbATRhc2JXebnUAR+0nVh3YiMZ
	RqQOgQ93gcQLziXg5bbiVOLh1XX5klvwrC07nSutjGBFudVZVTozBd5ESfLe19OeGvNX
	kY50rEYD8027jwhUdFiPJzWUt48f8oUAH5QTYtSGjyZ6BQbspjFlCWMUYHPxRExcqS2x
	da519+5vk7o37IGhrQnnZYJB8xsoDCgbJs2+gPDpLc9XICz/eGDFzZU7KqqG2l7iJSeu
	9gDQ==
X-Gm-Message-State: ALoCoQlI0duBucXzYe4wa4MTlveHeyReZyXYyayXOdlF7xdfSEkIVkfueFOwYKWl1smlDWBUzzaR
X-Received: by 10.180.83.69 with SMTP id o5mr32011219wiy.48.1425281095675;
	Sun, 01 Mar 2015 23:24:55 -0800 (PST)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id n6sm17963841wjy.8.2015.03.01.23.24.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Mar 2015 23:24:54 -0800 (PST)
Message-ID: <54F41044.4070206@dresearch-fe.de>
Date: Mon, 02 Mar 2015 08:24:52 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>,
	Armin Kuster <akuster808@gmail.com>
References: <1425041152-21513-1-git-send-email-sledz@dresearch-fe.de>
	<1425041152-21513-2-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1425041152-21513-2-git-send-email-sledz@dresearch-fe.de>
Subject: Re: [meta-oe][dizzy][PATCH] rsyslog: fix name of syslogd ua group
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
X-List-Received-Date: Mon, 02 Mar 2015 07:25:00 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 27.02.2015 13:45, Steffen Sledz wrote:
> (backport from master)
> 
> All the other syslogd implementations use 'syslogd' as update alternatives
> group name. So rsyslogd should use this too.
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> index aeca09a..7593dfb 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> @@ -125,10 +125,10 @@ INITSCRIPT_PARAMS = "defaults"
>  # higher than sysklogd's 100
>  ALTERNATIVE_PRIORITY = "110"
>  
> -ALTERNATIVE_${PN} = "rsyslogd syslog-conf syslog-logrotate"
> +ALTERNATIVE_${PN} = "syslogd syslog-conf syslog-logrotate"
>  
> -ALTERNATIVE_LINK_NAME[rsyslogd] = "${base_sbindir}/syslogd"
> -ALTERNATIVE_TARGET[rsyslogd] = "${sbindir}/rsyslogd"
> +ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
> +ALTERNATIVE_TARGET[syslogd] = "${sbindir}/rsyslogd"
>  ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
>  ALTERNATIVE_TARGET[syslog-conf] = "${sysconfdir}/rsyslog.conf"
>  ALTERNATIVE_LINK_NAME[syslog-logrotate] = "${sysconfdir}/logrotate.d/syslog"

Would be great if this patch could make it expeditiously to dizzy

Without this patch it is not possible to use rsyslog without problems because the wrong ua group name leads to running rsyslog and busybox-syslogd in parallel fighting on sockets and other ressources.

Thx,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


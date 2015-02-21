Return-Path: <sledz@dresearch-fe.de>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 90AD0606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 08:34:10 +0000 (UTC)
Received: by wesw55 with SMTP id w55so9484594wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 00:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=h4Rfe/BrOJm4kWFpgt9LBkLQb2xOXnRbfO0m/AdwVGY=;
	b=hhYQ5GnyfQSzewWExafrlSUKRfbnjk3phpBP6KylquLbc7sZs2Z5G8GY2uBxRO9og0
	+FzEyvetNy+ZMdPh2qNms3ejydRIT42wWAIKRXMZy+FgMJ3ii3vDA0q8JEB0TNEnrAH8
	9Ierwwh258DybswerR/4c5nzeqjbb0J1c5g6FuQkjPachyhAtBUMtBNiRroc05LD7HOR
	hHPY5U5g9+MADtEhtRP/A9VNvFaEoxynw6yA+VgNxYo0F3vNBL38GvRKyAt87mCygdM6
	1x0TI4Xmf0Ukj6/AculbOY927PlnNqRVebdlFMiMwTo2ZtLgRxN5JYDPoYhcE3VOyJYN
	3/Xw==
X-Gm-Message-State: ALoCoQm+wwCZcPuJDj8LNwJ4i/NjfkX+FmLn2szDGLHLONbk07WGh8Xa9M2628Nf+jJHJP6KmDYy
X-Received: by 10.194.240.164 with SMTP id wb4mr2903924wjc.66.1424507651663;
	Sat, 21 Feb 2015 00:34:11 -0800 (PST)
Received: from mobil-400-586.internal.dresearch-fe.de
	([2001:bf0:c080:403:1919:390:da5d:b887])
	by mx.google.com with ESMTPSA id v7sm45666897wju.22.2015.02.21.00.34.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Feb 2015 00:34:10 -0800 (PST)
Message-ID: <54E84300.8070808@dresearch-fe.de>
Date: Sat, 21 Feb 2015 09:34:08 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>, 
	Jackie Huang <jackie.huang@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
References: <1423846960-4749-1-git-send-email-sledz@dresearch-fe.de>
	<1424111855-22867-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1424111855-22867-1-git-send-email-sledz@dresearch-fe.de>
Subject: Re: [meta-oe][PATCH v2] rsyslog: fix name of syslogd ua group
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
X-List-Received-Date: Sat, 21 Feb 2015 08:34:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 16.02.2015 19:37, Steffen Sledz wrote:
> All the other syslogd implementations use 'syslogd' as update alternatives
> group name. So rsyslogd should use this too.
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> index 422def3..5ab6a30 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> @@ -127,10 +127,10 @@ INITSCRIPT_PARAMS = "defaults"
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

Ping!

Something wrong with this patch? I think it fixes an obvious bug.

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


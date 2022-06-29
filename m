Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8561AC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 17:09:05 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.14217.1656522539306421726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 10:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DiWLQBOD;
 spf=pass (domain: gmail.com, ip: 209.85.166.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id h20so10697435ilj.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 10:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=LTxN0ZKL7gHNMJeRQ1kiCzswlj0jivadLPEGjd3zDCw=;
        b=DiWLQBODLESaFnxIC0fWNeC1cj3V5XavtTKd8unH50uG0K0SVnAZ2CXO8uE/+REQC4
         mBrV0o6Vo9hDLUR30I1v256nUSlhls9Lvry6sAAY2Wv3/SHxmM56nYq3X/CryvKA+nQl
         s2FMyqXFT37a1MT/fF6WPSeH3iSlSWFxKoHos1mtvTL2pDnvqXc0bXpxPEx7eKMC6elU
         /uvrJJ4MBGNdz58e5oWbn8ZJe0wTaj6VRgeW+4lGmyQalxKqPlPIrF3b+rlrnN+GmT+l
         +miitbaO/oafJ26G2TZjGIk94L/Ok0tSLbR2j8EecJQ2puha0Xf6OLjQH4DfktNkD0TZ
         FWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LTxN0ZKL7gHNMJeRQ1kiCzswlj0jivadLPEGjd3zDCw=;
        b=j6HOsBmlOKpTcVv5bk2LyIMghKHJwUMXOlSYsfYic0RvnMtridlttZUwU6zcnNzSVt
         BrolD04dwbc+dQc9+X3qjckNoZQIG487rFdaylyD2bC6UPl5fHWMHLirNuD8yS7J92KJ
         9AKANr1jiTdx73kjPO+QgR3ug5pLEf0gFFGlrclOc/yu/QEQbkR2/31IwI4NzQuW4/TT
         sr92gCqHLcAi6D973pdG4t8FMQpVpr2aic0bVd6WjHhsPHCiTFTY+7KXaXRZ81Fl7UzY
         a6uB1p06KwMEEE2WIeBBrQWQOK8KV5czWIhbXW2LE4NcmvRytEkIzpvo7XAZ+9FzNb77
         ZkGA==
X-Gm-Message-State: AJIora+XPQ3wJNwadFYr0azh9v3gSa07WJpILu2kZysBP2Qomyu9FRcZ
	nD5YsP92GZDZYv8Jw2dnEq5gKAwHC1/5gA==
X-Google-Smtp-Source: 
 AGRyM1umev9QuTqLI8DDkRq+LtJua5/1UP+E1BvsodBPU/mlBOXf1B12aePzcceozMMh2HApXjIj3g==
X-Received: by 2002:a92:cdad:0:b0:2d9:1b4d:933 with SMTP id
 g13-20020a92cdad000000b002d91b4d0933mr2511044ild.162.1656522537702;
        Wed, 29 Jun 2022 10:08:57 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:6119:b422:792f:b68a?
 ([2607:fea8:95df:9730:6119:b422:792f:b68a])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a6b4910000000b00669384fcf88sm8166283iob.1.2022.06.29.10.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 10:08:57 -0700 (PDT)
Message-ID: <448db523-4a5c-cdb8-94f1-6edbb84e8b0c@gmail.com>
Date: Wed, 29 Jun 2022 13:08:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] cyrus-sasl:
 CVE-2022-24407 failure to properly escape SQL input allows an attacker to
 execute arbitrary SQL commands
Content-Language: en-US
To: Hitendra Prajapati <hprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20220628055554.10496-1-hprajapati@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220628055554.10496-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jun 2022 17:09:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97622

this patch is needed on master too, please send a version against master 
as well. We want to apply that before

backporting it to releases


On 6/28/22 1:55 AM, Hitendra Prajapati wrote:
> Source: https://github.com/cyrusimap/cyrus-sasl
> MR: 118497
> Type: Security Fix
> Disposition: Backport from https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc
> ChangeID: 4736aae2b7d8986787b1666cfd6eecd590915120
> Description:
>         CVE-2022-24407 cyrus-sasl: failure to properly escape SQL input allows an attacker to execute arbitrary SQL commands.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>   .../cyrus-sasl/CVE-2022-24407.patch           | 83 +++++++++++++++++++
>   .../cyrus-sasl/cyrus-sasl_2.1.28.bb           |  1 +
>   2 files changed, 84 insertions(+)
>   create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
>
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
> new file mode 100644
> index 000000000..0ddea03c6
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
> @@ -0,0 +1,83 @@
> +From 906b863c5308567086c6437ce17335b1922a78d1 Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Wed, 15 Jun 2022 10:44:50 +0530
> +Subject: [PATCH] CVE-2022-24407
> +
> +Upstream-Status: Backport [https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc]
> +CVE: CVE-2022-24407
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + plugins/sql.c | 26 +++++++++++++++++++++++---
> + 1 file changed, 23 insertions(+), 3 deletions(-)
> +
> +diff --git a/plugins/sql.c b/plugins/sql.c
> +index 95f5f707..5d20759b 100644
> +--- a/plugins/sql.c
> ++++ b/plugins/sql.c
> +@@ -1150,6 +1150,7 @@ static int sql_auxprop_store(void *glob_context,
> +     char *statement = NULL;
> +     char *escap_userid = NULL;
> +     char *escap_realm = NULL;
> ++    char *escap_passwd = NULL;
> +     const char *cmd;
> +
> +     sql_settings_t *settings;
> +@@ -1221,6 +1222,11 @@ static int sql_auxprop_store(void *glob_context,
> + 			    "Unable to begin transaction\n");
> +     }
> +     for (cur = to_store; ret == SASL_OK && cur->name; cur++) {
> ++	/* Free the buffer, current content is from previous loop. */
> ++	if (escap_passwd) {
> ++	    sparams->utils->free(escap_passwd);
> ++	    escap_passwd = NULL;
> ++	}
> +
> + 	if (cur->name[0] == '*') {
> + 	    continue;
> +@@ -1242,19 +1248,32 @@ static int sql_auxprop_store(void *glob_context,
> + 	}
> + 	sparams->utils->free(statement);
> +
> ++	if (cur->values[0]) {
> ++	    escap_passwd = (char *)sparams->utils->malloc(strlen(cur->values[0])*2+1);
> ++	    if (!escap_passwd) {
> ++		ret = SASL_NOMEM;
> ++		break;
> ++	    }
> ++	    settings->sql_engine->sql_escape_str(escap_passwd, cur->values[0]);
> ++	}
> ++
> + 	/* create a statement that we will use */
> + 	statement = sql_create_statement(cmd, cur->name, escap_userid,
> + 					 escap_realm,
> +-					 cur->values && cur->values[0] ?
> +-					 cur->values[0] : SQL_NULL_VALUE,
> ++					 escap_passwd ?
> ++					 escap_passwd : SQL_NULL_VALUE,
> + 					 sparams->utils);
> ++	if (!statement) {
> ++	    ret = SASL_NOMEM;
> ++	    break;
> ++	}
> + 	
> + 	{
> + 	    char *log_statement =
> + 		sql_create_statement(cmd, cur->name,
> + 				     escap_userid,
> + 				     escap_realm,
> +-				     cur->values && cur->values[0] ?
> ++				     escap_passwd ?
> + 				     "<omitted>" : SQL_NULL_VALUE,
> + 				     sparams->utils);
> + 	    sparams->utils->log(sparams->utils->conn, SASL_LOG_DEBUG,
> +@@ -1287,6 +1306,7 @@ static int sql_auxprop_store(void *glob_context,
> +   done:
> +     if (escap_userid) sparams->utils->free(escap_userid);
> +     if (escap_realm) sparams->utils->free(escap_realm);
> ++    if (escap_passwd) sparams->utils->free(escap_passwd);
> +     if (conn) settings->sql_engine->sql_close(conn);
> +     if (userid) sparams->utils->free(userid);
> +     if (realm) sparams->utils->free(realm);
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
> index 98899dfd5..e344733ef 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
> @@ -14,6 +14,7 @@ SRC_URI = "git://github.com/cyrusimap/cyrus-sasl;protocol=https;branch=cyrus-sas
>              file://saslauthd.service \
>              file://saslauthd.conf \
>              file://CVE-2019-19906.patch \
> +	   file://CVE-2022-24407.patch \
>              "
>   
>   UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97602): https://lists.openembedded.org/g/openembedded-devel/message/97602
> Mute This Topic: https://lists.openembedded.org/mt/92038717/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F410EC43334
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 13:01:26 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.49473.1656766883345749332
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jul 2022 06:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=msDzA0t8;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id r2so3406742qta.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jul 2022 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=T0Tflluh2k9rzNnNLUFPp92MlbAagHQkXiNUy94EpV0=;
        b=msDzA0t8KieM6fYGiBm3UWyxlIzx3/nHFoeRTwB9vtXEmnndKwLCw6clJCumMnkZnc
         ofXEb55uxIIgP10PZAyLyrZmWCQHhVRQZiVagtKuBZcDNZ+L+an40kNDgvcUGodQh4eh
         lxEJ4T4nxdDH854t7hCWOk99mjWDBpPyQSt15h4dEY+uzID7bSCi7oaYgrsmpmT9+cMH
         YzyeCO9gF/4fesH/mKW+maaMuDHW+pb2gGqZCw8yQU6scxZlRjrnLjpVBgR8agGXsj0m
         bTl4E3cYFehuds9MYWufcvtONLUPG8sNXbMir+LK7GrqATD4QXAbEv/d53rvGsrbEaWM
         HyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T0Tflluh2k9rzNnNLUFPp92MlbAagHQkXiNUy94EpV0=;
        b=SbMVPI/R57AF+tef9nRd9HWHomSmsMwmAYiNAptD1yiNSzEoeCyN4umwCgZtUH9tDZ
         OTpzpsYu8xiVl8bTZOsdC/d1BdnmlaPU7YvRjWPAc3/ofYE3k1k2g5Xu7aKefHXaVIoM
         4QC8map8OA6sxeYkD/L5ioAFdpd9c/n3tB5f8MvX16aCSFfGqFz99Hu93pz006A376sb
         yUWvsugZhgKHshT6Hojb5XnGg5lyxDUzsX4eTh3zuhHizHzi7s3S9KgMhWoFoIJrRPKE
         7stA6MmVwBO5Q2XgiLhpXfcu3ly+Hx7i3+AvWQGieHYnwJjJmP1fLvwZEK0bnpTQVQ50
         eS7w==
X-Gm-Message-State: AJIora+711Rrl+L78ggpg4FhOG788w0llYYYklQ9Ky2HXrISBA9oUIh8
	oiW1rAwxixVh4JUB+Vp+v94=
X-Google-Smtp-Source: 
 AGRyM1vpE0VTwp1sexLlglFuIJPRob3yheVDYQZTDZKbx38SjtOPZA+KA0k45HTEIEfSgFv1F3GSyQ==
X-Received: by 2002:a0c:d405:0:b0:443:8347:d7a5 with SMTP id
 t5-20020a0cd405000000b004438347d7a5mr1530847qvh.11.1656766882008;
        Sat, 02 Jul 2022 06:01:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:14b1:7390:cd97:e8bf:f94e:be78?
 ([2600:1700:14b1:7390:cd97:e8bf:f94e:be78])
        by smtp.gmail.com with ESMTPSA id
 y9-20020a05620a25c900b006a370031c3esm20725944qko.106.2022.07.02.06.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Jul 2022 06:01:21 -0700 (PDT)
Message-ID: <4eeeb395-0e95-e797-abaa-5e0e3a43c89b@gmail.com>
Date: Sat, 2 Jul 2022 09:01:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] cyrus-sasl:
 CVE-2022-24407 failure to properly escape SQL input allows an attacker to
 execute arbitrary SQL commands
Content-Language: en-US
To: Hitendra Prajapati <hprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20220628055554.10496-1-hprajapati@mvista.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220628055554.10496-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Jul 2022 13:01:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97677

I built this on kirkstone and one patch does not apply.

ERROR: cyrus-sasl-2.1.28-r0 do_patch: Applying patch 
'CVE-2022-24407.patch' on target directory 
'/builds/54vdLR_9/0/akuster/meta-branch-maint/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/cyrus-sasl/2.1.28-r0/git'
CmdError('quilt --quiltrc 
/builds/54vdLR_9/0/akuster/meta-branch-maint/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/cyrus-sasl/2.1.28-r0/recipe-sysroot-native/etc/quiltrc 
push', 0, 'stdout: Applying patch CVE-2022-24407.patch
patching file plugins/sql.c
Hunk #1 FAILED at 1150.
Hunk #2 FAILED at 1221.
Hunk #3 FAILED at 1242.
Hunk #4 succeeded at 1127 (offset -160 lines).
3 out of 4 hunks FAILED -- rejects in file plugins/sql.c
Patch CVE-2022-24407.patch can be reverse-applied



On 6/28/22 22:55, Hitendra Prajapati wrote:
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
> Mute This Topic: https://lists.openembedded.org/mt/92038717/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



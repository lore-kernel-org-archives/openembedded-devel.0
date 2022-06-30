Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BF5C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:49:12 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.28234.1656611346247698169
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 10:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AVs2X2Tt;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 59so296334qvb.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 10:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2/OEpbbIsnfXbHbCMU/2lRReuHxyKa+8EKeZGlcjOUk=;
        b=AVs2X2TtQdgN3DHibqBA2v8qGiDH/V+dBVE3PIh8pXw/3sylVCgobgy5GACxBld0XL
         sh0lS3mVFiI5kaFqWLtofj2rny/hw19+YLvCJNJWMthL8fR1HjixeHKLUGmEryDKJlmh
         sfO2DDa4lriUGgs0yfrEcthNONlQyHwMyohj8EASLFM9JAz8GssRszpELm8DO36F2Eqv
         efAxRehb7LQLzWxKDkayOmJBi5Hiz5hD52U7rc18hGobq38mGT5SMB87GcYG1HE+vu9f
         LRS3DI4QgalzWBl076Q23lQFv4zgVgPinfHCZjWdRneNj/1pPthMDV3i20UUjYCxj2EJ
         dQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2/OEpbbIsnfXbHbCMU/2lRReuHxyKa+8EKeZGlcjOUk=;
        b=JGkiXlCI4NgFQSC1A0WV79z979JyWDQxu2b0XvMcPdj7q5mRaFDUKZK9jUMhZhkij1
         sdcdjJmKeopRJ5035XMfM0W7lI+Vq3jVX4lxZmypDYHuasprFSO7K91jHzog3iReS4hT
         Xi+M3KMEuK912oAO2pQA5veORYdjc8RoEYYyVvQFG5Z3qFMwdoI7E4SlIpd/sKjF6fhv
         4A0AsRclsdLZvJroIbopyiW9Bl4SRfE4u7cAaxzlh/6StqpZvxOAW2SPsT0taP2S8h4v
         TARaHX1Wl9La+mLL7YEVKKSyt+PhoUthIbdBJk9GkBDvrDp1JrLI6u9h9WZsvorWN27s
         08cA==
X-Gm-Message-State: AJIora/nH/90Tvo6lc3PE8AQ3naJt0M6T+yan180NmqluZscY636Zq+f
	wwUxOsjvADUJT5iMrV8vUNfhBgTPAHvw9/buOis=
X-Google-Smtp-Source: 
 AGRyM1vYG42c9wEdSQRZ1hTqdkA3gIwA15AfsEN5HJFJU5P6tDvUWQi282/tPlVjFpevDTNF6k7WlkCjWu+AMNIJ2DM=
X-Received: by 2002:ad4:5c4d:0:b0:470:5450:1181 with SMTP id
 a13-20020ad45c4d000000b0047054501181mr13589005qva.110.1656611345076; Thu, 30
 Jun 2022 10:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220630040138.6776-1-hprajapati@mvista.com>
In-Reply-To: <20220630040138.6776-1-hprajapati@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Jun 2022 13:48:39 -0400
Message-ID: 
 <CAMKF1srRgwGtxEHXiLXabXzAg1gGDqck8R0tzS82_T=KuEVpfA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH] cyrus-sasl: CVE-2022-24407 failure
 to properly escape SQL input allows an attacker to execute arbitrary SQL
 commands
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 17:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97642

this fails to apply the patch during build.

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1809/steps/15/logs/stdio

Please test it before sending a v2.

On Thu, Jun 30, 2022 at 12:01 AM Hitendra Prajapati
<hprajapati@mvista.com> wrote:
>
> Backport from https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc
> CVE-2022-24407 cyrus-sasl: failure to properly escape SQL input allows an attacker to execute arbitrary SQL commands.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../cyrus-sasl/CVE-2022-24407.patch           | 83 +++++++++++++++++++
>  .../cyrus-sasl/cyrus-sasl_2.1.28.bb           |  1 +
>  2 files changed, 84 insertions(+)
>  create mode 100644 meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
>
> diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
> new file mode 100644
> index 000000000..0ddea03c6
> --- /dev/null
> +++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
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
> +                           "Unable to begin transaction\n");
> +     }
> +     for (cur = to_store; ret == SASL_OK && cur->name; cur++) {
> ++      /* Free the buffer, current content is from previous loop. */
> ++      if (escap_passwd) {
> ++          sparams->utils->free(escap_passwd);
> ++          escap_passwd = NULL;
> ++      }
> +
> +       if (cur->name[0] == '*') {
> +           continue;
> +@@ -1242,19 +1248,32 @@ static int sql_auxprop_store(void *glob_context,
> +       }
> +       sparams->utils->free(statement);
> +
> ++      if (cur->values[0]) {
> ++          escap_passwd = (char *)sparams->utils->malloc(strlen(cur->values[0])*2+1);
> ++          if (!escap_passwd) {
> ++              ret = SASL_NOMEM;
> ++              break;
> ++          }
> ++          settings->sql_engine->sql_escape_str(escap_passwd, cur->values[0]);
> ++      }
> ++
> +       /* create a statement that we will use */
> +       statement = sql_create_statement(cmd, cur->name, escap_userid,
> +                                        escap_realm,
> +-                                       cur->values && cur->values[0] ?
> +-                                       cur->values[0] : SQL_NULL_VALUE,
> ++                                       escap_passwd ?
> ++                                       escap_passwd : SQL_NULL_VALUE,
> +                                        sparams->utils);
> ++      if (!statement) {
> ++          ret = SASL_NOMEM;
> ++          break;
> ++      }
> +
> +       {
> +           char *log_statement =
> +               sql_create_statement(cmd, cur->name,
> +                                    escap_userid,
> +                                    escap_realm,
> +-                                   cur->values && cur->values[0] ?
> ++                                   escap_passwd ?
> +                                    "<omitted>" : SQL_NULL_VALUE,
> +                                    sparams->utils);
> +           sparams->utils->log(sparams->utils->conn, SASL_LOG_DEBUG,
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
> diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
> index 98899dfd5..0b2ce3639 100644
> --- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
> +++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
> @@ -14,6 +14,7 @@ SRC_URI = "git://github.com/cyrusimap/cyrus-sasl;protocol=https;branch=cyrus-sas
>             file://saslauthd.service \
>             file://saslauthd.conf \
>             file://CVE-2019-19906.patch \
> +           file://CVE-2022-24407.patch \
>             "
>
>  UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97633): https://lists.openembedded.org/g/openembedded-devel/message/97633
> Mute This Topic: https://lists.openembedded.org/mt/92080316/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


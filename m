Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15841C47089
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 18:31:03 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.23927.1670437855655514923
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 10:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZivcRFZg;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id k189so2610125oif.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 10:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RSgATDXXUAnCWuZ5ksFB+zKgNP7QGfxL4d1BwKbAVKM=;
        b=ZivcRFZgvVKFLEKpMgutY/tAlx9q2FiIRfHu+yhkg/UxMU+bEQZbofDeKqZkFMUdsG
         E53t/hXvqu5Tc/jRYj4yKNgPDTMt7QDTTBQV8U8jDvk23aR5wplRSPQn7jh0TIMAeC/f
         RNXPHNGyu/m0YrCbXYCOr3zvZ0lAH3UbWTUoYDT0KDe7lKn0JnICSB6LxRczmzmBf5IY
         cCM36jFYmD1hxUMHpFmQaYU3y3gi/WK3x/9/QfCSUUS3t2tKItIQTMJFoL2yMs/g3oBO
         D43A9RwqGz0hfKMQq0l85gZiVKewIHUuEvLQf/rQewVoO+O+qd6bo3vIQr9ZXp/QNxUu
         a/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSgATDXXUAnCWuZ5ksFB+zKgNP7QGfxL4d1BwKbAVKM=;
        b=aB88d3TeVHxdvKhW8gYlcf+nJ6Hu2cGjTMl4baMXFbK0EvKmHzB59HJcXpy9M9QB6w
         cWt0sNZyhqWAF0kJG3niV6Xhw6bwHJ+w+H+3ybOWx54z6jbXSKprMwOJMQM5UJg7846B
         DIV9ZcT42exbueUeob0nXdJyJPKyF/wAKHgUE/PlA1n9Eu6nCf/a2n4Xt3ULFlx6l/WL
         IHQXbJDKsHMnXQkO9JOETg0mgezO2Wwdl9t+WXWWkaNecxvxKLc/EDofelVqwFt26itO
         3RHfQJ/FEv7H89jmlWH9T+nkoJzx7vFNZNq6RTO2RXD6FH9nRnjsp4smWLYY7G9tt9zw
         RwYw==
X-Gm-Message-State: ANoB5pkcH1QNEaV2WKgOEWLw1RFZo8VfdrnPb8ST6R0LFeM8jmOishsY
	ZwZPMor84ME8QLEdPU7enYk=
X-Google-Smtp-Source: AA0mqf4uB8vZgNsm/VKZZxFopCgAacFjSVJQ0zn7PH8YWMTSzzJBzIaO4ziQyT4EZ1IawjuIuNem2Q==
X-Received: by 2002:a05:6808:1119:b0:35b:f934:2f8d with SMTP id e25-20020a056808111900b0035bf9342f8dmr253127oih.16.1670437854743;
        Wed, 07 Dec 2022 10:30:54 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:f05f:3481:d22e:56a2? ([2600:1700:9190:ba10:f05f:3481:d22e:56a2])
        by smtp.gmail.com with ESMTPSA id q204-20020acaf2d5000000b00354d8589a15sm9686616oih.45.2022.12.07.10.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 10:30:54 -0800 (PST)
Message-ID: <2dddf04b-dd33-5766-a098-0dca9a16c9f6@gmail.com>
Date: Wed, 7 Dec 2022 13:30:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: Fix
 CVE-2022-45062
Content-Language: en-US
To: "Polampalli, Archana" <archana.polampalli@windriver.com>,
 openembedded-devel@lists.openembedded.org
Cc: Hari.GPillai@windriver.com, narpat.mali@windriver.com
References: <20221206160016.4029521-1-archana.polampalli@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20221206160016.4029521-1-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 18:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99981



On 12/6/22 11:00 AM, Polampalli, Archana wrote:
> Escape characters which do not belong into an URI/URL
> In order to prevent argument injection in Xfce xfce4-settings
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-45062
>
> Upstream Status: Backport from
> https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/55e3c5fb667e96ad1412cf249879262b369d28d7
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>   .../xfce4-settings/files/CVE-2022-45062.patch | 83 +++++++++++++++++++
>   .../xfce4-settings/xfce4-settings_4.16.2.bb   |  3 +-
>   2 files changed, 85 insertions(+), 1 deletion(-)
>   create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
> new file mode 100644
> index 000000000..5384617d5
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch

This patch itself is missing the standard patch information like;

Upstream-Status:
CVE:
Signed-off-by:

For additional information: 
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

- armin
> @@ -0,0 +1,83 @@
> +commit 55e3c5fb667e96ad1412cf249879262b369d28d7
> +Author: Alexander Schwinn <alexxcons@xfce.org>
> +Date:   Mon Nov 7 09:56:31 2022 +0100
> +
> +    Escape characters which do not belong into an URI/URL (Issue #390)
> +
> +    In order to prevent argument injection
> +
> +diff --git a/dialogs/mime-settings/xfce-mime-helper.c b/dialogs/mime-settings/xfce-mime-helper.c
> +index 7149951f..b797e03b 100644
> +--- a/dialogs/mime-settings/xfce-mime-helper.c
> ++++ b/dialogs/mime-settings/xfce-mime-helper.c
> +@@ -415,7 +415,7 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
> +   gint          status;
> +   gint          result;
> +   gint          pid;
> +-  const gchar  *real_parameter = parameter;
> ++  gchar        *real_parameter = NULL;
> +
> +   // FIXME: startup-notification
> +
> +@@ -427,23 +427,43 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
> +   if (G_UNLIKELY (screen == NULL))
> +     screen = gdk_screen_get_default ();
> +
> +-  /* strip the mailto part if needed */
> +-  if (real_parameter != NULL && g_str_has_prefix (real_parameter, "mailto:"))
> +-    real_parameter = parameter + 7;
> ++  if (parameter != NULL)
> ++    {
> ++      if (helper->category == XFCE_MIME_HELPER_WEBBROWSER || helper->category == XFCE_MIME_HELPER_FILEMANAGER)
> ++        {
> ++          /* escape characters which do not belong into an URI/URL */
> ++          real_parameter = g_uri_escape_string (parameter, ":/?#[]@!$&'()*+,;=%", TRUE);
> ++        }
> ++      else if (g_str_has_prefix (real_parameter, "mailto:"))
> ++        {
> ++          /* strip the mailto part if needed */
> ++          real_parameter = g_strdup (parameter + 7);
> ++        }
> ++      else
> ++        {
> ++          real_parameter = g_strdup (parameter);
> ++        }
> ++    }
> +
> +   /* determine the command set to use */
> +-  if (exo_str_is_flag (real_parameter)) {
> +-    commands = helper->commands_with_flag;
> +-  } else if (exo_str_is_empty (real_parameter)) {
> +-    commands = helper->commands;
> +-  } else {
> +-    commands = helper->commands_with_parameter;
> +-  }
> ++  if (exo_str_is_flag (real_parameter))
> ++    {
> ++      commands = helper->commands_with_flag;
> ++    }
> ++  else if (exo_str_is_empty (real_parameter))
> ++    {
> ++      commands = helper->commands;
> ++    }
> ++  else
> ++    {
> ++      commands = helper->commands_with_parameter;
> ++    }
> +
> +   /* verify that we have atleast one command */
> +   if (G_UNLIKELY (*commands == NULL))
> +     {
> +       g_set_error (error, G_SPAWN_ERROR, G_SPAWN_ERROR_INVAL, _("No command specified"));
> ++      g_free (real_parameter);
> +       return FALSE;
> +     }
> +
> +@@ -533,6 +553,7 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
> +   if (G_UNLIKELY (!succeed))
> +     g_propagate_error (error, err);
> +
> ++  g_free (real_parameter);
> +   return succeed;
> + }
> +
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
> index aa4265f7b..6757c48f4 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
> @@ -8,7 +8,8 @@ inherit xfce features_check mime-xdg
>   
>   REQUIRED_DISTRO_FEATURES = "x11"
>   
> -SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
> +SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch \
> +            file://CVE-2022-45062.patch"
>   SRC_URI[sha256sum] = "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4b85be9197da03d7e"
>   
>   EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99959): https://lists.openembedded.org/g/openembedded-devel/message/99959
> Mute This Topic: https://lists.openembedded.org/mt/95495939/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



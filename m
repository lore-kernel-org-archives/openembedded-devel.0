Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C45C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 13:09:11 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.19885.1707311350011013579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Feb 2024 05:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WrEnKNfP;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6d5206e96so590521276.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 05:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707311349; x=1707916149; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFuJWb+1+IgrCenX07cbVBEtchPiP6YLQUBhqPXiTXE=;
        b=WrEnKNfPRJwTg/r6Lfev4/7l/NQ/gFTWypUAw1zwxMTthWfOmgn6S3D2Zn9IyFFW53
         7el2fwajDFj7AvN/Na3rWkXQBi+yp5AkPLZt+qXDyLR422W/xD2QHwELkRZNKrg+BltM
         QkZqHLWzKlcJq/gzIlqLnPXdm++61bene2A3WEPLImQwHJvF0e9VFrTo5MM3sCJvDqny
         qlQVTv8HZBaG+BWE0NBS9kCC4mPe8b/H6n5bVLuPnooz/do3VqscUXJti/qHeiptTvbR
         RLnnINcdWKFQ8+uc4Df1+aoR5bYDOzUGPLWdu0YHgXj40MrMieFHqJHRKEUPey/dBOxD
         1RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311349; x=1707916149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFuJWb+1+IgrCenX07cbVBEtchPiP6YLQUBhqPXiTXE=;
        b=Xbgk5r/v9RpaVBlbf3QY0yK7Y6wm2OkvG9hz75LXSJRLKf8XO2GTatV9gcXV7+m783
         Rn8k2v3L88vLjCv2yR9f9CzomYk8tVEVI4Nbb8vEsv4EHArQFaJCUHcHYapAIHW4DeXk
         NGB6vPOUJ3jB0b6iB+HtCk7ZfEaoFR0gvTmpdWdfIkFO9OCfrIKoavvPkMNAyuU962ZU
         Z8Bn1Ggbuj+sD6dlmKG6vfBi1INvf/06ycwMOnAQRCIO71M4Qeo55duFMgem8NOvKNZn
         uM3XB3a6b40JImLq0hCVJuYPe5Uhcp7xyxTK9Sx61OyxoWfxyXanMDRScH+a10eFmDgw
         4nzQ==
X-Gm-Message-State: AOJu0Yw6MMK9ZLaSjKp0wLE3HvTmL/3syNkUF5wtp+s3QZDyWSj/H0Ta
	vD28gla5Hj6fE8yIdBAlwUJ9kP6+1gMTZmuzNlm8J4y/bSaksB/h
X-Google-Smtp-Source: AGHT+IHXi0GbPrhh/jEUWwv7T16aK4QnwdA39QcBnfMmTcKF33lTN5FCoAdCh2UUgj0mrSb2wgoeTQ==
X-Received: by 2002:a25:b190:0:b0:dc6:d6f6:cc13 with SMTP id h16-20020a25b190000000b00dc6d6f6cc13mr4972283ybj.20.1707311349034;
        Wed, 07 Feb 2024 05:09:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiayhTT8CKcFmTuU2lS9U96L/rp1UryyteAulqvkU3jVfYtLMz+SHEsfdiF3epsmKf1+zzKfBsNA2VwLhzP64uK4sZsLu87jEpiGjHlDZtptahF0kS71180A==
Received: from [192.168.18.244] (108-243-27-252.lightspeed.tukrga.sbcglobal.net. [108.243.27.252])
        by smtp.gmail.com with ESMTPSA id x206-20020a25e0d7000000b00dc644e73909sm206241ybg.36.2024.02.07.05.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 05:09:08 -0800 (PST)
Message-ID: <e22e85bd-7904-40a4-a318-61126dc522fb@gmail.com>
Date: Wed, 7 Feb 2024 08:09:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] libssh: upgrade 0.8.9 -> 0.10.4
Content-Language: en-US
To: hprajapati@mvista.com, openembedded-devel@lists.openembedded.org
References: <20240131115809.355760-1-hprajapati@mvista.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20240131115809.355760-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 13:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108652



On 1/31/24 6:58 AM, Hitendra Prajapati via lists.openembedded.org wrote:
> ChangeLog:
> https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=libssh-0.10.4

This is a major version jump and include new APIS.  This update is 
inappropriate for a stable branch.

- Armin
>
> The "CVE-2020-16135.patch" is no longer needed as it's included in this upgrade.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>   .../libssh/libssh/CVE-2020-16135.patch        | 44 -------------------
>   .../{libssh_0.8.9.bb => libssh_0.10.4.bb}     | 16 ++-----
>   2 files changed, 3 insertions(+), 57 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
>   rename meta-oe/recipes-support/libssh/{libssh_0.8.9.bb => libssh_0.10.4.bb} (62%)
>
> diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
> deleted file mode 100644
> index 63b78688dd..0000000000
> --- a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 0a9268a60f2d3748ca69bde5651f20e72761058c Mon Sep 17 00:00:00 2001
> -From: Andreas Schneider <asn@cryptomilk.org>
> -Date: Wed, 3 Jun 2020 10:04:09 +0200
> -Subject: CVE-2020-16135: Add missing NULL check for ssh_buffer_new()
> -
> -Add a missing NULL check for the pointer returned by ssh_buffer_new() in
> -sftpserver.c.
> -
> -Thanks to Ramin Farajpour Cami for spotting this.
> -
> -Fixes T232
> -
> -Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
> -Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
> -Reviewed-by: Jakub Jelen <jjelen@redhat.com>
> -(cherry picked from commit 533d881b0f4b24c72b35ecc97fa35d295d063e53)
> -
> -Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/patch/?id=0a9268a60f2d3748ca69bde5651f20e72761058c]
> -CVE: CVE-2020-16135
> -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ----
> - src/sftpserver.c | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/src/sftpserver.c b/src/sftpserver.c
> -index 1717aa417..1af8a0e76 100644
> ---- a/src/sftpserver.c
> -+++ b/src/sftpserver.c
> -@@ -64,6 +64,12 @@ sftp_client_message sftp_get_client_message(sftp_session sftp) {
> -
> -   /* take a copy of the whole packet */
> -   msg->complete_message = ssh_buffer_new();
> -+  if (msg->complete_message == NULL) {
> -+      ssh_set_error_oom(session);
> -+      sftp_client_message_free(msg);
> -+      return NULL;
> -+  }
> -+
> -   ssh_buffer_add_data(msg->complete_message,
> -                       ssh_buffer_get(payload),
> -                       ssh_buffer_get_len(payload));
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> similarity index 62%
> rename from meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> rename to meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> index 061f13912f..3a57a728a1 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> @@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
>   
>   DEPENDS = "zlib openssl"
>   
> -SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8 \
> -           file://CVE-2020-16135.patch \
> -          "
> -SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
> +SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.10"
> +SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
>   
>   S = "${WORKDIR}/git"
>   
> @@ -25,15 +23,7 @@ EXTRA_OECMAKE = " \
>       -DWITH_PCAP=1 \
>       -DWITH_SFTP=1 \
>       -DWITH_ZLIB=1 \
> -    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
> +    -DWITH_EXAMPLES=0 \
>       "
>   
> -do_configure:prepend () {
> -    # Disable building of examples
> -    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
> -        || bbfatal "Failed to disable examples"
> -}
> -
> -TOOLCHAIN = "gcc"
> -
>   BBCLASSEXTEND = "native nativesdk"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108506): https://lists.openembedded.org/g/openembedded-devel/message/108506
> Mute This Topic: https://lists.openembedded.org/mt/104073273/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



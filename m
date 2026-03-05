Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A725CF30946
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:15:12 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41853.1772709308759923499
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+FzMSuy;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso694768f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 03:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772709307; x=1773314107; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yE683e4FLcTp8fPuZnQOqa6hVjLNLXTP75shaWjcjhI=;
        b=H+FzMSuyYErnUMSN8v6PGIP33ZpGDgXXJL3+vHfORajZ6MoQneYkGVV2QR5Deb7Z90
         6CgPVXObF5WhlUdCFkn9Ac+HVj+f2ofQ/mUAK888FlKuaHfhFsso8pqs0E64zo4hp88s
         BJmKONLdhjdLPOkHoocezYsetD0J3mdMPYMKGcMK/iiZQdS6KsaSpVWiHzsBJjVtdzcy
         lQ7pKP6MjI1n8UuF+dHcPT11Gwr5pJftR3fFySqWkzM2U9+fAWX2lI8pE+RxZi7Rth34
         /hIuItOPDoer/skOKoGwvdIdkim0eXHtnge5yhZg1mf+IHTwWsge8NOQJVDTUNKvxOgG
         /Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772709307; x=1773314107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE683e4FLcTp8fPuZnQOqa6hVjLNLXTP75shaWjcjhI=;
        b=O2ET3He7CVlXfcjIkOIWgTznZRt8V/yqc+RC7Kq+pGv/1+StztuoNiv6QQvvk7GcFe
         FLMYcGSFfI5+oJgdTeJU5mIwoOIDj0m8uxZ16wb8M5VvarKAnPbH06z/zyCcB1omeaIP
         HVCGCsVqW2ENRf7+COrAx4HZOXOVpnVTlqqVM0XcUOObhtjLSHtKiTtCK0Pv0htvMZ6K
         JntMsKlxRYiUeBcZCASvXu20LHAZgjN14jIfHY/0aGJNPcuhHF8diM0eS7dnCTXmlgbd
         Kd31/TJldfnESmDJW5BLa6Ay0TSnjQNN/GcBSUrdjRozUI6eyKz8fgWsOXcR2CwVQ23T
         6Alg==
X-Forwarded-Encrypted: i=1; AJvYcCXymNDh5qA4cnNEWmSlWEweKxUpM7LE1faa4ABIPwKNSVj8Dmk/+wtbA7ExAKbyHjKT5RWvpSmg4yLwQQ6FetQg9Pg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcwGTHbp8AkLfqUW+Q8AsuVTDQ69UyKPqPLaPn2M37y7mMip4b
	I/rWMv9dtzjTlxAPNqOLw0+p56wkan6Nft6cCeLeMxTg+hk5/nVk39rT
X-Gm-Gg: ATEYQzw6ornlaSh4jsX/E+EUyMUN32+5FES5aQ67/o1rUzd3pAw6XJnEuYpFHg+pKjF
	VT56EpqEhAkdlLckDzm6tlXzMzIRokMOphkvA4+Am8xhOF8vEnXbVpfcCkpP+FIOQraTE9u8yki
	qBPxTgslhWMJ7TyZauDU2vf4K9b01AYJO8hSArlqobgqbFD7cJhMdGmCVGGJXKmJPB55HhS0OIo
	zbr8H31pbWBKLE+XIfkt9mv2AsOMcygQPSNnMtKiUIu71THL1n3iK88hHKvQKVxZ+eiF54wxAOS
	Md/JId5zlEvUuzV4W6m70aUXUhBpaYi8RkV2bjlwpD+ROMo5xMCexvdR+vdEKcQ4hUNv8esvWDc
	fKtDk/TcHHax/2g3kYdGRB18ZT5b4WoVlUodWP6zc8rkywM2qGkqzL/w0FbKmHNgn7/rCs8/wxD
	WH/Rp2L407yUN8Yy1W7lSYDs12RKaVh5KMNdRnI2XBiw==
X-Received: by 2002:a5d:5d0a:0:b0:439:c6d0:b0e1 with SMTP id ffacd0b85a97d-439c7f8e135mr10276142f8f.26.1772709306859;
        Thu, 05 Mar 2026 03:15:06 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b34b6252sm33319273f8f.10.2026.03.05.03.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 03:15:06 -0800 (PST)
Message-ID: <d7ee961b-61c5-49a7-b474-bfa79e482c1a@gmail.com>
Date: Thu, 5 Mar 2026 12:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-java][PATCH] java-library.bbclass: resolve
 do_deletebinaries race condition
To: douglas.royds@taitcommunications.com,
 openembedded-devel@lists.openembedded.org
Cc: Stanley Stanton <stanley.stanton@taitcommunications.com>,
 tim.orling@konsulko.com
References: <20260305035459.3561243-1-douglas.royds@taitcommunications.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260305035459.3561243-1-douglas.royds@taitcommunications.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 11:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124873

- patches for meta-java should go to yocto-patches ML
(yocto-patches@lists.yoctoproject.org), though now I see that this info
isn't updated in all places
- AFAIK meta-java is still in deep sleep due to bitrot, and accepts no
patches due to this, until someone makes the layer build at least

in any case, cc'd Tim, the last maintainer that I know of.

On 3/5/26 04:54, Douglas Royds via lists.openembedded.org wrote:
> From: Stanley Stanton <stanley.stanton@taitcommunications.com>
>
> The do_deletebinaries task is attempting to delete directories created
> and destroyed by other bitbake classes such as sstate.bbclass and
> create-spdx-2.2.bbclass. If these classes remove their directories
> before do_deletebinaries has a chance to delete them, but after they are
> found, the following types of errors occur:
>
> Log data follows:
> | DEBUG: Executing shell function do_deletebinaries
> | find: ‘/build/tmp/work/x86_64-linux/junit-native/3.8.2/sstate-build-create_spdx’: No such file or directory
> | WARNING: exit code 1 from a shell command.
>
> Rewrite do_deletebinaries such that it is explicitly not looking through
> directories that are managed by other bitbake classes, to avoid this
> race condition.
>
> Suggested-by:  Douglas Royds <douglas.royds@taitcommunications.com>
> Signed-off-by: Stanley Stanton <stanley.stanton@taitcommunications.com>
> ---
>  classes/java-library.bbclass | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
> index 67541d2..033d6d4 100644
> --- a/classes/java-library.bbclass
> +++ b/classes/java-library.bbclass
> @@ -55,10 +55,9 @@ ALTJARFILENAMES = "${BPN}.jar"
>  # Java "source" distributions often contain precompiled things
>  # we want to delete first.
>  do_deletebinaries() {
> -  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_NATIVE}/*" \
> -                  -name "*.jar" -exec rm {} \;
> -  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_NATIVE}/*" \
> -                  -name "*.class" -exec rm {} \;
> +  dirs_to_search="$(find ${WORKDIR}/* -maxdepth 0 -type d | grep -Ev "recipe-sysroot|sstate|spdx")"
> +  find $dirs_to_search -name "*.jar" -exec rm {} \;
> +  find $dirs_to_search -name "*.class" -exec rm {} \;
>  }
>  
>  addtask deletebinaries after do_unpack before do_patch
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124864): https://lists.openembedded.org/g/openembedded-devel/message/124864
> Mute This Topic: https://lists.openembedded.org/mt/118149274/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



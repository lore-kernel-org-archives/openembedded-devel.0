Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4A72F7DEA3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 20:23:49 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id b3so12482873iob.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 May 2019 13:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MTCfFzGk91/Y0yr3Pg2b/Dw9DG1IaK67Evxbexzx8SY=;
	b=hPuHSuRM7XlmCPcdzSygtIVjwreOsckufcm6aGVOeazUhbq3eg6qemBRhm5kzePSDJ
	3MzpI8uAhkiLjce3hwxa6OitIRWq0UDVuy1POiA8Ugwjgzol4L3YfQo30AeTfNGTDzY4
	iVdv2iH7V2aU7+k/F9qroQQ03Z+AtFZjjloWw8tm+q/sgK/MJvaOF1B3sWaPtg+kNIQk
	MX4ZSw2pMYj81yEgl7U6P/atWn6BCuZMBbnIMimiMCzpA04pPcTwUncujltCwNR/zxwV
	aISuB57k/4yhzL3axdjrT7i8LUf4WUGBqVrHVQIKWpllrEdFn8VMYTJKIu0iQ6KB4yVW
	kHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MTCfFzGk91/Y0yr3Pg2b/Dw9DG1IaK67Evxbexzx8SY=;
	b=uAUCWZ1KGjnnM0/4tvMNZcvcOF5Cv/CWzbob5BraWbMD774pmQK3rtCXpLYvW/H85i
	/un2Q5KyPNyr6gf5+sFR2an6WTytb+SCYH4+fSNQoBMsfW69XSR1atHNIPCPOelaJzO6
	FKUSCjle2XvTCh4xRxm9llC4Mka/+7Xqfvlk5W40okg3WlAyqdBZj/ifRI9KxaPKHzwt
	jmPuN5LJnedccj6D1LnMip/7qAToHEL8uu3PB14tYkbQtKCKKb5oCnfQG9roggUQsjx5
	aTL6yjXh3cC/vL5msIY5SUDPJyGyQxh3U80iILDrh0R3TQ4eNLgZ2BOVbq/aKLlfjpIK
	N32A==
X-Gm-Message-State: APjAAAVHUlmtE8dnI/HaYoqoFq5n+e0KiPwi7cTkCLZwlVr9ipwBtofm
	E3hAF8tlG0uFe/zg2uqSJY7zlAj7Rmd5BDMUL/M=
X-Google-Smtp-Source: APXvYqzN4/mlK/AEvmRju84VInvPP5knw+2MEVHIMkSKlzn5G7qdH2+41yNPePCz/UbGU9V+LcyB91lFITL6iavdosQ=
X-Received: by 2002:a6b:c38d:: with SMTP id t135mr174242iof.284.1557347030349; 
	Wed, 08 May 2019 13:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190508195852.28803-6-bunk@stusta.de>
In-Reply-To: <20190508195852.28803-6-bunk@stusta.de>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 8 May 2019 22:23:38 +0200
Message-ID: <CALbNGRQ5bNvdzMcTw6Dr-xxQcXu1W3-WOjTu4XKJGJ5bN8go7g@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] fluidsynth: Explicitly disable readline support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2019 20:23:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 8, 2019 at 10:00 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> readline is GPL, so make it explicit that it shouldn't
> be enabled accidentally.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
> index 4f600a218..9a8cb87ba 100644
> --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
> +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
> @@ -8,7 +8,7 @@ SRC_URI += " \
>      file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
>  "
>
> -EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
> +EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} -Denable-readline=OFF"
>
If yo don't like it make a packageconfig out of it but keep it enabled
because I am not willing to test this change for you.

Andreas


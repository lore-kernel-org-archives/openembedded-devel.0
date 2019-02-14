Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id E75D86C45D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 23:42:13 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id y140so4695537qkb.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 15:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GxWzhT/dMiXtO1VQaVVyJ46X0uaRQvSx6z4r3yEvy88=;
	b=WpJVzPkbTPvQG1WBnm8kIZdK+DJ62nkSxloYpcGC388qyBF5hm+/Jh6GYiFNOJ6p+K
	dZCKLvLWFk218lWAV/u+PPamLmRaA9qtjoF+KftMIj9Mz3lF683V3AU9FEeIYqEQrb6O
	8t6lMEyTtykWp1qgtZcJXakBI8ysMu9GYzWAxarly5tDhdxbhqckAoqHhYMJBG/Nom2V
	xnRDEYCLX8OsU9rvKytSRCZ0dPhvgAuwaO5vJZapQ42ICHZt+0HvjgKnaq/+Su1Jz13r
	9Bd/O2VYJnPPsCCfcJMtAC6AlasXQ50YVm4XVzWRuQPKg2Stzcm+TOPb3klVaUgrNPoG
	4ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GxWzhT/dMiXtO1VQaVVyJ46X0uaRQvSx6z4r3yEvy88=;
	b=dImYQJ+r/mDzivgyU6FE0yO4+K+Kzs1Qj22UtlsoZEkY3W77PCI+qIuRXoE2layI20
	/44g0Wg5Gfz+FT+i0knklxKfIVezDATNIjuzTI61qohDRWrHJTnfodrbvnFHa4xwzpmF
	ruF6wfI/EblH1awi0z4Ejx0GBfJ1XhRXV7IqRELS6XaMsgdHUXW0qmCtgdZ/6xC9M7oF
	SbZuWp0yrd63YTKmKbLJsx3acBfZfdic/cIkgdWTx7kDlnOqerXes0UoZkFjT1GEMTsi
	LBT/1p8+HIH/WqPn45uHjmDTWfya1KJbvqI0z6+R1ANG8h+Dg4EnEaeinq/puI1pPMxi
	X0+Q==
X-Gm-Message-State: AHQUAubwB21oOnetjGdRPmrmKKvGeJ/mEAdkaS4IhFfmb+2bAZq6iwgI
	Oo0+0xE7ABhg7JSLN7jlXQFTvwJGobYAGrdqUNE=
X-Google-Smtp-Source: AHgI3IYMnozuU6H8/6tZaP3qC8BrgWcOqZSzw1reVCfpUKTY6X/OZAYb4e9NrBUzyIv+6fta2cIi8+CbRMv15Ps6heQ=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr4889620qka.206.1550187734473; 
	Thu, 14 Feb 2019 15:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20190214015858.30115-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190214015858.30115-1-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Feb 2019 15:41:48 -0800
Message-ID: <CAMKF1soP_s+hup0CC1UUhdZ+8aEokrCdZgTARiD3C7B9T=Wubw@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-python][PATCH] python-pycparser: upgrade to 2.19
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
X-List-Received-Date: Thu, 14 Feb 2019 23:42:14 -0000
Content-Type: text/plain; charset="UTF-8"

there is py3 version as well, so when such recipe is upgraded then
both should be done together. This time I have done it on top of this.
But please keep that in mind next time.

On Wed, Feb 13, 2019 at 5:58 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade python-pycparser from 2.18 to 2.19
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-pycparser_2.18.bb => python-pycparser_2.19.bb} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pycparser_2.18.bb => python-pycparser_2.19.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.18.bb b/meta-python/recipes-devtools/python/python-pycparser_2.19.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pycparser_2.18.bb
> rename to meta-python/recipes-devtools/python/python-pycparser_2.19.bb
> --
> 2.17.2
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


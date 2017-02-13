Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3D171D9A;
	Mon, 13 Feb 2017 14:02:47 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 89so24290851wrr.1;
	Mon, 13 Feb 2017 06:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VQwajpTtU9jZ77pyHrn62wkpHtxHw6uK67C0vDKtAgc=;
	b=F0Q/QDFVGPNiU99I5WYCL6Wxc/gNcSxU6XmKJOIGFXWoN7zoTX0xmcKWiFuPZLTTGo
	TWEvhjMUKVn0nKvp4mGhlk0JHszr05JQXY+yYP2T5LcItTCEBAdKZZDKpS4qsh2ZveTM
	XwJdgwZo2b9ZlOvw65lEwFgCac2E2naXPkvhzS7VUyRyBSpKqmoe+iToAIgQ0/z9OfLX
	xtYgwqWnW+gTX2WvT+1KlL84rIAfTU0nPEkn54ZAmO02elZapCi4aPJcTmcyZXpHqDpW
	z20wkYm6LCbnac2wDGMf/QMwJ8UlKU71jrGosXBrc3m5XegTel0QRccGAtgY62VZWFdJ
	TnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VQwajpTtU9jZ77pyHrn62wkpHtxHw6uK67C0vDKtAgc=;
	b=MUriawkFery4jmRw4Xmr0f0I8oPltItJaI2harz1HCD3SRitGJ89DvkZNt71xaKR/l
	wos0QsPBYlKBpowGm8NLvfb1zwyXVS7QUvsYvcNnnLNUFqq5ZS0R1cYzlKqGsB7U3Ij5
	p1CYkzk07uTGaQ6hWPNqwlW8wvH5Kjeo7/qKjr88+ppP+YPakiNAQmVZYZ5a5xJpDUIz
	pXaMWAyfSHtkQUG6LWwGj+zfAk37k+kv5XV2sKd2tI0fXB8TDireZReVheJpq87DUKiK
	n35TDyF67Gz9xlTh12aIBc2tqvixLpcdiZ1wAbv3HGh3UV8cnvwEJa8xoSmi+yNLS21M
	K/3g==
X-Gm-Message-State: AMke39nl20Q3YlSE4lZXp+HjoJpBrMPArOiK9Kj5TR2t/skcVc9sEVkThIx8XU9vSXRHzaoxc3Uaf2HdckYnuw==
X-Received: by 10.223.154.109 with SMTP id z100mr19418069wrb.145.1486994567513;
	Mon, 13 Feb 2017 06:02:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 13 Feb 2017 06:02:46 -0800 (PST)
In-Reply-To: <CAJTo0LYpGLN9M3CkUKcaySEkinDSqw2=aCuJcA5+-gonqgTNHA@mail.gmail.com>
References: <20170210082811.GA3021@jama>
	<CAJTo0LYpGLN9M3CkUKcaySEkinDSqw2=aCuJcA5+-gonqgTNHA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 15:02:46 +0100
Message-ID: <CA+chaQedGEN4Mrd-Uv=jnNJJ3Six1ae8gwm_guAJawEWN=kGMw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2017-02-08
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
X-List-Received-Date: Mon, 13 Feb 2017 14:02:48 -0000
Content-Type: text/plain; charset=UTF-8

Yup, that patch was already in my oe-core fork for next run.

see
http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111173.html

On Mon, Feb 13, 2017 at 1:36 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 10 February 2017 at 08:28, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>>     * openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.29.bb:
>> do_compile
>>
>
> This is due to ld-is-gold, there's a patch from Jussi on the list (and in
> mut).
>
> Ross
>


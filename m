Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5365C7722F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 22:58:53 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id p9so51658115vkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 14:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=DTVh+ggNwd5A43ixbZOepIc0EqBWZuvM13DbLCQ7KoQ=;
	b=evknae/jya4wwJSjSIEPoCdtz94qr4T9U/fbMvgz/0IMR8zsj/5PNygO2YRRGu2lp/
	VaXmEpuZbLD2hPXa08EqZllUItRzOE2P1g2PBtZChotQnHPl6xS5wBe1I65JM3ULCCR5
	NIwcmqNm4I70rgDkCBj+9fqEsnrBrU8f8wg1+zCOsO4W8KLSACrRLSiKhkKQu1kC4n7w
	R0kdmPt63OBnWdcQAoMCCqoE3Lpfj/myCjBtgm5DW+VGJqTopLntzT05J7vQ40JmHEZT
	6hqBnMuPvN1BWXu9xqq+pybVvzl4fvMM8DCkTZXgHhS9u/APUOv7y5MDHTBgqx23V9jw
	qG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=DTVh+ggNwd5A43ixbZOepIc0EqBWZuvM13DbLCQ7KoQ=;
	b=TEGYOS3nzGhaCepJ1CctYrP6+DFsViAfYnYGt1pwqeG3qGf85+ao33PZoyCxtEroXn
	O41fCVUQVZY+4Wqzdzw/F3GvgIhSX2Yd6uMcBEvTwKMOA6vm/FhR6htBUe5RcHfWIUEG
	/MQaJeTM8SAl3os0xLs8Z9MVfRTHHDMQIE7zaaZFn6fS+q5IZMSAGCjsfMTuQdc4pqX+
	+5cjdQZmQQRoEBIxfTewQVcfDS7edd+gVy02WAL4eAc1ssXLOGhrfrP+rjB0qXiMbaxQ
	8jlQdYO0XEfDD8Is8I4MkN9yenhmAmuEAwcbm79Jb0tomiC+Ohplcy2MiUMtfS0JyqR1
	oG8Q==
X-Gm-Message-State: AKaTC02hE/1TycdqgewEHIsW0zQ6EVdEDFO+JJ0Plgl+o2pc07T6q4v1ogVk1qguXFc0ht5MD1cNh4FtBkpdCA==
X-Received: by 10.176.82.71 with SMTP id j7mr75115219uaa.77.1481756335029;
	Wed, 14 Dec 2016 14:58:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Wed, 14 Dec 2016 14:58:52 -0800 (PST)
In-Reply-To: <1481755778-16443-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481755778-16443-1-git-send-email-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 14 Dec 2016 23:58:52 +0100
Message-ID: <CALbNGRSX7gZwpAAKp0jiPp4CT+xUXHr6wU_Zs2n+ug7xwp2hHg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 0/2] firefox fix build on oe-core master
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
X-List-Received-Date: Wed, 14 Dec 2016 22:58:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 11:49 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> * recent 'use system's nss/nspr' broke firefox
> * to build properly patch just sent to oe-core is necessary [1]
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2016-Decemb=
er/130211.html
>
> Andreas M=C3=BCller (2):
>   firefox: fix configure with oe-core master - there is no nss-config
>   firefox: use pkg-config to find nspr
>
>  .../firefox/0001-use-pkg-config-to-find-nss.patch  | 47 ++++++++++++++++=
++++++
>  .../firefox/0002-use-pkg-config-to-find-nspr.patch | 37 ++++++++++++++++=
+
>  recipes-mozilla/firefox/firefox_45.5.1esr.bb       |  2 +
>  3 files changed, 86 insertions(+)
>  create mode 100644 recipes-mozilla/firefox/firefox/0001-use-pkg-config-t=
o-find-nss.patch
>  create mode 100644 recipes-mozilla/firefox/firefox/0002-use-pkg-config-t=
o-find-nspr.patch
>
> --
> 2.5.5
>
And again sent out too early firefox still fails - continue with V2 :/

Andreas


Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 484CE75678
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 16:51:01 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so63150604igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 09:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=BwduxOKoU1rOEA0OpuHOuZNrCyHTtwgLJr8NdhdI/x8=;
	b=z8Tcm044A3rBv9Cs3DYYGleO2Ng1dz198P6kcdbQ2/Px+zYi/eh3WPtGKq/hePIke9
	PAt51yM+bx6hG0lE8TBVQosOqWdF70q5VKlAl+InSZ92hDw247QqKOoi0MR/O6RytrWo
	ZLE3IPRgvuwz9Gf5/EcRoPtsaLEykVdAel//cOLFsiDRQpt0rx/N9qgbD0bnkhON2uSw
	HuJgv+62LjcexdWIfEv395kLRcSQJuMMeugPTmVt13hx6nawH1nIu2vj22zqzQmXaTYb
	LfI2FwK6+YxQEgFROMcOvBBw56r+XznjP+f+Bb7z9NLaZsJKVy2k6utQ6WmlJbB48bhW
	N/IQ==
X-Received: by 10.50.8.68 with SMTP id p4mr31518308iga.4.1432659063234; Tue,
	26 May 2015 09:51:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Tue, 26 May 2015 09:50:32 -0700 (PDT)
In-Reply-To: <1432609164-10740-1-git-send-email-li.zhou@windriver.com>
References: <1432609164-10740-1-git-send-email-li.zhou@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 May 2015 09:50:32 -0700
Message-ID: <CAMKF1spcywmcvcF3TZfNfM9HGRUcj2UK=ruhgAt9TJqfytvbBw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] lvm2: fix segfault for snapshot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 May 2015 16:51:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 25, 2015 at 7:59 PM, Li Zhou <li.zhou@windriver.com> wrote:
> -           file://lvm.conf"
> +           file://lvm.conf \
> +           file://0001-snapshot-check-snapshot-exists.patch"
>

a small nit. usually, you put all patches before config files.


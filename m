Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id BB9B3798CC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 15:34:11 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id d131-v6so8408999qke.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tyrKOQppBibsE5kEkgEpU3nTpRf+bBc/PezvajwAbV8=;
	b=JiSIPJlOSDByuf5rl8uFWXpwdMtNyaw2bSAMpZWe7TUzW6kmpRy9qfYDMHiorWgQFR
	bc6B0jrWA8ZpfgsmNU/qEkyAbFIDEHZsPb6ayTKeOmlkcBQ1opMCkHKBq5T+mPbv0jy8
	2Ks5KUpZar9bWMhirfEJDTcPykO0/icl15fsGHsV1MLa+XN7vxvChRxn/yt2Lpxhx7wc
	ilUqFK2ywRUuNzLXKM8aPZTtnCgxzrRmMyOROY9V9jP22N8PWmt2RXgECJAbBmmAtZ/Y
	YciGI1DB8smEFJT0R3wRDKNsulup6vZpN55NvXDhMYKiyWY2bYqW4umMJhoexmwMFqGR
	Unfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tyrKOQppBibsE5kEkgEpU3nTpRf+bBc/PezvajwAbV8=;
	b=kubIcD7AzhCMYphp/bJP2Vs5lf/dRmBTNSFfh7AB/TdbMu985RstxHq67nyIETtiCp
	SpwLPNu14ce3eJrQPo/lOqLAH4yr+HyziG57X55T26MSwqEMBTTqyXitzPFHfPrfkq2P
	nRsomgc6LEeAMdZ23X80nSLBUIKaEDmUcQiZ90Idfl0oQWoaaGkFPy4Bvp0vm27wWqCI
	q93tmouy0xZKsEGv/XJyNCpRJnVbBPhXJ8WjbhRAl9gEJhvXWG6nP0omMXPh2/iOVAO5
	D8qO3NvNxJFPEsD6XhsPAQ6rmRuYAAwvFFSWh7Qc7Xb/E0yO33594zaEicRqguSYEJNJ
	7h9w==
X-Gm-Message-State: APzg51BrQJxNh2SBQKam02LUpMKWuoSfCWTa4p+BqpVQxPvs2/DBCEZl
	7KF6xS+wB2aE55GBeeSFyHmMRMLcwWcJ3ctwcFNlku+ehuE=
X-Google-Smtp-Source: ANB0VdaaFgLWuuVuLfRfeSGrdTwU68mhsJoCnhh9K4QclOG7gjW+pFT74sWWZg1K3PMY2OYhYGFNNXcvV3b/Kdh02lY=
X-Received: by 2002:a37:c04f:: with SMTP id
	o76-v6mr31404691qki.315.1537544052065; 
	Fri, 21 Sep 2018 08:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spB414U2iQh0k9DYTK0WV2ay___ahp932cfCU8Stzc20Q@mail.gmail.com>
	<20180921092805.7pa2zotfukuahyh7@swift.blarg.de>
In-Reply-To: <20180921092805.7pa2zotfukuahyh7@swift.blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Sep 2018 08:33:45 -0700
Message-ID: <CAMKF1sqsm4xRckbhNLUDCU=1+Dih=0MguYHvZtiyRhmSbgmcqA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: Re: [PATCH v2] libmpdclient: new recipe
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
X-List-Received-Date: Fri, 21 Sep 2018 15:34:11 -0000
Content-Type: text/plain; charset="UTF-8"

There are packaging errors on aarch64 see
http://errors.yoctoproject.org/Errors/Details/193773/

On Fri, Sep 21, 2018 at 2:28 AM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> From: Max Kellermann <max.kellermann@gmail.com>
>
> Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
> ---
>  .../recipes-multimedia/musicpd/libmpdclient_2.15.bb  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
> new file mode 100644
> index 000000000..dbee66e8d
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "C client library for the Music Player Daemon"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=06b9dfd2f197dc514d8ef06549684b77"
> +HOMEPAGE = "https://www.musicpd.org/libs/libmpdclient/"
> +
> +inherit meson
> +
> +SRC_URI = " \
> +    git://github.com/MusicPlayerDaemon/libmpdclient \
> +"
> +SRCREV = "7754ffdfb9371cd398371cb2670a54e9e1e623e2"
> +S = "${WORKDIR}/git"
> --
> 2.18.0


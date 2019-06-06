Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6E46BCE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 14:29:00 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s11so1597493pfm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jun 2019 07:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=6bm5Q3j5bFcUhIUrUwFLfttyPbah6cQY5B24/jRcIiM=;
	b=hEJmYe947taGrx1x/vrjSMdUX9fWimEULUkfHhv4JGtu004B74ii0ERyE0WuqysJAw
	Q2JHJpUP5ZHDwuyeaPDu6QNoXasfWLA7EHsWn4F/hlfneGoUxjbBGeOtoBhnBKPKE+mE
	BAMDfettq8yL5fg54VIWWneP0a83cCfVG4gXoQpsl0G9uLN2fMWyOyLyKNiSOdy8oy0G
	QYuBICK6rsf7i+falkGta3hdU7lXCVitNx9OAlGpvjCk5kjVmfnr0qgbAOITeGLF5UeW
	3I2AYgdVD7xyMhYlX7tXeOCzIwqe6O2ah1Gvwbhj7fK/q6UHGzahUo0IdMknbhuR1dEC
	DmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=6bm5Q3j5bFcUhIUrUwFLfttyPbah6cQY5B24/jRcIiM=;
	b=rEHmDNGJ6X+YW8Xb6crE6tHxwO2eEqeN6z6fXU0FIAX3wRk1SmAP+LJqc6CDEeBLMJ
	ztQqhAi4kiwTWE2NoLrAym7rnyuzfAkE4lwgESfdgEC8GmbOHC+LFtgMUm41Wv5bMH3u
	W/UXTnCD/I2GjXk/x+onzP4LTUD/kQCF3byXf7hzBE3GmiaaDqgPBoL4lyxTbwOtu30A
	GO7/iDhx2p/pP8ow3Qqs6twYvp+bKRyO90hPkQMmTjNQDQQgQH4DE1APsvRlSujykulE
	C2rxamRnjAwGYrDtPpDN6UfTMhG0U26ILW/lxFMZgfnE7+xYBB//Dl5/1ViM+xuXsefp
	gJtw==
X-Gm-Message-State: APjAAAUqbVcdOeHshc51G/aPJj2P+M00qfdmSX/EDEK4HHtBodPuD3eg
	T+5Jux78qIbKBJsMoKrd3awtS6G+
X-Google-Smtp-Source: APXvYqyw3bv/ktDw3ZAKzhOHICq9cFCNBohaei/v9XFG8De6Ce9yfVzf2FJa9tciEtdXvgOrR6OipA==
X-Received: by 2002:a63:d949:: with SMTP id e9mr3585295pgj.437.1559831341035; 
	Thu, 06 Jun 2019 07:29:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:649f:275:809c:24d6?
	([2601:202:4180:c33:649f:275:809c:24d6])
	by smtp.gmail.com with ESMTPSA id f21sm2036795pjq.2.2019.06.06.07.29.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 07:29:00 -0700 (PDT)
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20190605044932.62524-1-hongzhi.song@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <95302c7f-f036-623b-603e-b3a8ece56596@gmail.com>
Date: Thu, 6 Jun 2019 07:28:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605044932.62524-1-hongzhi.song@windriver.com>
Subject: Re: [PATCH] spice: fix compile errors on 32bit system
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
X-List-Received-Date: Thu, 06 Jun 2019 14:29:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/4/19 9:49 PM, Hongzhi.Song wrote:
> There are folowing compile errors on Linux 32bit system:
>
> red-channel.c:207:73: error: format '%x' expects argument of type
> 'unsigned int', but argument 7 has type 'long unsigned int' [-Werror=format=]
> |207| red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
>                                 ~~~~~~~~~~~~~~~~~~~~~^
>                         self->priv->thread_id);
>                 ~~~~~~~~~~~~~~~~~~~~~^
>
> On 32bit system, #define G_GSIZE_MODIFIER "". But the type of
> 'self->priv->thread_id' is 'unsigned long int' which should match '%lx'
> not '%x'.
>
> So we should recovery the <0x%" G_GSIZE_MODIFIER "x"> to <0x%lx">.
> And others files modification are similar to G_GSIZE_MODIFIER.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  ...compile-errors-on-Linux-32bit-system.patch | 96 +++++++++++++++++++
>  .../recipes-support/spice/spice_git.bb        |  1 +
>  2 files changed, 97 insertions(+)
>  create mode 100644 meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-Linux-32bit-system.patch
>
> diff --git a/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-Linux-32bit-system.patch b/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-Linux-32bit-system.patch
> new file mode 100644
> index 000000000..749a8fd16
> --- /dev/null
> +++ b/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-Linux-32bit-system.patch
> @@ -0,0 +1,96 @@
> +From a2af005b5d4a62839e56f42a43df793356e78f58 Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Tue, 4 Jun 2019 03:58:17 -0400
> +Subject: [PATCH] Fix compile errors on Linux 32bit system
> +
> +There are folowing compile errors on Linux 32bit system:
> +
> +red-channel.c:207:73: error: format '%x' expects argument of type
> +'unsigned int', but argument 7 has type 'long unsigned int' [-Werror=format=]
> +|207| red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
> +                                ~~~~~~~~~~~~~~~~~~~~~^
> +                        self->priv->thread_id);
> +                ~~~~~~~~~~~~~~~~~~~~~^
> +
> +On 32bit system, #define G_GSIZE_MODIFIER "". But the type of
> +'self->priv->thread_id' is 'unsigned long int' which should match '%lx'
> +not '%x'.
> +
> +So we should recovery the <0x%" G_GSIZE_MODIFIER "x"> to <0x%lx">.
> +And others files modification are similar to G_GSIZE_MODIFIER.
> +
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +---
> +Upstream-Status: sent to upstream

Is there a link we can follow for the change upstream?

> +
> + server/red-channel.c    | 6 +++---
> + server/red-client.c     | 8 ++++----
> + server/red-replay-qxl.c | 2 +-
> + 3 files changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/server/red-channel.c b/server/red-channel.c
> +index f81142d..6a03ec2 100644
> +--- a/server/red-channel.c
> ++++ b/server/red-channel.c
> +@@ -202,7 +202,7 @@ red_channel_constructed(GObject *object)
> + {
> +     RedChannel *self = RED_CHANNEL(object);
> + 
> +-    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x", (unsigned long)self->priv->thread_id);
> ++    red_channel_debug(self, "thread_id 0x%lx", (unsigned long)self->priv->thread_id);
> + 
> +     RedChannelClass *klass = RED_CHANNEL_GET_CLASS(self);
> + 
> +@@ -473,8 +473,8 @@ void red_channel_remove_client(RedChannel *channel, RedChannelClient *rcc)
> + 
> +     if (!pthread_equal(pthread_self(), channel->priv->thread_id)) {
> +         red_channel_warning(channel,
> +-                            "channel->thread_id (0x%" G_GSIZE_MODIFIER "x) != "
> +-                            "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> ++                            "channel->thread_id (0x%lx) != "
> ++                            "pthread_self (0x%lx)."
> +                             "If one of the threads is != io-thread && != vcpu-thread, "
> +                             "this might be a BUG",
> +                             (unsigned long)channel->priv->thread_id,
> +diff --git a/server/red-client.c b/server/red-client.c
> +index 2b859cb..ff4da2a 100644
> +--- a/server/red-client.c
> ++++ b/server/red-client.c
> +@@ -174,8 +174,8 @@ void red_client_migrate(RedClient *client)
> +     RedChannel *channel;
> + 
> +     if (!pthread_equal(pthread_self(), client->thread_id)) {
> +-        spice_warning("client->thread_id (0x%" G_GSIZE_MODIFIER "x) != "
> +-                      "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> ++        spice_warning("client->thread_id (0x%lx) != "
> ++                      "pthread_self (0x%lx)."
> +                       "If one of the threads is != io-thread && != vcpu-thread,"
> +                       " this might be a BUG",
> +                       (unsigned long)client->thread_id, (unsigned long)pthread_self());
> +@@ -193,8 +193,8 @@ void red_client_destroy(RedClient *client)
> +     RedChannelClient *rcc;
> + 
> +     if (!pthread_equal(pthread_self(), client->thread_id)) {
> +-        spice_warning("client->thread_id (0x%" G_GSIZE_MODIFIER "x) != "
> +-                      "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> ++        spice_warning("client->thread_id (0x%lx) != "
> ++                      "pthread_self (0x%lx)."
> +                       "If one of the threads is != io-thread && != vcpu-thread,"
> +                       " this might be a BUG",
> +                       (unsigned long)client->thread_id,
> +diff --git a/server/red-replay-qxl.c b/server/red-replay-qxl.c
> +index 6d34818..0deb406 100644
> +--- a/server/red-replay-qxl.c
> ++++ b/server/red-replay-qxl.c
> +@@ -264,7 +264,7 @@ static replay_t read_binary(SpiceReplay *replay, const char *prefix, size_t *siz
> +             exit(1);
> +         }
> +         if ((ret = inflate(&strm, Z_NO_FLUSH)) != Z_STREAM_END) {
> +-            spice_error("inflate error %d (disc: %" G_GSSIZE_FORMAT ")",
> ++            spice_error("inflate error %d (disc: %li)",
> +                         ret, *size - strm.total_out);
> +             if (ret == Z_DATA_ERROR) {
> +                 /* last operation may be wrong. since we do the recording
> +-- 
> +2.8.1
> +
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
> index 6249b0422..3c45d1f5e 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -24,6 +24,7 @@ SRC_URI = " \
>      git://anongit.freedesktop.org/spice/spice;name=spice \
>      git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common \
>      file://0001-Convert-pthread_t-to-be-numeric.patch \
> +    file://0001-Fix-compile-errors-on-Linux-32bit-system.patch \
>  "
>  
>  S = "${WORKDIR}/git"



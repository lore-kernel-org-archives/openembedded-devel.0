Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C742B79D54
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 04:54:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x554s2ho006635
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jun 2019 21:54:02 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 4 Jun 2019 21:54:01 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20190605044932.62524-1-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <810bd251-4eac-1259-dfb9-a7cc22024a9b@windriver.com>
Date: Wed, 5 Jun 2019 12:53:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605044932.62524-1-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.188]
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
X-List-Received-Date: Wed, 05 Jun 2019 04:54:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

For meta-networking

--Hongzhi


On 6/5/19 12:49 PM, Hongzhi.Song wrote:
> There are folowing compile errors on Linux 32bit system:
>
> red-channel.c:207:73: error: format '%x' expects argument of type
> 'unsigned int', but argument 7 has type 'long unsigned int' [-Werror=format=]
> |207| red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
>                                  ~~~~~~~~~~~~~~~~~~~~~^
>                          self->priv->thread_id);
>                  ~~~~~~~~~~~~~~~~~~~~~^
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
>   ...compile-errors-on-Linux-32bit-system.patch | 96 +++++++++++++++++++
>   .../recipes-support/spice/spice_git.bb        |  1 +
>   2 files changed, 97 insertions(+)
>   create mode 100644 meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-Linux-32bit-system.patch
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
>       git://anongit.freedesktop.org/spice/spice;name=spice \
>       git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common \
>       file://0001-Convert-pthread_t-to-be-numeric.patch \
> +    file://0001-Fix-compile-errors-on-Linux-32bit-system.patch \
>   "
>   
>   S = "${WORKDIR}/git"


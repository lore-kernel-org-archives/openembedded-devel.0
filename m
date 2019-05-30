Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4617CFE3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 07:23:32 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id g24so7675172eds.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 00:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xXnjAsGypfvchQ7S8TRc1XELMG6FDuhTsFEY3Ii+J14=;
	b=u+TGguqPYLG6RsocQJFIGmJxiZizMFNyZko7hiZeXTkN9h7qQn/DbffUeeajXwvoTN
	tK2W75SDHivDeRw4CxxsUi5wlgfeVnyV2fHbSBLx6eVHxJHqe7/rH/2h0rAYDPmVYt9L
	tIbyUtu0sutOnjesLSNMGqcZH0Uooi1DUY03Xz47l9/Gs1aptVkBP8ArK7tOiwhjL0c4
	wmIBe9LshPbufOcv/7H3Gsm+pf0cWHb0VMZj+PSRHLxomYJDHyz21jp8yDr2RT7wdC8I
	9byraHIYMs1bCrE2uY79Ne1vjq+tguLvOH47mAThBd6TLLHJ5UgjsU4uMLwDQ1YuFMFP
	XL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xXnjAsGypfvchQ7S8TRc1XELMG6FDuhTsFEY3Ii+J14=;
	b=luTz5J/zd/mD7Q7OFivaUviJlnnWq7i/zLYeSjN+F7+jdnndrtqKbuBavdV0BdqfCY
	n7QkjKDfAEQQmY0FzjHflZmuaIT3wy41es1Bw+Zmv9EFhNUqiHDmz/FzNTT5K0cgH3ZV
	z6GlVhdyVcjS0OAuD90QFCNqoNtZNhrSmMMSXR39bL+STYRidDPabkZpm83dYRwOLXh4
	WeYkteEX3RsQGV2l5K+RCypv+PO1e5vyUZp0j4DvWpRYC2dT4S/CDD5B9SBXC1+OrL8b
	2s0wpoEBme8cv8SeVLqEedkv5bpxLSapks8vWygkUAT0/eKAnqXFFn/O1teWmtcqk9ZB
	GdqA==
X-Gm-Message-State: APjAAAWbphHRdfAL49XKEwRlqo+EA4VPFhEcVE1GDCf8qgtCrp/whZ+5
	bDXrq/NYsHcN4hPiMN3QkrO0Th8zvQMnsYXxQdU=
X-Google-Smtp-Source: APXvYqwC8CXRk2n2A9fGzFp9fMOjEEZ00/GGflwwByogZwz4ga2us7H0MN7uq6byEzE0Uk3V7phgA83MG6VbXKf2H0A=
X-Received: by 2002:a17:907:20ed:: with SMTP id
	rh13mr2055990ejb.5.1559201012823; 
	Thu, 30 May 2019 00:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190523174735.42541-1-raj.khem@gmail.com>
	<e73b1021-ef85-3cf4-b1f9-d2afd154487b@windriver.com>
In-Reply-To: <e73b1021-ef85-3cf4-b1f9-d2afd154487b@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 30 May 2019 09:23:24 +0200
Message-ID: <CA+chaQdELWFRw2hoeJdH9bMdwGfNEuUYdYZd-ZRFd9BB84qRXQ@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] spice, spice-protocol: Uprev to 0.14.0
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
X-List-Received-Date: Thu, 30 May 2019 07:23:33 -0000
Content-Type: text/plain; charset="UTF-8"

What kind of do_compile failure you're seeing Hongzhi?

On Ubuntu-18.04 (with gcc-7.4.0) I'm seeing nativesdk-spice failing with
couple address-of-packed-member errors like:

../../git/server/red-parse-qxl.c:1022:38: error: taking address of packed
member of 'struct QXLDrawable' may result in an unaligned pointer value
[-Werror=address-of-packed-member]
 1022 |     red->release_info_ext.info     = &qxl->release_info;
      |                                      ^~~~~~~~~~~~~~~~~~

On Thu, May 30, 2019 at 6:57 AM Hongzhi, Song <hongzhi.song@windriver.com>
wrote:

> Spice has do_compile failure on v0.14
>
> Thanks,
>
> --Hongzhi
>
>
> On 5/24/19 1:47 AM, Khem Raj wrote:
> > Drop the patch for fixing printf formatting, its fixed differently
> > upstream
> >
> > Forward port pthread_t printf patch
> >
> > Add -Wno-address-of-packed-member needed with gcc9
> >
> > replace _append += with just _append syntax
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   .../spice/spice-protocol_git.bb               |  4 +--
> >   ...0001-Convert-pthread_t-to-be-numeric.patch | 25 +++++--------
> >   .../0001-spice-fix-compile-fail-problem.patch | 36 -------------------
> >   .../recipes-support/spice/spice_git.bb        | 11 +++---
> >   4 files changed, 17 insertions(+), 59 deletions(-)
> >   delete mode 100644
> meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
> >
> > diff --git a/meta-networking/recipes-support/spice/spice-protocol_git.bb
> b/meta-networking/recipes-support/spice/spice-protocol_git.bb
> > index 30d0a76752..be9dba32f1 100644
> > --- a/meta-networking/recipes-support/spice/spice-protocol_git.bb
> > +++ b/meta-networking/recipes-support/spice/spice-protocol_git.bb
> > @@ -13,9 +13,9 @@ architectures."
> >   LICENSE = "BSD"
> >   LIC_FILES_CHKSUM =
> "file://COPYING;md5=b37311cb5604f3e5cc2fb0fd23527e95"
> >
> > -PV = "0.12.13+git${SRCPV}"
> > +PV = "0.14.0+git${SRCPV}"
> >
> > -SRCREV = "87441524f4e7b79658e42bd8f1f6c3e3c8649aa5"
> > +SRCREV = "f72ece993aeaf23f77e2845562b20e5563e52ba0"
> >
> >   SRC_URI = " \
> >       git://anongit.freedesktop.org/spice/spice-protocol \
> > diff --git
> a/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch
> b/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch
> > index 505b7c890b..e63cbe3b72 100644
> > ---
> a/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch
> > +++
> b/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-numeric.patch
> > @@ -14,21 +14,19 @@ Upstream-Status: Pending
> >    server/red-client.c  | 6 +++---
> >    2 files changed, 6 insertions(+), 5 deletions(-)
> >
> > -diff --git a/server/red-channel.c b/server/red-channel.c
> > -index 1b38f04d..11dc667b 100644
> >   --- a/server/red-channel.c
> >   +++ b/server/red-channel.c
> > -@@ -192,7 +192,7 @@ red_channel_constructed(GObject *object)
> > +@@ -204,7 +204,7 @@ red_channel_constructed(GObject *object)
> >    {
> >        RedChannel *self = RED_CHANNEL(object);
> >
> > --    red_channel_debug(self, "thread_id 0x%lx", self->priv->thread_id);
> > -+    red_channel_debug(self, "thread_id 0x%lx", (unsigned
> long)self->priv->thread_id);
> > +-    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
> self->priv->thread_id);
> > ++    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
> (unsigned long)self->priv->thread_id);
> >
> >        RedChannelClass *klass = RED_CHANNEL_GET_CLASS(self);
> >
> > -@@ -475,7 +475,8 @@ void red_channel_remove_client(RedChannel *channel,
> RedChannelClient *rcc)
> > -         red_channel_warning(channel, "channel->thread_id (0x%lx) !=
> pthread_self (0x%lx)."
> > +@@ -479,7 +479,8 @@ void red_channel_remove_client(RedChanne
> > +                             "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> >                                "If one of the threads is != io-thread &&
> != vcpu-thread, "
> >                                "this might be a BUG",
> >   -                            channel->priv->thread_id, pthread_self());
> > @@ -37,12 +35,10 @@ index 1b38f04d..11dc667b 100644
> >        }
> >        spice_return_if_fail(channel);
> >        link = g_list_find(channel->priv->clients, rcc);
> > -diff --git a/server/red-client.c b/server/red-client.c
> > -index ddfc5400..76986640 100644
> >   --- a/server/red-client.c
> >   +++ b/server/red-client.c
> > -@@ -180,7 +180,7 @@ void red_client_migrate(RedClient *client)
> > -         spice_warning("client->thread_id (0x%lx) != pthread_self
> (0x%lx)."
> > +@@ -180,7 +180,7 @@ void red_client_migrate(RedClient *clien
> > +                       "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> >                          "If one of the threads is != io-thread && !=
> vcpu-thread,"
> >                          " this might be a BUG",
> >   -                      client->thread_id, pthread_self());
> > @@ -50,8 +46,8 @@ index ddfc5400..76986640 100644
> >        }
> >        FOREACH_CHANNEL_CLIENT(client, rcc) {
> >            if (red_channel_client_is_connected(rcc)) {
> > -@@ -199,8 +199,8 @@ void red_client_destroy(RedClient *client)
> > -         spice_warning("client->thread_id (0x%lx) != pthread_self
> (0x%lx)."
> > +@@ -199,8 +199,8 @@ void red_client_destroy(RedClient *clien
> > +                       "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> >                          "If one of the threads is != io-thread && !=
> vcpu-thread,"
> >                          " this might be a BUG",
> >   -                      client->thread_id,
> > @@ -61,6 +57,3 @@ index ddfc5400..76986640 100644
> >        }
> >        red_client_set_disconnecting(client);
> >        FOREACH_CHANNEL_CLIENT(client, rcc) {
> > ---
> > -2.17.1
> > -
> > diff --git
> a/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
> b/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
> > deleted file mode 100644
> > index 1f9d5fdd7b..0000000000
> > ---
> a/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -From 7023732c65b4dc509c46a54fb7715da275b5597f Mon Sep 17 00:00:00 2001
> > -From: Changqing Li <changqing.li@windriver.com>
> > -Date: Thu, 13 Sep 2018 12:39:44 +0800
> > -Subject: [PATCH] spice: fix compile fail problem
> > -
> > -compile error:
> > -format '%d' expects argument of type 'int', but argument 6 has
> > -type 'long unsigned int' [-Werror=format=]
> > -
> > -spice compile failed on 32bit system, since upstream commit
> > -9541cd2fe(in V0.14.1) change %ld to %PRIdPTR, %PRIdPTR is %d, but
> argument
> > -strm.total_out is uLong.
> > -
> > -Upstream-Status: Submitted[https://github.com/freedesktop/spice/pull/1]
> > -
> > -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ----
> > - server/red-replay-qxl.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/server/red-replay-qxl.c b/server/red-replay-qxl.c
> > -index 1fce76c..bd33b58 100644
> > ---- a/server/red-replay-qxl.c
> > -+++ b/server/red-replay-qxl.c
> > -@@ -266,7 +266,7 @@ static replay_t read_binary(SpiceReplay *replay,
> const char *prefix, size_t *siz
> > -             exit(1);
> > -         }
> > -         if ((ret = inflate(&strm, Z_NO_FLUSH)) != Z_STREAM_END) {
> > --            spice_error("inflate error %d (disc: %" PRIdPTR ")", ret,
> *size - strm.total_out);
> > -+            spice_error("inflate error %d (disc: %ld)", ret, *size -
> strm.total_out);
> > -             if (ret == Z_DATA_ERROR) {
> > -                 /* last operation may be wrong. since we do the
> recording
> > -                  * in red_worker, when there is a shutdown from the
> vcpu/io thread
> > ---
> > -2.7.4
> > -
> > diff --git a/meta-networking/recipes-support/spice/spice_git.bb
> b/meta-networking/recipes-support/spice/spice_git.bb
> > index 1ad46c2c31..6249b0422b 100644
> > --- a/meta-networking/recipes-support/spice/spice_git.bb
> > +++ b/meta-networking/recipes-support/spice/spice_git.bb
> > @@ -13,10 +13,10 @@ architectures."
> >   LICENSE = "BSD & LGPLv2.1+"
> >   LIC_FILES_CHKSUM =
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> >
> > -PV = "0.14.1+git${SRCPV}"
> > +PV = "0.14.2+git${SRCPV}"
> >
> > -SRCREV_spice = "eaa07ef15cfc3bf57a69da2576af66f028787774"
> > -SRCREV_spice-common = "6b93b3fce8909b836ef1d1434d191900d8aa00be"
> > +SRCREV_spice = "7cbd70b931db76c69c89c2d9d5d704f67381a81b"
> > +SRCREV_spice-common = "4fc4c2db36c7f07b906e9a326a9d3dc0ae6a2671"
> >
> >   SRCREV_FORMAT = "spice_spice-common"
> >
> > @@ -24,7 +24,6 @@ SRC_URI = " \
> >       git://anongit.freedesktop.org/spice/spice;name=spice \
> >       git://
> anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common
> \
> >       file://0001-Convert-pthread_t-to-be-numeric.patch \
> > -    file://0001-spice-fix-compile-fail-problem.patch \
> >   "
> >
> >   S = "${WORKDIR}/git"
> > @@ -37,6 +36,8 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
> >   export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
> >   export
> PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
> >
> > +CFLAGS += "-Wno-address-of-packed-member"
> > +
> >   PACKAGECONFIG_class-native = ""
> >   PACKAGECONFIG_class-nativesdk = ""
> >   PACKAGECONFIG ?= "sasl"
> > @@ -54,4 +55,4 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
> >
> >   BBCLASSEXTEND = "native nativesdk"
> >
> > -EXTRA_OECONF_toolchain-clang += "--disable-werror"
> > +EXTRA_OECONF_append_toolchain-clang = " --disable-werror"
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


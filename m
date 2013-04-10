Received: from mail-oa0-f48.google.com ([209.85.219.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nicolas.dechesne@linaro.org>) id 1UPx08-0001T6-7m
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 17:32:02 +0200
Received: by mail-oa0-f48.google.com with SMTP id j1so550458oag.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 08:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=/LkFTqbcJjhEX2XW9wk0mIbXffFYY8ni9KQwK/AP6TI=;
	b=RC5OQJlMp56reZjq91BYoQngdqucuL4F/b3RxQoyBazbVIXku69Hb0Xv9PDhNUw7mc
	TaCd4/RW8MTaNVUsfSomJZRSBwStK8RLZVsfKYEYYH/CvH+hIzbYZvecSQFPWZotoM4Q
	Csi1QInXWU9ShhXWKq8Rys0fPpaX1zV9LaGAIlcm/qyhzJdZ+UdVBiG3J9zFFUkf2UE4
	kPELxa0NSdwG/QX5a4ULZCfN/aB7Fr9jnkn4SNjdFwj+LhgH9Ki7LQLCwwWEZVr73I7f
	P+iH0IB1Extm+I+WlDm4Yk2eXyZSwMh4HH9kqIk3hmdqmmBYqoB/99+zOLdUxZMPnvVM
	5RBw==
X-Received: by 10.60.34.167 with SMTP id a7mr928597oej.20.1365606874156; Wed,
	10 Apr 2013 08:14:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.35.193 with HTTP; Wed, 10 Apr 2013 08:14:14 -0700 (PDT)
In-Reply-To: <CAJTo0LYfznJ8DH_PEaBWRF4_KVP=FqVJe8E6uZfkVtN1MhXYKw@mail.gmail.com>
References: <1365604639-5235-1-git-send-email-ndec@linaro.org>
	<CAJTo0LYfznJ8DH_PEaBWRF4_KVP=FqVJe8E6uZfkVtN1MhXYKw@mail.gmail.com>
From: Nicolas Dechesne <ndec@linaro.org>
Date: Wed, 10 Apr 2013 17:14:14 +0200
Message-ID: <CAP71WjwrXC6BAyPred-K+c0kZc4aOaDD6Nd_9WC5kmrTv_Hqog@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn/xaVLtCiAIkLMEfiPTmv6NM9LoHdYL2DOTSZHwR/yete/cj6CJvMZZ9EZI8VgbghAH7RU
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] gupnp: remove dependency on gnome-icon-theme
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 15:32:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 10, 2013 at 4:54 PM, Burton, Ross <ross.burton@intel.com> wrote:
> You'll want to bump PR (ideally adding some form of pr in the .inc at
> the same time).

ouch.. indeed.

do you mean something along these lines:

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
index f793236..f7c382a 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
@@ -2,6 +2,8 @@ SUMMARY = "UPnP framework"
 DESCRIPTION = "GUPnP is an elegant, object-oriented open source
framework for creating UPnP  devices and control points, written in C
using G
 LICENSE = "LGPLv2+"

+INC_PR = "r0"
+
 DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gobject-introspection-stub"

 require no-vala.inc
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
index 4fb1d05..5e6ea35 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
@@ -1,5 +1,7 @@
 require gupnp.inc

+PR = "${INC_PR}.0"
+
 SRC_URI = "http://download.gnome.org/sources/${BPN}/0.18/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "0e15fa26be7b1a0255e6dec07c285527"
 SRC_URI[sha256sum] =
"6b437d5711b212292c6080626b97480268310da636a6cf937ad6119291af78a1"

then, what I could do is a patch serie where patch 1/2 introduces the
INC_PR with "r0", and patch 2/2 fixes gupnp and increments INC_PR to
'r1'.

also, is that worthwhile to add the INC_PR in all other recipes in the
gupnp folder ? or just in gupnp recipe for now?



Return-Path: <chmorgan@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE026AC93
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 13:32:40 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so9567393wgg.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 05:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=j6zEDBcFUZiflrRzU0WDeB77z9dm35BYT51w4IAddus=;
	b=S5wLdbRZh7lC2nRNHyMvttP5o2IVoYYAg9X5Jad4Xkknvnmo0xG2QBja0WUxt0qXIc
	CyDjcF2l3kP0Q6lOFYhNf92LmUvnZQw97bUCJTmeNBeguNi1jJQcnwmlI6Rl48pw04eR
	Vbwxc69L8q1tp1PXZTOVrwx3EuXxXFfKz1A1IALqF4vlpRhkJSqpfvIbTR3nZ5GutdA6
	XqlbEPf1/6agfeg3ouOUScnRre78stmV1yG1OqAY+Vl5JMUbUT/MCas2PjwXAoYg4R1I
	xOK9BVNKQUp7KkiZ1Hz+gtz77oltNnLY9i+ApgF6GqroI0VrTfVUY5tZG0WnSRdAcWAa
	2Yrw==
X-Received: by 10.194.205.103 with SMTP id lf7mr3057132wjc.134.1416317560283; 
	Tue, 18 Nov 2014 05:32:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.52.8 with HTTP; Tue, 18 Nov 2014 05:32:20 -0800 (PST)
In-Reply-To: <1415645193-14565-1-git-send-email-cmorgan@cybexintl.com>
References: <1415645193-14565-1-git-send-email-cmorgan@cybexintl.com>
From: Chris Morgan <chmorgan@gmail.com>
Date: Tue, 18 Nov 2014 08:32:20 -0500
Message-ID: <CAAPegz2AAYvu0TQNrHm8yiF6axb74TG_uRj+4Kv0oPovo-wcug@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Morgan <cmorgan@cybexintl.com>
Subject: Re: [meta-oe][PATCH] dfu-util: Point to gitorious.org repository as gnumonks.org is down
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
X-List-Received-Date: Tue, 18 Nov 2014 13:32:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 10, 2014 at 1:46 PM, Chris Morgan <chmorgan@gmail.com> wrote:
> ---
>  meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> index aa2b84d..c706fd1 100644
> --- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> +++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> @@ -4,7 +4,10 @@ AUTHOR = "Harald Welte <laforge@openmoko.org>"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
> -SRC_URI = "http://${BPN}.gnumonks.org/releases/${BP}.tar.gz \
> +S = "${WORKDIR}/${BPN}-${BPN}"
> +
> +REV="a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
> +SRC_URI = "https://gitorious.org/${BPN}/${BPN}/archive/${REV}.tar.gz \
>      file://0001-configure.ac-Don-t-check-for-usbpath.patch \
>  "
>
> @@ -12,5 +15,5 @@ inherit autotools pkgconfig
>
>  DEPENDS = "libusb1"
>
> -SRC_URI[md5sum] = "56844020177d4db4c1ea2e926fe9d588"
> -SRC_URI[sha256sum] = "f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c712e0c58a332d80ec3eab"
> +SRC_URI[md5sum] = "1de724551604bce1962960b7a301cc08"
> +SRC_URI[sha256sum] = "5d253f924fd29bc13054b664bba9aa86b865299971195969478253c1775b7e56"
> --
> 1.9.3
>


Pinging on this commit and if anyone knows what happened to gnumonks.org.

Chris


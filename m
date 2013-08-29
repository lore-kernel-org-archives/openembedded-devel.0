Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4560F6BDF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:32:26 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id ec20so964053lab.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IvaLfPQszoCO8OWyA2hpKP5HYrfhHaB6tnUptGH95UM=;
	b=mcTrl7JuvFJ7juLGavKoTrgbkA/UrgjlgB1PhVW8Io9NU6EzwRq5/rO0RpbnVWvt7j
	qUdLNaHZcscJ4jF0ZkDCybpNY8q9D7KTmNOJsmCuf+NtWw/TUa5oO7jMTmN3sK8nisLB
	KzIzW2OE7RfzQDf7iLvZ4+xjS6ssts6taHNqhnTuKNGOXn85C0eoG+EXbGbDWGZM/9JI
	yNlQe/FtGXCc+ELiAlEwNZo1od2NufWE6RUGuhPpJLcuUrGtnnFYef7MsgOadbcRvPlw
	zp+qtPztB+KozwkUdSvltwo6OmSwan+tPT8sjYuTVBzUjZrsmnz8+OBEVfuJJGoxT6aR
	2nJA==
MIME-Version: 1.0
X-Received: by 10.112.154.70 with SMTP id vm6mr5182264lbb.1.1377819146321;
	Thu, 29 Aug 2013 16:32:26 -0700 (PDT)
Received: by 10.112.209.40 with HTTP; Thu, 29 Aug 2013 16:32:26 -0700 (PDT)
In-Reply-To: <1377819097-27389-1-git-send-email-andrea.adami@gmail.com>
References: <1377819097-27389-1-git-send-email-andrea.adami@gmail.com>
Date: Fri, 30 Aug 2013 01:32:26 +0200
Message-ID: <CAAQYJAsSp1EH-D3QibW9FWdCoL3J7_tWoCi75rbJV=XZn3FcxA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs][PATCH] cramfs: remove, we use mkfs.cramfs from util-linux
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
X-List-Received-Date: Thu, 29 Aug 2013 23:32:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

sorry, wrong prefix: meta-filesystems

On Fri, Aug 30, 2013 at 1:31 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../recipes-filesystems/cramfs/cramfs_1.1.bb       | 29 ----------------------
>  1 file changed, 29 deletions(-)
>  delete mode 100644 meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb
>
> diff --git a/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb b/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb
> deleted file mode 100644
> index 0bca0e1..0000000
> --- a/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION = "Builds cramfs filesystems for embedded systems"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
> -DEPENDS = "zlib"
> -
> -PE = "1"
> -
> -SRC_URI = "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${BPN}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "d3912b9f7bf745fbfea68f6a9b9de30f"
> -SRC_URI[sha256sum] = "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368"
> -
> -EXTRA_OEMAKE = "\
> -    'CC=${CC}' \
> -    'CFLAGS=${CFLAGS}' \
> -    'LDFLAGS=${LDFLAGS}' \
> -"
> -
> -do_compile_prepend() {
> -    ln -sf GNUmakefile Makefile
> -}
> -
> -do_install() {
> -    install -d ${D}${bindir}
> -    install mkcramfs ${D}${bindir}
> -    install cramfsck ${D}${bindir}
> -}
> -
> -BBCLASSEXTEND = "native"
> --
> 1.8.1.5
>


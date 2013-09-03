Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 67F5B6BD7F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 16:29:21 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so4816857lab.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 09:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=B7b86F2dsXkH7+IAKeJV4KvpG1InZqBJugj9yLNV41Y=;
	b=zAHOos8ZVlD7gZp503w5TQUVFDDKJjkbPnQhPRYI0wwQDBe2MB2NZVwnZ8KQd8JVr9
	ZVSqa56KVnKk6qxkdnn7QTp3dVBMoqCP5tk9JsF3mW4M9xlccc9RMAGnZKCsG0fIOPGN
	p930j7b5F5wZ8N50g8wfUs8XXBzRT7mihoEgGInOyiTd6rFJyszG2vhzwiE44kaA8oiR
	l9/seqnl8H3z+qTn11h6OPIskMhL3q57ryF1q9Z39wbvOZM8ho3geZsGkk7Zxu01lTEn
	EaoQe5vEK34ydZvY06ey/sanUvLmm5V9cDthCvqk824PiOa0bowjcYe78lZl0x7awYl1
	+/Rw==
MIME-Version: 1.0
X-Received: by 10.152.7.100 with SMTP id i4mr2582696laa.35.1378225760663; Tue,
	03 Sep 2013 09:29:20 -0700 (PDT)
Received: by 10.112.209.40 with HTTP; Tue, 3 Sep 2013 09:29:20 -0700 (PDT)
In-Reply-To: <1377819594-27497-1-git-send-email-andrea.adami@gmail.com>
References: <1377819594-27497-1-git-send-email-andrea.adami@gmail.com>
Date: Tue, 3 Sep 2013 18:29:20 +0200
Message-ID: <CAAQYJAsQWvk-ChLYZJ0fZXHs3ZM1im9TJkPv25nRPeataVjujw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-filesystems][PATCH] cramfs: remove, we use mkfs.cramfs from util-linux
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
X-List-Received-Date: Tue, 03 Sep 2013 16:29:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 30, 2013 at 1:39 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
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

PING

mkfs.cramfs is now packaged by util-linux in oe-core and the
necessaries changes to image_types.bbclass committed as well.

BTW, who is the layer maintainer ?
Please add it clearly to the README, thx.

Cheers

Andrea


Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id C61927264B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 08:04:22 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3B040D40814
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 09:04:20 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 72FC4D4080F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 09:04:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 09:04:19 +0100 (CET)
Date: Wed, 17 Dec 2014 09:04:13 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141217080413.GA24463@mail.itconsulting-heinold.de>
References: <1418802162-26554-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1418802162-26554-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-filesystems][PATCH] logfsprogs: Add new recipe
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
X-List-Received-Date: Wed, 17 Dec 2014 08:04:25 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Dec 17, 2014 at 03:42:42PM +0800, Qian Lei wrote:
> LogFS is a Linux log-structured and scalable flash file system, intended
> for use on large devices of flash memory. Logfsprogs is used to create
> LogFS file system.
> 
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  .../recipes-filesystems/logfsprogs/logfsprogs.bb   | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs.bb
> 
> diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs.bb
> new file mode 100644
> index 0000000..7e9de01
> --- /dev/null
> +++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "LogFS Programs: used to create LogFS file system"
> +DESCRIPTION = "\
> +LogFS is a Linux log-structured and scalable flash file system, intended \
> +for use on large devices of flash memory. It is written by Jörn Engel and \
> +in part sponsored by the CE Linux Forum. \
> +LogFS is included in the mainline Linux kernel and was introduced in \
> +version 2.6.34, released on May 16, 2010."
> +SECTION = "base"
> +HOMEPAGE = "https://github.com/prasad-joshi/logfsprogs"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://fsck.c;md5=3859dc73da97909ff1d0125e88a27e02"
> +DEPENDS = "zlib"
> +
> +SRC_URI = "git://github.com/prasad-joshi/logfsprogs.git"
> +SRCREV = "45b72c81ce3c6fa17ca19bafc207ea93e76312f4"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile () {
> +    make CC="${CC}" LD="${LD}" AR="${AR}"

Please use oe_runmake here, otherwise it looks good to me.

Bye Henning


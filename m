Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SCVtt-0005oT-3W
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 14:53:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 299BA315A8DD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:44:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id DafNSnAtJ43L
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:44:17 +0200 (CEST)
Received: from [172.22.22.61] (drms-4d014418.pool.mediaWays.net [77.1.68.24])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 71648315A8C4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:44:17 +0200 (CEST)
Message-ID: <4F71B620.7020304@opendreambox.org>
Date: Tue, 27 Mar 2012 14:44:16 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <8c581985c4eb9edd0843595fb0b735f70a899c48.1332849864.git.sledz@dresearch-fe.de>
	<71df8a759f91e821a2daee22f34eaa3a31708775.1332849864.git.sledz@dresearch-fe.de>
In-Reply-To: <71df8a759f91e821a2daee22f34eaa3a31708775.1332849864.git.sledz@dresearch-fe.de>
Subject: Re: [2011.03-maintenance 3/3] python-2.6.6: Fix python-2.6.6 build failure on linux-3.x
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
X-List-Received-Date: Tue, 27 Mar 2012 12:53:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 27.03.2012 14:07, Steffen Sledz wrote:
> From: Ulf Samuelsson <ulf_samuelsson@telia.com>
> 
> python-2.6.6 build will crash when host is running linux kernel 3.x.
> 
> Fix backported from openembedded-core.
> meta/recipes-devtools/python/python/07-linux3-regen-fix.patch

This patch has been superseded by a backport from upstream python,
causing linux2 to be used for all kernel versions. See commit
accb2b728ab10cae20be59253a56ac6410b8de10 in oe-core.

> Signed-Off-By:	Ulf Samuelsson <ulf.samuelsson@telia.com>
> ---
>  .../python/python-2.6.6/07-linux3-regen-fix.patch  |   18 ++++++++++++++++++
>  recipes/python/python_2.6.6.bb                     |    3 ++-
>  2 files changed, 20 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/python/python-2.6.6/07-linux3-regen-fix.patch
> 
> diff --git a/recipes/python/python-2.6.6/07-linux3-regen-fix.patch b/recipes/python/python-2.6.6/07-linux3-regen-fix.patch
> new file mode 100644
> index 0000000..a059605
> --- /dev/null
> +++ b/recipes/python/python-2.6.6/07-linux3-regen-fix.patch
> @@ -0,0 +1,18 @@
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Without this patch it calls cross-compiled python if host is running linux-3.0
> +python$EXE ../../Tools/scripts/h2py.py -i '(u_long)' /usr/include/netinet/in.h
> +| ./regen: line 3: /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.6.6-nk2.8/Python-2.6.6/python: cannot execute binary file
> +
> +diff -uNr Python-2.6.6.orig//Lib/plat-linux3/regen Python-2.6.6/Lib/plat-linux3/regen
> +--- Python-2.6.6.orig//Lib/plat-linux3/regen 1970-01-01 01:00:00.000000000 +0100
> ++++ Python-2.6.6/Lib/plat-linux3/regen 2001-08-09 14:48:17.000000000 +0200
> +@@ -0,0 +1,8 @@
> ++#! /bin/sh
> ++case `uname` in
> ++Linux*) ;;
> ++*) echo Probably not on a Linux system 1>&2
> ++ exit 1;;
> ++esac
> ++set -v
> ++h2py -i '(u_long)' /usr/include/sys/types.h /usr/include/netinet/in.h /usr/include/dlfcn.h
> diff --git a/recipes/python/python_2.6.6.bb b/recipes/python/python_2.6.6.bb
> index eacc5c2..5b47fec 100644
> --- a/recipes/python/python_2.6.6.bb
> +++ b/recipes/python/python_2.6.6.bb
> @@ -3,7 +3,7 @@ DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
>             ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
>  DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
>  # set to .0 on every increase of INC_PR
> -PR = "${INC_PR}.3"
> +PR = "${INC_PR}.4"
>  
>  SRC_URI = "\
>    http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
> @@ -14,6 +14,7 @@ SRC_URI = "\
>    file://04-default-is-optimized.patch \
>    file://05-enable-ctypes-cross-build.patch \
>    file://06-ctypes-libffi-fix-configure.patch \
> +  file://07-linux3-regen-fix.patch \
>    file://ipv6-cross.patch \
>    file://python-module-rpath-fix.patch \
>    file://sitecustomize.py \




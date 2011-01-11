Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PckId-0006M8-Jg
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 20:54:35 +0100
Received: by fxm17 with SMTP id 17so19501060fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 11:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=EcjnUyvWMvLXUJ4V3NLZp5XS4R3nqLbiUITkiANd5vU=;
	b=YzvMWWkgaTpufNSpaeU8KJ5/mvLbqXoGsLQAM8331Ij5TUZ3nHGiVm9HyHa1Kgv3Z3
	R6vCtGNJ2qMnr6wjJxUay+YgFnD+6wIxKJA37dP1Oeo6hNUdVVS0kBfU0SvGW3cTL/y7
	fw0kKDAPG5evov1OrA8ZSLRBsjsahN9UTmJK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HW/da5I+xSqCK0EryxDg7boCSoJrbiTvIjIv6FLaCYX0ANBeGWNqulKTf/J2ML3/V1
	O254CnSZ1aEcpdfmTazi/NbNOkrOBs8TiQfN7GF/+IZr7NHnl2RaWohGGXGxD24zZhGF
	PzxreRZhNJY2Ru6QQPMdBgZxG/5/T7VSB34mM=
Received: by 10.223.98.197 with SMTP id r5mr36296fan.68.1294775642748;
	Tue, 11 Jan 2011 11:54:02 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id y3sm7548613fai.38.2011.01.11.11.54.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 11:54:01 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PckI3-0001vG-3F; Tue, 11 Jan 2011 20:53:59 +0100
Date: Tue, 11 Jan 2011 20:53:59 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110111195359.GE6584@mx.loc>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-7-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1294084926-3115-7-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [PATCH 07/12] busybox: simplify handling of busybox-static
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
X-List-Received-Date: Tue, 11 Jan 2011 19:54:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping?

This is a first step into sanitizing busybox recipes, although it
doesn't really cleanup much ATM.

In the long run, i have already thought about virtualizing busybox into
coreutils/util-linux/init/whatnot and use packages and u-a (to handle
these opkg-packages natively via rootfs_opkg and pstaging w/ opkg-cl
-O). We now do a real install with the superset of {,-static} each and
use u-a to properly set the tools per provider. But anyway. The above
was a step. ACK?

On Mon, Jan 03, 2011 at 09:02:01PM +0100, Bernhard Reutner-Fischer wrote:
>Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>---
> recipes/busybox/busybox-static_1.17.4.bb |    8 +-------
> recipes/busybox/busybox-static_1.18.1.bb |    6 ------
> recipes/busybox/busybox.inc              |   15 +++++++++++++--
> 3 files changed, 14 insertions(+), 15 deletions(-)
>
>diff --git a/recipes/busybox/busybox-static_1.17.4.bb b/recipes/busybox/busybox-static_1.17.4.bb
>index 325752a..252fd66 100644
>--- a/recipes/busybox/busybox-static_1.17.4.bb
>+++ b/recipes/busybox/busybox-static_1.17.4.bb
>@@ -1,11 +1,5 @@
> require busybox_${PV}.bb
>-PR = "${INC_PR}.0"
>+PR = "${INC_PR}.1"
> 
> FILESPATHPKG =. "busybox-${PV}:"
> S = "${WORKDIR}/busybox-${PV}"
>-
>-do_configure_append() {
>-	sed -i -e '/CONFIG_STATIC/d' .config
>-	echo "CONFIG_STATIC=y" >>.config
>-}
>-
>diff --git a/recipes/busybox/busybox-static_1.18.1.bb b/recipes/busybox/busybox-static_1.18.1.bb
>index 58aca93..eeb3040 100644
>--- a/recipes/busybox/busybox-static_1.18.1.bb
>+++ b/recipes/busybox/busybox-static_1.18.1.bb
>@@ -2,9 +2,3 @@ require busybox_${PV}.bb
> 
> FILESPATHPKG =. "busybox-${PV}:"
> S = "${WORKDIR}/busybox-${PV}"
>-
>-do_configure_append() {
>-	sed -i -e '/CONFIG_STATIC/d' .config
>-	echo "CONFIG_STATIC=y" >>.config
>-}
>-
>diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
>index a9d1e6e..eda5f95 100644
>--- a/recipes/busybox/busybox.inc
>+++ b/recipes/busybox/busybox.inc
>@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
> SECTION = "base"
> PRIORITY = "required"
> 
>-INC_PR = "r38"
>+INC_PR = "r39"
> 
> SRC_URI = "\
>   file://busybox-cron \
>@@ -97,9 +97,11 @@ python () {
>                  d)
> }
> 
>-do_configure () {
>+do_prepare_config () {
> 	sed -e 's#@DATADIR@#${datadir}#g' \
> 		< ${WORKDIR}/defconfig > ${S}/.config
>+	sed -i -e '/CONFIG_STATIC/d' .config
>+	echo "# CONFIG_STATIC is not set" >> .config
> 	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
> 		${S}/.config
> 	sed -i -e '${configmangle}' ${S}/.config
>@@ -112,6 +114,15 @@ do_configure () {
> 	  {if(net==2&&$0 !~ /^#/&&$1){print("# "$1" is not set")}else{print}}' \
> 		  ${S}/.config.oe-tmp > ${S}/.config
> 	fi
>+}
>+
>+do_prepare_config_append_pn-busybox-static() {
>+	sed -i -e '/CONFIG_STATIC/d' .config
>+	echo "CONFIG_STATIC=y" >>.config
>+}
>+
>+do_configure () {
>+	do_prepare_config
> 	cml1_do_configure
> }
> 
>-- 
>1.7.2.3
>



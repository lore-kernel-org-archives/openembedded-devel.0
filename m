Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7696D8E9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:39:30 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WSOlV-0006KF-B5 for openembedded-devel@lists.openembedded.org;
	Tue, 25 Mar 2014 11:39:29 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 11:39:29 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 11:39:29 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 25 Mar 2014 11:39:18 +0100
Message-ID: <lgrmc6$aj8$1@ger.gmane.org>
References: <1395742470-21967-1-git-send-email-zhenhua.luo@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
In-Reply-To: <1395742470-21967-1-git-send-email-zhenhua.luo@freescale.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe] lvm2: replace CPPFunction with rl_completion_func_t to fix build error
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
X-List-Received-Date: Tue, 25 Mar 2014 10:39:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Zhenhua Luo schreef op 25-03-14 11:14:
> lvm2 depends on readline, CPPFunction has been replaced by
> rl_completion_func_t in recent readline,
> 
> Error log: | lvm.c: In function 'lvm_shell': | lvm.c:189:38: error:
> 'CPPFunction' undeclared (first use in this function) |
> rl_attempted_completion_function = (CPPFunction *) _completion; |
> ^
> 
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com> --- 
> meta-oe/recipes-support/lvm2/lvm2.inc              |  1 + 
> ...ace-CPPFunction-with-rl_completion_func_t.patch | 33
> ++++++++++++++++++++++ 2 files changed, 34 insertions(+) create mode
> 100644
> meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
>
>  diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
> b/meta-oe/recipes-support/lvm2/lvm2.inc index c2e1007..4b43328 100644 ---
> a/meta-oe/recipes-support/lvm2/lvm2.inc +++
> b/meta-oe/recipes-support/lvm2/lvm2.inc @@ -9,6 +9,7 @@ INC_PR = "r4"
> 
> S = "${WORKDIR}/LVM2.${PV}" SRC_URI =
> "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \ +
> file://0001-Replace-CPPFunction-with-rl_completion_func_t.patch \ 
> file://lvm.conf"
> 
> PACKAGECONFIG ??= "readline" diff --git
> a/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
> b/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
>
> 
new file mode 100644
> index 0000000..9eb5b7b --- /dev/null +++
> b/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
>
> 
@@ -0,0 +1,33 @@
> +From e2484e179c389b98366c8b66b451d9d2ba8f35e8 Mon Sep 17 00:00:00 2001 
> +From: Zhenhua Luo <zhenhua.luo@freescale.com> +Date: Tue, 25 Mar 2014
> 17:39:43 +0800 +Subject: [PATCH] Replace CPPFunction with
> rl_completion_func_t + +lvm2 depends on readline, CPPFunction has been
> replaced by rl_completion_func_t +in recent readline, + +Upstream-Status:
> Inappropriate [configuration] +The change depends on the build
> environment, it is required by Yocto env due to +readline upgrade.

s/Yocto/OpenEmbedded/

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTMVzWMkyGM64RGpERAmoXAKCkrMdIL8yO0+z0Opm4eQUj858XdACggu9X
vy9I+nuEbWkJSiKIm9Fxx1Y=
=qXnl
-----END PGP SIGNATURE-----



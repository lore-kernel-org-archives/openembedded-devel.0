Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Q47tT-0006Zt-AZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 10:33:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 38CBAA49AA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2011 09:31:52 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 5gvih3wGqRMN
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2011 09:31:50 +0100 (BST)
Received: from xora-eee (188-220-38-49.zone11.bethere.co.uk [188.220.38.49])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 57304A42E6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2011 09:31:50 +0100 (BST)
Received: by xora-eee (Postfix, from userid 1000)
	id 96F4882102; Mon, 28 Mar 2011 09:31:49 +0100 (BST)
Date: Mon, 28 Mar 2011 09:31:49 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110328083149.GA7337@xora-eee.xora.org.uk>
References: <E1Q3y4q-00047f-Ns@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1Q3y4q-00047f-Ns@melo.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Andrea Adami : udev: remove udev-compat for Zaurus devices since we use 2.6 .38 finally.
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
X-List-Received-Date: Mon, 28 Mar 2011 08:33:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Shouldnt this patch have a PR bump so udev already on devices is updated?

Graeme

On Sun, Mar 27, 2011 at 10:04:52PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: e0b9730eeb42cab4a16983777d1a7fc3986f4933
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=e0b9730eeb42cab4a16983777d1a7fc3986f4933
> 
> Author: Andrea Adami <andrea.adami@gmail.com>
> Date:   Sun Mar 27 23:59:02 2011 +0200
> 
> udev: remove udev-compat for Zaurus devices since we use 2.6.38 finally.
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> 
> ---
> 
>  recipes/udev/udev.inc    |   16 ----------------
>  recipes/udev/udev_151.bb |   16 ----------------
>  recipes/udev/udev_154.bb |   16 ----------------
>  recipes/udev/udev_162.bb |   16 ----------------
>  recipes/udev/udev_165.bb |   16 ----------------
>  5 files changed, 0 insertions(+), 80 deletions(-)
> 
> diff --git a/recipes/udev/udev.inc b/recipes/udev/udev.inc
> index 0c8a662..79f43dc 100644
> --- a/recipes/udev/udev.inc
> +++ b/recipes/udev/udev.inc
> @@ -44,22 +44,6 @@ EXTRA_OEMAKE = "-e \
>  		'STRIP=echo'"
>  
>  RPROVIDES_udev_append = " udev-compat-wrapper"
> -RDEPENDS_udev_spitz += "udev-compat"
> -do_unpack_append_spitz() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_akita += "udev-compat"
> -do_unpack_append_akita() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_c7x0 += "udev-compat"
> -do_unpack_append_c7x0() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_poodle += "udev-compat"
> -do_unpack_append_poodle() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
>  
>  # Modify init script on platforms that need to boot old kernels:
>  do_apply_compat_wrapper() {
> diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
> index d31d99a..e7f78f2 100644
> --- a/recipes/udev/udev_151.bb
> +++ b/recipes/udev/udev_151.bb
> @@ -85,22 +85,6 @@ FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
>  FILES_${PN}-dbg += "/lib/udev/.debug"
>  
>  RPROVIDES_udev_append = " udev-compat-wrapper"
> -RDEPENDS_udev_append_spitz = " udev-compat"
> -do_unpack_append_spitz() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_akita = " udev-compat"
> -do_unpack_append_akita() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_c7x0 = " udev-compat"
> -do_unpack_append_c7x0() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_poodle = " udev-compat"
> -do_unpack_append_poodle() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
>  
>  # Modify init script on platforms that need to boot old kernels:
>  do_apply_compat_wrapper() {
> diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
> index 44d7b13..8b416e2 100644
> --- a/recipes/udev/udev_154.bb
> +++ b/recipes/udev/udev_154.bb
> @@ -77,22 +77,6 @@ FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
>  FILES_${PN}-dbg += "/lib/udev/.debug"
>  
>  RPROVIDES_udev_append = " udev-compat-wrapper"
> -RDEPENDS_udev_append_spitz = " udev-compat"
> -do_unpack_append_spitz() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_akita = " udev-compat"
> -do_unpack_append_akita() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_c7x0 = " udev-compat"
> -do_unpack_append_c7x0() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_poodle = " udev-compat"
> -do_unpack_append_poodle() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
>  
>  # Modify init script on platforms that need to boot old kernels:
>  do_apply_compat_wrapper() {
> diff --git a/recipes/udev/udev_162.bb b/recipes/udev/udev_162.bb
> index 40104be..6611d8c 100644
> --- a/recipes/udev/udev_162.bb
> +++ b/recipes/udev/udev_162.bb
> @@ -88,22 +88,6 @@ FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
>  FILES_${PN}-dbg += "/lib/udev/.debug"
>  
>  RPROVIDES_udev_append = " udev-compat-wrapper"
> -RDEPENDS_udev_append_spitz = " udev-compat"
> -do_unpack_append_spitz() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_akita = " udev-compat"
> -do_unpack_append_akita() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_c7x0 = " udev-compat"
> -do_unpack_append_c7x0() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_poodle = " udev-compat"
> -do_unpack_append_poodle() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
>  RDEPENDS_udev_append_palmpre = " udev-compat"
>  do_unpack_append_palmpre() {
>  	bb.build.exec_func('do_apply_compat_wrapper', d)
> diff --git a/recipes/udev/udev_165.bb b/recipes/udev/udev_165.bb
> index 63e62f1..d426aff 100644
> --- a/recipes/udev/udev_165.bb
> +++ b/recipes/udev/udev_165.bb
> @@ -88,22 +88,6 @@ FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
>  FILES_${PN}-dbg += "/lib/udev/.debug"
>  
>  RPROVIDES_udev_append = " udev-compat-wrapper"
> -RDEPENDS_udev_append_spitz = " udev-compat"
> -do_unpack_append_spitz() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_akita = " udev-compat"
> -do_unpack_append_akita() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_c7x0 = " udev-compat"
> -do_unpack_append_c7x0() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
> -RDEPENDS_udev_append_poodle = " udev-compat"
> -do_unpack_append_poodle() {
> -	bb.build.exec_func('do_apply_compat_wrapper', d)
> -}
>  
>  # Modify init script on platforms that need to boot old kernels:
>  do_apply_compat_wrapper() {
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits



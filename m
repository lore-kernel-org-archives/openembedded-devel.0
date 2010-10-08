Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4Bzf-00083k-AN
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 14:24:22 +0200
Received: by pwj1 with SMTP id 1so221400pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 05:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=PryJBPvWaCPmDJb9CcGTyUpHbrcOP+juMJaEeDw+MDk=;
	b=qEtjoofNBg4fg6mAbbau2CbmBZGLdgHrw4MTGdrpeNTUwgxYAxhMpr/BBs4+h5LJIs
	Ll9VAgFm5lk96w+uGeNBzq3tNyOUgrO7wWNoh8JFhbfPDb0Qd3oEqbmrf6WmdBE7wJfk
	bD3bq7b8gdttIa0YPKpsKalVYr04wUAGQvmgM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=E3SYTe9nqqhaRcA3hJ/pOXJcADIJ+taJqzCXM2WcUyWjmQhQKUZoh/wABDY57Ve1XY
	E0OZYrqIfaRxW/Z56vqt5vvI0S2PhZBFMb/MCsNbFd+aq+XG/09dm5JMU4UwqVcdBJN0
	vt1BMbwW5EK47fCNHqek0pVErGwkZuiFaWBLg=
MIME-Version: 1.0
Received: by 10.114.160.2 with SMTP id i2mr2557107wae.110.1286540613714; Fri,
	08 Oct 2010 05:23:33 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 8 Oct 2010 05:23:33 -0700 (PDT)
In-Reply-To: <i8mvmu$510$1@dough.gmane.org>
References: <i8mvmu$510$1@dough.gmane.org>
Date: Fri, 8 Oct 2010 14:23:33 +0200
Message-ID: <AANLkTikfRGeqLH_c-v0jtK1WmbyB7c6YjpfKoCKHKaXR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] split kernel_do_compile into kernel_do_compile_image and kernel_compile_modules
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
X-List-Received-Date: Fri, 08 Oct 2010 12:24:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/8 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> For a long time now I have been thinking of this and today at work I
> found a case where I really need it:
>
> ti816x fbdev driver (internal to the kernel) depends on ti-syslink
> module (external), ti-syslink module requires a configured kernel tree.
>
> The reasons behind that are a bit complex, namely the framebuffer is
> done in "software" by a different processor which needs microcode to get
> loaded, etc, etc. We're working on getting that fixed, but it reminded
> my of my earlier plan.
>
> For people having simpler requirements, this allows you to (re)compile a
> *Image without waiting for a gazillion modules to build.
>
> Is anyone opposed to a change like this? The patch to kernel.bbclass is
> trivial, but a number or kernel recipes have do_compile_append that
> would need fixing.
>
> regards,
>
> Koen

Seems like a good plan to me.
Wrt the do_compile_append: that one does not seem to exist (at least
grep didn't give it to me).
There are some appends for configure/deploy/install though (see below)
I can imagine the deploy and installs also requiring some work.

Would it be a good plan to merge linux-libc-headers into this (so we
can build headers, kernel and modules from the same recipe)

Frans.

PS: I hope this does not mean getting 232 additonal recipes in the
linux dir (and yeah: maybe the linux dir could also use some cleanup).

chumby-kernel_2.6.16-chumby-1.2.bb:do_deploy_append() {
handhelds-pxa_2.4.19-rmk6-pxa1-hh42.bb:do_install_append() {
handhelds-sa_2.4.19-rmk6-pxa1-hh42.bb:do_install_append() {
ixp4xx-kernel.inc:do_install_append() {
LAB-kernel_cvs.bb:do_deploy_append() {
linux_2.6.20.bb:do_install_append_nhk15 () {
linux_2.6.26.bb:do_install_append() {
linux_2.6.27.bb:do_install_append() {
linux_2.6.28.bb:do_configure_append_smartqv7 () {
linux_2.6.29.bb:do_devicetree_image_append_boc01() {
linux_2.6.31.bb:do_devicetree_image_append_boc01() {
linux-bd-neon-2.6_2.6.22.bb:do_deploy_append() {
linux-bug_2.6.27.2.bb:do_install_append() {
linux-bug_2.6.27.2.bb:do_install_append() {
linux-dht-walnut_2.6.20.bb:do_install_append () {
linux-dht-walnut_2.6.20.bb:do_install_append () {
linux-dht-walnut_2.6.23.bb:do_install_append () {
linux-dht-walnut_2.6.23.bb:do_install_append () {
linux-efika_2.6.20.20.bb:do_install_append () {
linux-efika_2.6.20.bb:do_install_append () {
linux-efika_2.6.21+git.bb:do_install_append () {
linux-gumstix_2.6.15.bb:do_deploy_append() {
linux-handhelds-2.6.inc:do_deploy_append() {
linux.inc:do_configure_append() {
linux.inc:do_install_append() {
linux-kexecboot_2.6.21-hh20.bb:do_configure_append() {
linux-kexecboot.inc:do_configure_append() {
linux-leviathan_git.bb:do_deploy_append() {
linux-magicbox_2.6.18.6.bb:do_install_append () {
linux-magicbox_2.6.18.6.bb:do_install_append () {
linux-magicbox_2.6.19.2.bb:do_install_append () {
linux-magicbox_2.6.19.2.bb:do_install_append () {
linux-ml403-mvista-2.6.x_git.bb:do_install_append () {
linux-nokia800_2.6.21-osso71.bb:do_install_append () {
linux-omap_2.6.29.bb:do_install_append() {
linux-omap-hah_2.6.31.bb:do_configure_append() {
linux-omap-hah_2.6.31.bb:do_install_append() {
linux-omap-multi-psp_2.6.32.bb:do_install_append() {
linux-omap-pm_2.6.29.bb:do_install_append() {
linux-omap-psp_2.6.29.bb:do_install_append() {
linux-omap-psp_2.6.31.bb:do_install_append() {
linux-omap-psp_2.6.32.bb:do_install_append() {
linux-openmoko.inc:do_deploy_append() {
linux-sequoia_2.6.21.bb:do_install_append () {
linux-smdk2443_2.6.20+git.bb:do_deploy_append() {
linux-storcenter_2.6.27.7.bb:do_install_append() {
multi-kernel.inc:do_deploy_append () {



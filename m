Return-Path: <cody@arrc.ou.edu>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6CCBA72FA3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 18:29:43 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id y88so10190813ota.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrc-ou-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u3b+82BU3Bjiag73yY1d3yr8WnLY/hXNO07CnNBj2WU=;
	b=vzPv3rR4Hdv0xhMoO96qP39ApT/PGogOVbBRCCeYojYkPIIxToirv/4INZ+Mfif6w0
	/u2m/mrL81xR/hJfJluKyvTavpxxRG/zo1+JCzDcxe3il9zaUy8v3bksicP+spDnfBqf
	vesDnOeBfSkufPBZvnmoa3FN21LP5AX3CvZZfEDLB2fULXEpiVepSx0HEIQqBMAVsFvK
	BeZKt6QIco/7rVpsAlrBUsVZQ1jR+F0/g4gz6QX3HAcAI12/JF4AGsIIsEoqgBtbvh6I
	+YqgaYzd5Bh42ilt2+SNSrRDGWKgndTBhbgaNoEkKdCHob10kAh4XenmoAwK5nZvraj9
	pCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u3b+82BU3Bjiag73yY1d3yr8WnLY/hXNO07CnNBj2WU=;
	b=TmVXNFhtgtkbU2nFNM0yF89yEXx5TilXHuyqbbZxVuIH/joWdU2zdJKtR2wKhWccp3
	afGbuEfwFnH5EgrxbM55RrXNt0Yk321aDQQYO4AElKLZc4eePtNMJ+7ZrlmRnbjVEHg5
	Xk3sHQ9UuaV0XJtPd0HojQvu++/v7eThoKJZLVcJC/TaFD7g5VcHyFB4f90/dFWhDF0b
	XXBDv+kJMzO7oWBSdqjY0t4GQY17rdDkR6XYKQXGfIRdMEXuWcmz4l9Xre746TlyDD4x
	9ckJl2R02cZ9DcDvZ7Uj2e4ivD/2s5VJZRb74PtfbpfrU6y4ycMWaGw494TNloTdFIzV
	h13A==
X-Gm-Message-State: AFeK/H1TcTdKWQ1U/iFbNNmOk5CoN91uJi6Ucq9x/Cvsvg3prH7w3mMdqDYbBbx/quMgY5NHw2k+GjuhdbWAf/lq
X-Received: by 10.157.34.133 with SMTP id y5mr5618167ota.72.1490725785167;
	Tue, 28 Mar 2017 11:29:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.4.233 with HTTP; Tue, 28 Mar 2017 11:29:44 -0700 (PDT)
In-Reply-To: <CAJ86T=U6Xyrh2D4xYizX6Ly7b=6gg+Wxid1VkB60_0idG=RBwg@mail.gmail.com>
References: <1490372204-4336-1-git-send-email-cody@arrc.ou.edu>
	<CAJ86T=U6Xyrh2D4xYizX6Ly7b=6gg+Wxid1VkB60_0idG=RBwg@mail.gmail.com>
From: Cody Piersall <cody@arrc.ou.edu>
Date: Tue, 28 Mar 2017 13:29:44 -0500
Message-ID: <CAKEinFyVVOoy1FNpQKhAJKEPz9R53xsLUu7YBKeDHqzPzTemDA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-OE] Remove do_install_append() from zsh recipe.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Mar 2017 18:29:44 -0000
Content-Type: text/plain; charset=UTF-8

Hi Andre,

Thanks for the response.

On Tue, Mar 28, 2017 at 1:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Fri, Mar 24, 2017 at 9:16 AM, Cody Piersall <cody@arrc.ou.edu> wrote:
>> do_install_append() removes a lot of useful functionality from the zsh
shell.
>
> What exactly is this "useful functionality" ?
>
> Maybe it could be put in a separate package.
The recipe currently in meta-oe removes a lot of features that make zsh a
powerful shell.
A lot of zsh's nice interactive functionality is provided by files that
live in
/usr/share/zsh:  things like typing "cd <TAB>" only completing on
directories,
integration/completion with git commands, completion for various unix
utilities.  The big
drawback is that it takes up 5.5M of disk space.  For my platform this
isn't an issue, but
it could be for other people.

Unfortunately, the recipe I posted does not actually even work -- I posted
before testing
(I didn't set FILES correctly, and some things were expecting zsh to be in
/bin instead of
/usr/bin).  Sorry for wasting anyone's time if you tried it out.  I have a
working/tested
version now:


diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
index 39b2d95..1c06ef0 100644
--- a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
+++ b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
@@ -34,6 +34,7 @@ EXTRA_OEMAKE = "-e MAKEFLAGS="
ALTERNATIVE_${PN} = "sh"
ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
+ALTERNATIVE_LINK_NAME[zsh] = "${base_bindir}/zsh"
ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
ALTERNATIVE_PRIORITY = "100"
@@ -45,7 +46,10 @@ do_configure () {
}
do_install_append () {
- rm -fr ${D}/usr/share
+ if ! [ -e ${D}/bin/zsh ]; then
+ mkdir -p ${D}/bin
+ ln -s ${bindir}/zsh ${D}/bin/zsh
+ fi
}
pkg_postinst_${PN} () {
@@ -59,3 +63,8 @@ FILES_${PN}-dbg += "\
${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
"
+
+FILES_${PN} += "\
+ ${datadir}/${PN} \
+ ${base_bindir}/zsh \
+"

Cody


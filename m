Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3D67229E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 08:56:50 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id fb4so14832749wid.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 00:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=oozfKKm5dXAh+gCLk1SW4OoaEG2CnmtNi46agBSV/G0=;
	b=Pf1As/+pGNzv4opW9YkWlogZF8txhuRO0t+1GqTpUWGjJpfzbU9no7vkKopA8NSsmS
	AX7Y86zUeuM8qU/+D7E98thDk7gnp8k5hQVO1CsUhP5TcVAdn7i13NH1pwwlZOPyDTOV
	qED7zWTmTDVs05ZN8AATMuDOmkekjYg+ZQoFYVSlOCDFC/DEEYjBgZT7qdHQFcFoqUvY
	ytS6pQXoIXvwjjDHmC7j4yn2AMK743sqCV1UhBKI32arMD5V8III1pRnUEE4kNdx4Qt7
	2SCVTAzPP6PWwjizEibpTEc/JGsqSlexH94Qp86uqq5b6/iKlRy1EttAvakxWRx+8DP4
	8QOA==
MIME-Version: 1.0
X-Received: by 10.180.10.131 with SMTP id i3mr9507336wib.54.1421744210975;
	Tue, 20 Jan 2015 00:56:50 -0800 (PST)
Received: by 10.194.7.170 with HTTP; Tue, 20 Jan 2015 00:56:50 -0800 (PST)
In-Reply-To: <1421740939-2630-3-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <20141218115025.GA2462@jama>
	<1421740939-2630-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1421740939-2630-3-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Tue, 20 Jan 2015 09:56:50 +0100
Message-ID: <CA+chaQd=UiZb+MLMDUsd20+Zw1Pz6SkKLBFFS77mcrC6g+OaGw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/2] system-setup-keyboard: add new recipe
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
X-List-Received-Date: Tue, 20 Jan 2015 08:56:51 -0000
Content-Type: text/plain; charset=UTF-8

I think you should just inherit python-native

On Tue, Jan 20, 2015 at 9:02 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:

> system-setup-keyboard is a daemon to monitor the keyboard layout
> configured in /etc/sysconfig/keyboard and transfer this into
> the matching xorg.conf.d snippet.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../system-setup-keyboard_0.8.8.bb                 | 27
> ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-support/system-setup-keyboard/
> system-setup-keyboard_0.8.8.bb
>
> diff --git a/meta-oe/recipes-support/system-setup-keyboard/
> system-setup-keyboard_0.8.8.bb
> b/meta-oe/recipes-support/system-setup-keyboard/
> system-setup-keyboard_0.8.8.bb
> new file mode 100644
> index 0000000..ca71f63
> --- /dev/null
> +++ b/meta-oe/recipes-support/system-setup-keyboard/
> system-setup-keyboard_0.8.8.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "xorg.conf keyboard layout callout"
> +DESCRIPTION = "system-setup-keyboard is a daemon to monitor the keyboard
> layout configured in \
> +/etc/sysconfig/keyboard and transfer this into the matching xorg.conf.d
> snippet."
> +
> +HOMEPAGE = "https://git.fedorahosted.org/git/system-setup-keyboard.git"
> +SECTION = "Applications/System"
> +
> +SRC_URI = "
> https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${BP}.tar.gz"
> +SRC_URI[md5sum] = "399003968ccc739cddd9cc370af377a0"
> +SRC_URI[sha256sum] =
> "1ef6ef79c3588e85d7f42e99eb80a2e459f966284cf029c2d6fc1b645abcb860"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=bf57969a59612c5aca007b340c49d3a2"
> +
> +DEPENDS = "glib-2.0 python-native system-config-keyboard-native"
> +
> +do_compile() {
> +    ${STAGING_BINDIR_NATIVE}/python-native/python -v get_layouts.py >
> keyboards.h
> +    oe_runmake
> +}
> +do_install() {
> +    oe_runmake install DESTDIR=${D}
> +    install -d ${D}/etc/X11/xorg.conf.d
> +    touch ${D}/etc/X11/xorg.conf.d/00-system-setup-keyboard.conf
> +}
> +
> +FILES_${PN} += "${systemd_unitdir}/system/${PN}.service"
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


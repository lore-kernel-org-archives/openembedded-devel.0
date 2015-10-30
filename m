Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id B640F75894
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 19:31:53 +0000 (UTC)
Received: by iodd200 with SMTP id d200so90229292iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gWtxPgxCoMAcXQ11lS2Bu1ayJNczAGhEHWYRyboyRh0=;
	b=MPLudk/VY5Z4oP2ZF2aZZKnNJ5LyCKHXB8RMeJoHsSTQ5bAoNmT+duuZNu3avW7d/J
	a6ts3uqlsVmN+fBwujakuKyPISmLRaHbzEYi3mTEkpa7X7+6as4w9W7SoS5zlPPqrWFg
	CiMHSWXO00lZCWWChzzgNk/zHjBllY9Eqa1xM5n3KwkV8rmvzotj1gnHmHBkMnxubN/S
	LJtbcUbcLqNptDEYNqN86zMsMHpltQwVSYW1AbiGLZ+lCCWr8j2SHvugR8ymnrC2mAy5
	WjYUKWxYqZ5ArE1DvLoxiwdx2sCF9o5KQnf9uJ0QQBCkYP21E6sxrXVZ1uZXRwfa2ahl
	/LkA==
MIME-Version: 1.0
X-Received: by 10.107.135.95 with SMTP id j92mr10956142iod.148.1446233513168; 
	Fri, 30 Oct 2015 12:31:53 -0700 (PDT)
Received: by 10.36.31.131 with HTTP; Fri, 30 Oct 2015 12:31:53 -0700 (PDT)
In-Reply-To: <1446232789-12178-1-git-send-email-armccurdy@gmail.com>
References: <1446232789-12178-1-git-send-email-armccurdy@gmail.com>
Date: Fri, 30 Oct 2015 20:31:53 +0100
Message-ID: <CALbNGRS-8OJ=XiWQcKjQeKZ9BBvBwUZMJ_yXr2HZ=DKL+S7Eqg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ninja-native: add initial recipe, ninja 1.6.0
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
X-List-Received-Date: Fri, 30 Oct 2015 19:31:54 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 30, 2015 at 8:19 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  .../recipes-devtools/ninja/ninja-native_1.6.0.bb   | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
>
> diff --git a/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb b/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
> new file mode 100644
> index 0000000..c00710a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Ninja is a small build system with a focus on speed."
> +HOMEPAGE = "http://martine.github.com/ninja/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
> +
> +DEPENDS = "re2c-native"
> +
> +inherit native
> +
> +SRCREV="484c16336f19bd8970bb6e75322d61b92a229899"
> +
> +SRC_URI = "git://github.com/martine/ninja.git;branch=release"
> +
> +S="${WORKDIR}/git"
> +
> +do_configure[noexec] = "1"
> +
> +do_compile() {
> +    python ${S}/configure.py --bootstrap
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/ninja ${D}${bindir}/
> +}
> --
> 1.9.1
>
Yes ninja-native needs a more central place. Currently we have it (at
least - I checked my environment only) in

meta-qt5
meta-browser
meta-tizen

Once applied: Would you send patches to the other layers?

Andreas


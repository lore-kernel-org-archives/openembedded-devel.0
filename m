Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 892016BBE1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 16:10:11 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v11so9226843qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 08:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mbw6fcrKlyFYjiPmYI9YdBJxd4JWjuiQtAyHg02/OuM=;
	b=T7ilLzHc4wwS5ZmtCphFuy8MGOz+ekPvtXy8zFRd14CHtr3oNGnDGSfT68bm7JInE8
	IywteAoqtM+iTH16LrsBssv4kPBzgbv7HLTXXvq5zMLNeMp9T6uQe6owbM3cIyYSOJ8M
	73NYZLA3h48fttZY+OUHbEsiOUiRjUkHu1zW5hNK6WJouOaUjsv+eymboLXDlI4Xi/kN
	idervxj+zTnzWtku1t+m5QDdDRFd4lSghbdedzA88GSyR7+LvKtr5R6Bm9SGI4WxiSkP
	mAgyCuGwqmiOS8JRfFm4ArBjYQtUdClE9XkHar+lN2ht9/cK1i4ZBvY178swqQm5zpk0
	l+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mbw6fcrKlyFYjiPmYI9YdBJxd4JWjuiQtAyHg02/OuM=;
	b=QSxZiDzjfWILjldupwLOrDa72xlGRD4UkGLnEg58ju+sFXY1hNLUPYlwMuXI1ZwE+k
	mn/PSrLqwiPml6DVQOEHwyKouxej6KVJMw4qsb0Ulrd3sylEncEXSSn9kvM7u+DQSIux
	ZcAcmNiNXUcdsWp7RGCc3SLQRpICHuzJlU9tOTiEm/8JNCCtfmQY+PvkfICzldc8f6VO
	QJHzq8sH38KVJW/d+cRGRqXYC4cY95J8sUOXV7faPjBpl4xe/njNIiXc+B90qwsBUyyb
	LTB2CbNSZIc5shXqEkTvF6vl5mVKS2lBCvGxpa136+N+W/Q4pOJ6AlR6sFllt7bE+6Ok
	uRnQ==
X-Gm-Message-State: AJcUukdY7445s4q3HOu+cuDL6VrxxhF0QCx4a8VQC8szmhNCpBzNFZSz
	Rm1wFxlCYwCNRj0U5xj0gmm2Zq+mfkCdIKz5F10=
X-Google-Smtp-Source: AFSGD/U0puNycqDI4kGEbq9ADztfoA6HmlpzdphRjNNC5L9BROE2tMzYkTrW0gcSTVuJ/9E4VNoAW//fKy/aFa4yZgI=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr6619558qtk.253.1545495012065; 
	Sat, 22 Dec 2018 08:10:12 -0800 (PST)
MIME-Version: 1.0
References: <1545488571-406-1-git-send-email-ankit.tarot@gmail.com>
In-Reply-To: <1545488571-406-1-git-send-email-ankit.tarot@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Dec 2018 08:09:45 -0800
Message-ID: <CAMKF1spMgZDWJ61BeLkAWrG3ytgm=rHA9aOYWgpzbpHAjBx7kA@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] spirv-cross: Initial recipe for SPIRV-Cross
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
X-List-Received-Date: Sat, 22 Dec 2018 16:10:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 22, 2018 at 6:21 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Add generic recipe for SPIRV-Cross tool.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  ...0001-Add-install-PHONY-target-in-Makefile.patch | 31 ++++++++++++++++++++++
>  meta-oe/recipes-graphics/spir/spirv-cross_git.bb   | 22 +++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
>  create mode 100644 meta-oe/recipes-graphics/spir/spirv-cross_git.bb
>
> diff --git a/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch b/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
> new file mode 100644
> index 0000000..78598ea
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
> @@ -0,0 +1,31 @@
> +From 8d9870b66c3cfcf12ce7e8e013946e2a215bb722 Mon Sep 17 00:00:00 2001
> +From: Ankit Navik <ankit.tarot@gmail.com>
> +Date: Sat, 22 Dec 2018 19:16:02 +0530
> +Subject: [PATCH] Add install PHONY target in Makefile
> +
> +---
> + Makefile | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 0564b65..0993372 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -35,7 +35,13 @@ $(STATIC_LIB): $(OBJECTS)
> + %.o: %.cpp
> +       $(CXX) -c -o $@ $< $(CXXFLAGS) -MMD
> +
> ++install:
> ++      mkdir -p $(TARGET_DIR_BIN)
> ++      mkdir -p $(TARGET_DIR_LIB)
> ++      cp $(TARGET) $(TARGET_DIR_BIN)/
> ++      cp $(STATIC_LIB) $(TARGET_DIR_LIB)/
> ++
> + clean:
> +       rm -f $(TARGET) $(OBJECTS) $(CLI_OBJECTS) $(STATIC_LIB) $(DEPS)
> +
> +-.PHONY: clean
> ++.PHONY: all install clean
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/spir/spirv-cross_git.bb b/meta-oe/recipes-graphics/spir/spirv-cross_git.bb
> new file mode 100644
> index 0000000..b787972
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/spir/spirv-cross_git.bb
> @@ -0,0 +1,22 @@
> +SUMMARY  = "SPIRV-Cross is a tool designed for parsing and converting SPIR-V \
> +to other shader languages"
> +LICENSE  = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +SECTION = "graphics"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "ed16b3e69985feaf565efbecea70a1cc2fca2a58"
> +SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git \
> +       file://0001-Add-install-PHONY-target-in-Makefile.patch \
> +"
> +
> +EXTRA_OEMAKE += 'TARGET_DIR_LIB="${D}${libdir}"'
> +EXTRA_OEMAKE += 'TARGET_DIR_BIN="${D}${bindir}"'
> +
> +do_compile () {
> +       cd ${S} && oe_runmake
> +}
> +
> +do_install () {
> +       cd ${S} && oe_runmake install
> +}

this is not inheriting cross class, I think its better to rename it
something not cross
may be spirv-compiler or some such


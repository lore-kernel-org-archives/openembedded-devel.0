Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id C87A674572
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 20:32:20 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id r37-v6so19910259qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Sep 2018 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U5ULPfOxt7KkUUl56YRY3CmqrU+yqZRqp6VUjxxKO/0=;
	b=RnuHxddAivMs+uJH40Ls+1n7XrVCCGx9LguvcdvTj7/KrTS/xy//rzsuGEG/O4tXAy
	4wsvhJcf0fSx9mMMHa3zDl3P+Bf1Ppeo3F1jiF19/XRrEyYx8+53uYLi8vMZsuw3ZQ8T
	ExsdQs7884Oeguk9eATPFCGaTticQ7FZtnqVz1l0PDEQS962jAHeu8fdTQE0rkxf69yB
	Uvcl4zzbOrtd2VIn0WfC4cPThkO9B9bHBcNwIRDT3Xz9XcM8gt17V4QJ5SwungX05beL
	YJyPz8D93mJZ9tRC3Y64moi1IgHr9N0YiJr0EEQWx7t50PtWVklesKsSxb362Qd5m+K6
	Psfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U5ULPfOxt7KkUUl56YRY3CmqrU+yqZRqp6VUjxxKO/0=;
	b=rhIyNdeJ4DfcBRJFsJxZlGneVUXbBjwkXyzwtzWfBYlOMwbcUZGIQgaHa8lw4JgQym
	eku//oAUg3gV1sYYfhRcR72FT6C+FGSS5uZdMZpuxT3M+4628gL4TlWVudN2QegEGPGJ
	ewV6JgDRW8xUgYYN3rWwxtrnOcku4raU+r/lwfN9osrzAPHqyeVs71ubTOSl9KaqTA/N
	gDonkF492zRCP/H7TtbkTxe1Lh1IDb9bRtrDhYxLq3Kh3s+arBSmwXEsbJRWOe55aJ1n
	i836223WN7mAYuGrTZO2w666JI3hmzLn5ECbX9URu3KbhsDuowta55OOM1Lik6XVeQSS
	jH3A==
X-Gm-Message-State: APzg51BIr8W1NI8u0qDi6FneBvjH5j2QDI6An8jQgLb3koxD6JnZj8kk
	r0hi+5Awz/HWWkwf3BxXOsQbCaBRtmiiP3aelBAsGByT
X-Google-Smtp-Source: ANB0VdYeelgEYfD4w6xEABZFLxiu1Phj3NrT3KA9oTc8HebIK2el6LbAq0eFCSPsMgkST89EU2cPuTlE64ebp2dSf9w=
X-Received: by 2002:a0c:87f8:: with SMTP id
	53-v6mr10040467qvk.228.1536438741284; 
	Sat, 08 Sep 2018 13:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <1536417214-146096-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1536417214-146096-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Sep 2018 13:31:55 -0700
Message-ID: <CAMKF1soJdQnygZD9sbmKZazJFm=G_ugjogz_jnfAppd5q7oT1A@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sanlock: add version 3.6.0
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
X-List-Received-Date: Sat, 08 Sep 2018 20:32:20 -0000
Content-Type: text/plain; charset="UTF-8"

fails to build with musl and may be clang

http://errors.yoctoproject.org/Errors/Details/192148/
On Sat, Sep 8, 2018 at 7:34 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> A shared storage lock manager.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb | 35 +++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
>
> diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
> new file mode 100644
> index 0000000..e9a5792
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "A shared storage lock manager"
> +DESCRIPTION = "sanlock  is  a lock manager built on shared storage.  Hosts with access \
> +to the storage can perform locking.   An  application  running  on  the \
> +hosts  is  given  a small amount of space on the shared block device or \
> +file, and uses sanlock for its  own  application-specific  synchronization. \
> +Internally,  the  sanlock  daemon manages locks using two disk-based \
> +lease algorithms: delta leases and paxos leases."
> +HOMEPAGE = "https://pagure.io/sanlock"
> +SECTION = "utils"
> +
> +LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
> +LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
> +
> +SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
> +          "
> +SRCREV = "90b2ffa77edd46bea007b7bb39bfd4d2db2ff7af"
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "libaio util-linux"
> +
> +inherit distutils
> +
> +do_configure[noexec] = "1"
> +
> +do_compile_prepend () {
> +    oe_runmake -C wdmd CMD_LDFLAGS="${LDFLAGS}" LIB_LDFLAGS="${LDFLAGS}"
> +    oe_runmake -C src CMD_LDFLAGS="${LDFLAGS}" LIB_ENTIRE_LDFLAGS="${LDFLAGS}" LIB_CLIENT_LDFLAGS="${LDFLAGS}"
> +    cd ${S}/python
> +}
> +
> +do_install_prepend () {
> +    oe_runmake -C wdmd DESTDIR=${D} install
> +    oe_runmake -C src DESTDIR=${D} install
> +    cd ${S}/python
> +}
> --
> 2.8.1
>


Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 192D6771DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 19:24:35 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l37so21252092wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 12:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m8NTvv9zqrMUguJY1LjTQJ+ed2TZlUdvyF1tEYw/0KI=;
	b=og2oDz+fnBhSGxcUXbW1GlLL+NwZHHlpQmPN16X7TdHKpefFpJ7U75cdQoXxR4DOWu
	2ikBo3xr8oE/+EJUg3WycXtxJgsdkHR2N77beB+++hl/mTWG0rQ8XJhJ3L0yJBqw/ubT
	SAN3x1ZUkCNx20cnGUGJ1K8tBdE8osRGEc4bw+7rz6Pu1m3O4IHgu02GprjXDGQwpSmX
	UskbiAeGYQZJX02IlkJEU6VNrQ2gWVVINkcypb+XGlTiMbqyyC5bJJ7B1DWcrNdaBg/i
	CTTzSDiP5l9u22CZ/a4FjfCwMHbQ8W3OXw+U/iJ8hKSn7IJh6HYkT4kLdEzh16ezJNxr
	3KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m8NTvv9zqrMUguJY1LjTQJ+ed2TZlUdvyF1tEYw/0KI=;
	b=V4RHe7QdA74FEsvBAKxRrzLt6aXpNCLSQK6qQVtGUzcs9sQbUAshUaEegSAYKtuuNe
	cOtbYV1XmxDe0Hlib4UPKjV6YhcL/Q6rWMsoIKZC4sf4BBbcLIPedRr2q4yBpYtq8DZT
	hBXXCS7r8bw+cFSeuVcuU0Rk3yTw7RwKXHOR2hN1I0NOKScO+66mWUcf2ZvizCi3p/OO
	7QlLKGAR1OFkVRilRQL7KBA1CSsKBK3VPJpDD4m0tbbQWrhYYc7LfUg7DsxK5Y+PW+CG
	t9rVtq52XNscXEZtVF+e2zKc4exmz1cjLZYCk8dzRF1EVW4psi0wVgMPLCm5rPXxxSIq
	o79g==
X-Gm-Message-State: AMke39kcH0ut+FBOn8CTjDXbzT/jJwaqSudADNkdGCVZ7SlC6uPiW0HJyeMmIpf6WqmMsqaHecjKwMn492vGmQ==
X-Received: by 10.223.182.133 with SMTP id j5mr32940989wre.19.1489433076664;
	Mon, 13 Mar 2017 12:24:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Mon, 13 Mar 2017 12:24:36 -0700 (PDT)
In-Reply-To: <1485380601-6226-1-git-send-email-armccurdy@gmail.com>
References: <1485380601-6226-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 13 Mar 2017 12:24:36 -0700
Message-ID: <CAJ86T=Vyib+dD2ujiFZegeUQTFPqBfowTbD0BUNhz9=KZPt7jg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] luajit: test SITEINFO_BITS instead of maintaining a list of 32bit targets
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
X-List-Received-Date: Mon, 13 Mar 2017 19:24:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 25, 2017 at 1:43 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> When cross compiling, the word size of the compiler set via HOST_CC
> must match the word size of the target. That's achieved by appending
> "-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.
>
> Unfortunately the current list of over-rides (powerpc, x86 and arm)
> does not cover all cases (e.g. it ignores MIPS). Using SITEINFO_BITS
> is a more generic solution.

Ping.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> index 964dc1d..430279f 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746bee
>
>  S = "${WORKDIR}/LuaJIT-${PV}"
>
> -inherit pkgconfig binconfig
> +inherit pkgconfig binconfig siteinfo
>
>  BBCLASSEXTEND = "native"
>
> @@ -21,9 +21,7 @@ BBCLASSEXTEND = "native"
>  # you need to install the multilib development package (e.g.
>  # libc6-dev-i386 on Debian/Ubuntu) and build a 32 bit host part
>  # (HOST_CC="gcc -m32").
> -BUILD_CC_ARCH_append_powerpc = ' -m32'
> -BUILD_CC_ARCH_append_x86 = ' -m32'
> -BUILD_CC_ARCH_append_arm = ' -m32'
> +BUILD_CC_ARCH_append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
>
>  # The lua makefiles expect the TARGET_SYS to be from uname -s
>  # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
> --
> 1.9.1
>


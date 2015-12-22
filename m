Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7F02860107
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 22:52:56 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l126so126479450wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 14:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=bCC/c2AoGDDi2hdCOWdERh7XVZHrlPYolDV7jeLODtA=;
	b=bHPMuCUuApgZjcMpEjNwf9LZyMUyvseggT3RLX8M2ObLCBLJiwOZhko6B7HOxQhkj6
	fptKDT/EiTeQW7aulRJ+ihtvIpilIhVtrxdhd/7hOA6159e95hQkC2/5o4/XKBNZRZ74
	M478W7wxtpr9Iy+bXJVqdpVgf7C5kqNkZZL/6jPeWl4LFjU23t961Ri1tOdxdhLNdZMz
	og3SD9gQref+RlyjO9gvpJ8XIxC3cSMQ6JRhLyLzOitlmOEDDBltO0pdHOw7FZuT0tkm
	kigPsuQwZx1tgycK6i8wx45XfsFsifna92Hmii1HvA+sXHd2RAAX8OEG7Ja9O5sJ4VAo
	4+kQ==
MIME-Version: 1.0
X-Received: by 10.28.146.18 with SMTP id u18mr28606112wmd.72.1450824776850;
	Tue, 22 Dec 2015 14:52:56 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 22 Dec 2015 14:52:56 -0800 (PST)
In-Reply-To: <1450813380-3570-1-git-send-email-philip@balister.org>
References: <1450813380-3570-1-git-send-email-philip@balister.org>
Date: Tue, 22 Dec 2015 14:52:56 -0800
Message-ID: <CAJ86T=VVf3_etCwsns3n6W2qFUwgkjK0krtHbZcb-XV4xCxoDQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] thrift: Add recipe for Apache Thrift.
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
X-List-Received-Date: Tue, 22 Dec 2015 22:52:56 -0000
Content-Type: text/plain; charset=UTF-8

 On Tue, Dec 22, 2015 at 11:43 AM, Philip Balister <philip@balister.org> wrote:
>  * Run tested cpp bindings with GNU Radio Control Port.
>
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  .../recipes-connectivity/thrift/thrift_0.9.3.bb    | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
>
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
> new file mode 100644
> index 0000000..43b93cd
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
> @@ -0,0 +1,30 @@

Maybe add SUMMARY, DESCRIPTION and HOMEPAGE ?

> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e4ed21f679b2aafef26eac82ab0c2cbf"
> +
> +SRC_URI = "git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=https \
> +"
> +SRCREV = "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "thrift-native boost python libevent flex-native bison-native openssl"

Move DEPENDS above SRC_URI.

> +BBCLASSEXTEND = "native nativesdk"
> +
> +inherit pkgconfig cmake pythonnative
> +
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +export BUILD_SYS
> +export HOST_SYS
> +
> +EXTRA_OECMAKE = "-DWITH_QT4=OFF"
> +EXTRA_OECMAKE_append_class-native = "-DWITH_QT4=OFF -DBUILD_TESTING=OFF \
> +             -DBUILD_EXAMPLES=OFF -DWITH_CPP=OFF"

-DWITH_QT4=OFF is duplicated and _append without a leading space looks dubious.

Maybe better for the native and nativesdk classes to just over-ride
EXTRA_OECMAKE rather than try to append?

> +EXTRA_OECMAKE_append_class-nativesdk = "-DBUILD_TESTING=OFF \
> +             -DBUILD_EXAMPLES=OFF -DWITH_PYTHON=OFF"
> +
> +do_install_append () {
> +       cd ${D}/${bindir}
> +       ln -sf thrift thrift-compiler

Perhaps drop the unnecessary cd, ie:

  ln -sf thrift ${D}/${bindir}/thrift-compiler

> +}
> +
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


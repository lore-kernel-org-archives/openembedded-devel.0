Return-Path: <joe@deserted.net>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id F3E3360196
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 01:44:03 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id rd18so6678589iec.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2014 18:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=gpGFbfiip9qBLIyjIM7r1kk1l9+9rtywFWCyiG3TWlA=;
	b=iu5RlKINmBu+LSKzbnd1Zvfy2VAM2jfVpKpEqAe33G0N4d9T7AEVzy3SAEHlI091yM
	XrWUTXEm+fO2dYoPifVpBj1vBF2IDMSJpRJ8gsYxlFlUJsxO7Rz//TJgv6gIZujKt4em
	uGong0RUVstQneFiznxYBPsVQCnIjm9/cUFZFsxTC7ctOcR+cRpIWsTrbQwYfas46tIN
	xEENncqsggcZVwk22Dy4I/N88asifVhm78WV3+QHfGG5gHrJDkV3es5Rhszp5OewGzK2
	rKQZ0PzPaIcIWrL6Mi04GCIyhz4Mk/9L0H5tONbOSeYESd3K42Fnf7QB5hL1Ph2zt/wn
	XSfg==
X-Gm-Message-State: ALoCoQl4/VJ4X9siBF/BjumEWrz5xQT0IdIXrMQ4TtL4p3HaJiCeqKDfyYcS5Zs9XV3d9cD6yES3
MIME-Version: 1.0
X-Received: by 10.50.79.201 with SMTP id l9mr799862igx.11.1401846244772; Tue,
	03 Jun 2014 18:44:04 -0700 (PDT)
Received: by 10.42.81.130 with HTTP; Tue, 3 Jun 2014 18:44:04 -0700 (PDT)
In-Reply-To: <1399997660-12190-1-git-send-email-mihaela.sendrea@enea.com>
References: <1399997660-12190-1-git-send-email-mihaela.sendrea@enea.com>
Date: Tue, 3 Jun 2014 21:44:04 -0400
Message-ID: <CANBf+V0TSv+9P7ieWDBX7ZsgMYYw4T-x9WXKUe-23GMcMvD2Fg@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v5 1/2] lksctp-tools: add recipe (version 1.0.16)
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
X-List-Received-Date: Wed, 04 Jun 2014 01:44:04 -0000
Content-Type: text/plain; charset=UTF-8

Merged, thanks.

-J.

On Tue, May 13, 2014 at 12:14 PM, Mihaela Sendrea
<mihaela.sendrea@enea.com> wrote:
> This recipe comes from arago-oe-dev:
> https://github.com/mrchapp/arago-oe-dev/tree/master/recipes/lksctp-tools
>
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> ---
>  .../lksctp-tools/lksctp-tools_1.0.16.bb            | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
>
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> new file mode 100644
> index 0000000..102c2bb
> --- /dev/null
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> @@ -0,0 +1,43 @@
> +SUMMARY = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
> +SECTION = "libs"
> +LICENSE = "LGPLv2"
> +
> +LIC_FILES_CHKSUM = " \
> +    file://COPYING.lib;md5=0a1b79af951c42a9c8573533fbba9a92 \
> +    file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
> +"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] = "708bb0b5a6806ad6e8d13c55b067518e"
> +SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26"
> +
> +S = "${WORKDIR}/${BP}"
> +
> +BBCLASSEXTEND = "native"
> +
> +inherit autotools pkgconfig binconfig
> +
> +SOLIBVERSION="${PV}"
> +SOLIBMAJORVERSION="1"
> +
> +PACKAGES =+ "${PN}-withsctp ${PN}-utils"
> +
> +FILES_${PN} = " \
> +    ${libdir}/libsctp.so.${SOLIBVERSION} \
> +"
> +
> +FILES_${PN}-withsctp = " \
> +    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
> +"
> +
> +FILES_${PN}-dev += " \
> +    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
> +    ${libdir}/libsctp.so \
> +    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
> +    ${libdir}/lksctp-tools/libwithsctp.so \
> +    ${datadir}/lksctp-tools/*.c \
> +    ${datadir}/lksctp-tools/*.h \
> +"
> +
> +FILES_${PN}-utils = "${bindir}/*"
> --
> 1.8.5.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Joe MacDonald
:wq


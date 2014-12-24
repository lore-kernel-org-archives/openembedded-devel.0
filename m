Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 346BA726F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Dec 2014 17:54:28 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id y20so7834286ier.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Dec 2014 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=t7uUwJbYOKIIFiT6FShDo8O7p4b6S8x2HrtIvNTPRYk=;
	b=JFb5mWFUYnnCWRqbyUmCoSWKNLgYdlvV3mfkPvG9JknZqfs6XZ6Bp2Yagoyq9thM4I
	S6pHTOGjIw1gkV05HZrE9klQv4lUkjmR446FqXoxIsgobL3xaAdri00MOsf6tkgTkNXS
	T+wOwFMmH9EfeCg5DODSI2jVUrebVKnj4m/rE8ws5LfSm3r41nlObvu+9VUsc0IoZhwA
	A5+c8imuTSW1Tnta1N6lmV7M7/j4CiAEbub4gNmyUAcCOKP8JpaU9XZ6M9YIORwWGXQn
	Q6kQ0FOdOO0zBuBNO0RTR1XKQgzWFXZVapAdEDUk/Nah1kVszHwNW1X2dC5SRqT4GT45
	Fd4g==
MIME-Version: 1.0
X-Received: by 10.43.120.69 with SMTP id fx5mr27135212icc.45.1419443669116;
	Wed, 24 Dec 2014 09:54:29 -0800 (PST)
Received: by 10.50.252.9 with HTTP; Wed, 24 Dec 2014 09:54:28 -0800 (PST)
Received: by 10.50.252.9 with HTTP; Wed, 24 Dec 2014 09:54:28 -0800 (PST)
In-Reply-To: <1418983768-11857-1-git-send-email-gg@slimlogic.co.uk>
References: <1418983768-11857-1-git-send-email-gg@slimlogic.co.uk>
Date: Wed, 24 Dec 2014 10:54:28 -0700
Message-ID: <CAMKF1srz5HSkwObr6TXaZwwGd8Fk5qZbz64H9YSFqOoJG_e6PA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Graeme Gregory <graeme.gregory@linaro.org>
Subject: Re: [meta-oe][PATCH] fwts: add the Firmware Test Suite
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
X-List-Received-Date: Wed, 24 Dec 2014 17:54:32 -0000
Content-Type: text/plain; charset=UTF-8

On Dec 19, 2014 3:17 AM, "Graeme Gregory" <gg@slimlogic.co.uk> wrote:
>
> The Firmware Test Suite is a set of tests for checking ACPI and EFI
> implementations for common bugs and issues.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> Signed-off-by: Graeme Gregory <graeme.gregory@linaro.org>
> ---
>  meta-oe/recipes-test/fwts/fwts_git.bb | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-test/fwts/fwts_git.bb
>
> diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb
b/meta-oe/recipes-test/fwts/fwts_git.bb
> new file mode 100644
> index 0000000..b943d6d
> --- /dev/null
> +++ b/meta-oe/recipes-test/fwts/fwts_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Firmware testsuite"
> +DESCRIPTION = "The tool fwts comprises of over fifty tests that are
designed to exercise and test different aspects of a machine's firmware.
Many of these tests need super user access to read BIOS data and ACPI
tables, so the tool requires running with super user privileges (e.g. with
sudo)."
> +HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM =
"file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
> +
> +PV = "14.12.00"
> +
> +SRCREV = "efc18d16294f492b7f72bba64344b2eed50e6a69"
> +SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "libpcre json-c glib-2.0"
> +
> +inherit autotools-brokensep
> +

did you check why it can't  build out of tree

> +CFLAGS += "-I${STAGING_INCDIR}/json-c"
> +

May be just use -I= instead

> +FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
> +FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV}
${libdir}/fwts/lib*.la"
> +FILES_${PN}-staticdev += "${libdir}/fwts/lib*a"
> +FILES_${PN}-dbg += "${libdir}/fwts/.debug"
> --
> 2.1.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


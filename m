Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 307 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 04 Nov 2016 13:50:57 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id B501F71C41
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 13:50:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1478267458; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=USosoLdAzMoru1ooJALMSdhrr0R4VgslH2Mlw+ATv64=;
	b=oOMVcZ278C9V1yz/Z4w7ZwJAN0kmqT1EaVmaw0je05qDUB6+LcnW2YhKpi6j0mJT0aOtkMkj
	DwVWBGSaJF+lpvXpvEmln4J4q3Q5NpuyX1VsJBwVNZuqPkhbcW5SALOqnMmJO5u2K21Flmfy
	lzkqSYqA4EwyfeeScJAGIJUDrho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=no8rO4GhJJicNbCeh1jh/IVKVkDahND+VJ0uhq+AFRe90iS/8ADkX2T43junIbTEfSRep+
	IeUFw7Hmxt8TCBMJfIvK5bfTY+FJjE6EiMZHf/NG44BkTa5SiemJkmtKkw6CSE4VSSH5xDQF
	RR9wvEWlVI9PgNvSHSHYXpTrFCLkw=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mxa.mailgun.org with ESMTP id 581c910f.7f956a64fb30-in07;
	Fri, 04 Nov 2016 13:45:51 -0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id 62so162364591oif.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2016 06:45:50 -0700 (PDT)
X-Gm-Message-State: ABUngveW1qg8j5KBq8PODG9z5xrxaImQoE4OI1Kp49dxtFbCrtXxBcx4VJWUSfWdpNhvSfanYjRKXph9ss7DcQ==
X-Received: by 10.107.15.148 with SMTP id 20mr12230787iop.233.1478267150593;
	Fri, 04 Nov 2016 06:45:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.133.152 with HTTP; Fri, 4 Nov 2016 06:45:50 -0700 (PDT)
In-Reply-To: <20161104101423.20557-1-ruben.de.smet@rubdos.be>
References: <20161104101423.20557-1-ruben.de.smet@rubdos.be>
From: Derek Straka <derek@asterius.io>
Date: Fri, 4 Nov 2016 09:45:50 -0400
X-Gmail-Original-Message-ID: <CADNbA1q0Tm6-+caB187piY3bDMHbUHavbK3HL9Z1DivHdFZYbA@mail.gmail.com>
Message-ID: <CADNbA1q0Tm6-+caB187piY3bDMHbUHavbK3HL9Z1DivHdFZYbA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2] python-scales: add recipe for version 1.0.9
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
X-List-Received-Date: Fri, 04 Nov 2016 13:50:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 4, 2016 at 6:14 AM, Ruben De Smet <ruben.de.smet@rubdos.be>
wrote:

> A python module for tracking server state and statisticst
>
> Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
> ---
>  meta-python/recipes-devtools/python/python-scales.inc   | 17
> +++++++++++++++++
>  .../recipes-devtools/python/python3-scales_1.0.9.bb     |  2 ++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-scales.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-scales_1.0.9.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-scales.inc
> b/meta-python/recipes-devtools/python/python-scales.inc
> new file mode 100644
> index 0000000..4a10a78
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-scales.inc
> @@ -0,0 +1,17 @@
> +SUMMARY = "Metrics for Python"
> +DESCRIPTION = "Tracks server state and statistics, allowing you to see
> what \
> +your server is doing. It can also send metrics to Graphite for graphing
> or to \
> +a file for crash forensics."
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +# LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd
> 57"
>
Is there a reason this is commented out?  You'll need something or it will
give a QA Issue about license-checksum

> +SRCNAME = "scales"
> +
> +SRC_URI[md5sum] = "c61167f2b5f506f0a34a7b8a295a9567"
> +SRC_URI[sha256sum] = "8b6930f7d4bf115192290b44c757af
> 5e254e3fcfcb75ff9a51f5c96a404e2753"
> +
> +inherit pypi
> +
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-six \
>
Missing a closing quote here

> diff --git a/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
> b/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
> new file mode 100644
> index 0000000..91b48c2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-scales.inc
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


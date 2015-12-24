Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB6D606BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 18:43:50 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id o67so247849224iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 10:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=NIrXkXbnH9wf2wLK7xdFyPsUiXOlmUeB9QfdTdVfrU8=;
	b=GCjf97FRlbBtJMXrpZZmDnsuAhV75yECXono1N+6wHDHjGqt7wEv6R03WQ6izuNzvk
	mMUmEUMQzD7UwQlfplbW+0j0o2j49kjKaQjL2ww8/JJolQtzM37Cl59Go0ysrogxLWuQ
	U0euiHiiFx+b7NFS8f991bC6JBr/8wP18sUEuT1k8o1+vVkAdObSiySJV701ZX4aEDN/
	4WYjPUfQ0rrxMCgHbIvgGEgF+H5h4EQCJ+X6n43HNEtVgcKk6XH9ltpXZoBnMlbEK76X
	PZmwha7hb7lpQ/w5eSR1a9hoPSa3qVjHnZfHfSxwTLCxViGHbT06R3GRg415ZIsd7atW
	Y7Mg==
X-Received: by 10.107.4.213 with SMTP id 204mr42891552ioe.195.1450982630721;
	Thu, 24 Dec 2015 10:43:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Thu, 24 Dec 2015 10:43:21 -0800 (PST)
In-Reply-To: <1450954209-2353-1-git-send-email-nate.karstens@garmin.com>
References: <1450954209-2353-1-git-send-email-nate.karstens@garmin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Dec 2015 10:43:21 -0800
Message-ID: <CAMKF1sqp0gM9VgvE8M1-HAsAapDsNdNfs0S+AnaROfqFWXFYNg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Thu, 24 Dec 2015 18:43:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 24, 2015 at 2:50 AM, Nate Karstens <nate.karstens@garmin.com> wrote:
> Adds a new recipe for dhcpcd. Modifies the configure script to keep the
> host system header files from being used instead of the target system.
>

Can you also see how you differ with
https://github.com/sarnold/meta-alt-desktop-extras/blob/master/recipes-connectivity/dhcpcd/dhcpcd_1.3.22-pl4.bb

and I would prefer you to send a removal patch to above layer and let
it use it from meta-networking.

> Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
> ---
>  .../dhcpcd/dhcpcd-6.9.4/configure.patch               | 12 ++++++++++++
>  .../recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb       | 19 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.patch
>  create mode 100644 meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
>
> diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.patch b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.patch
> new file mode 100644
> index 0000000..d61b05e
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.patch
> @@ -0,0 +1,12 @@
> +--- ./configure
> ++++ ./configure
> +@@ -316,9 +316,6 @@
> + if [ "$STATIC" = yes ]; then
> +       echo "LDFLAGS+= -static" >>$CONFIG_MK
> + fi
> +-for x in $INCLUDEDIR; do
> +-      echo "CPPFLAGS+=        -I$x" >>$CONFIG_MK
> +-done
> +
> + if [ -z "$DEBUG" -a -f .fslckout ]; then
> +       printf "Found fossil checkout ... "
> diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
> new file mode 100644
> index 0000000..1c0aff4
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
> @@ -0,0 +1,19 @@
> +SECTION = "console/network"
> +SUMMARY = "dhcpcd - a DHCP client"
> +DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer to work on the attached networks without trouble and mostly without configuration."
> +
> +HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://dhcpcd.c;endline=26;md5=7daf225c91b8065ecc974fc594b2a7de"
> +
> +SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
> +           file://configure.patch"
> +
> +SRC_URI[md5sum] = "02f5043a415cd4b6d089631a0cd95f5b"
> +SRC_URI[sha256sum] = "c3f3ff7473ef158a1e71db9aea7424df2c3477ad064e2b542f27948a5abc9ba0"
> +
> +inherit autotools
> +
> +B = "${S}"
> +EXTRA_OECONF = "--enable-ipv4 --enable-ipv6"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


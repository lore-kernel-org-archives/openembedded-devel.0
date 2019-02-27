Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9F9C66D545
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 16:44:27 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w4so19996184qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 08:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9grPmA+2pau37jBvF+wpbtVd7YD2jUcsW9cKfhQaK4o=;
	b=tAnOO9B0J1Pzv20m1GJGiv683tgnZeYSXEEQp+6hjJjn0jFW9CKiSPv0RutaKmt+9N
	R6sAKvFYFq+lGO8rAhQNd6SjeT/pxUn86ygIAvsNSFaI1Rbd7jFomiNWGKd6jjvEFgQ2
	QlqNJoGcLgku9rvKnEfzDO4faYnPHCBe7EmHyZgGPQrrZUbl9/VG6jdVyF+22du+OYlG
	ovrDM5Ck4oaTGTP0BBC5LiRHV1aGJt2J2r46b2iICQ8KZUEGfWLtqvvQgUDKT3MJHehw
	o3dKytrUOaCM0Fnw/UvGXrzkDoSR8Hsa5Elf3R3kaRnmF21/YcDVU30Mg5Z8BeZXrsBJ
	wczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9grPmA+2pau37jBvF+wpbtVd7YD2jUcsW9cKfhQaK4o=;
	b=NXPWGs5Tr1GnGb5A/Mdss+Bj32xp/x02suMCZ2EzRxsPkv38EDcdsj6RNyKS1szos1
	dEAYG/iEnaZE7xQfyna002w45m3FsjbyA24LL0v9t33tERYdTSIAHOAgbhhGHdNh1Lg1
	/6Qyax1otW9VaAZtCpqpprmpBtkrbPekx97Gx2Md/rP/9p7UxA+zF5YMUojX8ouwmKyZ
	uFmJucaFGg82GF+quYHkaxV4R60zCRmr9fXzm9urzH1wjkdxEDrMNTqZC3YGTc0FnQIO
	t9/BbTly6tAeE26rHXWg5gDHDuqjlezLxDsTWGq7hPF5kE+GbUE67t9itUXrNqyZNO1V
	8XKA==
X-Gm-Message-State: AHQUAuajYK6LPgmCwWbNR5yE4G++peMrTr8bm6TwkiE2+dYLoftdAAa+
	u05zZe2otnZGWVuNA7RO/lURbFlTjs9Zrc0qJfc=
X-Google-Smtp-Source: AHgI3IZ1r1oY/4bMzF2A51xMKcwXPsYG//GrQ4Gey5UzmOj/bkaXcBa1LR4UIAfFLDq7fw2rsgWw+O1gXTMbgSz6uhc=
X-Received: by 2002:aed:2268:: with SMTP id o37mr2471362qtc.29.1551285867339; 
	Wed, 27 Feb 2019 08:44:27 -0800 (PST)
MIME-Version: 1.0
References: <1551255161-11946-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1551255161-11946-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2019 08:44:01 -0800
Message-ID: <CAMKF1sqJ4K8eYvBtbr6uRwtMk5vd4BFDwi_zbySPpeWORTArRA@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] lmsensors: read cpu information fail on ppc
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
X-List-Received-Date: Wed, 27 Feb 2019 16:44:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 27, 2019 at 12:13 AM <changqing.li@windriver.com> wrote:
>
> From: Dengke Du <dengke.du@windriver.com>
>
> The program sensors-detect in lmsensors can't read the cpu
> information on ppc and arm arch, such as: fsl-t4xxx based on ppc.
>
> This is because the program sensors-detect design for the x86 and
> x86-64, but weak on ppc and arm.
>
> So add the support for the ppc and arm, just add the correspond
> field to read in sensors-detect.
>

the patch deserves to be upstreamed to lmsensors as well. Can you
try doing that on the side ?

> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...fix-sensors-detect-can-t-read-the-cpu-inf.patch | 74 ++++++++++++++++++++++
>  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb  |  1 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
>
> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
> new file mode 100644
> index 0000000..2d5709f
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
> @@ -0,0 +1,74 @@
> +From dd9b40c54f160a44f1d78e5946d4cd00a8852802 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 21 Sep 2016 03:17:32 -0400
> +Subject: [PATCH] lm-sensors: fix sensors-detect can't read the cpu information
> + on fsl-t4xxx
> +
> +This is because two reasons:
> +
> +1. The sensors-detect program in lm-sensors depends on the file '/proc/cpuinfo',
> +   different arch write different infomation to it. That program supports x86
> +   and x86-64 well, but weak on ppc and arm.
> +
> +2. The sensors-detect program show the cpu information just design for intel's
> +   cpu, when meets other arch, it can't output the correct information.
> +
> +So we need to add the ppc and arm support for this program:
> +
> +1. add the ppc cpu information field 'cpu' in initialize_cpu_list function.
> +
> +2. add the correspond case of ppc and arm when print cpu information in
> +   print_cpu_info function.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + prog/detect/sensors-detect | 11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/prog/detect/sensors-detect b/prog/detect/sensors-detect
> +index 5f62405..ae4def1 100755
> +--- a/prog/detect/sensors-detect
> ++++ b/prog/detect/sensors-detect
> +@@ -2833,6 +2833,7 @@ sub kernel_version_at_least
> + # model name and stepping, directly taken from /proc/cpuinfo.
> + use vars qw(@cpu);
> +
> ++# The added field 'cpu' is for support the ppc.
> + sub initialize_cpu_list
> + {
> +       local $_;
> +@@ -2848,7 +2849,7 @@ sub initialize_cpu_list
> +                       };
> +                       next;
> +               }
> +-              if (m/^(vendor_id|cpu family|model|model name|stepping|cpuid level)\s*:\s*(.+)$/) {
> ++              if (m/^(vendor_id|cpu family|model|model name|stepping|cpuid level|cpu|revision)\s*:\s*(.+)$/) {
> +                       my $k = $1;
> +                       my $v = $2;
> +                       $v =~ s/\s+/ /g;        # Merge multiple spaces
> +@@ -2861,12 +2862,20 @@ sub initialize_cpu_list
> +       push @cpu, $entry if scalar keys(%{$entry}); # Last entry
> + }
> +
> ++# The field 'model name' is for ARM.
> ++# The field 'cpu' is for ppc.
> + sub print_cpu_info
> + {
> +       my $cpu = $cpu[0];
> +       if ( $cpu->{'model name'} && $cpu->{'cpu family'} && $cpu->{model} && $cpu->{stepping} ) {
> +               print "# Processor: $cpu->{'model name'} ($cpu->{'cpu family'}/$cpu->{model}/$cpu->{stepping})\n";
> +       }
> ++      elsif ( $cpu->{'model name'} ) {
> ++              print "# Processor: $cpu->{'model name'}\n";
> ++      }
> ++      elsif ( $cpu->{'cpu'} && $cpu->{'revision'} ) {
> ++              print "# Processor: $cpu->{'cpu'} $cpu->{'revision'}\n";
> ++      }
> +       else {
> +               print "# Processor: There isn't enough cpu info for this arch!!!\n";
> +       }
> +--
> +2.8.1
> +
> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
> index ffab5d6..4dbef73 100644
> --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
> @@ -12,6 +12,7 @@ SRC_URI = "https://github.com/groeck/lm-sensors/archive/V3-4-0.tar.gz \
>             file://sensord.init \
>             file://0001-lmsensors-sensors-detect-print-a-special-message-whe.patch \
>             file://0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch \
> +           file://0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch \
>  "
>  SRC_URI[md5sum] = "1e9f117cbfa11be1955adc96df71eadb"
>  SRC_URI[sha256sum] = "e334c1c2b06f7290e3e66bdae330a5d36054701ffd47a5dde7a06f9a7402cb4e"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


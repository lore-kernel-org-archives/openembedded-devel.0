Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id 96F616100F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 01:42:24 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id d11so7719035qko.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 17:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=azHU8H4cOAyGnyyLmUc4fc+8b/431YLrj0hVdqJkzBI=;
	b=k2QtURztaQCr20TFHDf47abKWNH22qjar1/50j4Mnb4FsQlzTia67OhEw74xI8lUgP
	kJLyuVa8VHr50xnKgKL37Lhg/8OFR1OEksbGXsFDAaqkNq/q8O+Bbg9pVLvyCrvLfs+O
	XtACUdfFTof6peSqnFzNBbQM0/bUws9jcuR/CY6FuzysCCAvV3wZ4Vk8MNuM7D0lTmwO
	2mCUcN1ocNnoSwO0G2km14DVHN9n3IVq2IE0ZsYGXp7SVybLE7AkCIFTCX4602Ll3x+1
	H5aAKVnXRwSZPfMZi4vSpMrJr+YCW47Y4++vjVOqnicn789Hhqm+WY15DPfRg/YyDbZ9
	6r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=azHU8H4cOAyGnyyLmUc4fc+8b/431YLrj0hVdqJkzBI=;
	b=FSHKIVEjf26m0SQUN8x/Sab4VK7ilSiWwOMwyZV/FepcbbNdNf76IcRd1gBpLCdG1Y
	w5eY89k2XFEpaEBqmoc6h/O6mYKAoUtWJ6S+9yXFEjgRFseerIFHy+Kp/uDUrNcVH3R6
	In0m3MbsiqWoz6wrvWaP5zJHTl+AwCVrXwpOKhAQjd2Isx6uzBO+KfYe48JtkivSA3bz
	tiKR2lBt8QxYCHvPsnHoEJeQ3JX8pX/ehclsqUgSU3xFPkvUooW4dfXttNSS0o9hZPfH
	DyXlR/2IofwYTMiR2nBnvJiDfhhowhXTlHi9RD/yYzjmDVxDMM3fVSaU5AqiwqdIngv+
	7V6g==
X-Gm-Message-State: APjAAAVGzVPu1uuAmdHpRwHjq7ZqzUkDgFS1yBEx+yVeinwXVHFtuTZK
	9A0Nv9Fy47rHmTrly99eno46ey2vtfCCXI4IBnCcn6Z5UGI=
X-Google-Smtp-Source: APXvYqyUGIZLH9q5l8NvSRAY/xR2Gi8L+3Upv8kWp9qoinvSFTIvs0hEMWPS+8RNiwKoTCqJNUdqko2bhZtIuMjUjsA=
X-Received: by 2002:a37:de05:: with SMTP id h5mr429141qkj.474.1581644545221;
	Thu, 13 Feb 2020 17:42:25 -0800 (PST)
MIME-Version: 1.0
References: <20200213232220.109189-1-jonathan.richardson@broadcom.com>
In-Reply-To: <20200213232220.109189-1-jonathan.richardson@broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 17:41:59 -0800
Message-ID: <CAMKF1srr9h4BU9g6NHV66TFfJxv9DOpP-PVXZEPDuFJO+pw9Ng@mail.gmail.com>
To: Jonathan Richardson <jonathan.richardson@broadcom.com>
Cc: Randy Schacher <stuart.schacher@broadcom.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] pcimem: add initial version 2.0
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
X-List-Received-Date: Fri, 14 Feb 2020 01:42:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 3:22 PM Jonathan Richardson via
Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
>
> From: Randy Schacher <stuart.schacher@broadcom.com>
>
> Initial revision from 09724edb1783a98da2b7ae53c5aaa87493aabc9b
>
> Reviewed-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> Reviewed-by: Randy Schacher <stuart.schacher@broadcom.com>
> Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> ---
>  meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
>
> diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> new file mode 100644
> index 000000000..ee2b1846b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Simple program to read & write to a pci device from userspace"
> +HOMEPAGE = "https://github.com/billfarrow/pcimem"
> +BUGTRACKER = "https://github.com/billfarrow/pcimem/issues"
> +SECTION = "devel"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +COMPATIBLE_HOST = "(x86_64|aarch64|arm)"
> +
> +SRCREV = "09724edb1783a98da2b7ae53c5aaa87493aabc9b"
> +SRC_URI = "git://github.com/billfarrow/pcimem.git "
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/pcimem ${D}${bindir}

both installs could be squashed with
install -D -m 0755 ${B}/pcimem ${D}${bindir}/pcimem

> +}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


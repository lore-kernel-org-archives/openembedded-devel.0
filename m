Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 72A567605D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 14:44:09 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id q12-v6so3592303ual.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jul 2018 07:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HReOL0qXK8EONRu0DxjDDCxuLlImXk2pG5pGpmNnKGI=;
	b=A5ssuDbA39N253RJFUEncQWnobOlHGP/w+oDtdOxAxEwRp+D/dOLyZm0h9YzVBU7mf
	shZaoQZpk1//d+Rxnja9A/QND7j2xyEpXOK4YuXMTsNIyrDWgWvDQ3qmxBRgRlibQ1Sq
	o80cNXwBrkIul5O+YjswmacSqAhI94VHwb9Ki6E11buIS3lHpQx1FxNdw1HW9B2dGVd8
	RuWhqo92LhSXnKw6rXXlQRr9vwNC+G6djLw5xBB+IHDLyWOdeL9VT7E8Q3XQ44BIG/9W
	Kt23gqsTyk+rL4O+biMdOIDOzSKHAFP6vZ6DFvukrCkaoSsY4GJwngnExQ4i3+CUfIYa
	yChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HReOL0qXK8EONRu0DxjDDCxuLlImXk2pG5pGpmNnKGI=;
	b=nsvAe9yQeawDz2kwaJJEj6dVlorrECttB6+5PaXVvdOOa7chWk8M3BZ8NGpXcAONpW
	ZSwEiI5GuJVYU6HR5Ddmtc7eQjcGhog/VRswveffzHID6k1MLc0s/Bak3FayBQMdXGyC
	fqzBdoCNeQPzQx0XXIzu+ngzsD6CpCX6hpoPwxIVXjduoT1hnGcX5MFSQs1s4MN4HU2S
	+aWLYun9UHieQCZqNphRP3gBLhlqc1EpwvmfLCD+pcT91tx0UoyzuMNX7rFztIB66trA
	gaIAD9J5L2E19zuRHwkE5aMRPqYer4JuiEjM9tk6gruAuaZYTawDwKryFC4g2NDfJ9hD
	9vEA==
X-Gm-Message-State: APt69E3zTGzp5VuC5SDRi48DJ6rm8Nwtns58AEnU23JwVH9l0F+H7khH
	qb0bPpp0u7cIKZVQGTh2SP0hx6KPEHhnufg/F4U=
X-Google-Smtp-Source: AAOMgpeYgLiJHvNUdESZKEGM4IJqSblMHQfceqfGgQBoWZM83wO2TiwYjNVG0Kdzn4j6RpV71rLXJtd8hzxc4ZOlad8=
X-Received: by 2002:ab0:7296:: with SMTP id
	w22-v6mr1376643uao.184.1530715449997; 
	Wed, 04 Jul 2018 07:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180704085702.14811-1-alexandru.vasiu@ni.com>
In-Reply-To: <20180704085702.14811-1-alexandru.vasiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jul 2018 07:43:01 -0700
Message-ID: <CAMKF1spt6G=YrQRT5f_SWweGib4k47bg_ZyS63gGKLR6o2foOA@mail.gmail.com>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-python][PATCH v3] python-pyiface: Upgrade to 0.0.7
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
X-List-Received-Date: Wed, 04 Jul 2018 14:44:09 -0000
Content-Type: text/plain; charset="UTF-8"

I am seeing license change which is not accounted for in checksum

ERROR: python-pyiface-0.0.7-r0 do_populate_lic: QA Issue:
python-pyiface: The LIC_FILES_CHKSUM does not match for
file://LICENSE.txt;md5=fe06497acaf4f45999925d348c2605f9
python-pyiface: The new md5 checksum is 4fe869ee987a340198fb0d54c55c47f1
python-pyiface: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
                    GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

                            Preamble

  The GNU General Public License is a free, copyleft license for
...
if any, to sign a "copyright disclaimer" for the program, if necessary.
For more information on this, and how to apply and follow the GNU GPL, see
<http://www.gnu.org/licenses/>.

  The GNU General Public License does not permit incorporating your program
into proprietary programs.  If your program is a subroutine library, you
may consider it more useful to permit linking proprietary applications with
the library.  If this is what you want to do, use the GNU Lesser General
Public License instead of this License.  But first, please read
<http://www.gnu.org/philosophy/why-not-lgpl.html>.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
python-pyiface: Check if the license information has changed in
/mnt/a/oe/build/tmp/work/core2-64-bec-linux/python-pyiface/0.0.7-r0/pyiface-0.0.7/LICENSE.txt
to verify that the LICENSE value "GPLv3+" remains valid
[license-checksum]
On Wed, Jul 4, 2018 at 1:57 AM Alexandru Vasiu <alexandru.vasiu@ni.com> wrote:
>
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta-python/recipes-devtools/python/python-pyiface.inc        | 4 ++--
>  .../{python-pyiface_0.0.6.bb => python-pyiface_0.0.7.bb}      | 0
>  .../{python3-pyiface_0.0.6.bb => python3-pyiface_0.0.7.bb}    | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pyiface_0.0.6.bb => python-pyiface_0.0.7.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.6.bb => python3-pyiface_0.0.7.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
> index 8e464a83f..c341779bf 100644
> --- a/meta-python/recipes-devtools/python/python-pyiface.inc
> +++ b/meta-python/recipes-devtools/python/python-pyiface.inc
> @@ -5,7 +5,7 @@ LICENSE = "GPLv3+"
>
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fe06497acaf4f45999925d348c2605f9"
>
> -SRC_URI[md5sum] = "2379d8d4506e6c4d83cf3d4824abce8b"
> -SRC_URI[sha256sum] = "774ea47bb1387e493f6d5d0937b68fa28202c948eccddbd6e4cf2d708dcd86f2"
> +SRC_URI[md5sum] = "1bbc53c281925eae5f508b8b1a1f8259"
> +SRC_URI[sha256sum] = "83a64f5672cda48776ca9ed228dbf2e2df7b074a7dcb52ed4f6987322051928d"
>
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.7.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> rename to meta-python/recipes-devtools/python/python-pyiface_0.0.7.bb
> diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.7.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.7.bb
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


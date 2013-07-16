Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id E16446B203
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 15:36:08 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id f4so1004965oah.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xbHEo0U46+LapekoTQt0baMTCkF5W39OJKI7Jn1tEqA=;
	b=oMfnOXPYMydmkH+aDQAYloTS3/IfQ+2jhYynghC8T47VGdr4OrZlwAUyriTYjeJAiJ
	FWrWuX7YnBDKm/sLoTK8dn/9EiYzhKZzCSuFTj9GKhb7S112L6+5gLfTiFBrPfEI5epX
	Ae4dlZdYId9PvIisVGkqv8y4FvlH+TFfmAHj5gJ8UBrCCcQacwaHVYFSlorYeg5KnQ03
	+pynbeIuaKbb/VySiFw4KToqgsGrbU17EHqHvOGbSbTkJS8Pv+SJIir3Gy2PekvpIbHa
	oV+ySwkZE/B/RpCUQuIOemiVgzhNDAdPu9AdVMZ++2GgCduIO/3nQuKtKXAJBLSRuUnV
	wMDg==
MIME-Version: 1.0
X-Received: by 10.182.134.229 with SMTP id pn5mr292422obb.9.1373988969006;
	Tue, 16 Jul 2013 08:36:09 -0700 (PDT)
Received: by 10.60.37.65 with HTTP; Tue, 16 Jul 2013 08:36:08 -0700 (PDT)
In-Reply-To: <f70cc47eb65740d7307194b9a4e3414f78180348.1373726565.git.paul.eggleton@linux.intel.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
	<f70cc47eb65740d7307194b9a4e3414f78180348.1373726565.git.paul.eggleton@linux.intel.com>
Date: Tue, 16 Jul 2013 17:36:08 +0200
Message-ID: <CAGiJk9cSOsY4Lb1-KKJrtLAX05J680diw4HSFfg7LW56ga7Hrg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] protobuf: add recipe from meta-virtualization and tweak
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
X-List-Received-Date: Tue, 16 Jul 2013 15:36:09 -0000
Content-Type: text/plain; charset=UTF-8

2013/7/13 Paul Eggleton <paul.eggleton@linux.intel.com>:
> * Add proper SUMMARY
> * Break long DESCRIPTION onto multiple lines
> * Reorder some lines
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
> new file mode 100644
> index 0000000..c4ed5e6
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Protocol Buffers - structured data serialisation mechanism"
> +DESCRIPTION = "Protocol Buffers are a way of encoding structured data in an \
> +efficient yet extensible format. Google uses Protocol Buffers for almost \
> +all of its internal RPC protocols and file formats."
> +HOMEPAGE = "http://code.google.com/p/protobuf/"
> +SECTION = "console/tools"
> +LICENSE = "BSD-3-Clause"
> +
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
> +
> +SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "dc84e9912ea768baa1976cb7bbcea7b5"
> +SRC_URI[sha256sum] = "eac6969b617f397247e805267da2b0db3ff9e5a9163b123503a192fbb5776567"
> +
> +EXTRA_OECONF += " --with-protoc=echo"


Hi,

do you know why it doesn't use:

EXTRA_OECONF += "--with-protoc=${STAGING_BINDIR_NATIVE}/protoc"

in combination with DEPENDS += "protobuf-native" in protobuf?
Instead the recipe that uses protobuf/protoc depends on protobuf and
protobuf-native.

My assumption is, that the result would the same, and it is currently
skipping tests for the cross compiled protobuf.
Or does it archive anything else?



--
Regards
Samuel


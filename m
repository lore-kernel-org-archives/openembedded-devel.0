Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com (mailrelay2-3.pub.mailoutpod1-cph3.one.com [46.30.212.11])
 by mx.groups.io with SMTP id smtpd.web11.12845.1586775518062106480
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 03:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embexus.com header.s=20191106 header.b=SDLOEl0Q;
 spf=none, err=permanent DNS error (domain: embexus.com, ip: 46.30.212.11, mailfrom: ayoub.zaki@embexus.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:to:subject:from;
	bh=Gcy8NaaWF9rVIyOQ/Fq4z7BCO4XBvbPLV4ZayHjSiPA=;
	b=SDLOEl0QFWxJRSxOckD50Ftvm1Gx6smYEHbuiWDFdtpqdQNT/IhGiTh33CFJvmjl279Gyc06dUpWS
	 GT21LU6G1jlR3cLqepdBma2oxxbGsygyrIAW67mQqmQwskYeVBAV2SQCEOxIjNyTgwJ7DhvDJQl4QL
	 4ALh0opjsmv4RXz7dJfAEgZOnD6nblroBp3/+H8RkLLTjpyhrvINBFEI7NPM7bHJ2S3PHwa8oG6I32
	 T1IoBwtGGqMMbucf4Lm6tbGZTQEWs21gB7oRVXvLsxXp2yc+THfKMk6OQ3ixZMVT0kvnhGiSIxYS8l
	 z55MnX+VWs6GbPkTgN8dkINmr91uYLQ==
X-HalOne-Cookie: 5fbfa2cf931dcfda71789e95b7bcd243d583ce36
X-HalOne-ID: b8939b66-7d75-11ea-9551-d0431ea8a290
Received: from [192.168.178.41] (x4db49fc3.dyn.telefonica.de [77.180.159.195])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id b8939b66-7d75-11ea-9551-d0431ea8a290;
	Mon, 13 Apr 2020 10:58:35 +0000 (UTC)
Subject: Re: [oe] [meta-security][RFC 1/2] classes: provide a class for generating dm-verity meta-data images
To: openembedded-devel@lists.openembedded.org
References: <20200410124135.24217-1-brgl@bgdev.pl>
 <20200410124135.24217-2-brgl@bgdev.pl>
From: "Ayoub Zaki" <ayoub.zaki@embexus.com>
Organization: Embexus
Message-ID: <34f4335a-c9ed-a790-c683-3b6db93eceb7@embexus.com>
Date: Mon, 13 Apr 2020 12:58:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200410124135.24217-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,


On 10.04.20 14:41, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This adds a class that allows to generate conversions of ext[234] and
> btrfs partitions images with dm-verity hash data appended at the end as
> well as a corresponding .env file containing the root hash and data
> offset that can be stored in a secure location (e.g. signed fitImage)
> or signed and verified at run-time on its own.
>
> The class depends on two variables:
>    DM_VERITY_IMAGE:      defines the name of the main image (normally the
>                          one that is used with the bitbake command to
>                          build the main image)
>    DM_VERITY_IMAGE_TYPE: defines exactly one type for which to generate
>                          the protected image.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   classes/dm-verity-img.bbclass | 88 +++++++++++++++++++++++++++++++++++
>   1 file changed, 88 insertions(+)
>   create mode 100644 classes/dm-verity-img.bbclass
>
> diff --git a/classes/dm-verity-img.bbclass b/classes/dm-verity-img.bbclass
> new file mode 100644
> index 0000000..1c0e29b
> --- /dev/null
> +++ b/classes/dm-verity-img.bbclass
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright (C) 2020 BayLibre SAS
> +# Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +#
> +# This bbclass allows creating of dm-verity protected partition images. It
> +# generates a device image file with dm-verity hash data appended at the end
> +# plus the corresponding .env file containing additional information needed
> +# to mount the image such as the root hash in the form of ell variables. To
> +# assure data integrity, the root hash must be stored in a trusted location
> +# or cryptographically signed and verified.
> +#
> +# Usage:
> +#     DM_VERITY_IMAGE = "core-image-full-cmdline" # or other image
> +#     DM_VERITY_IMAGE_TYPE = "ext4" # or ext2, ext3 & btrfs
> +#     IMAGE_CLASSES += "dm-verity-img"
> +#
> +# The resulting image can then be used to implement the device mapper block
> +# integrity checking on the target device.
> +
> +# Process the output from veritysetup and generate the corresponding .env
> +# file. The output from veritysetup is not very machine-friendly so we need to
> +# convert it to some better format. Let's drop the first line (doesn't contain
> +# any useful info) and feed the rest to a script.
> +process_verity() {
> +    local ENV="$OUTPUT.env"
> +
> +    # Each line contains a key and a value string delimited by ':'. Read the
> +    # two parts into separate variables and process them separately. For the
> +    # key part: convert the names to upper case and replace spaces with
> +    # underscores to create correct shell variable names. For the value part:
> +    # just trim all white-spaces.
> +    IFS=":"
> +    while read KEY VAL; do
> +        echo -ne "$KEY" | tr '[:lower:]' '[:upper:]' | sed 's/ /_/g' >> $ENV
> +        echo -ne "=" >> $ENV
> +        echo "$VAL" | tr -d " \t" >> $ENV
> +    done
> +
> +    # Add partition size
> +    echo "DATA_SIZE=$SIZE" >> $ENV
> +
> +    ln -sf $ENV ${IMAGE_BASENAME}-${MACHINE}.$TYPE.verity.env
> +}
> +
> +verity_setup() {
> +    local TYPE=$1
> +    local INPUT=${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$TYPE
> +    local SIZE=$(stat --printf="%s" $INPUT)
> +    local OUTPUT=$INPUT.verity
> +
> +    cp -a $INPUT $OUTPUT
> +
> +    # Let's drop the first line of output (doesn't contain any useful info)
> +    # and feed the rest to another function.
> +    veritysetup --data-block-size=1024 --hash-offset=$SIZE format $OUTPUT $OUTPUT | tail -n +2 | process_verity
> +}
> +
> +VERITY_TYPES = "ext2.verity ext3.verity ext4.verity btrfs.verity"
> +IMAGE_TYPES += "${VERITY_TYPES}"
> +CONVERSIONTYPES += "verity"
> +CONVERSION_CMD_verity = "verity_setup ${type}"
> +CONVERSION_DEPENDS_verity = "cryptsetup-native"
> +
> +python __anonymous() {
> +    verity_image = d.getVar('DM_VERITY_IMAGE')
> +    verity_type = d.getVar('DM_VERITY_IMAGE_TYPE')
> +    image_fstypes = d.getVar('IMAGE_FSTYPES')
> +    pn = d.getVar('PN')
> +
> +    if verity_image != pn:
> +        return # This doesn't concern this image
> +
> +    if not verity_image or not verity_type:
> +        bb.warn('dm-verity-img class inherited but not used')
> +        return
> +
> +    if len(verity_type.split()) is not 1:
> +        bb.fatal('DM_VERITY_IMAGE_TYPE must contain exactly one type')
> +
> +    d.appendVar('IMAGE_FSTYPES', ' %s.verity' % verity_type)
> +
> +    # If we're using wic: we'll have to use partition images and not the rootfs
> +    # source plugin so add the appropriate dependency.
> +    if 'wic' in image_fstypes:
> +        dep = ' %s:do_image_%s' % (pn, verity_type)
> +        d.appendVarFlag('do_image_wic', 'depends', dep)
> +}
>

basically this class generate a dm-verity hash that needs to be injected 
inside the initramfs...it's a bit hacky.

wouldn't be signing the hash, include the verifiication public key in 
initramfs more portable ?


Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : ayoub.zaki@embexus.com
Homepage : https://embexus.com
VAT No.  : DE313902634


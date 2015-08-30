Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 115E076536
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 12:49:33 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so109659803pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 05:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:from:to:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=cOWkEWsDRb+TLT5ponvPv7HcBnHkpV0D31cOxzCavPo=;
	b=yX8/KPLD5//C9VcOkMogpgCxe6xVfS9a5uwjOxm5UC8Zmio6m/Dk4sMpHxnA2KqfNn
	LBV8VDf3dksA66aPuTBfDv/rQGU4+xNbEY+9Mhp+vf5KU84r4b4QOAEM4leXwCoEGjwV
	aQAAG+ilkFiUhTjqou72UkT8waHpDrK/GLpg+Cr88KyQ9EmaL2rnclL19LA0t0wKqkAn
	ubDcbAsrg+j6AdsIXON9lb97wgWN/5LORU6tGms+xKNzZG/N3IxoFwOL+lSmNH7DW4e0
	RbrnAK4RV5+Ud57VYMc8V5FOiwNVXl2KzMxFuRFKPe1lJZb8a+SB6bgzAZF1bnz/RBVp
	iGVQ==
X-Received: by 10.66.145.195 with SMTP id sw3mr29937687pab.72.1440938973722;
	Sun, 30 Aug 2015 05:49:33 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by smtp.gmail.com with ESMTPSA id
	eu6sm11241666pdb.86.2015.08.30.05.49.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Aug 2015 05:49:33 -0700 (PDT)
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
	<f7c705865ed574150e379a05345febead2237e07.1440502860.git.samuli.piippo@theqtcompany.com>
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <55E2FBD7.9020404@gmail.com>
Date: Sun, 30 Aug 2015 22:49:27 +1000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <f7c705865ed574150e379a05345febead2237e07.1440502860.git.samuli.piippo@theqtcompany.com>
Subject: Re: [meta-qt5][PATCH v2 01/11] qt5: make populate_sdk_qt5 reusable
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
X-List-Received-Date: Sun, 30 Aug 2015 12:49:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 25/08/2015 9:43 PM, Samuli Piippo wrote:
> Move task definitions from populate_sdk_qt5.bbclass to the toolchain recipe,
> so that populate_sdk_qt5 can be reused in different toolchain meta recipes.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
> ---
>   classes/populate_sdk_qt5.bbclass      | 5 -----
>   recipes-qt/meta/meta-toolchain-qt5.bb | 4 ++++
>   2 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
> index 79df489..d29ec36 100644
> --- a/classes/populate_sdk_qt5.bbclass
> +++ b/classes/populate_sdk_qt5.bbclass
> @@ -1,8 +1,5 @@
>   # Copyright (C) 2014 O.S. Systems Software LTDA.
>   
> -TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-qt5-toolchain-host"
> -TOOLCHAIN_TARGET_TASK += "packagegroup-qt5-toolchain-target"
> -
>   # This allow reuse of Qt paths
>   inherit qmake5_paths
>   
> @@ -33,5 +30,3 @@ create_sdk_files_prepend () {
>       echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
>       echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
>   }
> -
> -FEATURE_PACKAGES_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
> diff --git a/recipes-qt/meta/meta-toolchain-qt5.bb b/recipes-qt/meta/meta-toolchain-qt5.bb
> index 8991176..11b7962 100644
> --- a/recipes-qt/meta/meta-toolchain-qt5.bb
> +++ b/recipes-qt/meta/meta-toolchain-qt5.bb
> @@ -5,3 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
>                       file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>   
>   inherit populate_sdk populate_sdk_qt5
> +
> +TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-qt5-toolchain-host"
> +TOOLCHAIN_TARGET_TASK += "packagegroup-qt5-toolchain-target"
> +FEATURE_PACKAGES_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
If someone had already copied meta-toolchain-qt5 into their own layer 
and modified it, this would be a breaking change for them as they need 
to make the same changes in their own toolchain recipe. I wonder if it 
would be better if the reusable part of populate_sdk_qt5.bbclass was 
split off into populate_sdk_qt5_base.bbclass instead and inherited by 
populate_sdk_qt5.bbclass.

Regards,
Jonathan


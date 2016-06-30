Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE286E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 13:31:39 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id v190so10992984vka.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=l+kNWWG+QXoCwA3r8xPMD/xgm1ieVFRwQX1009dyUTg=;
	b=FWl+emw64eAmex7xNarL60BxITZW+vfAgA+YhMeatIaAUG5C2xAl/UI3jOpa0EiNvX
	/e8Wo02ge6MBS3ik4NxzQ9b5UgiUCICpdgwe3yKjj0eiyeJlKJojXvMw2bA+xeuns2KL
	z5GvO5xDDdCXmJ65+SuO9wJ5ygTw3q46KBMQoG7CB127UFqXrdvK2gXfrmkafM4DK5SK
	iBgs0LUsO4ov2kN1R1+D4QGc5uDpQe62IrsKhXLhXFmPdBl/QURZDS+ypKE/GEY2vI1z
	h+/IV//wKu6zWr9IqfqCZ5GO6CLVOCmmw2PwPjXkGXTwHJXCYsG7nLqUfoQ8L5fxx6kz
	S7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=l+kNWWG+QXoCwA3r8xPMD/xgm1ieVFRwQX1009dyUTg=;
	b=MfWjhvCLcaHoP2WkzROGMXHvL5Xx7vcRtwp02Cyf2hm47P5k52rYtxAGB4iFz/ExLY
	Pe+MOPkR6Q5UZaV6sJ+L8Ik+t55dxZW8YjLVb5FIT8abOJUSiXpYKwoFwIC+Uf8HYfna
	B8SvIMxt0w4FtOIFwC1N8a75ZVIcn7uVrCPhpFL/zcI8dacHaHyijg1j1pSwYaaCN7u2
	3GGn8d1Aq6rbFvwDrP5B7sF0bxG4W5klp6b/aSiZeG7/2U6oYteyE1ohY+Fq8pyEHqxT
	ObCN7EaZ5BAuzLzterSFEmmBJrzAVuxpVe0ma9vguiyRgxExb29c9urg8nku/bKw9vnc
	dWdA==
X-Gm-Message-State: ALyK8tJzpbtxcCqRzp+p2L2CWzj+pgUMveWYu14VMOQTO4n9w41WMVgpaIxVL/d9AI1Q5Z/1kKrsHKb4I7pNDA==
X-Received: by 10.176.0.136 with SMTP id 8mr966580uaj.17.1467293500125; Thu,
	30 Jun 2016 06:31:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.35.80 with HTTP; Thu, 30 Jun 2016 06:31:39 -0700 (PDT)
In-Reply-To: <1467206440-4906-1-git-send-email-bernhard@bdick.de>
References: <1467206440-4906-1-git-send-email-bernhard@bdick.de>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 30 Jun 2016 07:31:39 -0600
Message-ID: <CACS+7ZS3f=Amh4xYP5nZoH2BY1doYr_71rnD00+PjxMsk7bOEQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-8: Add update version and build number to the java binaries
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
X-List-Received-Date: Thu, 30 Jun 2016 13:31:41 -0000
Content-Type: text/plain; charset=UTF-8

On 29 June 2016 at 07:20, Bernhard Dick <bernhard@bdick.de> wrote:
> The OpenJDK builds did not include the update version and build number
> leading to problems when applications check for the minimum needed version.
> This commit fixes it by adding the update version and build number to the
> configure parameters.
>
> Signed-off-by: Bernhard Dick <bernhard@bdick.de>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index 3206ec4..70bd40c 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -229,3 +229,10 @@ JDK_ARCH = "${@get_jdk_arch(d)}"
>  export DEBUG_BINARIES = "true"
>
>  ALTERNATIVE_PRIORITY = "50"
> +
> +OPENJDK_UPDATE_VERSION = "${@bb.data.getVar('PV', d, 1).split('b')[0]}"
> +OPENJDK_BUILD_NUMBER = "b${@bb.data.getVar('PV', d, 1).split('b')[1]}"
> +EXTRA_OECONF_append = "\
> +        --with-build-number=${OPENJDK_BUILD_NUMBER} \
> +        --with-update-version=${OPENJDK_UPDATE_VERSION} \
> +"
> --
> 2.8.1
>

LGTM. I have/had a similar change locally I was going to push
alongside an update to OpenJDK.


> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


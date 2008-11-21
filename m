Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1L3X6g-00007I-Nn
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Nov 2008 15:35:38 +0100
Received: by ug-out-1314.google.com with SMTP id k3so126119ugf.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2008 06:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=+UqWdnxSsGf2Ci0ncnDv6T2WwQmR+UrTbAACA3mDsQc=;
	b=MjvkPInQpuC74QLRys+8f+biA/OzLrkdIcSOnMjSQTwuAf+S1ZUj9SiWs6R45C8bxB
	4QOnSPr7dh6QvaYYwn82eb2b4Is06npcbOH+IC1Iunk2ZIj9QmfWbMhG2P8rs/sjEp4l
	17HwiOO3fui4lIfgme5Qj3Sw5PBsEhwShXj24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NHju/iKSwMZxTBIbLkWaiiyYS6DQXLHZ+KvKCg1d+2Lj6tApZU9EIRH9TZLOFfvDNp
	WSI5pO/UmxAJXQwYx1f3iBFiwoIWRqXzfdPJEFKMXP494XilW3vPN5LbM/069h53jeVa
	9uGR5vCwnReP/yTUJUu25lg5h/1qOctLs/nN0=
Received: by 10.86.91.12 with SMTP id o12mr425770fgb.16.1227277981035;
	Fri, 21 Nov 2008 06:33:01 -0800 (PST)
Received: from doriath.ww600.siemens.net (iap-pxy-mow1.siemens.ru
	[212.248.25.26])
	by mx.google.com with ESMTPS id 12sm4053842fgg.0.2008.11.21.06.32.58
	(version=SSLv3 cipher=RC4-MD5); Fri, 21 Nov 2008 06:32:59 -0800 (PST)
Date: Fri, 21 Nov 2008 17:32:39 +0300
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081121143239.GA10815@doriath.ww600.siemens.net>
References: <1226989020-23551-1-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1226989020-23551-1-git-send-email-dbaryshkov@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] sharprom-compatible: update to reflect current	toolchain classes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Nov 2008 14:35:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 18, 2008 at 09:17:00AM +0300, Dmitry Baryshkov wrote:
> Current toolchain classes want  to also have virtual/arm-linux-libc-initial
> So, add it to sharprom-toolchain-native PROVIDES and to PREFERRED_PROVIDER of
> sharprom-compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
> ---
>  conf/distro/sharprom-compatible.conf               |    1 +
>  .../sharprom-toolchain-native_1.0.bb               |    3 ++-
>  2 files changed, 3 insertions(+), 1 deletions(-)

What's about this patch? If noone objects, I'll push it tomorrow.

> 
> diff --git a/conf/distro/sharprom-compatible.conf b/conf/distro/sharprom-compatible.conf
> index ef198ac..93077e1 100644
> --- a/conf/distro/sharprom-compatible.conf
> +++ b/conf/distro/sharprom-compatible.conf
> @@ -34,6 +34,7 @@ DISTRO_TYPE = "debug"
>  
>  PREFERRED_PROVIDER_virtual/arm-linux-gcc-2.95 = "sharprom-toolchain-native" 
>  PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "sharprom-toolchain-native" 
> +PREFERRED_PROVIDER_virtual/arm-linux-libc-initial = "sharprom-toolchain-native"
>  PREFERRED_PROVIDER_virtual/arm-linux-binutils = "sharprom-toolchain-native"
>  PREFERRED_PROVIDER_virtual/libc = "sharprom-toolchain-native"
>  PREFERRED_PROVIDER_virtual/libiconv = "sharprom-toolchain-native"
> diff --git a/packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb b/packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
> index 8870bcc..c391c36 100644
> --- a/packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
> +++ b/packages/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
> @@ -6,6 +6,7 @@ DEPENDS = "linux-libc-headers cross-linkage staging-linkage"
>  PROVIDES_sharprom-compatible = "\
>    virtual/arm-linux-gcc-2.95 \
>    virtual/arm-linux-libc-for-gcc \
> +  virtual/arm-linux-libc-initial \
>    virtual/arm-linux-binutils \
>    virtual/libc \
>    virtual/libintl \
> @@ -14,7 +15,7 @@ PROVIDES_sharprom-compatible = "\
>    virtual/arm-linux-libc-for-gcc \
>    virtual/arm-linux-gcc-intermediate \
>    virtual/arm-linux-gcc-initial "
> -PR = "r2"
> +PR = "r3"
>  
>  RPROVIDES = "glibc-utils libsegfault glibc-thread-db libgcc-dev libstdc++-dev libstdc++"
>  PACKAGES_DYNAMIC = "glibc-gconv-*"
> -- 
> 1.5.6.5
> 

-- 
With best wishes
Dmitry




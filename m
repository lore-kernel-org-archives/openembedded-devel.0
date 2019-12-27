Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9027C85D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577444669; x=1608980669;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=zn9JSnMITERbRooVeRQbbbO05I7oWe6l3speCuOX6qE=;
	b=oZmCucU+L2umqxuE3+Tb76sX9EHl7Oh5m+xV+kdUcQiRaU5iMGRRIjF1
	tuZFYj897BwS5/d04J8Rj4MlIMwU7YGxil1xLBYg9beeddNFZ9b0fRw7R
	gA4boTd8f/napjK1Lf7T2wVGI44owKsnp+yIZZyo8MD+qHyXfjxa71+OA
	YS5TsqNckiMe79GY1Rhc8rzBtLf0zcTAnkz0dSOXwRrcrUkcC9aVCaLMR
	y5p13oTBv8ud0miDZtNzwFQMvXAEF10YfieCH8+RLqUjfa9xrcIUfHxYm
	k6w1mNSe5Od873C/TOBwwEZmCyw4ubFkVuXal1oTN5nC0S4afvdTyt91D w==;
IronPort-SDR: HtfrpZL94F4Yo2SRsgtA7mlnNtl1C7cTSUIQlSSnOc6D0XeK4u5gJ+RqwddY6bpChK6ruyx2Xj
	vejhW7Y8VaKWdqJ0a4YmiQe5nS3YQbJI09aa/F2HnZ6GYJ88XzshK6wwf2Z32+S+ujJR/HSJLM
	yhG8sy9nxHsJ6ETaMd74gF+SgWJ56JtonsZy+Q50gS8P2r+yUM/9s0DO1l/n0ZJytPRlQwiGl/
	HhA9tPQasYU+sNywjpEVXOnO4f8favrfqogmfR/BmU+0UCig1c1J3dEkXmIs2htVKAcAgcqctf
	HQk=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; 
   d="scan'208";a="2472767"
To: <mohamad.noor.alim.hussin@intel.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20191206013339.12461-1-mohamad.noor.alim.hussin@intel.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <5f1aed42-fd3a-e392-8b24-d4bc1535a9d5@skidata.com>
Date: Fri, 27 Dec 2019 12:04:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191206013339.12461-1-mohamad.noor.alim.hussin@intel.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] class/java-native: remove
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
X-List-Received-Date: Fri, 27 Dec 2019 11:04:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
      git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 06/12/2019 02:33, mohamad.noor.alim.hussin@intel.com wrote:
> From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> 
> Java-native class used NATIVE_INSTALL_WORKS which was removed
> from oe-core around 2010. Also updated recipes that inherit
> java-native to native class.
> 
> Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> ---
>   classes/java-native.bbclass                          | 9 ---------
>   recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb | 2 +-
>   recipes-core/ant/ant-native_1.8.1.bb                 | 2 +-
>   3 files changed, 2 insertions(+), 11 deletions(-)
>   delete mode 100644 classes/java-native.bbclass
> 
> diff --git a/classes/java-native.bbclass b/classes/java-native.bbclass
> deleted file mode 100644
> index cade7b1..0000000
> --- a/classes/java-native.bbclass
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -# This is to be used by recipes which rely on java-library.bbclass
> -# infrastructure and are a *-native recipe which needs to install
> -# jar files into staging.
> -#
> -# This class has nothing to do with Java's JNI.
> -
> -inherit native
> -
> -NATIVE_INSTALL_WORKS = "1"
> diff --git a/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb b/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
> index 2a44ea2..db79626 100644
> --- a/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
> +++ b/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
> @@ -12,7 +12,7 @@ DEPENDS = "ant-native commons-cli-native commons-codec-native \
>              oro-native bcel-native xerces-j-native \
>             "
>   
> -inherit java-library java-native
> +inherit java-library native
>   
>   SRC_URI = "${SOURCEFORGE_MIRROR}/ant-contrib/ant-contrib-${PV}-src.zip"
>   
> diff --git a/recipes-core/ant/ant-native_1.8.1.bb b/recipes-core/ant/ant-native_1.8.1.bb
> index 5a39f42..7839abd 100644
> --- a/recipes-core/ant/ant-native_1.8.1.bb
> +++ b/recipes-core/ant/ant-native_1.8.1.bb
> @@ -11,7 +11,7 @@ SRC_URI = "http://archive.apache.org/dist/ant/source/apache-ant-${PV}-src.tar.gz
>   
>   S = "${WORKDIR}/apache-ant-${PV}"
>   
> -inherit java-library java-native
> +inherit java-library native
>   
>   DEPENDS = " \
>   	jsch-native bsf-native xalan-j-native xerces-j-native \
> 


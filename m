Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id E8D8C7CBE4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 11:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577447312; x=1608983312;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=D2V9R0hap2mo7TsqNdOfLBWqrePmjINcLcQLRRaJ1eE=;
	b=dGFKC+hbJ5zIpW4hTyPoSYtE+Kqy9ncT0nmxe75bGjbkjmY+4lovt8Xt
	X/yZmGH8f6KP0zB3Yg0lDKS9rjtRpiQwChc2xZPKHQpzY/kXmGjt0F5Br
	DCk2Se6M6mdFYoAykAoY9u27Y/ckgzj4oqAF8drUJj1j3i9+5oPx6neV/
	2oKQGyumGbz01L56ANbNeqYwhohuCVH7nyyGKzi2X98VLY4hmBnOdayUG
	9Krr9eBrbUfyq8CTY5fpILFhgG827XYMvi3bQV7WUJqPWVsX5I2tFWtsv
	zpgneRItPVVOdK1o3JOMCy+Rxgqp3LKzcL15UhnM+8Ds76Bbx9IObauOK Q==;
IronPort-SDR: kuCLsYfB9PJ7DL50iRCNDmhKAnWkGn4lZnHbT5BaBfXFoFaTIYpkpXHcdC/rVIy+/VRXFIEka+
	wRwvUvKKtf9NwsysAYqcVhaChTOYEK0dbnDAFdzV7fwSOsq4WgI7OrmO3K1u07y4cFKOy+cebO
	QTQAWmFacAHLSEGX+jyAU0viqcMgpzTR0BBkYjthuZwIXzrE83XtWJ97d7ih/OFNGgn6clipXk
	CD9ZJgENhYfErcPr7qEbkLb1kmFXiDbnnh/UJttD9oiao1OZ+ICTntjThqGBiRo9zezq2EUSX2
	4v4=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; d="scan'208";a="21733693"
To: Marek Belisko <marek.belisko@open-nandra.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1551959871-9647-1-git-send-email-marek.belisko@open-nandra.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <2b790cdb-1a58-0af0-241c-0a5cffd76a12@skidata.com>
Date: Fri, 27 Dec 2019 12:48:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1551959871-9647-1-git-send-email-marek.belisko@open-nandra.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] jamvm: Disable inlining
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
X-List-Received-Date: Fri, 27 Dec 2019 11:48:31 -0000
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

On 07/03/2019 12:57, Marek Belisko wrote:
> This will fix crashes seen when build openjdk-8:
> 
> ERROR: jaxp1.3-native-1.4.01-r0 do_compile: Function failed: do_compile (log file is located at /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894)
> ERROR: Logfile of failure stored in: /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | Illegal instruction (core dumped)
> | WARNING: exit code 132 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894)
> ERROR: Task (virtual:native:/home/jenkins/meta-java/recipes-core/xml-commons/jaxp1.3_1.4.01.bb:do_compile) failed with exit code '1'
> 
> 
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>   recipes-core/jamvm/jamvm.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
> index fc21380..8a1ed63 100644
> --- a/recipes-core/jamvm/jamvm.inc
> +++ b/recipes-core/jamvm/jamvm.inc
> @@ -29,7 +29,7 @@ do_configure_append_class-native() {
>   }
>   
>   
> -EXTRA_OECONF = "--with-classpath-install-dir=${prefix} --libdir=${libdir}/jamvm --enable-ffi"
> +EXTRA_OECONF = "--with-classpath-install-dir=${prefix} --libdir=${libdir}/jamvm --enable-ffi --disable-int-inlining"
>   
>   # Needed for big compilation targets like OpenJDK
>   CFLAGS_append_class-native = " -DDEFAULT_MAX_HEAP=1024*MB"
> 


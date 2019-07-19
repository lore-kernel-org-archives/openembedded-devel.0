Return-Path: <prvs=096109b2f=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 206B07CD73
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1563523460; x=1595059460;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=snzosOds18nabllkp5b/ONEf/diozqKp8S/E0GP4Qi0=;
	b=WuMneBbEQZRI744LaX/6/v9TvoZFPdE8LZdPp+l9B98Yto+VyqJDzjxm
	ohiaBt/SJwnuIPg5xhQB1DpLMAhCadTPpbZSKDcBA4x9AWUNqpAJ3pyzJ
	jBtG+gNdYlqXcJUCZX93SVYeEcAxiYrtmf2yh1Vcd639ba44uJaU9B+lT
	yvv6YY5FPP03S1+1OzP5DTbzAwcuyim41D46RZngRsmKcj5Ezw81He3xe
	8cccHYrdjClG9uFUWL6ILB8FefgV4ZLP7zHUrx1fz3LUOwK5cRZvk8Mcx
	ollVjYO8mX4fLi9olSkSiVltKdwBz+djR2HmqhU0rHpqNrJcPXFB8on9X A==;
IronPort-SDR: nLXSaj77MCPaSDRbUUNmClB5dzcaXA+55xbfVZX0JtWCJuMRFKCTlaTiG2sCwszCODO0mQe4e/
	zAzoXwpK+u/zx6AzLf1c+ZaKJo1W2Jk1xlbN51bjF0VW2ITTjoznB7Zd6GWoo0Tum0AT7nmGmK
	VHNGrB5dRoh998sJskAr4uEjC1675Xlv/vfkp/nsW6ow8qUjTrEy6CkeCBsYRG6NanlardX8cr
	QRDUty7r4b32Z/E6MihIR88BDrZ836qTUhWiotPL1bE3PC9Z/abCy/c+dEwDY/PJlj0mpReIsf
	Tl0=
X-IronPort-AV: E=Sophos;i="5.64,281,1559512800"; d="scan'208";a="18459502"
To: Fang Jia <fang.jia@windriver.com>, <git@andred.net>,
	<openembedded-devel@lists.openembedded.org>
References: <1550719388-9980-1-git-send-email-fang.jia@windriver.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <b829ca5a-d128-6871-a832-2151b3773e6f@skidata.com>
Date: Fri, 19 Jul 2019 10:04:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1550719388-9980-1-git-send-email-fang.jia@windriver.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [PATCH 1/2] Revert "base-files: Define JAVA_HOME by default"
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
X-List-Received-Date: Fri, 19 Jul 2019 08:04:19 -0000
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

On 21/02/2019 04:23, Fang Jia wrote:
> This reverts commit ada652564f09756a81f54495cbc2091125239625.
> 
> When enable multilib on a 64-bit system, probably both base-file and
> lib32-base-files are installed.
> Then both packages want to modify the file "profile", there will be
> an error like:
> "
> Error: Transaction check error:
> file /etc/profile conflicts between attempted installs of
> lib32-base-files-3.0.14-r148.gpb_virt and
> base-files-3.0.14-r148.gpb_virt
> "
> 
> The task can be added by adding a file to ${sysconfdir}/profile.d/.
> 
> Signed-off-by: Fang Jia <fang.jia@windriver.com>
> ---
>   recipes-core/base-files/base-files_3.0.14.bbappend | 13 -------------
>   1 file changed, 13 deletions(-)
>   delete mode 100644 recipes-core/base-files/base-files_3.0.14.bbappend
> 
> diff --git a/recipes-core/base-files/base-files_3.0.14.bbappend b/recipes-core/base-files/base-files_3.0.14.bbappend
> deleted file mode 100644
> index 4651185..0000000
> --- a/recipes-core/base-files/base-files_3.0.14.bbappend
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -do_install_append() {
> -	cat >> ${D}${sysconfdir}/profile << EOT
> -JAVA_HOME=""
> -for dir in ${libdir}/jvm/*; do
> -	if [ -x "\${dir}/bin/java" ]; then
> -		[ -z "\${JAVA_HOME}" ] && JAVA_HOME="\${dir}"
> -	fi
> -done
> -if [ -n "\${JAVA_HOME}" ]; then
> -	export JAVA_HOME=\${JAVA_HOME}
> -fi
> -EOT
> -}
> 


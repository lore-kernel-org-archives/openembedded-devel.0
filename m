Return-Path: <prvs=949748c37=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id DA1697CC04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 08:52:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,398,1544482800"; d="scan'208";a="15307583"
To: <openembedded-devel@lists.openembedded.org>
References: <1550719388-9980-1-git-send-email-fang.jia@windriver.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <cee583cc-c120-8198-8322-d917f6ae1266@skidata.com>
Date: Fri, 22 Feb 2019 09:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
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
X-List-Received-Date: Fri, 22 Feb 2019 08:52:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
thanks for the patch. Looks good to me now.
I'll add it to my tests and will give feedback.

Nonetheless things to improve for your next contribution:
  a) Please add [meta-java] to the subject
  b) Please version the patchset when it updates an existing one
     on the mailinglist

Therefore the correct subject prefix for this patchset would have been:
  [oe][meta-java][PATCH V2 1/2]

No problem for this one as I found it, but please keep an eye on that 
for the next time. Thanks.

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


Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pi7JE-0002ir-PI
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 16:29:24 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pi7IS-0007lm-S3 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 07:28:36 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 26 Jan 2011 07:28:36 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 26 Jan 2011 08:28:35 -0700
Message-ID: <4D403DA0.6030303@mentor.com>
Date: Wed, 26 Jan 2011 08:28:32 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295905501-1948-1-git-send-email-sgarman@zenlinux.com>
In-Reply-To: <1295905501-1948-1-git-send-email-sgarman@zenlinux.com>
X-OriginalArrivalTime: 26 Jan 2011 15:28:35.0755 (UTC)
	FILETIME=[B2B607B0:01CBBD6D]
Subject: Re: [PATCH] sudo: upgrade to 1.7.4p6
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
X-List-Received-Date: Wed, 26 Jan 2011 15:29:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/24/2011 02:45 PM, Scott Garman wrote:
> Addresses the following CVEs:
> * CVE-2010-2956
> * CVE-2010-1646
> * CVE-2011-0010
>
> Signed-off-by: Scott Garman<sgarman@zenlinux.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   recipes/sudo/{sudo_1.7.2p4.bb =>  sudo_1.7.4p6.bb} |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>   rename recipes/sudo/{sudo_1.7.2p4.bb =>  sudo_1.7.4p6.bb} (72%)
>
> diff --git a/recipes/sudo/sudo_1.7.2p4.bb b/recipes/sudo/sudo_1.7.4p6.bb
> similarity index 72%
> rename from recipes/sudo/sudo_1.7.2p4.bb
> rename to recipes/sudo/sudo_1.7.4p6.bb
> index c2818cf..8afee8d 100644
> --- a/recipes/sudo/sudo_1.7.2p4.bb
> +++ b/recipes/sudo/sudo_1.7.4p6.bb
> @@ -1,4 +1,4 @@
> -PR = "r4"
> +PR = "r0"
>
>   DEPENDS = "libpam"
>   RDEPENDS_${PN} = "libpam libpam-meta"
> @@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz;name=src \
>     file://sudo.pamd \
>   "
>
> -SRC_URI[src.md5sum] = "3989e5a00538247d7dcef8b514076752"
> -SRC_URI[src.sha256sum] = "57d9adbdffa881e32894231079da7d68ffe99f46942818b63baadf6c795b7bdd"
> +SRC_URI[src.md5sum] = "1ae12d3d22e7ffedbf2db26f957676f0"
> +SRC_URI[src.sha256sum] = "20091ef71018698c674c779f4b57178b2ecb4275fa34909b06219d2688ad14d5"
>
>   EXTRA_OECONF += " --with-pam "
>


-- 
Tom Rini
Mentor Graphics Corporation



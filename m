Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PdlsA-0006ru-FF
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 16:47:30 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pdlrb-0002R4-Fy from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 07:46:55 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 14 Jan 2011 07:46:54 -0800
Received: from [172.30.80.234] ([172.30.80.234]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 14 Jan 2011 08:46:53 -0700
Message-ID: <4D306FE5.8020608@mentor.com>
Date: Fri, 14 Jan 2011 08:46:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295019241-5145-1-git-send-email-tom_rini@mentor.com>
In-Reply-To: <1295019241-5145-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 14 Jan 2011 15:46:54.0104 (UTC)
	FILETIME=[446BC980:01CBB402]
Subject: Re: [PATCH] busybox-static: Look in ${P}:${BPN} before the main busybox
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
X-List-Received-Date: Fri, 14 Jan 2011 15:47:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/14/2011 08:34 AM, Tom Rini wrote:
> Update FILESPATHPKG so that busybox-static could have its own
> starting defconfig.
>
> Signed-off-by: Tom Rini<tom_rini@mentor.com>
> ---
>   recipes/busybox/busybox-static_1.18.1.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/busybox/busybox-static_1.18.1.bb b/recipes/busybox/busybox-static_1.18.1.bb
> index 58aca93..27d4121 100644
> --- a/recipes/busybox/busybox-static_1.18.1.bb
> +++ b/recipes/busybox/busybox-static_1.18.1.bb
> @@ -1,6 +1,6 @@
>   require busybox_${PV}.bb
>
> -FILESPATHPKG =. "busybox-${PV}:"
> +FILESPATHPKG =. "${P}:${BPN}:busybox-${PV}:"
>   S = "${WORKDIR}/busybox-${PV}"
>
>   do_configure_append() {

The use here is if you have external layers/collections that want to 
build a busybox-static that's rather different from the regular busybox.

-- 
Tom Rini
Mentor Graphics Corporation



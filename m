Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P7qd5-0005Pn-Hs
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 16:24:00 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P7qcW-0006wf-Oe from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 07:23:24 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 18 Oct 2010 07:23:24 -0700
Received: from [172.30.80.149] ([172.30.80.149]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 18 Oct 2010 08:23:23 -0600
Message-ID: <4CBC5851.4090204@mentor.com>
Date: Mon, 18 Oct 2010 07:23:13 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287354561-29374-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1287354561-29374-1-git-send-email-obi@opendreambox.org>
X-OriginalArrivalTime: 18 Oct 2010 14:23:23.0926 (UTC)
	FILETIME=[05C54B60:01CB6ED0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-libc-headers-2.6.34: Delete include/scsi/scsi.h
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
X-List-Received-Date: Mon, 18 Oct 2010 14:24:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Andreas Oberritter wrote:
> * Based on 91d3d92a626da89dfe13d63e68a90dbafdbaef1d for 2.6.31 and 2.6.32
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  .../linux-libc-headers_2.6.34.bb                   |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb
> index 8e0df2e..340915c 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb
> @@ -5,7 +5,7 @@ DEFAULT_PREFERENCE = "-1"
>  DEFAULT_PREFERENCE_nios2 = "1"
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r1"
> +PR = "r2"
>  
>  COMPATIBLE_TARGET_SYS = "."
>  
> @@ -39,4 +39,5 @@ do_compile () {
>  
>  do_install() {
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
> +	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
>  }


-- 
Tom Rini
Mentor Graphics Corporation



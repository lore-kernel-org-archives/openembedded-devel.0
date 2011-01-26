Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pi6h6-0001X2-MS
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 15:50:00 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pi6gK-0001nW-62 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 06:49:12 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 26 Jan 2011 06:49:11 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 26 Jan 2011 07:49:10 -0700
Message-ID: <4D403462.6060807@mentor.com>
Date: Wed, 26 Jan 2011 07:49:06 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296029446-27041-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1296029446-27041-1-git-send-email-raj.khem@gmail.com>
X-OriginalArrivalTime: 26 Jan 2011 14:49:11.0017 (UTC)
	FILETIME=[3137A590:01CBBD68]
Subject: Re: [PATCH] samba: Fix build issue on uclibc/arm/thumb
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
X-List-Received-Date: Wed, 26 Jan 2011 14:50:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/26/2011 01:10 AM, Khem Raj wrote:
> We get following errors as of now. This patch fixes those
>
> /scratch/oe/sysroots/x86_64-linux/usr/armv5te/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/../../../../arm-oe-linux-uclibceabi/bin/ld:
> /scratch/oe/sysroots/armv5te-oe-linux-uclibceabi/usr/lib//uclibc_nonshared.a(atexit.os)(.text+0x12):
> unresolvable R_ARM_THM_CALL relocation against symbol `__cxa_atexit'
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   recipes/samba/samba_3.2.15.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/samba/samba_3.2.15.bb b/recipes/samba/samba_3.2.15.bb
> index ef2707e..214de58 100644
> --- a/recipes/samba/samba_3.2.15.bb
> +++ b/recipes/samba/samba_3.2.15.bb
> @@ -9,7 +9,7 @@ SRC_URI += "file://configure-3.2.8.patch \
>   SRC_URI[md5sum] = "5a3bcc4927c9643b9f42970d0815b18f"
>   SRC_URI[sha256sum] = "84281fd1faeffee8558e49dff865dd382abbf78bc1be00f8cb5aa70aeea67d46"
>
> -PR = "r3"
> +PR = "r4"
>
>   EXTRA_OECONF += "\
>   	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
> @@ -22,6 +22,7 @@ EXTRA_OECONF += "\
>   	samba_cv_HAVE_WRFILE_KEYTAB=yes \
>   	"
>
> +EXTRA_OECONF_append_libc-uclibc = " --disable-pie"
>   # for arm we always use ARM instruction set
>   # gcc 4.5 ICE's in thumb mode
>   # see http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46934


-- 
Tom Rini
Mentor Graphics Corporation



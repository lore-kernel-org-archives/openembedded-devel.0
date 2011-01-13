Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PdUk2-0000Eh-14
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 22:29:58 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PdUjU-0006NB-FK from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 13:29:24 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 13 Jan 2011 13:29:23 -0800
Received: from [172.30.80.234] ([172.30.80.234]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 13 Jan 2011 14:29:23 -0700
Message-ID: <4D2F6EAC.40209@mentor.com>
Date: Thu, 13 Jan 2011 14:29:16 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294953575-30765-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1294953575-30765-1-git-send-email-obi@opendreambox.org>
X-OriginalArrivalTime: 13 Jan 2011 21:29:23.0194 (UTC)
	FILETIME=[F23855A0:01CBB368]
Subject: Re: [PATCH] libcap2: add libpam to DEPENDS
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
X-List-Received-Date: Thu, 13 Jan 2011 21:29:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2011 02:19 PM, Andreas Oberritter wrote:
> * Fixes the following compile error:
>
> pam_cap.c:19:34: error: security/pam_modules.h: No such file or
> directory
> pam_cap.c:20:34: error: security/_pam_macros.h: No such file or
> directory
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> CC: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>

Possible to use the pam DISTRO_FEATURE?

> ---
>   recipes/libcap/libcap2_2.16.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/libcap/libcap2_2.16.bb b/recipes/libcap/libcap2_2.16.bb
> index 97b03d5..be0788e 100644
> --- a/recipes/libcap/libcap2_2.16.bb
> +++ b/recipes/libcap/libcap2_2.16.bb
> @@ -2,8 +2,8 @@ DESCRIPTION = "Libcap is a library for getting and setting POSIX.1e (formerly PO
>   PRIORITY = "optional"
>   SECTION = "libs"
>   LICENSE = "GPL"
> -DEPENDS = "bison-native flex-native attr"
> -PR = "r2"
> +DEPENDS = "bison-native flex-native attr libpam"
> +PR = "r3"
>
>   BUILD_CFLAGS += "-I${S}/libcap/include"
>   CFLAGS += "-I${S}/libcap/include"


-- 
Tom Rini
Mentor Graphics Corporation



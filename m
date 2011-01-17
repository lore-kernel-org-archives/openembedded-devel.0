Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PeuY8-00062t-P7
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 20:15:32 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PeuXW-0007EC-Cp from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 11:14:54 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 17 Jan 2011 11:14:54 -0800
Received: from [172.30.80.246] ([172.30.80.246]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 17 Jan 2011 12:14:53 -0700
Message-ID: <4D34952B.607@mentor.com>
Date: Mon, 17 Jan 2011 12:14:51 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
X-OriginalArrivalTime: 17 Jan 2011 19:14:53.0571 (UTC)
	FILETIME=[D2009530:01CBB67A]
Subject: Re: [PATCH 1/2] minimal.conf: Prefer perl 5.10.1 and opie 1.2.5
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
X-List-Received-Date: Mon, 17 Jan 2011 19:15:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2011 10:50 AM, Khem Raj wrote:
> * Tested various builds seems to hold fine
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   conf/distro/minimal.conf |    5 +++--
>   1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 5a19cbc..f495d13 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -108,7 +108,7 @@ INHERIT += "recipe_sanity"
>   # PREFERRED VERSIONS
>   #############################################################################
>   require conf/distro/include/preferred-e-versions.inc
> -require conf/distro/include/preferred-opie-versions-1.2.4.inc
> +require conf/distro/include/preferred-opie-versions-1.2.5.inc
>
>   PREFERRED_PROVIDER_opkg ?= "opkg"
>   PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
> @@ -119,7 +119,8 @@ PREFERRED_VERSION_qt4-embedded = "${PREFERRED_QT_VERSION}"
>   PREFERRED_VERSION_qt4-embedded-gles = "${PREFERRED_QT_VERSION}"
>   PREFERRED_VERSION_qt4-x11-free = "${PREFERRED_QT_VERSION}"
>   PREFERRED_VERSION_qt4-x11-free-gles = "${PREFERRED_QT_VERSION}"
> -
> +PREFERRED_VERSION_perl = "5.10.1"
> +PREFERRED_VERSION_perl-native = "5.10.1"
>   #############################################################################
>   # CONTENTS
>   #############################################################################

I see different problems with perl 5.10.1 + uclibc + p2020ds, so I guess 
this is fine with me.

-- 
Tom Rini
Mentor Graphics Corporation



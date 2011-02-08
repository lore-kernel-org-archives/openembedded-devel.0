Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PmvIn-0006R1-5S
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 22:40:49 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PmvHm-0002Vb-1g from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 13:39:46 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 8 Feb 2011 13:39:45 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 8 Feb 2011 14:39:44 -0700
Message-ID: <4D51B81D.8000800@mentor.com>
Date: Tue, 08 Feb 2011 14:39:41 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297199824-3712-1-git-send-email-morphis@gravedo.de>
In-Reply-To: <1297199824-3712-1-git-send-email-morphis@gravedo.de>
X-OriginalArrivalTime: 08 Feb 2011 21:39:44.0960 (UTC)
	FILETIME=[B38FCC00:01CBC7D8]
Subject: Re: [PATCH] evas: disable cpu neon support for palmpre machine
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
X-List-Received-Date: Tue, 08 Feb 2011 21:40:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2011 02:17 PM, Simon Busch wrote:
> Neon support in evas is currently broken for the palmpre machine. If we enable neon
> support evas causes alignment trap errors and lets the device freeze in the end. This
> should be reverted after the bug in evas code is found and fixed.
>
> Signed-off-by: Simon Busch<morphis@gravedo.de>
> ---
>   recipes/efl1/evas.inc |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
> index eb64d7a..ad30eba 100644
> --- a/recipes/efl1/evas.inc
> +++ b/recipes/efl1/evas.inc
> @@ -7,7 +7,7 @@ DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-na
>   inherit efl
>
>   BBCLASSEXTEND = "native"
> -INC_PR = "r0"
> +INC_PR = "r1"
>   FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
>
>   python populate_packages_prepend () {
> @@ -83,6 +83,9 @@ EVAS_CPU_TWEAKS = ""
>   # Disabled for now, see http://thread.gmane.org/gmane.comp.window-managers.enlightenment.devel/25194
>   #EVAS_CPU_TWEAKS_armv7a = "--enable-cpu-neon"
>
> +# Neon support for evas is broken on palmpre currently (causes the device to freeze)
> +EVAS_CPU_TWEAKS_palmpre = "--disable-cpu-neon"
> +
>   # common options
>   EVAS_OECONF = " \
>                   --x-includes=${STAGING_INCDIR}/X11 \

Shouldn't this be changing the armv7a EVAS_CPU_TWEAKS that's above yours 
to be uncommented and as a --disable?

-- 
Tom Rini
Mentor Graphics Corporation



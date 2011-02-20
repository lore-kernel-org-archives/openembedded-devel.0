Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PrGsc-0005yT-7m
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 22:31:46 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PrGrM-00000d-1M from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 13:30:28 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 20 Feb 2011 13:30:27 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 20 Feb 2011 14:30:26 -0700
Message-ID: <4D6187EA.8000103@mentor.com>
Date: Sun, 20 Feb 2011 14:30:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298232756-24526-1-git-send-email-pespin.shar@gmail.com>
In-Reply-To: <1298232756-24526-1-git-send-email-pespin.shar@gmail.com>
X-OriginalArrivalTime: 20 Feb 2011 21:30:26.0814 (UTC)
	FILETIME=[63D679E0:01CBD145]
Subject: Re: [PATCH] libacpi: SET OE LDFLAGS in recipe
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
X-List-Received-Date: Sun, 20 Feb 2011 21:31:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/20/2011 01:12 PM, Pau Espin Pedrol wrote:
> Fixes ld problem related to GNU_HASH
> ---
>   recipes/libacpi/libacpi_0.2.bb |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/libacpi/libacpi_0.2.bb b/recipes/libacpi/libacpi_0.2.bb
> index 458fc30..77d266b 100644
> --- a/recipes/libacpi/libacpi_0.2.bb
> +++ b/recipes/libacpi/libacpi_0.2.bb
> @@ -14,6 +14,8 @@ FILES_${PN}-bin = "${bindir}"
>
>   COMPATIBLE_HOST = '(x86_64|i.86.*)-(linux|freebsd.*)'
>
> +EXTRA_OEMAKE = "LDFLAGS='${LDFLAGS}'"
> +
>   do_install() {
>   	oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix}
>   }

Thanks, applied.

-- 
Tom Rini
Mentor Graphics Corporation



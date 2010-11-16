Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PIT4D-0003qg-LD
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 22:27:54 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PIT39-0005Sa-Pw from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 13:26:47 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 16 Nov 2010 13:26:47 -0800
Received: from [172.30.7.13] ([172.30.7.13]) by na2-mail.mgc.mentorg.com with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 16 Nov 2010 14:26:42 -0700
Message-ID: <4CE2F70E.90807@mentor.com>
Date: Tue, 16 Nov 2010 14:26:38 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1289935265-26637-1-git-send-email-msmith@cbnco.com>
In-Reply-To: <1289935265-26637-1-git-send-email-msmith@cbnco.com>
X-OriginalArrivalTime: 16 Nov 2010 21:26:42.0998 (UTC)
	FILETIME=[F6C6DD60:01CB85D4]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev 141: fix postinst check for /lib/udev/rules.d symlink
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
X-List-Received-Date: Tue, 16 Nov 2010 21:27:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2010 12:21 PM, Michael Smith wrote:
> [ -d foo ] succeeds even if foo is a symlink to a directory.
>
> Signed-off-by: Michael Smith<msmith@cbnco.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   recipes/udev/udev_141.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
> index 816637f..7a34ada 100644
> --- a/recipes/udev/udev_141.bb
> +++ b/recipes/udev/udev_141.bb
> @@ -7,7 +7,7 @@ DEFAULT_PREFERENCE = "-1"
>
>   require udev.inc
>
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>
>   SRC_URI += "file://mount.blacklist \
>   	    file://run.rules \
> @@ -107,7 +107,7 @@ else
>   fi
>   update-rc.d $OPT udev-cache start 12 S .
>
> -if [ -d $D/lib/udev/rules.d ] ; then
> +if [ -e $D/lib/udev/rules.d ]&&  [ ! -L $D/lib/udev/rules.d ] ; then
>   	echo "$D/lib/udev/rules.d is not a symlink, fixing that"
>   	mv $D/lib/udev/rules.d/* $D${sysconfdir}/udev/rules.d/
>   	rm -rf $D/lib/udev/rules.d


-- 
Tom Rini
Mentor Graphics Corporation



Received: from smtp1.irobot.com ([206.83.81.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <harvey.tim@gmail.com>) id 1PQjgn-0007ZJ-Ct
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 17:49:54 +0100
X-AuditID: 0a460614-b7b13ae0000039bc-34-4d010855bb0b
Received: from webmail.irobot.com (Unknown_Domain [10.70.6.12])
	by smtp1.irobot.com (Symantec Brightmail Gateway) with SMTP id
	4D.1D.14780.558010D4; Thu,  9 Dec 2010 11:48:21 -0500 (EST)
Received: from fever2.wardrobe.irobot.com ([192.168.163.187]) by
	webmail.irobot.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 9 Dec 2010 11:48:21 -0500
Received: from [192.168.69.108] ([192.168.69.108]) by
	fever2.wardrobe.irobot.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 9 Dec 2010 11:48:21 -0500
Message-ID: <4D01084A.1040103@gmail.com>
Date: Thu, 09 Dec 2010 08:48:10 -0800
From: Tim Harvey <harvey.tim@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
Newsgroups: gmane.comp.handhelds.openembedded
To: openembedded-devel@lists.openembedded.org
References: <1291225269-21801-1-git-send-email-harvey.tim@gmail.com>
In-Reply-To: <1291225269-21801-1-git-send-email-harvey.tim@gmail.com>
X-OriginalArrivalTime: 09 Dec 2010 16:48:21.0236 (UTC)
	FILETIME=[E3407B40:01CB97C0]
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 206.83.81.187
X-SA-Exim-Mail-From: harvey.tim@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] avrdude: update SRC_URI and fix deps
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
X-List-Received-Date: Thu, 09 Dec 2010 16:49:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2010 09:41 AM, Tim Harvey wrote:
> * SRC_URI updated to new location
> * Makefile.am patched to fix missing dep causing parallel make issue
>
> Signed-off-by: Tim Harvey<harvey.tim@gmail.com>
> ---
>   recipes/avrdude/avrdude.inc        |    5 ++++-
>   recipes/avrdude/avrdude/make.patch |   14 ++++++++++++++
>   2 files changed, 18 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/avrdude/avrdude/make.patch
>
> diff --git a/recipes/avrdude/avrdude.inc b/recipes/avrdude/avrdude.inc
> index 679c4ba..4679c7a 100644
> --- a/recipes/avrdude/avrdude.inc
> +++ b/recipes/avrdude/avrdude.inc
> @@ -5,7 +5,10 @@ LICENSE = "GPLv2"
>
>   DEPENDS = "virtual/libusb0 ncurses"
>
> -SRC_URI = "http://savannah.nongnu.org/download/avrdude/avrdude-${PV}.tar.gz"
> +SRC_URI = " \
> +   http://savannah.nongnu.org/releases/avrdude/avrdude-${PV}.tar.gz \
> +   file://make.patch \
> +   "
>
>   inherit autotools
>
> diff --git a/recipes/avrdude/avrdude/make.patch b/recipes/avrdude/avrdude/make.patch
> new file mode 100644
> index 0000000..30b3b1d
> --- /dev/null
> +++ b/recipes/avrdude/avrdude/make.patch
> @@ -0,0 +1,14 @@
> +fix missing deps causing build failure on parallel make
> +Index: avrdude-5.10/Makefile.am
> +===================================================================
> +--- avrdude-5.10.orig/Makefile.am	2010-12-01 09:17:41.675507203 -0800
> ++++ avrdude-5.10/Makefile.am	2010-12-01 09:17:44.474882497 -0800
> +@@ -155,6 +155,8 @@
> +
> + sysconf_DATA = avrdude.conf
> +
> ++config.c: config_gram.h
> ++
> + install-exec-local: backup-avrdude-conf
> +
> + distclean-local:

can someone ack/nak this?  This should get into master if there are no 
objections.

Thanks,

Tim



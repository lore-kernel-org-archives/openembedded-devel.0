Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S3Tw3-0000mv-1i
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2012 15:58:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 82DC13159B4B;
	Fri,  2 Mar 2012 15:49:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ERhqIMVdOT7h; Fri,  2 Mar 2012 15:49:42 +0100 (CET)
Received: from [172.22.22.61] (drms-590cfbe4.pool.mediaWays.net
	[89.12.251.228])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0493D3159B47;
	Fri,  2 Mar 2012 15:49:41 +0100 (CET)
Message-ID: <4F50DE05.6050804@opendreambox.org>
Date: Fri, 02 Mar 2012 15:49:41 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1330604440-8121-1-git-send-email-obi@opendreambox.org>
	<1330604440-8121-2-git-send-email-obi@opendreambox.org>
	<jipvmb$14d$1@dough.gmane.org>
In-Reply-To: <jipvmb$14d$1@dough.gmane.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 2/2][resend] udev: consolekit package requires x11
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
X-List-Received-Date: Fri, 02 Mar 2012 14:58:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02.03.2012 09:17, Koen Kooi wrote:
> Op 01-03-12 13:20, Andreas Oberritter schreef:
>> * consolekit fails to build without x11, so disable creation of
>> udev-consolekit, if x11 is unavailable.
> 
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org> --- 
>> meta-oe/recipes-core/udev/udev_173.bb |    2 +- 
>> meta-oe/recipes-core/udev/udev_175.bb |    2 +- 
>> meta-oe/recipes-core/udev/udev_181.bb |    2 +- 3 files changed, 3
>> insertions(+), 3 deletions(-)
> 
>> diff --git a/meta-oe/recipes-core/udev/udev_173.bb
>> b/meta-oe/recipes-core/udev/udev_173.bb index e4e634a..cbbe910 100644 ---
>> a/meta-oe/recipes-core/udev/udev_173.bb +++
>> b/meta-oe/recipes-core/udev/udev_173.bb @@ -59,7 +59,7 @@
>> do_configure_prepend() { INITSCRIPT_NAME = "udev" INITSCRIPT_PARAMS =
>> "start 04 S ."
> 
>> -PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit" 
>> +PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils
>> ${@base_contains('DISTRO_FEATURES', 'x11', 'udev-consolekit', '', d)}"
> 
> What does this actually accomplish? If the package is empty it won't get
> generated anyway and if it isn't empty you just introduced a QA error.

The recipe contains:

RDEPENDS_${PN}-consolekit += "consolekit"

Therefore, consolekit gets built when building udev, but fails:

ERROR: Nothing RPROVIDES 'consolekit' (but .../meta-oe/recipes-core/udev/udev_181.bb RDEPENDS on or otherwise requires it)
ERROR: consolekit was skipped: 'x11' not in DISTRO_FEATURES
NOTE: Runtime target 'consolekit' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['consolekit']
ERROR: Required build target 'udev' has no buildable providers.
Missing or unbuildable dependency chain was: ['udev', 'consolekit']

That's what the patch is addressing. Which alternative
would you suggest instead? To omit the runtime dependency?

About the QA error, if this is the error you're referring to,
then the warning is not very helpful:

WARNING: For recipe udev, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/sbin

Regards,
Andreas



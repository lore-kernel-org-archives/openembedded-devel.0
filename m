Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S4tc6-00064W-OM
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 13:35:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 49B0E315959A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2012 13:27:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id PGqMXllcYRDx
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2012 13:26:50 +0100 (CET)
Received: from [172.22.22.61] (drms-590cf39a.pool.mediaWays.net
	[89.12.243.154])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 3F0CB3159549
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2012 13:26:50 +0100 (CET)
Message-ID: <4F560287.70904@opendreambox.org>
Date: Tue, 06 Mar 2012 13:26:47 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1330986957-24272-1-git-send-email-obi@opendreambox.org>
	<jj4jcv$dnp$1@dough.gmane.org>
In-Reply-To: <jj4jcv$dnp$1@dough.gmane.org>
Subject: Re: [meta-oe][PATCH v2] udev: consolekit package requires x11
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
X-List-Received-Date: Tue, 06 Mar 2012 12:35:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06.03.2012 09:54, Koen Kooi wrote:
> Op 05-03-12 23:35, Andreas Oberritter schreef:
>> * consolekit fails to build without x11, so drop the runtime dependency
>> on consolekit if x11 is unavailable.
> 
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org> --- v1->v2:
>> Instead of removing the package, drop the runtime dependency on
>> consolekit.
> 
> It's only missing a PR bump now :)

I don't thinks so, because with x11 nothing changes and without x11 udev
couldn't be built before (this is what the patch addresses).

Albeit, I'm going to send a patch with bumped PRs.

Regards,
Andreas

> 
> regards,
> 
> Koen
> 
> 
> 
>> meta-oe/recipes-core/udev/udev_173.bb |    2 +- 
>> meta-oe/recipes-core/udev/udev_175.bb |    2 +- 
>> meta-oe/recipes-core/udev/udev_181.bb |    2 +- 3 files changed, 3
>> insertions(+), 3 deletions(-)
> 
>> diff --git a/meta-oe/recipes-core/udev/udev_173.bb
>> b/meta-oe/recipes-core/udev/udev_173.bb index e4e634a..a111f11 100644 ---
>> a/meta-oe/recipes-core/udev/udev_173.bb +++
>> b/meta-oe/recipes-core/udev/udev_173.bb @@ -81,7 +81,7 @@ FILES_${PN} +=
>> "/lib/udev*" FILES_${PN}-dbg += "/lib/udev/.debug"
> 
>> FILES_${PN}-consolekit += "${libdir}/ConsoleKit" 
>> -RDEPENDS_${PN}-consolekit += "consolekit" +RDEPENDS_${PN}-consolekit +=
>> "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
> 
>> do_install () { install -d ${D}${usrsbindir} \ diff --git
>> a/meta-oe/recipes-core/udev/udev_175.bb
>> b/meta-oe/recipes-core/udev/udev_175.bb index b6484d9..114dbe9 100644 ---
>> a/meta-oe/recipes-core/udev/udev_175.bb +++
>> b/meta-oe/recipes-core/udev/udev_175.bb @@ -77,7 +77,7 @@ FILES_${PN} +=
>> "/lib/udev*" FILES_${PN}-dbg += "/lib/udev/.debug"
> 
>> FILES_${PN}-consolekit += "${libdir}/ConsoleKit" 
>> -RDEPENDS_${PN}-consolekit += "consolekit" +RDEPENDS_${PN}-consolekit +=
>> "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
> 
>> do_install () { install -d ${D}${usrsbindir} \ diff --git
>> a/meta-oe/recipes-core/udev/udev_181.bb
>> b/meta-oe/recipes-core/udev/udev_181.bb index 1e0a02a..5e27706 100644 ---
>> a/meta-oe/recipes-core/udev/udev_181.bb +++
>> b/meta-oe/recipes-core/udev/udev_181.bb @@ -73,7 +73,7 @@ FILES_${PN} +=
>> "/lib/udev*" FILES_${PN}-dbg += "/lib/udev/.debug"
> 
>> FILES_${PN}-consolekit += "${libdir}/ConsoleKit" 
>> -RDEPENDS_${PN}-consolekit += "consolekit" +RDEPENDS_${PN}-consolekit +=
>> "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
> 
>> FILES_udev-utils = "${bindir}/udevadm"
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



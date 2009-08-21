Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1MeQoh-0003vu-MV
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 11:53:51 +0200
Received: by ewy21 with SMTP id 21so581898ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2009 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0rh6tfZTitoBzGQrtAkHrf4R5Iaazf0QcC0AY+sTv0Q=;
	b=xSbKCtStFHCBTQrzxifYvyZSGaRawHyt54eagcR/aYl0FF588KzL42tVqION7lWOg1
	VFeqlDS0ShGC1lv6B9FdUw9YzGI1MgGGymvK4vg77IrdCPiYWwrTTXX70WthQYDsOO4G
	lyGBZlXnaLG0EuoFm4yvrRNXuyh2xgKT1H85Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=H+iGWGipS9T0jK5nA56NCFbD3ioWBSDQaba68i7Seq0Ez87HqTY+1BBAnzk2bjqex0
	8pd20/qdUmPX0AgI0XU3XtxQyYxNN7DyS+Sisml1YeyuZ9Qs5mzMMHodVn0+kNx8n+Xp
	Y6Wdp3qw85uOXRKmfiRz/MTvBDncloNIWY/8I=
MIME-Version: 1.0
Received: by 10.216.29.201 with SMTP id i51mr161555wea.214.1250847385977; Fri, 
	21 Aug 2009 02:36:25 -0700 (PDT)
In-Reply-To: <d1b08f940908210231v1ab08454j6db9e15c4ac43389@mail.gmail.com>
References: <d1b08f940908210231v1ab08454j6db9e15c4ac43389@mail.gmail.com>
Date: Fri, 21 Aug 2009 11:36:25 +0200
Message-ID: <d1b08f940908210236u5b0ad12ne292d8eb860062f6@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Wrong crosscompilers path after rebuild from PSTAGE + fix
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
X-List-Received-Date: Fri, 21 Aug 2009 09:53:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

REPOST under right subject:

Ok, the issue is the staging-* packages are created without BASE_PACKAGE_ARCH
This patch (thx ReaperOfSouls) seems to fix it:


diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 33acb90..3b97f59 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -284,7 +284,7 @@ populate_staging_postamble () {
               if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
                       exit $exitcode
               fi
-               stage-manager -p ${CROSS_DIR} -c
${DEPLOY_DIR_PSTAGE}/stamp-cache-cross -u -d
${PSTAGE_TMPDIR_STAGE}/cross
+               stage-manager -p ${CROSS_DIR} -c
${DEPLOY_DIR_PSTAGE}/stamp-cache-cross -u -d
${PSTAGE_TMPDIR_STAGE}/cross/${BASE_PACKAGE_ARCH}
               if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
                       exit $exitcode
               fi



Andrea



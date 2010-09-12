Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OuhBb-00040S-Tw
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 09:41:16 +0200
Received: by iwn2 with SMTP id 2so3966298iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 00:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=K6A6rlLju5YMnN9E1EDKiAqG7GWCC4JUC5OLrMSb+jE=;
	b=kPRUj+20lp42GTTHbh69DYyZiOxke5AxkODvHHpAYeWiCHK3ZraS+/Yd7wzUr18WTm
	rdd3Kh3DagNlQjySU3CnPMJud6EJfaeruKygbPhtuvXVPATnBh42qEX3GBSuHBq0RTlV
	G5X7VB0ScO0iiLPykS04c48ZldjLw91zzZeiM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=n14Dpj33/hsFyFT4+pncaY5tG10wX9/bT55MnR8LIN/kpZ4dZJqFtRW6LjYl//dqQG
	M6Ny4BGY2sIoxONfKtkQntomLiaUGB3c3sIxDTia4bsufFdxeThep1EsLjCWNtNFmTdB
	pc53TH+GHi459o4k5wgzkhJFfS+tabBan6zNw=
MIME-Version: 1.0
Received: by 10.231.174.5 with SMTP id r5mr3915972ibz.132.1284277230695; Sun,
	12 Sep 2010 00:40:30 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 12 Sep 2010 00:40:30 -0700 (PDT)
In-Reply-To: <20100910185711.GG28148@denix.org>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
	<AANLkTim57opnM=fn47pQ-GeNsNbSyydHd3TKSWhdD5z5@mail.gmail.com>
	<AANLkTikyFRQskds_P9AH+=_km46KEf1cPm-Vq1+MhdhC@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFA4A2@dlee06.ent.ti.com>
	<AANLkTik599XZfY1Abq+gdDqGSOOLnqHUiqL1VVK9Rh87@mail.gmail.com>
	<20100910185711.GG28148@denix.org>
Date: Sun, 12 Sep 2010 09:40:30 +0200
Message-ID: <AANLkTimyXbmVN0P9pNXKhoxOoNRrnpxKUUqCsuwD=p1B@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make it global
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
X-List-Received-Date: Sun, 12 Sep 2010 07:41:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/10 Denys Dmytriyenko <denis@denix.org>:
:>
> Frans,
>
> I guess then you haven't read the original discussion closely enough. Chase
> only made a change to add existing SOC_FAMILY override into COMPATIBLE_MACHINE
> variable... I keep repeating myself - SOC_FAMILY feature is about a year old.
> It was introduced as part of a large merge from Arago. Here is the original
> commit and some description:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b788499815bfc1974d4277c0a261b9a7c24aa816

I did some more research on this, as I could not recall any specific info.
The patch you give above is from dec, so 9 months old.
At that time it was not discussed at the mailing list as far as I can
see. As the commit message said "recipes/ti: merge in updates"
I (and I guess most of the non-ti devs) gave little attention to it.

Also I did a quick grep on the source tree. Currently it is only used
in the following files

frans@linux-suse:~/oe/openembedded> grep -r SOC_FAMILY .
./conf/local.conf:SOC_FAMILY_local = "none"
./conf/distro/include/angstrom.inc:SOC_FAMILY ?= "Unknown"
./conf/distro/include/angstrom.inc:# Add FEED_ARCH and SOC_FAMILY to overrides
./conf/distro/include/angstrom.inc:OVERRIDES .= ":${FEED_ARCH}:${SOC_FAMILY}"
./conf/machine/include/dm6467.inc:SOC_FAMILY = "dm6467"
./conf/machine/include/omap3.inc:SOC_FAMILY = "omap3"
./conf/machine/include/omapl137.inc:SOC_FAMILY = "omapl137"
./conf/machine/include/dm365.inc:SOC_FAMILY = "dm365"
./conf/machine/include/dm6446.inc:SOC_FAMILY = "dm6446"
./conf/machine/include/dm355.inc:SOC_FAMILY = "dm355"
./conf/machine/include/omapl138.inc:SOC_FAMILY = "omapl138"
./recipes/ti/ti-linuxutils.inc:    case ${SOC_FAMILY} in
./recipes/ti/ti-linuxutils.inc:    if [ ${SOC_FAMILY} == "dm365" ] ; then
./recipes/ti/ti-local-power-manager.inc:# SOC_FAMILY configuration
./recipes/ti/ti-codec-engine.inc:# SOC_FAMILY configuration
./recipes/ti/ti-dsplink.inc:# SOC_FAMILY configuration
./classes/base.bbclass:                this_soc_family =
bb.data.getVar('SOC_FAMILY', d, 1)

Anyway, wrt the breakage, I'll push the patch for now as it has been
out for review quite a while (and I got an ack and a looks good).
If SOC_FAMILY is not desired we can also revert that one.

Frans



Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NHOSF-0001pI-FC
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 22:15:46 +0100
Received: by bwz9 with SMTP id 9so3028821bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 13:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=dwjoTBuwGaC1azrPAFrc4/U0aeRo4iJLOft9MBpNhFw=;
	b=lbtozuoaA3vO5pEtgOYou4Mhga8WGjHCgsTxooAzITQSx455NoXqTVbO2Q8ADmiEwM
	0TIoBvLRJCuwceB7UMKMV8VQ9opnAbYlGxprVDCdy40PIV+zBoYqmhQPfDbF3nxIuHRa
	5eWoKZSOR0o91ZGyFX39jqDVGISYj5c1/k59o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=B2bbNJWk4aBAc4ISrZ9vWVOdDjpjKYsPA9+VNweHUwGu4KMwlwZfOwLxl/rsW8egT3
	58nQBBY2/jci3l3pGBUysfAQulRRAPFb0/MooBWUWG+KShP/93v8Q85bTH2LsMxZ4x5y
	SOR9+DAnJ+ykTxXiF3Ah1bdjFl18WHH1IBrhs=
Received: by 10.204.49.68 with SMTP id u4mr6226710bkf.42.1260134043246;
	Sun, 06 Dec 2009 13:14:03 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1745950fxm.11.2009.12.06.13.14.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 13:14:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 22:13:44 +0100
Message-Id: <1260134030-3658-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.4
In-Reply-To: <20091204090048.GA3233@jama>
References: <20091204090048.GA3233@jama>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] sane-providers.inc with default providers for all distributions
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
X-List-Received-Date: Sun, 06 Dec 2009 21:15:46 -0000

Hi,

so here is series of patches for compatibility-providers.conf, required from 
bitbake.conf as suggested.

Tested on 
shr-image for shr distribution (on gta02) 
xorg-image for angstrom (on spitz)

only difference was db instead of db3 providers for shr.

Tricky part is to set u-a provider in sync with opkg provider (see 6th). 
We don't want to pull 2 different opkg versions one as opkg provider 
and second as u-a, but opkg is set as provder and also IPKG_VARIANG, u-a
providers are set in sane-feed-ipk.inc/angstrom-ipkg.inc so its a bit 
error-prone, suggestions better patches are welcome.

Please test and ack.

Regards,




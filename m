Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1O8uxI-0003hZ-3K
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 14:41:00 +0200
Received: by fxm11 with SMTP id 11so1965066fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 May 2010 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=LFZlAd/qM+slxvcHSj82PcO577tnT+JqIFahBUBdbAQ=;
	b=MKuo6mGCsb0I5b9GQG4t+fikXUZ3LPc8hEPxTKPvX5riJPnNtSs/AJsJxEnx931aPH
	LFUiVYfrQIyEzH8qBs7d3VyYjRRgtUPJH8MfqGH/S3Q+DqV8iSSlqdbSNaoU37tJGMNr
	Gg8y2atgwrLuHDgFrIdZgQst4xZvMC9AYUsQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lmh6afcGHaS2Uoy4VCPWP7DkeRoAapCD3MBPNxnPb740sCyavCMog2Pi1mKQrcio0q
	quHwdggZmN/qhEOzd0yB0ZZtksUVZYuSKRCjXmq+roDnz82JV+EBRWX3NiZPw02AT+Of
	SYJRfq6GiWz3X53MWZSdHneVcT8PJhi4H6nJQ=
MIME-Version: 1.0
Received: by 10.239.177.212 with SMTP id w20mr1454670hbf.126.1272890234431; 
	Mon, 03 May 2010 05:37:14 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Mon, 3 May 2010 05:37:14 -0700 (PDT)
In-Reply-To: <d1b08f941002061618i53d87452r826beee6da0b4a08@mail.gmail.com>
References: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
	<d1b08f941001220212v588c5f9bvbf2a149660a86898@mail.gmail.com>
	<hjceds$nsr$2@ger.gmane.org>
	<d1b08f941001281450o3dc53131je7168dbfbca9c1c8@mail.gmail.com>
	<d1b08f941002011024p60f08708xbb56a3293fe73dba@mail.gmail.com>
	<d1b08f941002011357y4285709w44dbed0b4e2c4b87@mail.gmail.com>
	<hk7nl6$rik$1@ger.gmane.org>
	<20100201234729.GB2493@xora-build.xora.org.uk>
	<d1b08f941002061509y424103c3sa00e993c0deb485e@mail.gmail.com>
	<d1b08f941002061618i53d87452r826beee6da0b4a08@mail.gmail.com>
Date: Mon, 3 May 2010 14:37:14 +0200
Message-ID: <o2kd1b08f941005030537zaa129f82g78c99ebaf1e95783@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	zaurus-devel@lists.linuxtogo.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Zaurus: make updater.sh obsolete for poodle, clamshells and tosa
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
X-List-Received-Date: Mon, 03 May 2010 12:41:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

I rebump the topic because a couple of weeks ago I did some changes to
zaurus-updater.

The actual revision in OE has following targets (in capitals too):

Part.  File

mtd1 uboot.bin  =  u-boot (deprecated - old testing)

mtd1  zImage/zImage.bin  =  kernel
mtd2  initrd.bin  =  rootfs (now *with or without 16b sharp-headers*)
mtd3  home.bin  =  here you can flash a second rootfs or restore a
backup of /home if set on mtdblock3 in fstab
hdd1  hdimage1.tgz  =  rootfs on first hdd partition (spitz only. Do
we really need this one and gnu-tar for the installer?)


I suppose that all models where originally shipped with 'signed'
binaries, to have a coherent master version.
We still don't have a precise idea about the used checksum...


Regards

Andrea



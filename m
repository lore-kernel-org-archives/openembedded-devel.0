Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Nc0zT-00008w-Iv
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 19:27:18 +0100
Received: by ewy4 with SMTP id 4so558862ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2010 10:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=lu7gnI44Ot+EWPKxXY6Pslh36pz50KcmYsvpBZKX/7k=;
	b=GFYEjPSTOrMKNtDbJwV6BBgbSajRh0zOT69ukID9GfSitjsIOZc4YyXTZoR6OXNz1A
	pJKuPkb2NwP8YuXg3Hf1AyDAhcNIy1OEWP8gxnDOo6sLg38LxBKgtaCYSn6D3+MNkaKa
	8Eg1e8twz34ArHxw8wIol5FAEK1MdVhVD1mwE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Udn+pChBXU7EWevHrjlTXd8UlV5IFmhqIkZXh6ITR0lNr+2cS08bQmuht/r5wn6gUY
	w7dNo9pQrlcMxOtH4a3Y0ZO+GEyi17sWlPdJz4ovKHnbjNlhdNimoJk7xMTWTrW4bw3e
	XWPX1534KkoxeaBIMW83RowKR3lc488ts8bco=
MIME-Version: 1.0
Received: by 10.213.97.28 with SMTP id j28mr3532744ebn.82.1265048688039; Mon, 
	01 Feb 2010 10:24:48 -0800 (PST)
In-Reply-To: <d1b08f941001281450o3dc53131je7168dbfbca9c1c8@mail.gmail.com>
References: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
	<201001172013.06010.marcin@juszkiewicz.com.pl>
	<201001172258.25258.jay4mail@gmail.com>
	<d1b08f941001171559w5ae011a6u61715d0fd236046@mail.gmail.com>
	<d1b08f941001220212v588c5f9bvbf2a149660a86898@mail.gmail.com>
	<hjceds$nsr$2@ger.gmane.org>
	<d1b08f941001281450o3dc53131je7168dbfbca9c1c8@mail.gmail.com>
Date: Mon, 1 Feb 2010 19:24:48 +0100
Message-ID: <d1b08f941002011024p60f08708xbb56a3293fe73dba@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Zaurus PDA developers list <zaurus-devel@lists.linuxtogo.org>
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
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
X-List-Received-Date: Mon, 01 Feb 2010 18:27:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Again on this:

chatting with Eric about the pxa-linking-bug-r1 patch, it seems it is
needed because of a bug in updater.sh:

Same was reported here:
http://www.oesf.org/index.php?title=SL-C3000_Updater_Script

				## Bug in Sharp bit
				## original line...
				## /sbin/nandlogical $LOGOCAL_MTD WRITE $ADDR $DATASIZE $TMPDATA >
/dev/null 2>&1
				## didn't use correctly determined block size
				## cause problems for other kernels
				/sbin/nandlogical $LOGOCAL_MTD WRITE $ADDR $TMPSIZE $TMPDATA >
/dev/null 2>&1
				ADDR=`expr $ADDR + $TMPSIZE`
			fi


OpenEmbedded updater.sh still has the 'wrong' line...

Opinions?

Andrea



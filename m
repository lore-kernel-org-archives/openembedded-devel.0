Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PMLYR-0008U9-Ta
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 15:15:08 +0100
Received: by wyb40 with SMTP id 40so2897512wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 06:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Hr1QkL/O6FGKNf69Pj7HUuTn/E0cbOd/pcoMLhNV820=;
	b=ZY5TZPwAbwrYHKkqDWN2gWgarqOHPtSky8q10Opc9vZvE3mDarRt4hUgL4MMDV+wrl
	g4CdN574fWIqcvwZUM9r3NjS/CHZtXhehhIu39PDpEEyMWN96k+U101d/lt7Aqut76if
	8N3roehN9wN28sxTrk5Z1s2yt8aV9I2HMjeV8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=T/cQXnsxPoKIem+uTYwhB8N3s4ycJGXt9uG9ajoIfCx08WW/LkDTm8WsyG/E8iI1m3
	fPKiNeK6cYVpF3f+e+WIsMDcM7Al7FS8br00ORoSCdY7ZlRzRYUFaEDZbyNFWHJWBMGP
	fpX4kdaT0+o1MITfmBx+UNtUSPQzh3hVqSkXg=
MIME-Version: 1.0
Received: by 10.216.199.81 with SMTP id w59mr967427wen.100.1290867226642; Sat,
	27 Nov 2010 06:13:46 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Sat, 27 Nov 2010 06:13:46 -0800 (PST)
In-Reply-To: <20101127140200.GH10755@ibawizard.net>
References: <1290768432-13366-1-git-send-email-ynezz@true.cz>
	<AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
	<ico56o$f8$2@dough.gmane.org>
	<20101127140200.GH10755@ibawizard.net>
Date: Sat, 27 Nov 2010 15:13:46 +0100
Message-ID: <AANLkTi=kAyxY9i+_c-6UoeEp6ZjUf91m3z3UE272ibVu@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3 which unbreaks x264
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
X-List-Received-Date: Sat, 27 Nov 2010 14:15:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ok, then I suggest to stay with 0.9.30.2 and add the two hacks documented here:

1) replacing log2f(i) with logf(i)/logf(2)
http://www.mail-archive.com/uclibc@uclibc.org/msg04949.html
2) '--disable-tls' for e2fsprogs
http://patchwork.openembedded.org/patch/2069/

openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Opinions?

Andrea



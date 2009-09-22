Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1Mq6TV-0004zg-2E
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 16:36:16 +0200
Received: by ewy20 with SMTP id 20so2296245ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2009 07:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=hMuy6fuzZv/uSauMW1PvhKQSWj/naY/42m/U83GpNoA=;
	b=MlZzsD0pV/UUIxeYQUGAg4Wv46URRp1dgKOBv5aMECwTJkgJYWFysMPj9ZQnDLgEm1
	Zw7gv6MQjwBXe3u3FVgUy89Xp62PckQJWLcqGmkS//lxoHIejGheZqjsyErHtCqlXdUo
	poCT+q0aSxKeZJ7kshynYTZrOv3+hbEFIAi4c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=f2Or9bQlzKTh/xurAIAIysT4m5a95K2mXpOUddU7mFkBCmj+FGl1BDmYsXJJXWU9Vs
	i/2ooTvX3U0fOXPnj5lFlrvk3VgRuprmr8sjpIBjGlodXr807WN9VU29lR9plca4g26/
	7+7zpsOEROoArUNAQfqQ3x1LGm8OJj7kuzCAA=
MIME-Version: 1.0
Received: by 10.216.86.132 with SMTP id w4mr246583wee.87.1253630135069; Tue, 
	22 Sep 2009 07:35:35 -0700 (PDT)
In-Reply-To: <359c5480909220611m64f169a1g6c833a0a82d9a38b@mail.gmail.com>
References: <200908021211.14793.mok@mnet-online.de>
	<359c5480908040048t54ac4adbsa6a4e4fa88b7557f@mail.gmail.com>
	<359c5480909211003p49f636e9p38889c4967b2acc4@mail.gmail.com>
	<200909212005.31498.mok@mnet-online.de>
	<359c5480909220611m64f169a1g6c833a0a82d9a38b@mail.gmail.com>
Date: Tue, 22 Sep 2009 16:35:35 +0200
Message-ID: <359c5480909220735n4a476beeme970c1ae821bce48@mail.gmail.com>
From: Nicola Mfb <nicola.mfb@gmail.com>
To: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
X-SA-Exim-Connect-IP: 209.85.219.220
X-SA-Exim-Mail-From: nicola.mfb@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org, shr-devel@lists.shr-project.org
Subject: Re: [Shr-Devel] some RRECOMMENDed packages do not get included into the image
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
X-List-Received-Date: Tue, 22 Sep 2009 14:36:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 22, 2009 at 3:11 PM, Nicola Mfb <nicola.mfb@gmail.com> wrote:
> On Mon, Sep 21, 2009 at 8:05 PM, Klaus 'mrmoku' Kurzmann
[...]
> Anyway it boots but at some point I get:
>
> ...
> Configuring ...
> Configuring ...
> Removing old /usr/share/gpe/pixmaps ...
> Press enter to continue

It was opkg postinstallation of gpe icons, I just removed the "read"
line and it booted, finally I can see Xorg!

[...]
> On the second forced boot I lost usb networking completely

No way to reproduce doing normal reboot, passing the gpe-icons
postinst dropbear starts normally, before it may be that hard shutdown
with long power press broke my filesystem.

Regards

    Nicola



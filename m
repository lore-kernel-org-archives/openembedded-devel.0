Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pr6TE-0001R9-DU
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 11:24:52 +0100
Received: by qyk35 with SMTP id 35so561650qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 02:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=17wWItwBcKoNfUDmFdzh6UMVb4aBHwfeWeNFMaBsxz0=;
	b=K0Lpf7bHJ2r7QiaipoBJYGqeCC2sgwb32ISM2YVhkqKEy6uzzw/WuAKo//mDXpLO8V
	td2/bQof8/SReCX5MnQHgPQVBvMoHCGN3KY8QaQF0JIN0qyS6j8sGOYjYZhUPhxT0TH3
	OFwAqKgg0jbAUbObcZhuymF70cDaoZ1547jzA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dmU3oaHI+FTRZWSNSl+LwsQwL39HzFTxQH6TSNj6gysivO4DFt6GuqL0IU68/vglgy
	EKvVreg/sEFQjkEgNa00f+YlZxt0t+lMyCV7teZBKMSMmk2nRSplynC6Pg3mpOitD0aQ
	VP8LGHfQWNs9+5mHKNIaeZoCYMsQb8tnOq708=
MIME-Version: 1.0
Received: by 10.229.6.207 with SMTP id a15mr124704qca.298.1298197415863; Sun,
	20 Feb 2011 02:23:35 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Sun, 20 Feb 2011 02:23:35 -0800 (PST)
In-Reply-To: <20110220011124.GA3451@sakrah.homelinux.org>
References: <1298063776-2260-1-git-send-email-filip.zyzniewski@gmail.com>
	<1298158249-10217-1-git-send-email-filip.zyzniewski@gmail.com>
	<20110220011124.GA3451@sakrah.homelinux.org>
Date: Sun, 20 Feb 2011 11:23:35 +0100
Message-ID: <AANLkTim8Ati0-iYJwm6ePhHxU6+-iFhe9-zM_pAJcP_4@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv2] package_deb.bbclass/apt: armel architecture name for eabi systems.
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
X-List-Received-Date: Sun, 20 Feb 2011 10:24:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/20/11, Khem Raj <raj.khem@gmail.com> wrote:

> did you test the above calls ? I think these append should be defined
> individually i.e. duplicate them

I've changed it to be symmetrical (both call a separate function) so
that I can verify it on my build and avoid duplication of code.

> while at it please get rid of do_stage

I've removed it and resulting package has the same contents, so removed it is.

I have just realised that I've skipped increasing PR, I'll send a
fixed one in a minute.

bye,
Filip Zyzniewski



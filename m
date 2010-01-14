Received: from ey-out-1920.google.com ([74.125.78.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NVMHI-0003df-0z
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 10:46:11 +0100
Received: by ey-out-1920.google.com with SMTP id 5so49827eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 01:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=piQg+JnO0EKCEojWMNkClOKQVKSl0ifEIMUBv3WKLPM=;
	b=kyCa5LbCsgEod1UZg7CVFPcTJ6dSQ3bip7s58yflj46oOFcWU/07QD1TrUrSojvuyn
	n+CXZ9LxMz3pg4dqpAAgEakcxk+q0kowsvZhfI6zXFa1/Ww8hRXcMvm9jjGgs9j+bgVv
	GAHMqrlQvKwfF6f/vZ23pIF0a8Im2TO4D3Gtw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UPWki2Swcpn71/0R8M0BKiGR7H0Llw3UaDv8mH/40ifPGgwx+C+5HHoFRUrl6fArKP
	eG1LvlBD6qOP/JfKPUQAV9sYKRoAUqUbtvB1STU9kcWVMFkUJLnkGGl2/JJ2SiJIfdY4
	AdxPqu1KkCPlVs9IkC+ivtDlUxqW1G5XTSJdo=
MIME-Version: 1.0
Received: by 10.213.102.138 with SMTP id g10mr587407ebo.19.1263462239259; Thu, 
	14 Jan 2010 01:43:59 -0800 (PST)
In-Reply-To: <4B4EE2DA.5080106@rambler.ru>
References: <318819580.1263399029.155991028.16785@mcgi25.rambler.ru>
	<4B4EDCED.6000107@gefanuc.com> <4B4EE2DA.5080106@rambler.ru>
Date: Thu, 14 Jan 2010 10:43:59 +0100
Message-ID: <d1b08f941001140143l633e1a8dv3daef77d91ad6cb5@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.148
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Adding a new Machine question
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
X-List-Received-Date: Thu, 14 Jan 2010 09:46:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

>> At a guess (as you haven't provided any specifics) I'd guess that you
>> need to look at the kernel configuration.
right

Setting DEFAULT_PREFERENCE_yourmachine = "1" is not enough: you have
to provide a specific defconfig for your machine, in a subdir of
linux-2.6.32+2.6.33-rc4
Actually only spitz machine has one...I suppose you are building using
default defconfig.

Regards

Andrea



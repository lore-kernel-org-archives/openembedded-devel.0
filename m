Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1M8iRc-000493-JN
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 00:14:56 +0200
Received: by bwz19 with SMTP id 19so3387622bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 15:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2FT39ZhGsT8aTOGIKqIwzEtU94eUcEg56FENBNJ2adA=;
	b=bGSpl4/Uyhd83CvytijOXNapgEJZJ84/oRpmDRTVKNbATKRWNcdlZzrQeYoc9XGfsJ
	J7uDSMvdxd0UINOP316TKBE/mmsbHyT5A2nY8hxMvQ80dg24LR7b55009SUOxSls1vqf
	dmbm+gSF2t3PdYHFIjXwNCjdEwOMFbSW/iL78=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iqVXP4kHgzb0coH0T9SlfrXkuKcuhLyBk1ix1sTYnXB+noBFaloHkT/raNUFAh8cjK
	cq72gJXOef+9eWAH7ii7dNuWaeI3+z+dT0/YCCJ4XaU0NSqu//jcg7NOZP5+MSqrs0P9
	MiqPXUw1mtEYAuGs6zIRPLazndndc1piNz9uc=
MIME-Version: 1.0
Received: by 10.223.106.15 with SMTP id v15mr3956240fao.15.1243289212234; Mon, 
	25 May 2009 15:06:52 -0700 (PDT)
In-Reply-To: <1243268900.4869.47.camel@lenovo.internal.reciva.com>
References: <d1b08f940905250229o2482fda0l7ec6e57804542665@mail.gmail.com>
	<1243268900.4869.47.camel@lenovo.internal.reciva.com>
Date: Tue, 26 May 2009 00:06:52 +0200
Message-ID: <d1b08f940905251506s7edaace2s3de03407059c6b12@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][Zaurus] (Re)move obsolete kernels
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
X-List-Received-Date: Mon, 25 May 2009 22:14:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The culprit:

./openzaurus-pxa27x_2.4.20-rmk2-embedix20050602.bb:
COMPATIBLE_MACHINE = '(akita|spitz|borzoi)'

Discussing with Phil about the opportunity of using the defunct
'borzoi' as dummy target, he pointed out the following commit:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=52dcccdfd31b0b0c9ac4725dd52a20b88a6b7b7c


author	Richard Purdie <rpurdie@rpsys.net>	2006-04-08 19:18:40 (GMT)
committer	OpenEmbedded Project
<openembedded-devel@lists.openembedded.org>	2006-04-08 19:18:40 (GMT)
commit	52dcccdfd31b0b0c9ac4725dd52a20b88a6b7b7c (patch)
tree	06a634a182886ead6e16e3dad4fb1b3dc258ec4c
parent	5bcdb4abd61e4d64aec042d9bb27e8ff275530b3 (diff)
* Remove 2.4 machine support for c7x0, akita, spitz and borzoi.
* Remove borzoi machine entirely as its now equal to spitz. * For
remaining 2.4/2.6 split machines use ZKERNEL_VERSION instead of
KERNEL_VERSION to fix a long standing bug - people will need to update
local.conf. * Add dummy terrier MACHINE to point at spitz.


Thoughts?

Andrea



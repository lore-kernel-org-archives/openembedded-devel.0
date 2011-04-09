Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q8Rm9-0001zd-7M
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 08:36:05 +0200
Received: by yia13 with SMTP id 13so1704322yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 23:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:subject:from:reply-to:to:cc:in-reply-to
	:references:content-type:organization:date:message-id:mime-version
	:x-mailer:content-transfer-encoding;
	bh=BF1zBqUKpsL9oonsVwqFcEXbmSvGKCfPV7LxTnhGnAU=;
	b=nP3xqdEZWU19d+nMpPh0nvPuI6NbkURpxCTqdnMckANcivrVLakv0nAameNCsClBgr
	AfgELdN04rC/6/NTJY547+RMnD5llqTF65xD9UKHfheBHZbVgTxrICK4tslHVn9T0+5N
	4wXa36afggrL1dFVOpCmItwdcmsXq2ymgMLMM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:cc:in-reply-to:references:content-type
	:organization:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=DNjLDj1+kGUOI5+U0SeG7hxsM57JJellBGGR4dqudspqhXiOPFwqQFugA6dFcEF+3F
	GPBWg+d+TFIy4xxZ6f0ed4lA9/45F1K0O+A4i3df6GKmLY1nHfVl8nWG/9Puc42rdYsZ
	XULmVRSYbKJ9B5OLDmQapLsXe7ILF3Q5wUPD0=
Received: by 10.236.181.41 with SMTP id k29mr4016326yhm.62.1302330834012;
	Fri, 08 Apr 2011 23:33:54 -0700 (PDT)
Received: from [192.168.1.67] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 41sm1657651yhl.23.2011.04.08.23.33.49
	(version=SSLv3 cipher=OTHER); Fri, 08 Apr 2011 23:33:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimS+CcrB7cHUF+ao=XwD0aXeFqt4r1N4erHoKFs@mail.gmail.com>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
	<1301660208-31105-3-git-send-email-otavio@ossystems.com.br>
	<in4lhs$326$1@dough.gmane.org>
	<AANLkTimRF7Q3=XeF1EOHgPNAGfJwnp5PmjHGyjUhTyef@mail.gmail.com>
	<CC5D751E-FF84-40C2-B184-4C813C49F5E4@dominion.thruhere.net>
	<AANLkTimS+CcrB7cHUF+ao=XwD0aXeFqt4r1N4erHoKFs@mail.gmail.com>
Organization: Sakrah
Date: Fri, 08 Apr 2011 23:33:36 -0700
Message-ID: <1302330816.15056.15.camel@leto>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 3/6] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Sat, 09 Apr 2011 06:36:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-01 at 11:16 -0300, Otavio Salvador wrote:
> On Fri, Apr 1, 2011 at 11:07, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > I guessed that much, but why don't you want .la files in the -dev package? Your commit message doesn't give any clue about it or anything else.
> 
> Those are  for the modules that are dlopened so not required. It ended
> up on the regular package, no -dev.
> 

I think right fix is to put them in -dev package for now

-- 
-Khem




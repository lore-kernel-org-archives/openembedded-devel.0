Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LotQS-0000DD-F3
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 07:55:48 +0200
Received: by fxm20 with SMTP id 20so2631488fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 22:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DipKCaKKm1MvVMVkh0iDKu+JjilztxS7bwC4TAQx758=;
	b=i0SNrQyMwBP0/Gx6CNT5QgxeMyU0nfw5ee9t1n5Bx0MZmRM7duZ0xkPAVJOnTvxutX
	XQESs4fsLNeYtksTCq2S+Pua+3pOszMSxFUVzG4nu2W8D6SY23KNXN/ug6suQHixF/rr
	W757DM/txIDXe8VnSLMvGP38Ziher/pF/7GS0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hcdWdCMdh+Qw9wzGhi/kEfcLtS5kTWdzIpmggv0sQpEnZBVS4faKvIYNQi/UZS1Yog
	6kT6WT8eA0Rt5xyB0t6NtU5D4OoR8FmMzyuCWJTmiAP7Q3OKVWBFhsgqf1R1RgohTyB6
	2KBXWrGz1F4eg/cd0hcIwrEDSEgUK7ogKlW5c=
MIME-Version: 1.0
Received: by 10.223.114.135 with SMTP id e7mr5765689faq.89.1238565209834; Tue, 
	31 Mar 2009 22:53:29 -0700 (PDT)
In-Reply-To: <1238532016-3172-1-git-send-email-k.kooi@student.utwente.nl>
References: <1238532016-3172-1-git-send-email-k.kooi@student.utwente.nl>
Date: Wed, 1 Apr 2009 07:53:29 +0200
Message-ID: <ac9c93b10903312253xbbb5bfl5df6b25105bdaf2b@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [STABLE][PATCH] linux-omap 2.6.29: disable alignment trapping completely for omap3board
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
X-List-Received-Date: Wed, 01 Apr 2009 05:55:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I suggest to add the mmctiming patch I made last week for .28 also to
.29 and to the stable branch.
This one increases the timeout for sd/mmc actions causing cards where
the timing is near the edge to work.

Not sure yet what the root cause is of the problem as the card used to
work with .26
Actually just now thinking that it also could be something having to
do with timing accuracy or rounding or so.
But anyway the patch allows more cards to work while there is no
negative side effect for others (as it are only two timeouts that are
being extended).

Frans.



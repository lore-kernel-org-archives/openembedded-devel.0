Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RToVZ-0006aX-Jz
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 06:39:33 +0100
Received: by wwf22 with SMTP id 22so1880628wwf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 21:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=x82q9GI/IbcQbGBvBKYnIWdHBmUKztIEAZg4LOLUIu0=;
	b=MhHSdXLfKE63epk1xcZmPVQazquLG22rk4WeRiKFfVgA/gsKV5aZHkzqONnCKsVBnZ
	gL/i70X9DT5cqKXu56KL5UKw4dnEFag+eSQmp6MuyyzFr9AeNil0vXTr4/Nq5/4iJxFF
	EOcXQREnODTbJ0qT/me0E2YfACT/WV8X1i9Y0=
Received: by 10.180.81.73 with SMTP id y9mr32140780wix.37.1322199176764;
	Thu, 24 Nov 2011 21:32:56 -0800 (PST)
Received: from xp1.wyse.network
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id gd6sm26628985wbb.1.2011.11.24.21.32.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 21:32:55 -0800 (PST)
Message-ID: <4ECF2887.2040400@googlemail.com>
Date: Fri, 25 Nov 2011 05:32:55 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20110312)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EC81A85.8050704@googlemail.com>
	<CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
	<4ECE4B0D.6030401@googlemail.com> <4ECE5422.3070504@googlemail.com>
	<20111124174936.GA28767@sakrah.homelinux.org>
	<4ECE87A9.8040109@googlemail.com>
	<20111124182713.GH28767@sakrah.homelinux.org>
	<4ECEE6D8.7080802@googlemail.com>
	<20111125050922.GA30623@sakrah.homelinux.org>
In-Reply-To: <20111125050922.GA30623@sakrah.homelinux.org>
Subject: Re: "cannot find -lppl_c" link error
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
X-List-Received-Date: Fri, 25 Nov 2011 05:39:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

>> That did not work, unfortunately - "perl ./Configure" doesn't like these:
> 
> well where did you add them ? they should ONLY be added for gcc-cross
> recipe
Well, considering my OE experience is just a few days old (if you can call it that), I placed this in my local.conf file. Then I realised I should put it with the failed task recipe (gcc-4.5-initial) and then by looking at the actual file itself I realised that the gcc-4.5.bb is the place to go. 

I have just finished my built - the whole lot and with a lot of warnings, mainly from unpackaged files - don't know whether these are important though.

I'll probably spend the weekend fine-tuning this as my build went over 25G in size - massive! Thanks for your help Raj, much appreciated!



Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@gmail.com>) id 1QTvw8-0007RH-5G
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 15:03:12 +0200
Received: by wwb17 with SMTP id 17so4113127wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 05:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:cc:subject:message-id
	:in-reply-to:references:organization:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=x6o8HRuwhnqE/byb8irKnGPAehMFrlDL8sN8R6rlGjc=;
	b=kzQZnc5YcImldt+ot98Jmqe1AJ9MN4YZUHBvcJ0hsUGecGbUe/LIA7a8SO1mG9JlAp
	p3phXszBPevNORfUzxmQyLwVYfi71ml4BSU0+MvtXcm+nYfSvuLCXKVnsFXP+h3MM1xf
	RmBmOFCTkd4HDf1Nmbvs4ywAXhIsqaCBP5x+Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=Gy/CX/NWhBYk3sRl0lUgq0S+Nlk2MSvffNg/3QBu6m4bmHi3ao1ghOnLp1q32M7Zqj
	lga3Dwnr9GMsUKeOlEp/xiCwk9US3cB1Uyc+6DZDIZndGXMUCDIGcTzVcP/WqZ5Bg9UO
	IA73HIQFLyDDozSl3k4e/X4fzHLVPFAg1g8sA=
Received: by 10.216.232.13 with SMTP id m13mr3663910weq.110.1307451594685;
	Tue, 07 Jun 2011 05:59:54 -0700 (PDT)
Received: from guibc (vig38-2-81-56-113-2.fbx.proxad.net [81.56.113.2])
	by mx.google.com with ESMTPS id g4sm2856117weg.12.2011.06.07.05.59.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 05:59:54 -0700 (PDT)
Sender: guillaume beraudo <guillaume.beraudo@gmail.com>
Date: Tue, 7 Jun 2011 14:59:50 +0200
From: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110607145950.3bd432a7@guibc>
In-Reply-To: <isl6bu$ot6$1@dough.gmane.org>
References: <guillaume.beraudo@belledonne-communications.com>
	<1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<isl6bu$ot6$1@dough.gmane.org>
Organization: Belledonne Communications
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: Re: [PATCH] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Tue, 07 Jun 2011 13:03:12 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> > * included alsa_8khz patch to get audio out at 8KHz rate.
> > +SRC_URI_append_igep0020 = " file://alsa_8khz.patch"
> why is it machine specific?

It was required for this specific hardware to work.
Moreover it slighlty damages latency.



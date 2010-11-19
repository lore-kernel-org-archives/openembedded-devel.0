Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1PJaEx-0007lO-7I
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 00:20:07 +0100
Received: by fxm11 with SMTP id 11so3259291fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 15:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=V7lgS4W2DKwNvEasISv9xgAHnOd7ioEfjzViuXLey5U=;
	b=QXDvu5of9zSz3E9j7ZfIwK+ADYe4vFxHf2v8WDmBQKkhz7HYwJCpJIoNJGhPrFG3hd
	ZFwEAeo6+LKI0yqVU159kjoEc+TvfmprzIR3YZG377ynNw1n+3jHjP3cPKxRb1pqJVTw
	1twOLd4aYCjo6mL6UpyniYf+bT+QRZ1QPrGlU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=v0kQanWAHOJ58PGinnAuF41saVAqmvm896eTk34Z6uLPjbaLx0QJVLzbI9u9XcGWsK
	qcX/j2tqNJw7693PgXQg6XYe6iwM9hUY/ovXBO5mq1jUJS5O4xqHd9Q6pGuXQBnzKlBW
	CaEU64la0c6S6AcxprXtrZE9njcbgwBWG5y1Q=
Received: by 10.223.116.200 with SMTP id n8mr1544605faq.61.1290208702439; Fri,
	19 Nov 2010 15:18:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.125.138 with HTTP; Fri, 19 Nov 2010 15:18:02 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
Date: Fri, 19 Nov 2010 16:18:02 -0700
Message-ID: <AANLkTi=aMYQXCUQLzTAfAPeNmvV38Emtckaw_EmXzBmL@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: any reason to not cache `opkg list`?
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
X-List-Received-Date: Fri, 19 Nov 2010 23:20:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

My assumption is that the only time the results of `opkg list`
will change is after `opkg update`.

Is that correct?


If so, why not have `opkg update` generate the output
which `opkg list` produces such that `opkg list` is instantaneous?

AJ ONeal


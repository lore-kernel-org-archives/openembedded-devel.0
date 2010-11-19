Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PJZzE-0000sg-5c
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 00:03:20 +0100
Received: by wwb22 with SMTP id 22so52778wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 15:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=vtWIzkghU6vNqG0jFfccX0zxveZ5XTSy1FdJHaFnqwQ=;
	b=v4pd/VlmWGcTZ6WN0RhxRWsTKiEEQA/UdA6vsbt+tosmNLkBptaAf3ydX0z1TjY9cq
	XF8Ws0DbhaZLU+jWHfHQsqK+5rPdxwXT1k+HfhnoI4Plesc2+i5Wkg7Sw2ZsmfC55r3o
	z/+cQxXVEytqud/eQxBI9tNXalWNAX5/OMvwA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=eB4yAppx0QJDxEpJq0RF504uI+0wkuQW3Ydzvvw5ORYHk8Ku8QdmQHLr89UtDF9Wcb
	sWYVp2PRGyvZdBZCEm3jRu5pqtP6befL1Lz078CKvuDJHtpiJtCT7Wgv2oz55lyXrsns
	621ulVcP4JB2Lw9BWBGYUW529+zRa/wG6kbwk=
MIME-Version: 1.0
Received: by 10.216.173.194 with SMTP id v44mr2356910wel.100.1290207730633;
	Fri, 19 Nov 2010 15:02:10 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Fri, 19 Nov 2010 15:02:10 -0800 (PST)
In-Reply-To: <4CE664DB.30709@opendreambox.org>
References: <E1PJA5d-0001qe-R1@melo.openembedded.org>
	<AANLkTinfS==Wq=xreD6uJA8g7sNKwDw8roPGXRAsihkw@mail.gmail.com>
	<4CE664DB.30709@opendreambox.org>
Date: Sat, 20 Nov 2010 00:02:10 +0100
Message-ID: <AANLkTi=XS7HQ9LTDBmMmKmas_R5BxfhrADu6T8X7OmYf@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Andreas Oberritter : pkgconfig.bbclass: don't blindly install every . pc file
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
X-List-Received-Date: Fri, 19 Nov 2010 23:03:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Please try removing the do_install function from libgpepimc.inc first.

Yes, that indeed seems to fix it.
I did oversee that task when converting to new style staging...my bad ;)

Thanks

Andrea



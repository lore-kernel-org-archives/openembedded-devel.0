Received: from mail-iw0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PS9QA-0007UW-0s
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 15:30:34 +0100
Received: by iwn1 with SMTP id 1so9737555iwn.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 06:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=R77snYx9+ivgpGd3+oMlkX5v2wivPg0sRLvcUOjzg6I=;
	b=rZPqlRfO8ya4C1xfiGrZah2lGApGLhBqALa8OZMGCpdXFVgH9v/4l+7rrB/slAtxtU
	6B13zc+CpP9kTJcDxuLksekUeBqFW2mRs3k9RBOYlc2UqvLURsiitluUniFsnbZOSz0X
	Rn5kPga0/H48cgnBTmcBhtzU48VpVEV1qOenQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WW+WuMY+2iZVJOqiLgq8uAVOyKxM7FVIMEcKXm/tSkbYMZg8BjkZumbButc5q+0kE4
	lYWk2Iv5JYneRO6sAYWGaZA/V3XcdezwOOiL7CvJzy/sTuPYyeEBdYC0EAsvdiLan8RX
	Tiinv+yN9KzXK4HNnbPvxTSQPoW54fUYbMBDk=
MIME-Version: 1.0
Received: by 10.231.206.7 with SMTP id fs7mr1912192ibb.82.1292250539527; Mon,
	13 Dec 2010 06:28:59 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Mon, 13 Dec 2010 06:28:59 -0800 (PST)
In-Reply-To: <AANLkTim6OtGFRPtXA-pQuGT0efA755FpxJVsUghks8gg@mail.gmail.com>
References: <AANLkTim6OtGFRPtXA-pQuGT0efA755FpxJVsUghks8gg@mail.gmail.com>
Date: Mon, 13 Dec 2010 15:28:59 +0100
Message-ID: <AANLkTi=XiHz=Aza5CC9Y0yOqtgrntQ6Edf0rKNkO2aT8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gettext libtool ARM issue
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
X-List-Received-Date: Mon, 13 Dec 2010 14:30:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/12 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> We seem to have an issue with gettext and libtool on ARM
> I cannot build git head on our autobuilder for ARM based platforms.
> (tried sheevaplug, armv5te and beagleboard armv7a). (distro minimal
> build host ubuntu 10.04 x64)

Woglinde suggested on irc that it would be highly useful to have the config log.
I've uploaded it and config.status and configure here:

http://www.easy-share.com/1913272622/config.log
http://www.easy-share.com/1913272623/config.status
http://www.easy-share.com/1913272624/configure

(filebin was not responding so diverted to easy-share, sorry for the
inconvenience, if someone has a better suggestion, please let me
know).

Frans



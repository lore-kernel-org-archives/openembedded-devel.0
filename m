Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PUUxj-0001ke-L8
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 02:54:55 +0100
Received: by wyb40 with SMTP id 40so2457326wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 17:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=kELLpAAsQ9giDrth7+1/Fh/MjHIllVv1ZAH9Huugi3U=;
	b=GyKEbIsVZpSZM/pX3k5PGgPqGVAmeF9bKq+0HvRRIxEdfVqysyz+fFcE3kMlHSw9aZ
	U1JRvwGw4PVX4Ppg8pxbx4/ZI7DvheQ54lqjcRqAD6aTjATKbNWGmcgSpsNm+gZx/++4
	voWnH8ZXwXqh1zB8V/uyYyN1G+qNRs9KPFI6k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=pHNQFZFeJf6HN4cKZhhGaXuDT9/17wcK7Swk4UXKfMfcCo0+C98EK45YJPra0tivIZ
	YeUoyxCtcqui0xc07bWqkeE1qqXp5crrIiq9C8hFyVNBwmEuuRxqGCcLgGw/dm5l5ygm
	SgpZY6zlK2MLMO8b7Z6gg4ozyXU5eZslMCFvY=
Received: by 10.216.154.8 with SMTP id g8mr616581wek.12.1292810090902; Sun, 19
	Dec 2010 17:54:50 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Sun, 19 Dec 2010 17:54:30 -0800 (PST)
In-Reply-To: <AANLkTikotnoR4+_vA7_O1xAyRj5FBosconGFkWjSfzr4@mail.gmail.com>
References: <AANLkTikotnoR4+_vA7_O1xAyRj5FBosconGFkWjSfzr4@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 19 Dec 2010 18:54:30 -0700
X-Google-Sender-Auth: eKLuoBZVOCrU8nJ2gva7qk-Nuj4
Message-ID: <AANLkTi=GGyxNfDzV==iO+nNPKqoShRbUXLY-QDAUMzrN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Building Image with all dbg packages?
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
X-List-Received-Date: Mon, 20 Dec 2010 01:54:55 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 19, 2010 at 6:18 PM, AJ ONeal <coolaj86@gmail.com> wrote:
> How do I get all -dbg packages to be installed by default?
>
> I have
> DISTRO_TYPE = "debug"
> in build/conf/local.conf
>
> but when I gdb stuff I still get a bunch of
> ?? 0x2345() ??
>
> What else should I do?

IMAGE_FEATURES += "dbg"
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics



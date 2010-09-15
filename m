Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OvvDw-0004c7-22
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 18:52:44 +0200
Received: by wwi14 with SMTP id 14so466540wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Jk7BXjdMRaTING65QFns4e5Ld6BFd5N9r0Dhe+GikYk=;
	b=IGj2nMKefJ62Cq4T9Kz1KvYFOYpNDamjJU48Aj+ULhwI4YLxbbTWcT4qd7ZtnA5YE6
	poBKl9JR+SIhll5dLItnBqkMiExPozLsQcajULqhZCfAPtP1+m3CMt75+2rg22U9iz19
	4zRE2p9QUZWJXG08SVQNFUkOZZRFDiSzcI8VU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=gmxBn5cLUtBfAUWO6Hc5FAdKhCqtsoRPjD/sk2yJtZ1CEhVnbwvM75KfXikKNuqnfu
	K7V1R8y/smkFCXQc07iT6yzFF7ugyEO2BzNYlGdGeSDuCOhtxyrxQWXm/V7riObHB2+W
	XcQfrUDtWaEt8GdgJB1z682ncHu6BnWxRIDSs=
Received: by 10.227.155.3 with SMTP id q3mr1568805wbw.130.1284569514778; Wed,
	15 Sep 2010 09:51:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.168 with HTTP; Wed, 15 Sep 2010 09:51:34 -0700 (PDT)
In-Reply-To: <1284567574.3890.36.camel@mattotaupa>
References: <1284567574.3890.36.camel@mattotaupa>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 15 Sep 2010 09:51:34 -0700
X-Google-Sender-Auth: QpecVpIZ2k67UbYGmPQPfh5h3Zw
Message-ID: <AANLkTinH0UTOuT6uSk+UL1aF9=C7f-4BqHMwydE0qcHS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Automatically utilize of `mercurial-native`?
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
X-List-Received-Date: Wed, 15 Sep 2010 16:52:44 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 15, 2010 at 9:19 AM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Dear OE folks,
>
>
> Eric added a mercurial-native recipe in 41ee3c [1] to eliminate the
> necessity to have Mercurial installed on the build host.
>
> Is there a way to build this when Mercurial is not installed on the
> build host? Or do I have to build it manually?
>
>    bitbake mercurial-native


See http://patchwork.openembedded.org/patch/2886/
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


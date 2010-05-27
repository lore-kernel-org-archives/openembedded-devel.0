Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1OHdU6-00053d-Ey
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 15:50:55 +0200
Received: by gwb15 with SMTP id 15so3187129gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 06:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=KstBMOTuwmXRWRht+xA83oR2468YJN2ZMK6LicVmMCY=;
	b=MC0J80+U+zpSUUyEVVUkJcSS7E4SDt5ub5Cjdyh1+buFqauboU/1/WR+FuIyLuED7q
	P9TVzXkrV1zJL1NP7lIqnZ+pnzEZKnxIhbuGFgGkizcBNeHuhotUTPgwI3TSUxgyPvqX
	SSOL4yEMFbSQ3ky6QogKX9MKmHQKnQAFCtQqk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=WJ1v02BwFcxZuiWJZhRsOPQWNa34T0AyW9gG4vIaBEaU4Lo1pYmJqyxzTOCiqEl69q
	4DNE1D4Bd94FrbC43Hxi880u/un5TWphBbqwVkPddhrJE8Xqzdoc8QJkcjYQ2VTWCHBV
	aULnYF8ayUw+mji9Oat98OYv1/viqmiwgpw1Q=
MIME-Version: 1.0
Received: by 10.231.147.18 with SMTP id j18mr684339ibv.12.1274968004332; Thu, 
	27 May 2010 06:46:44 -0700 (PDT)
Received: by 10.231.171.85 with HTTP; Thu, 27 May 2010 06:46:44 -0700 (PDT)
In-Reply-To: <20100527151451.85d5c520.ospite@studenti.unina.it>
References: <AANLkTin5ULxoMD23AleqaBLBxR8zinSd8OfO8NgpKvTn@mail.gmail.com>
	<20100527151451.85d5c520.ospite@studenti.unina.it>
Date: Thu, 27 May 2010 15:46:44 +0200
Message-ID: <AANLkTimphTn0f2lyPXt_QOClM4KV3uzLguFLAhzhcIXf@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: Antonio Ospite <ospite@studenti.unina.it>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: developmet setup
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
X-List-Received-Date: Thu, 27 May 2010 13:50:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Hi Raffaele, you can even avoid having a git server, look at:
> http://ao2.it/blog/2010/05/27/neat-compilerun-cycle-git-and-openembedded
>
> does this work for you?
>


Can be nice.
I need to have myapps on my pc already manually git cloned.
For instance myapp1.
So I modify in $MYAPP1 out of OE.
And I compile using :
bitbake recipes/myapps/myapp1.bb

If MYAPP1 == /home/devel/myapps/myapp1
I'll use
SRC_URI = "git:///home/devel/myapps/myapp1;protocol=file;"

The only problem is that for any change in $MYAPP1 dir I need a new fetch
and a new complete rebuild.
Not very nice for large projects.

Thx for your help,
Raffaele


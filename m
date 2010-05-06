Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OA4yf-0005W9-Uc
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 19:35:26 +0200
Received: by fxm11 with SMTP id 11so188892fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 10:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=OVTnAiszHIDkNGNaB2Dm228OE7NyVXro4ph+Z9FLuvc=;
	b=PX0Wv4otHTqKepoChFFAp1zva0gfrUywYCC7e9PrdmZfJvxwiWB4EE/f4bIViQ9TnU
	38CtrtnZGa88kGAiHEu2P6Fcat+yEjKydxpqAUSJNeOecC1cZfmZv38cs28TcFeAOguT
	XasbvtB0Ry2YFqCbFSD7o1C25IDm9DFZ0tY8E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=GaVwnl8IYKEGeQbeQkpi7mf2cRIa7T89ghBqLQjRxNwtjJxQpdfw6BgycOr5XVH2Gu
	XV1sBTUU3ypxY8vqP/xO1h76pAn8l5sQcrc51CENSy5SwLE31mCQKKgUMqg3fP+Jm5ar
	UtX0XLDVCxXXwsHe7K4iu5Lkep3eHyfYdEyF0=
MIME-Version: 1.0
Received: by 10.223.5.89 with SMTP id 25mr7010432fau.87.1273167080146; Thu, 06 
	May 2010 10:31:20 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Thu, 6 May 2010 10:31:20 -0700 (PDT)
In-Reply-To: <m2pac9c93b11005060635j1abeb64er76c391d607e43993@mail.gmail.com>
References: <m2pac9c93b11005060635j1abeb64er76c391d607e43993@mail.gmail.com>
Date: Thu, 6 May 2010 19:31:20 +0200
Message-ID: <v2n141020e31005061031ub521d900vf405fe9c6e682e7f@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 4134f55dc7d99516d750b24a60e5cec400ae5ef3: eglibc: Move away from legacy staging
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
X-List-Received-Date: Thu, 06 May 2010 17:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 6, 2010 at 3:35 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> I feel the above commit is not sound.
> If I pull the head eglibc does not build for me because apparently
> eglibc-initial does not stage limits.h any more.
> If I revert to the commit before this one, eglibc and eglibc-initial
> build, so this seems to break things.
>
> It might be that this went unnoticed, because there is no PR bump in
> this commit (which I would have expected, but technically if the new
> and old staging result is identical is not necessary).

Hi,

What version are you trying to build?
Today I've built version 2.11 before this patch as well as after this patch.
Both during rebuild from scratch and both after RP's WIP branch merge.

So this patch seems OK to me. I was expecting PR bump too, but it's not
a big issue today, because many people rebuild from scratch,

Regards,



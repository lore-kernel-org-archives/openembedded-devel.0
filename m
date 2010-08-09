Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OiWTH-0001MN-Tw
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 19:49:18 +0200
Received: by fxm6 with SMTP id 6so184213fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 10:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=T3zWYET2rHLgZkrnZui88a/H714YLMEScO0wBwEv37A=;
	b=CjnX37GJaYAS8X67JpShsTkB5gU50kVL21GeMegilAZscP5WwYEGSfjoyo9fj72MoI
	DFAwV7BxneA+how9jYgyLQ4VFUP1SUfEy4UMGxKDyahe/9STmgeIgmhktR+Um+J8r4dW
	oKJqMZruLsD2OxAMYm1JqZXk8pCxXO96yIXLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fUMFNYJ1nEiBDV8y3uIZkZ4VUcvUoR1iSdDJcq4Cd1a+qzP5TUeB2x5+RvpoG9qmxO
	yvtbhEN7KTpKGauvJzMetKgZXO2SVgSndyo9bcwr3MN72pdNd9lLxHDnNmUGPzhAtEnl
	yR/TpmViENUNUnGYpH/KTME738wDOk6ycgikc=
MIME-Version: 1.0
Received: by 10.223.103.67 with SMTP id j3mr16800949fao.99.1281376142228; Mon, 
	09 Aug 2010 10:49:02 -0700 (PDT)
Received: by 10.223.164.79 with HTTP; Mon, 9 Aug 2010 10:49:02 -0700 (PDT)
In-Reply-To: <1280492963-30578-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1280492963-30578-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Mon, 9 Aug 2010 19:49:02 +0200
Message-ID: <AANLkTi=Umaro-+_MQCjro6S6HrFfp_rek1aXmimYx0=y@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ncurses: added 5.7 recipe
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
X-List-Received-Date: Mon, 09 Aug 2010 17:49:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 30, 2010 at 2:29 PM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> It uses ideas from the old 5.4 recipe but brings a lot of new features
> like widec libs, pkgconfig files or splitted library packages.
>
> As lot of packages depend on ncurses, whole distribution must be
> probably rebuild when updating to this new version.
>
> Due to this and the complex recipe, it has a negative DEFAULT_PREFERENCE
> for now.

Hi,

Only breakage I noticed sofar is in pidgin when pidgin-2.6.6 checks
for wide char support:
configure:16212: checking if
/OE/tmpdir-dev-shr/sysroots/armv4t-oe-linux-gnueabi/usr/include/ncurses.h
supports wide characters
|                                       #ifndef get_wch
|                                       # error get_wch not found!
|                                       #endif

and then it decides not to build finch (and later do_package fails).

is it about ENABLE_WIDEC, or something else?

Thanks!



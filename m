Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty@dasty.net>) id 1SRVD1-0006Wx-Pg
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 23:11:08 +0200
Received: by bkcjm2 with SMTP id jm2so4457469bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dasty.net; s=gmail;
	h=sender:subject:from:to:in-reply-to:references:content-type:date
	:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=UiPkqB13GAkOcoK/+zpH97I4DCD1eJmW2XuttKmmIlM=;
	b=VaIqtIArfwVBO2wg1VJJksIrQ3xhKXtZqJb8/6xcKahPjWpi2a/OqbXJfmdgZ4Kicl
	CZZOeza3yYk5VKRmjmmMnO2D58LHWN/2ubn8afHr2XGUXGbrzcM6btnww4N4m3U5NZu1
	jxTvzCd0gdNNg1dyEX9Kmwrc1kQi3tHWWvKow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:subject:from:to:in-reply-to:references:content-type:date
	:message-id:mime-version:x-mailer:content-transfer-encoding
	:x-gm-message-state;
	bh=UiPkqB13GAkOcoK/+zpH97I4DCD1eJmW2XuttKmmIlM=;
	b=LvbXX8epZhQLpoa5mC1XKBonJvaZyiaQtoAL0rdMZ8iQSZehLWIvPWqUuIiABoXgcG
	r5RnbG1c++xXTCwczODjtV1fwvdWVV0wB286boYmzQDQfuL8ClYAmM2x6FyX7bmV2Dmd
	Za5O3yaif/wwkO4Y6vTwPz8TBqX+YygeK9cqYPlF89kMAjWI0qgWfJt8YCu2fK4FFGVI
	cGWgJ/XxRi8OBNYai6n9n1vd5DSNEGlKxyYJlUFQkNwiwXetVhJ1G9+suKgONaEITYx8
	F1Bd/4MviuRNGk6Z2k0g5fyaYBBAA6ije8KAJMi+gcTkpaVo7LNQEv9C8yXallrlscAX
	mg5A==
Received: by 10.204.141.25 with SMTP id k25mr682105bku.72.1336424476728;
	Mon, 07 May 2012 14:01:16 -0700 (PDT)
Received: from [192.168.1.20] (85-127-117-46.dynamic.xdsl-line.inode.at.
	[85.127.117.46])
	by mx.google.com with ESMTPS id s20sm34680826bks.2.2012.05.07.14.01.13
	(version=SSLv3 cipher=OTHER); Mon, 07 May 2012 14:01:14 -0700 (PDT)
Sender: Radek Dostal <dasty@dasty.net>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAMKF1sonQpWBRYNSapa16EDGyyQCiRr5AmKoSx02xnqzzn+5yA@mail.gmail.com>
References: <1336391680.3417.7.camel@dasty-laptop>
	<4FA7B9DF.60304@mlbassoc.com> <1336394035.3417.12.camel@dasty-laptop>
	<CAMKF1sonQpWBRYNSapa16EDGyyQCiRr5AmKoSx02xnqzzn+5yA@mail.gmail.com>
Date: Mon, 07 May 2012 23:01:11 +0200
Message-ID: <1336424471.2074.4.camel@dasty-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3
X-Gm-Message-State: ALoCoQkyXSRyzZ6uQL9TUOiXhIGy68sCt8W88f5Ey7/ji/80vUHigIfZdszH/VRCPet7Pw2a8xby
Subject: Re: Simultaneous build of two intree packages
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
X-List-Received-Date: Mon, 07 May 2012 21:11:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-07 at 08:46 -0700, Khem Raj wrote:
> > usually it crashes during "ln -sf target dest" which is executed
> > simultaneously with same parameters for both builds. There are other
> > issues as well in addition to this ln issue.
> 
> This is confusing why does this happen at all 

Because ln -sf first do symlink(1) unlink(2) and symlink(3) again. In
case link is created by another process between 2 and 3 than ln fails.

It is quite well described here:
http://rcrowley.org/2010/01/06/things-unix-can-do-atomically.html

I was also able to verify my finding by running two ln -sf in two for
loops in two different terminals and they were failing constantly.

So any idea on implementing locks/mutexes inside OE. If somebody can
point me in the right direction I should be able to implement and feed
back.

Thanks,
Radek




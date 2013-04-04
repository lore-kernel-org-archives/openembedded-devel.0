Received: from mail-qe0-f51.google.com ([209.85.128.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNrZC-00013C-V1
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 23:19:31 +0200
Received: by mail-qe0-f51.google.com with SMTP id nd7so1700924qeb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 14:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=B02mwLz04ytgs7+XJ187lvYUcM03VKrAxb+sLii+7nI=;
	b=YgQYsZwz27rOpxAo6uNjkFrvfDhqlhs+Qq5azyCB1zDuzu8v6JyUsMpbex5iQ12MHP
	53YUoGGY8UNflL4kgQ5UzGyidDPrQdcvRZ5xmH76VA/rS9LJDZaA90S+olkmtIajd6q1
	15EetZtHFbVS8Ihe1k3nXt4wolfzz9AYxwPmgdqZ5ziOnZWcCMVKTOhrojc8+gFsEUAJ
	tEpRiQQmlvC+MCUrZKZ2IuEEeOCYUAs78fgIcnTm8BjyahkdlAa2ohXo1zarS/ccEezs
	rqWB5JTqHw0aCZskHbRh1I0hZR8ISHNtLBKsjDc9r1rvxo4+TdduO4Ig39llMFL85p46
	mGLw==
MIME-Version: 1.0
X-Received: by 10.224.104.67 with SMTP id n3mr6087231qao.42.1365109337394;
	Thu, 04 Apr 2013 14:02:17 -0700 (PDT)
Received: by 10.49.58.171 with HTTP; Thu, 4 Apr 2013 14:02:17 -0700 (PDT)
In-Reply-To: <515DE693.1050601@pseudoterminal.org>
References: <515DE693.1050601@pseudoterminal.org>
Date: Thu, 4 Apr 2013 23:02:17 +0200
Message-ID: <CA+chaQf0r77KGfkdT7ZNU=TXgXz-Jh3KxG82+=Lh9eVx+qHyOw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: DEFAULTTUNE_<machine> not working
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
X-List-Received-Date: Thu, 04 Apr 2013 21:19:31 -0000
Content-Type: text/plain; charset=UTF-8

Check with bitbake -e, don't trust the header shown at the beginning of
build log.


On Thu, Apr 4, 2013 at 10:46 PM, Carlos Rafael Giani
<dv@pseudoterminal.org>wrote:

> Hello,
>
> I have tried to set a machine specific DEFAULTTUNE in the local.conf .
> Example:
>     DEFAULTTUNE_beagleboard = "cortexa8hf"
>
> but this does not seem to work. I do not see "callconvention-hard" in the
> TUNE_FEATURES list bitbake shows me.
>
> Writing this in local.conf works, however:
>     DEFAULTTUNE = "cortexa8hf"
>
> I am using OE Danny, and distro is Poky 8.0 .
>
> Any ideas on what is going on here?
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>


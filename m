Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Lelv3-0000S4-Mg
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 08:53:33 +0100
Received: by bwz9 with SMTP id 9so2705029bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 23:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=aD2OkLV3F3irSDl8cbyowMhGe+X5MbVa9T8d01U4ySE=;
	b=V5hzhpBzT89NKFig62q8tNveocCq9EPhWSJ+RudQeC8fGA6mpwlZc0taNv8viuWcwI
	UP41mZ5Lx3SmXawWAQyi3XfPLjBFNW6Q/YGY8JgEmjXkRPQpN1pcOgNy+5rdrfioTxQd
	XFrFhvIOSURF6RYuDuvlWOzh/jaejLUTUJyLE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gjwkl+1qttl9wGjSFffkGJZrRf7OaRQIWyp3clckHXHZ02V9Mo3jjAxIGqocaKZyxp
	FNhGzdtPxHHpnfM6pZIW9WIuWEdjKPimYsbjq9u8tDfV11A44GMwSjBGgpJojt3yZjex
	6ZKZxdO5brLeZvFuwQc0G3y7zC7ivNNe29hFc=
MIME-Version: 1.0
Received: by 10.223.122.15 with SMTP id j15mr7840632far.74.1236152962217; Tue, 
	03 Mar 2009 23:49:22 -0800 (PST)
In-Reply-To: <49ADB183.5070709@balister.org>
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>
	<1236119119.10602.62.camel@andromeda> <49ADB183.5070709@balister.org>
Date: Wed, 4 Mar 2009 08:49:22 +0100
Message-ID: <ac9c93b10903032349h1f6243a8t661505b31f67fbff@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: bump automake-native to 1.10. 2 since some idiot deleted 1.10
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
X-List-Received-Date: Wed, 04 Mar 2009 07:53:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/3/3 Philip Balister <philip@balister.org>:
> Michael 'Mickey' Lauer wrote:
>>
>> Am Dienstag, den 03.03.2009, 21:49 +0100 schrieb GIT User account:
>>>
>>> Module: openembedded.git
>>> Branch: org.openembedded.dev
>>> Commit: eee859a9c348871d6d644ece76bc57b151cc80e8
>>> URL:
>>> =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3D=
eee859a9c348871d6d644ece76bc57b151cc80e8
>>>
>>> Author: Koen Kooi <koen@openembedded.org>
>>> Date: =A0 Tue Mar =A03 21:47:57 2009 +0100
>>>
>>> angstrom 2009.X: bump automake-native to 1.10.2 since some idiot delete=
d
>>> 1.10
>>
>> Ah, are we in that mood again? Take more pills.
>
> We need to have a serious discussion about deleting recipes. I know the
> deletion of python 2.5 will force me to address the 2.5->2.6 upgrade in
> gnuradio before the upstream developers are ready.
>
> We need a way to remove recipes, but doing it as part of adding a new rec=
ipe
> is causing problems for OE users.
>
> Philip

Hm.
When I returned to oe 2 months ago I just created new recipes for new
versions (as was the common practice when I started my extended
vacation 2 years ago).
However at some point I stumbled upon
http://wiki.openembedded.net/index.php/Upgrading_Packages and started
using git mv (2 years ago the cumulation of recipes already became
cumbersome).
Part of the problem is that there is no good "algorithm" to decide
whether to keep the old version or not.

FM.



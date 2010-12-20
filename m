Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PUjLz-0007tw-K7
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 18:16:55 +0100
Received: by iyj18 with SMTP id 18so2477787iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 09:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=BF+Fl7KUdPdYIJPGtdJxxYuRs99fmZ8OtC07ReIp+mI=;
	b=g7XBpCLXeF64Y3s2U3ndIvIQbh2x6ijXSj1Q2cVFSNA2Zl/AYrPDwOxct3ZHJo+FEY
	UY8xDAGlfhDCELFFEJeVNKGig6tPj5DUqfW3acOvJdFEiCYavaEdHIOuTF/AU9K7cA8j
	da3KPLvxE4zSzIqKtVTs6hvwf+4sl/JU2p/UU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ojZL9lgP42cUSbqRJeheczANtzf7Hr16oAMujBu+jrV4vd6kmipU3rTyzHi0/U/RSf
	q/kcEswd0oEkkM92SX4/Lr/+KIKB4uSFaaYy8QxRJXeqACT7Uzof9mochN589qHOR+DM
	+QMhXlSgRwtTsNUhu5C2OSdUh2CEgtuVo71+0=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr4357036ibv.32.1292865409452; Mon,
	20 Dec 2010 09:16:49 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Mon, 20 Dec 2010 09:16:49 -0800 (PST)
In-Reply-To: <4D0F8AB7.1020104@xora.org.uk>
References: <ienu66$5gf$1@dough.gmane.org>
	<4D0F8AB7.1020104@xora.org.uk>
Date: Mon, 20 Dec 2010 18:16:49 +0100
Message-ID: <AANLkTiks4PYZxZCQgsprveY1jNQgpy_mMVTOwg3DtsqX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] meta-openembedded layer for yocto hosted on oe.org
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
X-List-Received-Date: Mon, 20 Dec 2010 17:16:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Nice piece of work & a good plan but...

Who will be the owners/maintainers of the layers?
I maintain several multimedia recipes (mythtv with all that is dragged
in (which is a.o. a lot of perl stuff), various cd*  related recipes,
python-coherence and the python stuff it uses, mediatomb, and it seems
recently people seem to see me as the first line of contact if they
have musicpd issues), as well as some file sharing recipes.
Any idea on how I get them added, and how to deal with updates for these?

An alternate approach would be to let the stuff live in poky-extras.
See this proposal from RP:
http://www.mail-archive.com/yocto@yoctoproject.org/msg00286.html

Frans.

PS: personally I would have preferred it if console-image was in the
common part.I guess some other recipes will get fairly identical
recipes.
Maybe we should have a generic console-image and let each distro use
.bbappend or aminc to extend on it.



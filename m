Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pusws-0007Ke-CF
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 21:47:06 +0100
Received: by fxm8 with SMTP id 8so428000fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 12:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k49gOyriThdQ8R6EgIJ4TvfX5ExPfms0o8fYT93hdSc=;
	b=i1WLCZ9Z4lx5oNCqUhi+JevqvEqBsknbuMdQmhNhwdWxHZp6NErIHZ06FKBdXSvD1R
	WD4TMlwALlkdY8OkaVFeHJhioxyA/nxvGwVD8vHSuJmKENS7s/5nsj0/0ywlv1m8J4x4
	bsoVn/mze8GcDYR+f8OdjEC+qXWf+oQyKgUCk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=I64u7QTSVJ12L4U4PhezUk/2Hz5IfhcA22c9gUwkGG11gFgaHbAjyRrwRzRZi5SDCX
	6NC6gH+Cd+WckcM6GAPqbFbGDDvR6SHs82ERtwvbP/sFFlCNvNux5pbk5jeSTXRkTP1l
	6PrCFCq7HDPYVWhM4MoFQvj6ekOJ4XtpqeMsM=
Received: by 10.223.96.195 with SMTP id i3mr434728fan.77.1299098739067; Wed,
	02 Mar 2011 12:45:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 2 Mar 2011 12:45:19 -0800 (PST)
In-Reply-To: <4D6E0CF4.4040005@dresearch.de>
References: <4D64BD5E.6040805@dresearch.de> <4D6DF124.2080607@dresearch.de>
	<AANLkTi=sJanB_o6LGmg=3-96=iDD8VMrM-DLp4EC+zBr@mail.gmail.com>
	<4D6E0CF4.4040005@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2011 12:45:19 -0800
Message-ID: <AANLkTi=UYfsdZQvvQzLMBkZ21wFpPQK-p7pdbSy1F-_H@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: net-snmp-svn-r7.0 do_compile failed
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
X-List-Received-Date: Wed, 02 Mar 2011 20:47:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 2, 2011 at 1:25 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> failed here).
>>
>> for svn recipe you can bump rev up
>
> I tried to bump to some newer revs (19399/5.6, 19787/5.6.1, 20047/HEAD) but ended up in some undefined referrence errors (nl_handle_destroy and nl_handle_alloc) in all cases. :(
>
> So this needs some more attention.

--disable-nls in EXTRA_OECONF does that help ?

>
> Jamie, you're listed as net-snmp maintainer. Can you look into this please.
>
>> and for others you can backport the
>> fix and you can backport it as it is ideally that patch should
>> have changed configure.ac and regenerated configure but they patched
>> configure instead. but its ok to patch configure here since
>> we do not regenerate configure for net-snmp recipe.
>
> As mentioned before i failed trying this. The patch does not apply without modifications. :(
>

hmmm I cant promise but if I have time I can look into it



Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PfXPc-0004tR-1U
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 13:45:20 +0100
Received: by iyj18 with SMTP id 18so780134iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 04:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=osqbZYlqZZMAhicNPO7uJmYHZ87+bsCejgJ5IfBsd/M=;
	b=VGhx/t8cx7eSRRoy+9+FLJUSXBJ0XmhyQFi8SD8g8Q/z6jQzh+3tHODFEuMwdnt0K+
	Dq6QeIVjy6kM9i2IuiXZe9zRph2yMgCjpi1LlQa4tATxHveYJMUFfTOQ8cwS40+q7nvs
	Jh6qHek8ZfW1h4dabj31jr6op3v+8SWYuAa20=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=q+OuG1s/451anaKkCOEjy8793zZn7jJ5aLk5T8FLZk1I+j9+0bd0sfh2wqI+VOr1Dg
	/3r2P1+4zj2Rvz9BTdnE8wuAtroXQg9cCIPsF98h1GM09wI7TuUFIMqafUCaUajUpkQb
	akV5K7nV0YlBw3JogOaiuGn6qLfHq7FsSNJI0=
MIME-Version: 1.0
Received: by 10.231.39.74 with SMTP id f10mr752374ibe.84.1295441079884; Wed,
	19 Jan 2011 04:44:39 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Wed, 19 Jan 2011 04:44:39 -0800 (PST)
In-Reply-To: <1295436662.2540.14.camel@scimitar>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
	<4D36A64E.9060804@xora.org.uk>
	<AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>
	<1295436662.2540.14.camel@scimitar>
Date: Wed, 19 Jan 2011 13:44:39 +0100
Message-ID: <AANLkTik9-k_euvDGZd+CFfQ9LyxD_7mubpVxPqyEsEVU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 12:45:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/19 Joshua Lock <josh@linux.intel.com>:
> On Wed, 2011-01-19 at 10:12 +0100, Frans Meulenbroeks wrote:
>> 2011/1/19 Graeme Gregory <dp@xora.org.uk>:
>>
>> >> I wholehearthy agree with the proposal that it is left to the package
>> >> maintainers discretion.
>> >> Wrt the GPLv2+ version. I suggest to reflect this in the name.
>> >> E.g. you could have samba and samba-gplv2 (or perhaps samba-gplv2 and
>> >> samba-gplv3). Then it immediately becomes obvious why there are two
>> >> versions.
>> >> Similarly with versions that became a lot fatter over time (which imho
>> >> is a good reason to keep the old version).
>> > I am totally against this idea, it just makes a total mess of the
>> > namespace. We have the ability to put comments in bitbake files use it.
>>
>> I don't think there are that many recipes for which this is relevant,
>> so the namespace clutter is limited.
>> Comments in bb files may work equally well. Problem is that those
>> comments are not written in the files.
>
> Surely that what the LICENSE field in the metadata is for?

That works for gpl v2 vs v3, but if there are other reasons to keep an
old recipe (e.g. footprint) it would also be nice to record it one way
or another.
>
> Aside: In Poky we have various features to ensure recipes have license
> information included, and functionality to blacklist packages of a
> certain license - these will doubtless be merged into oe-core too.

I assume so

Frans



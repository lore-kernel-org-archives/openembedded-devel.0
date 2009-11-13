Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N8t8o-0000Bo-I6
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 11:12:33 +0100
Received: by ywh7 with SMTP id 7so2889340ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 02:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AvELUTFw5ka4mPGTMW45pljUHCpNhhQnAt6EkT70XGo=;
	b=tsZ+QsV8HZT74F84pu7eSyneyp9ES3XazCZtiInirON9hUf7Uzxap595l4VGVB0osG
	ufoCFNJSVmVydaNCdxfC0994VQzI6oGsj1J/bE3WsCave4xkNTG0TKiCSQnsFMSs6sKA
	djQEaur5M2DgJjWiz5PCviwqyMhPL+iZMiOt8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fUloDr4FvQBLBuXs41slnOXk9QR/XpFtI9J9sLs8j6pgPyO8Q9zLUpIKWmOE5zkbMc
	NN6Y//2vGFfZE+hSwc7v1azS9YpOqylskbK2y6R2bS2PUh3snK5aQMrVsLHGwry4+mOf
	vNUT/o1ainhg4mHXHDj9ABWqd7Wrb64HEOEcM=
MIME-Version: 1.0
Received: by 10.101.32.17 with SMTP id k17mr4371359anj.136.1258107070394; Fri, 
	13 Nov 2009 02:11:10 -0800 (PST)
In-Reply-To: <4AFC9BD2.6070203@vollmann.ch>
References: <1258014540.6879.18.camel@opal>
	<ac9c93b10911120038l67476671pe223e41233fc9bc6@mail.gmail.com>
	<4AFC9BD2.6070203@vollmann.ch>
Date: Fri, 13 Nov 2009 11:11:10 +0100
Message-ID: <ac9c93b10911130211y64195300me521030b4635541b@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM: Summary of the 'Splitting the tree' session
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
X-List-Received-Date: Fri, 13 Nov 2009 10:12:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/13 Detlef Vollmann <dv@vollmann.ch>:
> On 11/12/09 09:38, Frans Meulenbroeks wrote:
>>
>> I think a split is a good idea, but I am not too keen on the name "base"
>> This suggests that it is kinda basic/core functionality.
>
> This is how I understand it.
>
>> For a lot of
>> recipes this is not true. E.g. I am currently working on xmltv, not
>> really base functionality
>
> And it wouldn't go into 'base'.

In the current proposal then there is no place for this recipe.
Guess we need to define one (and also define what should go in base.

Thinking of it it might be worthwhile to have a hierarchical clustering.
In that case xmltv could reside in a subdir of mythtv
(actually currently we already have a one level clustering as dirs can
contain multiple recipes for multiple packages (see e.g. perl)

>
>> As the split proposal is more along the graphics axe, I suggest that
>> instead of "base" we use something like "cmdline" or so (trying to
>> avoid the word "terminal" here).
>> Btw before someone proposes this: I'm also not too keen on a directory
>> "other" as it will become a junkyard of things.
>
> You can't avoid that 'junkyard', whether you call it 'cmdline'
> or 'other'. =A0And as that would be the place for those packages
> that don't belong in any of the other categories, 'other' is
> just the right name for that.

Well other is not yet in the proposal :-)
And left or right junkyard packages will also exist in the other trees.

BTW there may be room for a dir with packages that are
unmaintained/unsupported or whatever you want to call it.

Frans



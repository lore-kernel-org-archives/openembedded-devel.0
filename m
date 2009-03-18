Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Lk0C3-0006gB-Ft
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 19:08:45 +0100
Received: by yw-out-1718.google.com with SMTP id 9so126625ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 11:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=gBY6wYnpB7812shTpk09nOQ9+eDdPSadptK1D4zq6BI=;
	b=bR15pubL2dvmBoBa+9XwygL8TGllOy15r/DT89CRJb1jRpQauGGVDLPDHGnzbkU51G
	fU69XFnzxV9kjzqh9vU6JmSS/5egmPC00QOs4DzymufO7JFGR5PsAZeELvhMDRO6LkZ6
	qlpqq8EuQ7MAVSf5KWL9JSK5HbRlhWxXgxdjk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=v5awBI2psuTG7VofgVime8hQIATpCbHSlt1cb2s1Dg0CtLDAz/dqQFgROTQvQ6xTql
	wnHN8DnaHcqH68R6Nrg4xlW8ub7FaFTXYvVBaJsWi3u0eUWqzWFyuDAXHFGRrP/en2YE
	+f5h1+WrCsv96ZRjcTHAMzBU6K7bEEBeENjPM=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.98.11 with SMTP id a11mr2688906ybm.58.1237399671450; Wed, 
	18 Mar 2009 11:07:51 -0700 (PDT)
In-Reply-To: <49C135C3.9040206@balister.org>
References: <-2193387358217288963@unknownmsgid>
	<b6ebd0a50903180906v755f082akf8460a3b3307d9fd@mail.gmail.com>
	<49C135C3.9040206@balister.org>
Date: Wed, 18 Mar 2009 11:07:51 -0700
X-Google-Sender-Auth: fc4a963d179681a8
Message-ID: <b6ebd0a50903181107m4e47bbe5ra29d64327dad9241@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.157
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Loss of all package history following the recipe rename.
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
X-List-Received-Date: Wed, 18 Mar 2009 18:08:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/3/18 Philip Balister <philip@balister.org>:
> Chris Larson wrote:
>>
>> On Wed, Mar 18, 2009 at 8:38 AM, John Willis
>> <John.Willis@distant-earth.com> wrote:
>>>
>>> <snip>
>>>
>>> After kergoth took the time to point out that I was just looking at thi=
s
>>> 'the wrong way' and not 'the GIT way' I think the mail can safely be
>>> disregarded ;-).
>>>
>>> It still does not change the fact that the behavior of 'git log' gave m=
e
>>> a
>>> real panic moment but at least nothing is lost if your happy to dig (or
>>> rather use git log --follow, ok, next time I promise to read the man pa=
ge
>>> before panicking ;-), I am just used to --follow functionality being a
>>> default behavior).
>>
>> Re: default behavior, I'm not entirely certain, but the 'diff.renames'
>> git config parameter seems promising. =C2=A0Try running:
>> git config diff.renames true
>>
>> I'm not sure if git log --follow is the same thing as git diff-tree
>> -M, but it probably is, since git log is essentially git rev-list |
>> git diff-tree.
>
> A friend of mine pointed me at this article:
>
> http://markmail.org/message/x7ubgl6wanubwa3g#query:git%20mv%20lost%20hist=
ory+page:1+mid:pl3pbiuhzu2excg7+state:results
>
> Hopefully, this makes more send to the git gurus.

Aye, it seems that doing 'git log .' inside the renamed directory
won't show the history across the rename boundary, only if you look at
the log without specifying a path, or if you specify a single file and
use --follow.  That's somewhat annoying :\

Side note: if you're doing a git log -p, you probably want to do git
log -M -p, so you don't see the add/remove of every file in the diffs
for the renames.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.



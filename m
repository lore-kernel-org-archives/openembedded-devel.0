Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NJ9Kh-0002gd-QK
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 18:31:14 +0100
Received: by iwn32 with SMTP id 32so554341iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 09:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JGkNPVUP+V8OLKcxbA++uFYrJdLUB6BU/4HmPAfDjvs=;
	b=qdUUSZtVyZ03bZOW1UiU+be6+6UQqLm3sGkQMYa9DgIPOC793+qJ2DOIbzJKjUVwJB
	Tb7WdtTYzHl3LgoIXxeLNuTxKN5uEdwAtnvhCu96CzQsix5sg/pbznWcdTl9MmXE9Uf1
	dF78b8UBjBCBInj8pmy9ygRsvm1gH0ommgtq0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bgBrdjTojnZZkNanU6DDeeTcZI5aFmN76PPuPJmQP30DklJYljyGgfFiq2QsWw+fWk
	80GFsF45i2Q3u5/HZVEWCkaSrYfN4d68K6cFxVfctGBpvKKV8gu5LtVcZVQciysE2Bf1
	wSYjG/snjCkHxaPplpX63tRRjBWz9X1yGEYp0=
MIME-Version: 1.0
Received: by 10.231.122.36 with SMTP id j36mr1556329ibr.21.1260552567961; Fri, 
	11 Dec 2009 09:29:27 -0800 (PST)
In-Reply-To: <ac9c93b10912110229g30bb3a31gf501fbdd7b16d52f@mail.gmail.com>
References: <ac9c93b10912110039u28303201t5a762e715ed53ceb@mail.gmail.com>
	<1260523507.6896.130.camel@lenovo.internal.reciva.com>
	<ac9c93b10912110229g30bb3a31gf501fbdd7b16d52f@mail.gmail.com>
Date: Fri, 11 Dec 2009 09:29:27 -0800
Message-ID: <19c1b8a90912110929k37678ecbx3a1153e5beff74b3@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: multiple DISTRO's in tmp
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
X-List-Received-Date: Fri, 11 Dec 2009 17:31:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2009 at 2:29 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2009/12/11 Phil Blundell <philb@gnu.org>:
>> On Fri, 2009-12-11 at 09:39 +0100, Frans Meulenbroeks wrote:
>>> However, I was wondering: wouldn't it be nice to allow multiple
>>> distro's in one tmp dir (so that e.g. if they share the same version
>>> of a recipe (like m4-native or os), this does not need to be
>>> recompiled?
>>
>> Even if the (PN, PV) tuple is the same for two DISTROs it doesn't
>> necessarily follow that the resulting packages will be the same. =C2=A0T=
hey
>> might have selected different compilers, configuration options, or
>> versions of depended-on packages. =C2=A0Or they might have a different
>> filesystem layout, or any number of other things.
>>
>> So, practically speaking, no: it isn't going to be feasible to make
>> multiple DISTROs coexist in a single TMPDIR. =C2=A0This is a case where =
you
>> do need to create a separate TMPDIR.
>
> I understand that. Then again it *is* possible for multiple machines
> in the same distro to co-exist, even though the machine config file
> could change some flags.
>
> Rethinking it, I would expect that if things can be shared it would be
> in the native area (and perhaps some things in cross).
>
> Actually just bumped into this because my tmp dir for angstrom was
> about 18 GB and ofc I didn't have sufficient free space for another
> tree (and also not really enough patience to wait out a build of the
> cross tools).

IIRC angstrom used -ggdb3 (which may not be case anymore) which means
more than half of your total size it consumed
by elaborated debug info for code which is compiled at O2 and most of
the debug info
will not be usable. Change using -g instead to reduce the bloat.

-Khem



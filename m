Received: from [209.85.221.176] (helo=mail-qy0-f176.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MzGwo-0000K3-OC
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Oct 2009 23:36:25 +0200
Received: by qyk6 with SMTP id 6so264143qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Oct 2009 14:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RYvQsjyQD0eo4IHNI9ToXVzUMPyQW/z8OZNSaToA/hs=;
	b=C6bGbJUoxoQFWCf7xWKJZRw99LySsfbSz1wvKR6anK4gcbdGvz996wl1iaRa7yDFRK
	MfB6aIg7/kCYMB9yMkUqqFW9ztebhbaG5k/1uu5zvyReA7ze2rD77Pp+VeqAb2aSojYr
	jvabLf62syQxDMkL0nklwcGquVrb/dbiHKnRM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=t8+xei3y6DC13F9si/WiyDjlK/92zx0mLKO0/npeuRm6EuabqJ0qfpP9l8QZxVYKpb
	c0AuCbtGhmTDb7f5qm5zdYPwnYTeFXuZQyhSGB9j+zNxXL1hIsO1DIvahZ6PSIZJxARJ
	Yo2tgguw3v9TMHmGIY1HEJCBTlzQxTygbfdFk=
MIME-Version: 1.0
Received: by 10.229.44.21 with SMTP id y21mr442595qce.42.1255815324362; Sat, 
	17 Oct 2009 14:35:24 -0700 (PDT)
In-Reply-To: <20091017031315.GB12337@denix.org>
References: <4AD90574.1080800@mwester.net> <20091017031315.GB12337@denix.org>
Date: Sat, 17 Oct 2009 14:35:24 -0700
Message-ID: <19c1b8a90910171435o118e0ca4xd2484c342484a72b@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.176
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: commit 806811bf2d72827d3031bfcd5dbab1e82324d34e breaks distros
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
X-List-Received-Date: Sat, 17 Oct 2009 21:36:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2009 at 8:13 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Oct 16, 2009 at 06:44:52PM -0500, Mike Westerhof wrote:
>> The following commit breaks numerous non-angstrom distros:
>>
>> commit 806811bf2d72827d3031bfcd5dbab1e82324d34e
>> Author: Denys Dmytriyenko <denis@denix.org>
>> Date: =C2=A0 Wed Oct 14 14:25:07 2009 -0400
>>
>> =C2=A0 =C2=A0 angstrom: clean ups of the external toolchain support
>>
>>
>> The symptom of the problem is this:
>>
>> $ bitbake slugos-image
>> ERROR: Unable to parse conf/bitbake.conf (Could not include required
>> file conf/distro/include/glibc.inc)
>> $
>>
>> It seems that glibc.inc has been removed, and possibly replaced by
>> either an external or an internal variant, but no non-angstrom distros
>> have been updated.
>>
>> Please forgive me if there was a discussion of this change on the
>> mailing list; I have been locked away behind corporate firewalls, and
>> living on-the-road for the past months, and just haven't been able to
>> keep up. :(
>>
>> How do I fix this, please?
>
> Mike,
>
> I'm sorry to hear you are having problems with my commit.
>
> I was told conf/distro/include/glibc.inc was only used by Angstrom. And
> grepping through files recursively kind of proves it - there are no in-tr=
ee
> distros using this file. There is another glibc.inc in recipes/glibc, but
> that's obviously a different one.
>
> I also ran a test build of minimal-image using minimal distro w/o any par=
sing
> issues.

Minimal uses its own set of files so this change wont affect it.
Looking at the patch I wonder virtual packages are now
picked up when you angstrom build which uses internal toolchain/glibc

>
> It looks like you may have out-of-tree distro which uses glibc.inc file i=
n the
> conf directory. If this is the case, I apologize for removing it and woul=
d be
> happy to restore it for you.
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



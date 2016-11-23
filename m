Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A3A7760069
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 22:03:05 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id e9so1909195pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 14:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=HJbrKZJu1ZMfeR2ADf9KU5Od0uLn5fRsDiVwuNtdbPg=;
	b=JpuTq7LPEIazAMpdQBkj/AigxQMMWDjNlsM5JW68Z4wUYgCWaxFzvOoeTOgapd3T84
	Zh8PVvxf3i8PHnral1w1rJ41eoVYvhifLV8TMx4X3RdTWfQgZ04PVjg/TvG/xqgZw2fN
	Xytng6+TPgvZcb559OYXrx64ZaAjoAho4pV2FWdQD+CgZ0xt6ja1P7f8RVzy7hqYzWU/
	jXr25oTQA4ngm2EMTG2U7Z0ovLXQ8RR7028vFZdjf8PjxPvjSwvFP1tynL4FAiEXfH/3
	1jwdR5jsRUJ14BQrKrfa4/SO/3gWVyZJY5Na3mA/WnlUEXa8hyiGJuYGb/4uuce/zvXD
	xt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=HJbrKZJu1ZMfeR2ADf9KU5Od0uLn5fRsDiVwuNtdbPg=;
	b=B6QmKJ637r0/ujiNqQ5s42xipeQJxTSK8J84Yne6Jxp8DLbuiVSHRS3bF8CqakvAQw
	XeHC8cqr6aRyhz83v/zH1wZD0tyyhTgJzhd3UxFN4o4hetDiBLlKmZFi3X/JSU2BDL6N
	cQT6JompDrWUAb89gOmzqMdsGV9LemX2zHEXbWwePpgRig8hO6erW6RA6j3zL6pK1as1
	20CJLdGgjzPcsegHOidovpP+1DthAzJLYOXQGJCoNp/g2J70/F8TEoDTRuk0rg8M9evX
	guL9+Q6PM2MRUksw9PKUZncDx0JzvIouCWTLNkFyAv7kX6E0r6+LU+uT6t2BuLtFGb6s
	f20w==
X-Gm-Message-State: AKaTC02eYDNX6W+vZ7wjEyfcvD46jDIM84ZwvZMdCGfYSAm6WIUTcg7en8aBo46oYOaymg==
X-Received: by 10.98.84.68 with SMTP id i65mr4982585pfb.133.1479938586734;
	Wed, 23 Nov 2016 14:03:06 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:5159:9909:3ede:f0af?
	([2601:646:8882:b8c:5159:9909:3ede:f0af])
	by smtp.gmail.com with ESMTPSA id
	72sm51621459pfw.37.2016.11.23.14.03.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 14:03:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Wed, 23 Nov 2016 14:03:05 -0800
References: <alpine.LFD.2.20.1611231326510.15876@localhost.localdomain>
	<5E80B6DC-66EC-499B-84D0-41A5D4F1A1BC@gmail.com>
	<alpine.LFD.2.20.1611231624420.18557@localhost.localdomain>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.20.1611231624420.18557@localhost.localdomain>
Message-Id: <04A98AEA-497D-4919-B83E-27C442F24FB9@gmail.com>
X-Mailer: Apple Mail (2.3251)
Subject: Re: mozjs/unhandled signal 11/64k page patch/__powerpc64__ ???
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2016 22:03:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 23, 2016, at 1:26 PM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
> On Wed, 23 Nov 2016, Khem Raj wrote:
>=20
>> can you reproduce it on version 24 as well ?
>=20
>  not sure what you mean ... this is running on a qemuppc image. i
> haven't tried running this on fedora 24 itself. what exactly do you
> want me to try?
>=20

I meant version of mozjs


>>> On Nov 23, 2016, at 10:34 AM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
>>>=20
>>>=20
>>> i know nothing about this issue, i'm asking on behalf of a colleague
>>> who has allegedly tracked down a bug in wind river linux, and
>>> comparing sources, it *appears* the very same thing would happen in
>>> OE.
>>>=20
>>> the symptom running "poweroff" in a qemuppc session;
>>>=20
>>> ... snip ...
>>> polkitd[680]: unhandled signal 11 at 00000000 nip 0fa69198 lr =
0fa69174code 30001
>>> ... snip ...
>>>=20
>>> further investigation shows the very same thing happening with:
>>>=20
>>> # systemctl start httpd
>>> polkitd[680]: unhandled signal 11 at 00000000 nip 0fa69198 lr =
0fa69174code 30001
>>> Error getting authority: Error initializing authority: Error calling
>>> StartServiceByName for org.freedesktop.PolicyKit1: Timeout was =
reached
>>> (g-io-error-quark, 24)
>>> Failed to start httpd.service: Connection timed out
>>> #
>>>=20
>>> to make a long story short, said colleague followed bug reports and
>>> ended up here:
>>>=20
>>> https://bugzilla.redhat.com/show_bug.cgi?id=3D1289432
>>>=20
>>> eventually, he got the problem to go away by tweaking the patch
>>> "0005-aarch64-64k-page.patch" for mozjs with the following =
adjustment:
>>>=20
>>> @@ -113,7 +113,7 @@ struct Cell
>>> #if defined(SOLARIS) && (defined(__sparc) || defined(__sparcv9))
>>> const size_t PageShift =3D 13;
>>> const size_t ArenaShift =3D PageShift;
>>> -#elif defined(__powerpc__)
>>> +#elif defined(__powerpc__) || defined(__aarch64__)
>>>              ^^^^^^^^^^^ change that to __powerpc64__
>>> const size_t PageShift =3D 16;
>>> const size_t ArenaShift =3D 12;
>>> #else
>>>=20
>>> as my colleague reads it, the original patch above is necessary for
>>> PPC64, but *breaks* PPC32. i haven't followed the logic, but does =
any
>>> of this make sense? by making that change, the error went away and
>>> things work fine.
>>>=20
>>> thoughts?
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



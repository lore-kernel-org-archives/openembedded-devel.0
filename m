Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6pbu-0008Kf-Si
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 19:02:06 +0100
Received: by ywh7 with SMTP id 7so1760673ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 10:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LxPH2s67u/+piFoYLU7505fFgb/+ClqvK8k86IULL/4=;
	b=N+o73X4Yu/Z43Nw5oiqlxWGCBeGQ8M1OVs4viPpfJZlXJp9cz4Xr8lSS+6ucTvTqxU
	p0RL4Tq9IMRziuc5um+DE+tSKGLbvZ+Il5BRerJBMGMLPq4Vt+8RMGDYtNEUNV4UdlpU
	uj5wRICif3Pm2xsYkGzuxIXT2kntux1+0xqAk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GuZVt0GZhgjY3vc1pt9YvN6bWd7Gylp6UgUYMni70D7RP0Z85Xcp7AoBQQ1PuPPVKG
	/lpeWoETQWYIj6gDMYrIZr5m++R1s521NR2HV3LZTYjmDF5ikMGiTWL2xYDWZ8bZSJTn
	Z6p0Opo0gmpn8mQx3abNlmosA0XXaSvZddTr8=
MIME-Version: 1.0
Received: by 10.101.7.37 with SMTP id k37mr5671906ani.121.1257616846540; Sat, 
	07 Nov 2009 10:00:46 -0800 (PST)
In-Reply-To: <be7a9f3d0911070838x34e5cce8je93bc39aeb8fb3aa@mail.gmail.com>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<200911070406.18094.holger+oe@freyther.de>
	<ac9c93b10911070106n587495a5qaf3cfc9288df7e8@mail.gmail.com>
	<4AF574B5.2010802@mwester.net> <hd4108$sbn$2@ger.gmane.org>
	<be7a9f3d0911070838x34e5cce8je93bc39aeb8fb3aa@mail.gmail.com>
Date: Sat, 7 Nov 2009 19:00:46 +0100
Message-ID: <ac9c93b10911071000p51baba8fi8f4935f962eb8810@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sat, 07 Nov 2009 18:02:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/7 Otavio Salvador <otavio@ossystems.com.br>:
> Hello,
>
> On Sat, Nov 7, 2009 at 12:42 PM, Koen Kooi <k.kooi@student.utwente.nl> wr=
ote:
>> On 07-11-09 14:23, Mike Westerhof wrote:
>>>
>>> Frans Meulenbroeks wrote:
>>> ...
>>>>
>>>> Reluctantly updated checksums.ini
>>>>
>>>> Frans
>>>
>>> But of course there's no magic that will remove the old cached tarball
>>> out of one's downloads directory when this sort of thing happens.
>>> (Busybox has been known to do this, too)
>>>
>>> What do folks think we should do about that when it occurs?
>>> a) support two entries (old and new) in checksums.ini
>>> b) do nothing (leave as is)
>>> c) add some sort of support so that the user gets additional informatio=
n
>>> =A0 =A0with the new checksum match failure explaining that the checksum=
 was
>>> =A0 =A0updated and they need to manually remove the old (bad) tarball
>>
>> d) rename the tarball slighty and mirror in on a known good server (e.g.
>> angstrom sourcemirror) and have OE use that.
>
> IMO (d) is the safest and the right thing to do; this avoids more core
> to be written and avoids also we use changed versions without
> noticing.

Ok, I'll leave it to someone with better access so e.g. the
sourcemirror to change things.
BTW I've exchanged an email with the author of twig. He stated that
the version on CPAN (3.22) is the official version and that the
version we use is the current development version and subject to
change.
He proposed to move the 3.33 version to CPAN (which I encouraged).
Guess we should then move to the cpan version which is the fixed one.

Frans

PS: and I did not think of cached versions of the files, otherwise I
would probably taken somewhat more caution before upgrading
checksums.ini



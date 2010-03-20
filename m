Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NsuQH-0003Xw-W2
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Mar 2010 09:52:50 +0100
Received: by gye5 with SMTP id 5so1790867gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Mar 2010 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GxtZiD7CdL3v+I77cXJ8Jvw2q4GZpOWjGjsqjanePx4=;
	b=CPQp3SjTDqekmdogd7pV7AB3ZhI4ymR6MKHoyToAsbv/TvAtAmfet/ip3HeLIMjZKX
	xDJgaWPrzCdisrzRUKLa6bUvZgxPmf5Qg4fHV4/jCHKEhsZ3TgzZE+STEnrCfKdzp//1
	0x+Q2cHTUvVdOrZ89+4m+5fXAtv/IEHRLOUSY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=j+XaXf7fdCRFFaOhZ2WAaUk3QsmshgGYvAs4bS79RTwcIfMXE4/iQiwiBuu395F9id
	MaLUYZFZrfFFlX4q9cBXHi/2ti9c/9uOQGn8h7WZfAjz7ggbrdNvMcXwwxU35PJ+qb+K
	TZyTYanJ4fnaQz2Z5vTb69SjU3aLlSR0c3YEo=
MIME-Version: 1.0
Received: by 10.100.86.13 with SMTP id j13mr9665127anb.90.1269074979503; Sat, 
	20 Mar 2010 01:49:39 -0700 (PDT)
In-Reply-To: <20100319211220.GI2425@xora-desktop.xora.org.uk>
References: <201003182212.31873.roman@khimov.ru>
	<201003190004.37865.roman@khimov.ru>
	<201003190023.36525.roman@khimov.ru>
	<201003200005.35468.roman@khimov.ru>
	<20100319211220.GI2425@xora-desktop.xora.org.uk>
Date: Sat, 20 Mar 2010 09:49:39 +0100
Message-ID: <ac9c93b11003200149l464580e7qd08b6a15bd1272@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC/PATCH] Perl 5.10.1 and a bunch of modules
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
X-List-Received-Date: Sat, 20 Mar 2010 08:52:50 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/3/19 Graeme Gregory <dp@xora.org.uk>:
> On Sat, Mar 20, 2010 at 12:05:35AM +0300, Roman I Khimov wrote:
>> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=D1=D4=CE=C9=C3=C1 19 =CD=C1=
=D2=D4=C1 2010 00:23:25 =C1=D7=D4=CF=D2 Roman I Khimov =CE=C1=D0=C9=D3=C1=
=CC:
>> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=D1=D4=CE=C9=C3=C1 19 =CD=C1=
=D2=D4=C1 2010 00:04:30 =C1=D7=D4=CF=D2 Roman I Khimov =CE=C1=D0=C9=D3=C1=
=CC:
>> > > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =FE=C5=D4=D7=C5=D2=C7 18 =CD=
=C1=D2=D4=C1 2010 23:47:01 =C1=D7=D4=CF=D2 Roman I Khimov
>> =CE=C1=D0=C9=D3=C1=CC:
>> > > > No. You mean, this one?
>> > > > http://git.pokylinux.org/cgit.cgi/poky/commit/?id=3Dca5f36ee6ad756=
e1e5402
>> > > >88 a5 6a504c1d8ecc7a3
>> > > >
>> > > > Looks like a good thing to have, so if Richard will push it to OE.=
dev I
>> > > > can do a rebase of my patchset.
>> > >
>> > > Actually, the better sequence is
>> > > =9A* drop 5.8.4 and 5.8.7
>> > > =9A* bring in staging changes
>> > > =9A* bring in 5.10.1
>> > >
>> > > I'll prepare 5.8.4/5.8.7 removal patch.
>> >
>> > Updated rik/perl-5.10 branch with removal patch, please ACK.
>>
>> Tried to compile for arm, succeeded with perl, discovered and fixed some
>> problems in modules. Updated the branch.
>>
>> I think I need some ACK's for dusty old Perl versions removal and then
>> Richard's Perl staging update could be merged better on top of that (CC'=
ing
>> Richard) and than I'll update 5.10.1 to new staging and push the series.=
 At
>> least, that's how I think it should be. If there are any problems with s=
taging
>> update and it's not ready to be pushed in OE.dev, I think we can merge 5=
.10.1
>> as it is now.
>>
> For removal of old perl versions
>
> Acked-by: Graeme Gregory <dp@xora.org.uk>

 For removal of old perl versions
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>



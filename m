Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LeUBJ-0004Dz-8p
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 13:57:09 +0100
Received: by fk-out-0910.google.com with SMTP id f40so1079380fka.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 04:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JT+/Zv7K2HYfcCPMO1IwGj+6jvjX7SHSRft4iwZjWwc=;
	b=CVhUU5YKox+OfamAsglmZmSpFIDBRFGZYJjiFlTIi6QTKnWJdH6yuoSRfDzSBQ+LNo
	KYWx+EGM1tMQpqmwQ/iA267VsfjUD26vnoxOK4wE5yqBgzTlO1x9feu2Hb89LtgMB+Se
	iMG7JN+AxA/7bT9B2/zm50WJMvHfTWkHwqkiw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UYGTGeRu830KphJjIu5WM1qegEMrDfjJlEicBriqlIKFmFaOk9ZaE117MwNUwCSxNy
	iG5tVOdr9v4WZmVyz1KBJw8caqSPSOO9W+4cU1oKA9I1U7EcaDTHlbegxwzBMSthAKCN
	7BsWYgJVPnHPfp2WTSUI1IbaWPJD0k2/nEMNk=
MIME-Version: 1.0
Received: by 10.223.115.16 with SMTP id g16mr6997321faq.93.1236084787114; Tue, 
	03 Mar 2009 04:53:07 -0800 (PST)
In-Reply-To: <20090303133626.5706500e@mobil.site>
References: <20090211213312.919E8189338@amethyst.openembedded.net>
	<20090303133626.5706500e@mobil.site>
Date: Tue, 3 Mar 2009 13:53:07 +0100
Message-ID: <ac9c93b10903030453g6bdfb268ubb30f3854e667d12@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Frans Meulenbroeks : opkg: fix bug that occured with file names of exactly 100 chars in the tar file
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
X-List-Received-Date: Tue, 03 Mar 2009 12:57:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/3/3 Krzysztof Kotlenga <pocek@users.sf.net>:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 4e1b79d2d824ae7e0204251a09e852c24045c54a
>> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcom=
mit;h=3D4e1b79d2d824ae7e0204251a09e852c24045c54a
>>
>> Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> Date: =A0 Wed Feb 11 22:32:06 2009 +0100
>>
>> opkg: fix bug that occured with file names of exactly 100 chars in
>> the tar file
>>
>> ---
>>
>> =A0packages/opkg/files/opkg_unarchive.patch | =A0 13 +++++++++++++
>
> Hi,
> this is actually a new bug, it causes paths in .list files being cut at
> 99 characters. I've run into this issue when I couldn't find gcc in
> meta-toolchain.
>
> --
> kjk
>

I don't have time today to look into this (all day & evening hooked up
at work). Probably tomorrow.
Anyway, appending the 0 byte is no good as tar_entry->name[100] is
already out of bounds.

For now I suggest undoing my patch. I'll come up with a better solution a.s=
.a.p.
Guess this needs to be fixed at the place where tar_entry->name is
used (the issue was that this array was 100 bytes and got followed by
the mode (.e.g 000644), so without my patch you got files like:
.....xml000644). this happens if the file name is exactly 100 chars

Apologies for any inconvenience.

Frans



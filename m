Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6oKl-0002Ge-P2
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 17:40:18 +0100
Received: by bwz9 with SMTP id 9so2048231bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 08:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=kfLv+PbNTlprq3B0jOqKhrO5YixhN1L2bKiXV1VZar0=;
	b=b9P5QNJSFFjTsB8AHhNtAPynlDoAcmJDESa1ScZK3i5BMm8J8gBwT8cf9n0P9RR0KC
	KTdMe9EoA/tSG7vU243URSClckze/g7cQS9UVE6UaZxuwX1qZpmnSeFatSiBnXtqRgPk
	bK9kcEml4f9RZjRA35dGCG80/+wQ2XZdPKYNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=MB7ovags6BaQ+kKTTM8gOhQmPwSiiGwtZyWDI5KJiZ/YXoRS5+ZhXlZueS4rEUW4up
	sHl911nsdg5P1fkVdaMx3MDCwVS1uJuLlbHLlypvVTC8BQFKNtHHE+AimGG/6pM3o4g4
	EecWQmFD1D1ysq2qdKu+hoA6Vym+jSvVTpHvo=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.244.83 with SMTP id l19mr570247hbq.202.1257611939890; Sat, 
	07 Nov 2009 08:38:59 -0800 (PST)
In-Reply-To: <hd4108$sbn$2@ger.gmane.org>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<200911070406.18094.holger+oe@freyther.de>
	<ac9c93b10911070106n587495a5qaf3cfc9288df7e8@mail.gmail.com>
	<4AF574B5.2010802@mwester.net> <hd4108$sbn$2@ger.gmane.org>
Date: Sat, 7 Nov 2009 14:38:59 -0200
X-Google-Sender-Auth: 287ad05ef93a65e6
Message-ID: <be7a9f3d0911070838x34e5cce8je93bc39aeb8fb3aa@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
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
X-List-Received-Date: Sat, 07 Nov 2009 16:40:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Nov 7, 2009 at 12:42 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> On 07-11-09 14:23, Mike Westerhof wrote:
>>
>> Frans Meulenbroeks wrote:
>> ...
>>>
>>> Reluctantly updated checksums.ini
>>>
>>> Frans
>>
>> But of course there's no magic that will remove the old cached tarball
>> out of one's downloads directory when this sort of thing happens.
>> (Busybox has been known to do this, too)
>>
>> What do folks think we should do about that when it occurs?
>> a) support two entries (old and new) in checksums.ini
>> b) do nothing (leave as is)
>> c) add some sort of support so that the user gets additional information
>> =A0 =A0with the new checksum match failure explaining that the checksum =
was
>> =A0 =A0updated and they need to manually remove the old (bad) tarball
>
> d) rename the tarball slighty and mirror in on a known good server (e.g.
> angstrom sourcemirror) and have OE use that.

IMO (d) is the safest and the right thing to do; this avoids more core
to be written and avoids also we use changed versions without
noticing.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br



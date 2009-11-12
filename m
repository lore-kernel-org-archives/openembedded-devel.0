Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N8Z6y-0006jB-Ck
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 13:49:19 +0100
Received: by ywh7 with SMTP id 7so1956700ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 04:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zufiXWqMxWoQF9oPYhX1CUfVcLrcMfuYcMf9CqRg8KU=;
	b=jLEUN5zHQGx1AcNlnKslDTuR6NLg+U0ayST+fyEw3o1Ug1/E7WFAKVzOsHBypGYlks
	sUo/x4g1aDmyaUTeBOnZTs8FsJC/GRP+NgQpFUnhKilqGpTnUlM/DAgMJQslFup1CeeN
	j6eVmU1PGGPqELPF7+2ldSH6Y2S3UGbPb8xgs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BVBFuP+d7VBlMLxmFfhq4aTOxu4oaHHq0/zIQfFbQG46Tj9fDHJzC3EusG5Isg0+oN
	ovwWlp2ucfcImczF4+VwYgBOGEYIoWJgPVuFkbVufukvsP3ooHdW+sk3RvEUlzIGbuvo
	shtq7PK0EWypw1qKJWZlnJ8KHq3VJVOwCifSY=
MIME-Version: 1.0
Received: by 10.100.200.9 with SMTP id x9mr2406129anf.172.1258030076767; Thu, 
	12 Nov 2009 04:47:56 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.0911120727540.7268@localhost>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120656.41249.holger+oe@freyther.de>
	<200911120722.09166.holger+oe@freyther.de>
	<alpine.LFD.2.00.0911120125380.1977@localhost>
	<ac9c93b10911120015j5b8cbc07j30f57f2dc68987ca@mail.gmail.com>
	<alpine.LFD.2.00.0911120727540.7268@localhost>
Date: Thu, 12 Nov 2009 13:47:56 +0100
Message-ID: <ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 12:49:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/12 Robert P. J. Day <rpjday@crashcourse.ca>:
> On Thu, 12 Nov 2009, Frans Meulenbroeks wrote:
>
>> 2009/11/12 Robert P. J. Day <rpjday@crashcourse.ca>:
>>
>> > the above is switching on a symbolic mode, and that final line is
>> > using sed to convert the symbolic mode to the corresponding numeric
>> > mode for installation.
>> >
>> > =A0that worked fine a few years back, but it fails on newer linux
>> > distros for which the long listing might have a trailing period, as
>> > does my fedora 11 system:
>> >
>> > $ ls -l /etc/passwd
>> > -rw-r--r--. 1 root root 2474 2009-11-09 14:59 /etc/passwd
>> > =A0 =A0 =A0 =A0 =A0^ there
>>
>> Hm. I've never ever heard about this trailing period. Where does it
>> come from/how was it introduced?
>
> https://fedoraproject.org/wiki/Fedora_11_FAQ#Why_does_ls_show_a_dot_.28..=
29_or_a_plus_.28.2B.29_at_the_end_on_the_file_modes_for_some_files.3F
>
> rday
> --

Robert thanks for the link.
Didn't know that. Apparently one is never too old to learn something new.

So it is not really fedora specific, but it is SELinux specific.
Do we want to support SELinux as build host ?
(the ideal solution of course would be to have our own ls in the cross dir)=
.

Frans.

PS: Personally I think it is a bad idea to change the output format of
a utility that is more than 30 years old and that is so widespread.
(and I did not even see an obvious way to get the old behaviour).



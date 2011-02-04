Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PlO3Q-0000k6-Bh
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 16:58:36 +0100
Received: by bwz10 with SMTP id 10so2664017bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 07:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kGMMvyh7Unwsak94NhTrHhkBjUGe5KT8uEFISV2YSPU=;
	b=stlv9a/qdVXvBQ/cjdF8RuMkiZdTuNOOftZdODnDpr3VObBao9vFLEXBJR7DKpD/6d
	Jn4qSaZ2FA2QTTwoOvFyegk6+YsnT7Tx3t7yj8sz0QsAYkKu4LoK5bHqxmXUxIwSN1Tk
	VKZWRpjDVW+HKfoKIVuMiLotB8j4RJTxLa1ac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=we/8kTZ6VJCTAxupE9aX2gaVr7bp2yWj4C9cZ0phorIwus1J3XtEzVhv7Qf+szETw6
	pUanND62HyUrt6metE0/0suB94z05o3RrP/qfKY7FSjSBFw4sOHD5IK7Mtnjw4UuLgPw
	yBNY0a3EQpYupxNPTdWgYVPY+iovSNOdkouxc=
MIME-Version: 1.0
Received: by 10.204.102.146 with SMTP id g18mr11659921bko.163.1296835057045;
	Fri, 04 Feb 2011 07:57:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.56.135 with HTTP; Fri, 4 Feb 2011 07:57:37 -0800 (PST)
In-Reply-To: <4D4C1B8C.9080709@mentor.com>
References: <E1PlNJv-0005sP-PU@melo.openembedded.org>
	<4D4C1B8C.9080709@mentor.com>
Date: Fri, 4 Feb 2011 15:57:37 +0000
X-Google-Sender-Auth: eTKjdPSGnZ7IhYqnzwTIzbY9tM4
Message-ID: <AANLkTim=14HWLtuNDr5vqZSbt=o=MzF5QqVYGUOb_sKy@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Martin Jansa : gnu-config: update also bindir change to replace /usr/bin/ env instead of /usr/bin/perl
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
X-List-Received-Date: Fri, 04 Feb 2011 15:58:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 4, 2011 at 15:30, Tom Rini <tom_rini@mentor.com> wrote:
> On 02/04/2011 08:11 AM, git version control wrote:
...
>> gnu-config: update also bindir change to replace /usr/bin/env instead of
>> /usr/bin/perl
...
> This is wrong. =A0/usr/bin/env is one of those mandated things everyone h=
as.
> =A0And ${bindir} can be too long :) =A0Based on the previous commit, this
> test/regex should be able to go away.

This is right since micro can build without /usr et all.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



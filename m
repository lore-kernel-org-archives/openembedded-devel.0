Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PcyYD-0007KE-H0
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 12:07:37 +0100
Received: by bwz10 with SMTP id 10so403444bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 03:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mz9xgyOPzmLvX4pSibztcpf+4wFve0p9nVyJ5nC+HN4=;
	b=ERj6bpJRf8YI8nlZDftuO3nKGzx/cYL1S6J2yuM5wxkvwqXCH5c2ul58LOwQLBofU8
	IdJhKFVTQ9wTWwinjyotAMSTPXYQ+FXCJMdvNJxoqwXyTr50gk60zJQ/CQgCbyZhrZmb
	TWQ52NVJEkCPOo8Kuqlgnb24hMOQw+2QVP81E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=a5pgTYTZ5kwEUjfFpSZNm9r39nUZARbzgvT76TBmzE9Z5gbibYsYQCgzw+xArQcULa
	P08RswoRhmzxwpf9bKhC3cWPiC0VjoG6RDHVCODC1K9CmPWtws90K5WAvIMmjQQ+QHgn
	9VpUbvtmXC+DyUvBofLAY2SUdQV2qHjF1QCzo=
MIME-Version: 1.0
Received: by 10.204.71.141 with SMTP id h13mr611958bkj.180.1294830426975; Wed,
	12 Jan 2011 03:07:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Wed, 12 Jan 2011 03:07:06 -0800 (PST)
In-Reply-To: <20110111194110.GC6584@mx.loc>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-9-git-send-email-rep.dot.nop@gmail.com>
	<201101032354.25037.roman@khimov.ru> <4D230B5A.3030202@gmx.de>
	<AANLkTikAsHGf9H2YUVt6c7eqauOHyWuNUGC9Oy92TOBV@mail.gmail.com>
	<4D23186C.8080803@gmx.de> <20110111194110.GC6584@mx.loc>
Date: Wed, 12 Jan 2011 09:07:06 -0200
X-Google-Sender-Auth: 5qMX-AAM33juZnxqtc6JN3s1moY
Message-ID: <AANLkTikEATsB-UU+Cr5YjRhK6oVkM7mC2eXyeFwJpghc@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 09/12] busybox: provide postrm for package mdev
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
X-List-Received-Date: Wed, 12 Jan 2011 11:07:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2011 at 17:41, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Tue, Jan 04, 2011 at 01:54:04PM +0100, Wolfgang Hauser wrote:
>>I agree for the test statement, but that may be solved by using =B4the
>>brackets in the long statement.
>>
>>Otavio Salvador schrieb:
>>> On Tue, Jan 4, 2011 at 09:58, Wolfgang Hauser <wohauser@gmx.de> wrote:
>>>> Keep it simple and stupid!
>>>> So I vote for the long, readable and less error prone version.
>>>
>>> I usually prefer the KISS however on this specific case I disagree.
>>>
>>> The new code avoid using test and a fork. This allows for "test"
>>> applet removal if desired.
>>>
>>> I prefer the ugly but more "embedded like" code.
>
> remember that this stuff potentially ends up on the target, so KISS
> (byte-wise) is always the preferred way. And yes, update-rc.d and the
> required inode itself is bloat, but heck, if you want online
> pkg-management you have to take that penalty, FWIW.
>
> So.. Can i please have an explicit ACK for that space-saver?

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



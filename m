Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKE1z-0002eG-DG
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 18:50:05 +0100
Received: by iwn38 with SMTP id 38so2242012iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 09:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LYpgbIivOoHVavOfGe0kvJsOFd35WtLNiE5r2ryFbeo=;
	b=MQ77Vo8A1Bj2ug70JLxJcfO0lvMQ/6c0T/SBC+yU3qLkTw3+mUgbjZ6DUi34e/JlTW
	npey0e6apFjWiwtzNnh5eoz+f25o8bzWt2lFut3sgrvzNedygkMlhUFboBs98frPgwJX
	GxIhWKj15kbRjXBCiIA7tfLt1WuHbO/4G0+QI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ph2n10YvWCAd6W9/Tguv9JKOqm946mdbH8iNMUCIJLB1JRgF2XzeYadiCr5xM4j0Jg
	frqARd4/h99Mds//zgpPlxnNQB0dDWdfcVoHX3yUGsTruY2OdaxrOWzGeAP4KaIi1qsT
	7G1nu8go58kp8mZj3/fo7xORuFbWqXAn6Sa8k=
MIME-Version: 1.0
Received: by 10.231.35.201 with SMTP id q9mr5536243ibd.176.1290361658646; Sun,
	21 Nov 2010 09:47:38 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Sun, 21 Nov 2010 09:47:38 -0800 (PST)
In-Reply-To: <4CE926A8.3000402@mentor.com>
References: <E1PKA9U-00040x-SY@melo.openembedded.org>
	<4CE926A8.3000402@mentor.com>
Date: Sun, 21 Nov 2010 18:47:38 +0100
Message-ID: <AANLkTik+48R--3w7woTqp=vQ324a5BsOFKAvzj8vg6Yi@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Frans Meulenbroeks : flex: added perl to dependencies
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
X-List-Received-Date: Sun, 21 Nov 2010 17:50:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/21 Tom Rini <tom_rini@mentor.com>:
> On 11/21/2010 06:40 AM, git version control wrote:
>>
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: c3b5b68541320ed0104d8654a0793251ed0187b9
>> URL:
>> =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3Dc=
3b5b68541320ed0104d8654a0793251ed0187b9
>>
>> Author: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
>> Date: =A0 Sun Nov 21 10:15:08 2010 +0100
>>
>> flex: added perl to dependencies
>>
>> Without it (rebuilding from packaged staging) I got:
>>
>> |
>> /home/frans/oe/tmp_minimal/work/i686-linux/flex-native-2.5.35-r5.1/temp/=
run.do_configure.12240:
>> /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/bin/automake:
>> /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/bin/perl: bad
>> interpreter: No such file or directory
>
> This starts to open up the very large can of worms of stuff that uses hos=
t
> perl (autotools, etc) and then what happens once perl-native has been bui=
lt
> and installed. =A0I've mentioned this before in
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg=
08445.html

After reading the archive and discussing this on irc.

I feel DEPENDS should be complete (minus perhaps a few things that are
always there, e.g. no depends on patch needed).

I understand the very long pathname problem, but I don't think it is
good to "solve" that by deferring building of perl-native (or
restoring it from packaged staging).
That solution does not work if someone rebuilds a package that suffers
from the long path problem.

Some alternate solutions (most of them coined in the thread mentioned befor=
e).
- always use perl from the host; not too desirable as the host version
may not be what you want.
- use perl from host for standard things (like configure etc), have a
package (e.g. perl-cross) for things that really need perl on the host
for the target (I can imagine libperl* recipes need this)
- use /usr/bin/env perl instead of the long path
- relax the line length of the command interpreter so longer paths are
ok. Guess that would mean having a bash-native or so.
- create (sym)links and use these. E.g. we could have $TMPDIR/links
where there is a link for perl to the long path. By adding
$TMPDIR/links to the front of the path executables in it wll be picked
up first.

Guess there are plenty other ways to skin this cat.
My personal preference is using /usr/bin/env perl. This seems the
cleanest solution.

Best regards, Frans



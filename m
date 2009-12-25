Received: from mail-px0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NO3Uy-0007f3-Cz
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Dec 2009 07:18:07 +0100
Received: by pxi12 with SMTP id 12so4623304pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 22:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=1KH3U9YuZjv6Ndt0rKTiu8ZuoOlQQuzWFQ1vhl5aeUE=;
	b=Wwwwp3onVl+iBhTbT5pGhLcSQFAFOw7tVx6/QnKSgRkOBnAqaYtDALnASv1KpDlWja
	WmNo2ZqcoSyBa+Me6RhNHGT/dmdi9dAv6nBbHsUAhhl93r2NCXA2sVW5T3TCbmtGHSGg
	u3G2x8bQ48Vq4+OShmCt+pf35nuFhak6cCB6U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=FguV+/JbWrbH9jiFTT00HNCbxTZAS7RUpC75XLUy//aUIoq+TP4c7YhqGG4JKv4vIA
	9OPKWMgm7H1CyMwjAYeYQ1Xva+HfB+PbmTEFD5oNpCotMIqb5hmWAeAIkIsIQbRiI1Mz
	6E+4UbT15OImICVZpdSkXSzmAaUijngE5ZEB0=
Received: by 10.141.188.1 with SMTP id q1mr8091434rvp.294.1261721769271;
	Thu, 24 Dec 2009 22:16:09 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.105.26])
	by mx.google.com with ESMTPS id 23sm8402863pzk.0.2009.12.24.22.16.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 22:16:08 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1261712573-10282-1-git-send-email-camelguo@gmail.com>
	<200912250546.52376.holger+oe@freyther.de>
Date: Fri, 25 Dec 2009 14:16:00 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5hc0pupmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <200912250546.52376.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Upgrade glibc from 2.6.1 to 2.10.1, the 2.6.1 glibc cause ltrace compilation failed
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
X-List-Received-Date: Fri, 25 Dec 2009 06:18:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Fri, 25 Dec 2009 12:46:52 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Friday 25 December 2009 04:42:53 Guo Hongruan wrote:
>> the include/sys/ptrace.h of glibc 2.6.1 does not include the  =

>> PTRACE_EVENT*
>>  macroes, which is needed by ltrace. the one of glibc 2.10.1 does  =

>> include
>>  them and on it the compilation of ltrace succeed ---
>
> That is quite a bad reason to upgrade the default. The problem is you =
 =

> would
> have to convince us that glibc 2.10.1 is working just fine for arm,  =

> armeb,
> mips, mipsel, powerpc, avr, sparc, i486, i586... Or at least your comm=
it
> message should include the information that you have tested builds wit=
h  =

> it.

The include/sys/ptrace.h of glibc 2.6.1 lacks of the above macroes, this=
  =

is a bug of it, which was fixed by the later glibc There is a newer  =

version of glibc recipes, so I have no reason to not test with it.

Yes, I have not validated on some much architecture. It is only verified=
  =

on qemux86 and minimal.conf.

>
>
> Then again. It is pretty common that older versions of a library do no=
t  =

> have
> newere definitions of syscalls and syscall parameters (e.g. most notab=
le  =

> this
> happened with the addition of inotify and early adaption of it). The f=
ix  =

> is the
> one you proposed. Check if the system has the definition, if not defin=
e  =

> it
> locally.
>
>
> regards
> 	holger
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com



Received: from [209.85.223.190] (helo=mail-iw0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N69Rp-00037j-W7
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 22:00:53 +0100
Received: by iwn28 with SMTP id 28so348039iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 12:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=d82hZATeZAFxOOCNApVwB2tEChQaJrtfFZLP7YLTJQY=;
	b=GVlj7N9ElJ4mPXdYllTlXYFc9+kwx0b05zFokdJDWeLlyO8+x0m3g+uOxzGBTcIMMF
	ibIqKnihGL7lUSSKps+FnDgn9uVvEe2loYJ/AvpThUS1meLarhaQ2womzrLfhVWCgZ5a
	I1EWknkmwjvEqM176ecAhNkIgOjNtik2QPze0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=l1X3+9auB1ls4eF5KoDpkqaOmW9OSYSoZxc9HTi2iqClqCle38ONcKoFsTbXXnRC0y
	ZekmK03zKPyvqGo4fGBSydjfg0YQh3zc73DYAPc+vDsTh8HJxZKtBiRR+P2ngun/ofUB
	UjcW4bIsMHrEnD/s1GKCC2yfnaQqRYcbGHodE=
MIME-Version: 1.0
Received: by 10.231.117.215 with SMTP id s23mr1313443ibq.41.1257452859277; 
	Thu, 05 Nov 2009 12:27:39 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.0911050101490.17537@localhost>
References: <alpine.LFD.2.00.0911050101490.17537@localhost>
Date: Thu, 5 Nov 2009 12:27:39 -0800
Message-ID: <19c1b8a90911051227i83370f0u2847b51f4d5536d0@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OE breakage: qte-mt_2.3.10.bb.
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
X-List-Received-Date: Thu, 05 Nov 2009 21:00:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2009 at 10:06 PM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
>
> =C2=A0yes, it's just me again, whining about another build error.
> bitbaking qte-mt produces:
>
> NOTE: Running task 747 of 759 (ID: 8,
> /home/rpjday/oe/openembedded/recipes/qte/qte-mt_2.3.10.bb, do_compile)
> ERROR: function do_compile failed
> ERROR: see log in /home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux=
-gnueabi/qte-mt-2.3.10-r28/temp/log.do_compile.26359
> NOTE: Task failed: /home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linu=
x-gnueabi/qte-mt-2.3.10-r28/temp/log.do_compile.26359
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/rpjday/oe/openembedded/recipes/qte/qte-mt_2.3.10.bb=
 do_compile failed
> ERROR: Task 8 (/home/rpjday/oe/openembedded/recipes/qte/qte-mt_2.3.10.bb,=
 do_compile) failed
> NOTE: Tasks Summary: Attempted 747 tasks of which 747 didn't need to be r=
erun and 1 failed.
> ERROR: '/home/rpjday/oe/openembedded/recipes/qte/qte-mt_2.3.10.bb' failed
>
> =C2=A0qte-mt log file attached, but here's what appears to be the salient
> bit:
>
> ...
> kernel/qpixmapcache.cpp:125:57: error: asm/page.h: No such file or direct=
ory

asm/page.h is not exported by kernel headers anymore. getpagesize()
definition could be obtained from including <unistd.h>

-Khem



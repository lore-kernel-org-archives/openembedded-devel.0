Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQod5-0000id-Iy
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 May 2012 01:43:11 +0200
Received: by lags15 with SMTP id s15so337953lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2012 16:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=AxxNHSBpTXHstxdFjzJol0qvU1zYZE8TP+VJbhT6aWM=;
	b=C2/owATJWpNj/qx++aRDEqrZnr3XCWocKnIWwVIU3AkAIsxr2W2CjJfJty/HlUDOxz
	tRdhVuUGV8LxxEFmoa5xxMjHhpxbJAL0k4KpFCziyqI3XCLmnMtwXl5WACsFzS5i876A
	+jjp7ahcTVpQSD00SG9Tk+JgH4WMWwXUzR78NCEa5rg5V2tDphOU8XD8hO9blZoisMb+
	qQjN7iqCEKMqB1gTKHHLwsmjDQjjAyCJFnHa9pcXeRATTvl7yuqtGk8nzoO35xcKuRPj
	2fflObdsGk7D/xs2OAfVlIQaTi1sC0ddV+F1d6fwUSbtyWFeGWg+6L63vl3VlGhu7TO/
	Lfjg==
Received: by 10.152.133.144 with SMTP id pc16mr3229089lab.0.1336260802664;
	Sat, 05 May 2012 16:33:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sat, 5 May 2012 16:32:52 -0700 (PDT)
In-Reply-To: <1336248354.26091.4.camel@localhost.localdomain>
References: <1336237032.22405.2.camel@localhost.localdomain>
	<4FA58128.7030906@gmail.com>
	<1336248354.26091.4.camel@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 May 2012 16:32:52 -0700
Message-ID: <CAMKF1so7oUWmrYROtvk-1x9o6cfNJhgNUgibnc+YpwAv+tDm6g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld] Troubles building kernel for h2200
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
X-List-Received-Date: Sat, 05 May 2012 23:43:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 5, 2012 at 1:05 PM, Priit Laes <plaes@plaes.org> wrote:
> =C3=9Chel kenal p=C3=A4eval, L, 05.05.2012 kell 12:36, kirjutas Khem Raj:
>> On 05/05/2012 09:57 AM, Priit Laes wrote:
>> > include/asm/arch/uncompress.h:20:20: warning: conflicting types for
>> > built-in function 'putc'
>>
>> what version of binutils+gcc is in play and which version of kernel is
>> it ?
> binutils-2.20.1-r9
> gcc-4.5-r49+svnr184907
>
> And kernel is linux-handhelds-2.6-2.6.21-hh20-r27
>
> It's quite possible that I'm posting to the wrong place because I've set
> up the system using Angstrom's setup-scripts
> ( https://github.com/angstrom-distribution/setup-scripts )
> using the following tutorial:
> http://www.angstrom-distribution.org/building-angstrom
>
>

OK what does arch/arm/boot/compressed/head-h2200.s looks like ?
it could be a linker problem. If you have option of chosing a
different version of binutils then please try that to confirm

> P=C3=A4ikest,
> Priit Laes
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



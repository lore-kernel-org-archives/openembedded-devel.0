Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5Gaq-0003Uu-1T
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 13:31:05 +0200
Received: by iwn7 with SMTP id 7so2566306iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ks/M4GdpU4l9QEcrrOpHvIdTOG5ZSQJ3zCZoy+4hwlg=;
	b=Bk2s8vQlEwhQ1MQOQZ/yYoNoC1S053giD3BLk3ddS0TEZ9CyTLFHbyF6Jfpk2RtXRq
	X28Wf+HTipqqDIMmR3V9PQ5CfCZzkys/ZQ2Kul9ZfgpldY6/yaLE8IHbLxn+pk6LjRhG
	PjOG0q/OK5eZAiii/EVD0ZIQE8WA0t4L+6fQM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pZnBUJXBmAkSwVjVpUDB4GOEb8l5OGrUKFa7SUB4ltqyYu4bsif4IZWWFFYOxRQ5Zj
	iAnBztxeVV+b4RMWwUfdQfs8cPtLdwHEuwJhuRJ6Nq597WSNqspydtHMDdWLIiUuXoAJ
	lY27cLIjac7CqY9wM32YVf9bfLO/iOIKyNxfw=
MIME-Version: 1.0
Received: by 10.42.100.142 with SMTP id a14mr1889811ico.204.1286796634020;
	Mon, 11 Oct 2010 04:30:34 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 04:30:33 -0700 (PDT)
In-Reply-To: <AANLkTikxPN7Oocgh2Xy6dc6=VQ=mxLSYj_xUDKQ7V1Yd@mail.gmail.com>
References: <4CB2AD64.90800@gmail.com>
	<AANLkTimPP5f4MtwXSh+JmWAPOK4ufj+u6tB=iv4su0KP@mail.gmail.com>
	<AANLkTikxPN7Oocgh2Xy6dc6=VQ=mxLSYj_xUDKQ7V1Yd@mail.gmail.com>
Date: Mon, 11 Oct 2010 13:30:33 +0200
Message-ID: <AANLkTi=4dsm_bJ6jR8e3vsARxYMcOb9x0WG3XrKGe0hg@mail.gmail.com>
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
Subject: Re: [PATCH] prboom_2.5.0.bb: fix compilation failure due to undefined references.
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
X-List-Received-Date: Mon, 11 Oct 2010 11:31:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/10/11 Graham Gower <graham.gower@gmail.com>:
> On 11 October 2010 17:04, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Do you feel this is the preferred way?
>> I would probably not have made the patch but add -D_GNU_SOURCE to
>> CFLAGS. (I like to compile all the sources with the same flags to
>> avoid inconsistencies)
>>
>> Frans
>
> To be honest, I didn't really think about it and don't care either
> way. But the glibc manual says the following:
> "You should define these macros by using =91#define=92 preprocessor
> directives at the top of your source code files. These directives must
> come before any #include of a system header file. It is best to make
> them the very first thing in the file, preceded only by comments. You
> could also use the =91-D=92 option to GCC, but it's better if you make th=
e
> source files indicate their own meaning in a self-contained way." [1]
>
> The last sentence is not found in the feature_test_macros(7) man page.
>
> -Graham
>
> [1] http://www.gnu.org/s/libc/manual/html_node/Feature-Test-Macros.html


Ah ok, didn't know that text.
My personal perception is to keep changes as small and unintrusive as
possible. That is why I generally prefer -D. With a new version the -D
will keep working whereas a patch might not (due to a change in the
src file).

But looking at that text, I'm fine with this change.

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>



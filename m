Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OiZYR-0005YK-U4
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 23:06:47 +0200
Received: by bwz8 with SMTP id 8so1555646bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 14:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=eZd4xdf6Fetlk8/+paDEf1a0gCluP2t1iyW8U/rrBBY=;
	b=g9XG4BnD4eHng2yF16IRXNjf+eH0tPImxnBHu7ZnAmUtYluZU2a+ls143/fwMiXdO2
	qxbuXY8G0JK8E9lGgPKpYIkQfq5Rc1366sAzlHLldKKKEaqJk1f03WYzzYhLsDxM9KEY
	2ybQnQ/L6lseRs+UIYjlxGeYk3xUq9TqQBpQU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=IdgkGYFhnO/XqkL0ba2GtQ3YhPQ+3pt+MVH+MNnahNYonps/+HL4xUnYeHEsZOqEaS
	9JJ3Em0HiNCYu8Cj+FdQPU5C4f+TZfCQmxfsBZqcsohzEdf9wrm4CO8LE6pCDIw/qvR/
	wFq/89qTT6aZcoP0+YokWMfjL6mY2UnMULKVA=
Received: by 10.204.33.86 with SMTP id g22mr3452004bkd.26.1281387995079; Mon, 
	09 Aug 2010 14:06:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.71.8 with HTTP; Mon, 9 Aug 2010 14:06:15 -0700 (PDT)
In-Reply-To: <AANLkTinZJSeh++976L9WwTHGR=TrJA4=46kKKgyPiCyz@mail.gmail.com>
References: <AANLkTinZJSeh++976L9WwTHGR=TrJA4=46kKKgyPiCyz@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Aug 2010 14:06:15 -0700
Message-ID: <AANLkTi=3rK8j32QEbR4ZZk_Tp_hwL3k9KOXDDWWywjFN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: glibc-initial do_install failure
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
X-List-Received-Date: Mon, 09 Aug 2010 21:06:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 9, 2010 at 1:39 PM, Adrian Alonso <aalonso00@gmail.com> wrote:
> Hi,
>
> I'm trying to build glibc-initial_2.3.6 for Microblaze arch
> and it fails in do_install function at final stage when linking
> libc.so; Error log attached
>
> I notice that this always happends when invoking gcc with
> "-shared" flag it always returns the same error:
>
> /tmp/ccvUy8ol.o: could not read symbols: File format not recognized
> | collect2: ld returned 1 exit status
> | ERROR: Function do_install failed
>
> The combination of tools that trying to build
>
> binutils: 2.20.1
> gcc: =A0 =A0 =A04.5 Microblaze svn branch
> glibc: =A0 =A02.3.6 from petalogix know working port for microblaze
> Computer host: Fedora 13
>
> Can any one give me some advise on how to root cause and solve this probl=
em?
>

The problem is that its not using the right assembler AFAICT
the log you attached does not help. Can you try that same command
individually with -v added to it please.

Thx
-Khem



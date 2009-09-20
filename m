Received: from [212.27.42.91] (helo=wmproxy1-g27.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alain2210@free.fr>) id 1MpRQD-00040G-FH
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 20:46:08 +0200
Received: from wmproxy1-g27.free.fr (localhost [127.0.0.1])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id A27603450;
	Sun, 20 Sep 2009 20:45:31 +0200 (CEST)
Received: from UNKNOWN (imp6-g19.priv.proxad.net [172.20.243.136])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id 9786E334C;
	Sun, 20 Sep 2009 20:45:30 +0200 (CEST)
Received: by UNKNOWN (Postfix, from userid 0)
	id 95AA0C2E48B27; Sun, 20 Sep 2009 20:45:30 +0200 (CEST)
Received: from  ([82.123.18.65]) by imp.free.fr (IMP) with HTTP 
	for <alain2210@172.20.243.55>; Sun, 20 Sep 2009 20:45:30 +0200
Message-ID: <1253472330.4ab6784a8f36c@imp.free.fr>
Date: Sun, 20 Sep 2009 20:45:30 +0200
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <1253437328.4ab5ef902b12f@imp.free.fr>
	<19c1b8a90909200807u66d5d12bh345139ce4c4302ad@mail.gmail.com>
In-Reply-To: <19c1b8a90909200807u66d5d12bh345139ce4c4302ad@mail.gmail.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.8
X-Originating-IP: 82.123.18.65
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 212.27.42.91
X-SA-Exim-Mail-From: alain2210@free.fr
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: minimo not building
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
X-List-Received-Date: Sun, 20 Sep 2009 18:46:08 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks for the answer.

Selon Khem Raj <raj.khem@gmail.com>:
> > | {standard input}: Assembler messages:
> > | {standard input}:28: Error: lo register required -- `ldr ip,[r5,#16=
]'
> > | {standard input}:33: Error: lo register required -- `sub sp,sp,r4'
> > | {standard input}:37: Error: lo register required -- `ldr ip,[r5,#20=
]'
> > | {standard input}:44: Error: lo register required -- `ldr ip,[r1,r2]=
'
> > | {standard input}:46: Error: Thumb does not support conditional exec=
ution
> > | {standard input}:47: Error: Thumb does not support conditional exec=
ution
> > | {standard input}:48: Error: Thumb does not support conditional exec=
ution
> > | {standard input}:49: Error: Thumb does not support conditional exec=
ution
> > | {standard input}:50: Error: Thumb does not support conditional exec=
ution
> > | make[8]: *** [xptcinvoke_arm.o] Error 1
>
>
> The error messages are clear that there is mixed arm
> and thumb code in a file but is not properly guarded with
> .arm and .thumb (.code16 or .code32) directives.
>
> It could be inline assembly.

Thanks for the explanation. How can I make minimo build again ? (and do y=
ou have
an idea why fennec with the same code can be built ?)

Sincerely,

Alain



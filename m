Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MyQaT-0007Dq-Kl
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Oct 2009 15:41:52 +0200
Received: by yxe5 with SMTP id 5so904852yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2009 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=dFSyHxmnzkFWbAGDjbnyTFUDK/89MXyULCp8agUulJk=;
	b=sR1MDChQS/K+WNbPWMV4dq7DKbkjLyAv1EPvS1E8Z0Ztk9+8f2sdoZxhEipHJrCBVa
	R4Pu6ShOusEhhr6HukN8UKdGWAm7rraEVYhXtVtn8DVbCwyo1iVUkcv9JSaJrR/Sfz2r
	RTPEYSCWsmjibYFHViaYWDLlZETfGUSQK30i8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=DGhTPHKo0YSdRyJ505kzuMNQo5mV77gVKPBwQU4CoenAi3Ey/TIBeobPuDSf7G55/n
	iW6LJjZzBeGQ2IvcStrh5mEdNWitXfa2Zo/U08WSD5A7+HPflWoWfhJoA5hJxD/ArGBk
	hyCiBhsrReGtCezPSdklzDx6iuoVNXNUyh+IA=
MIME-Version: 1.0
Received: by 10.239.181.164 with SMTP id m36mr3160hbg.184.1255614052480; Thu, 
	15 Oct 2009 06:40:52 -0700 (PDT)
Date: Thu, 15 Oct 2009 15:40:52 +0200
Message-ID: <c384c5ea0910150640t6b3b74c7qbe9e8b968b6fa670@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: race condition during eglibc do_stage() fails my build
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
X-List-Received-Date: Thu, 15 Oct 2009 13:41:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Khem, all,

I am hitting a race condition during eglibc do_stage.

do_stage() mentions it implements a workaround for a possible race,
but I do not understand what races.


do_stage() {
    # Installing directly into staging creates some races between existing
    # glibc-initial files and us. We could use a new DESTDIR but we may as
    # well just copy the data installed by do_install
    cp -pPR /home/leon/sandbox/gtd100/openembedded/tmp/work/ppce500v2-angstrom-linux-gnuspe/eglibc-2.10-r7.1/image/*
/home/leon/sandbox/gtd100/openembedded/tmp/staging/ppce500v2-angstrom-linux-gnuspe/

}

Note that the temporary files it tries to copy:


NOTE: generation of binary locales disabled. this may break i18n!
ERROR: function do_stage failed
ERROR: log data follows
(/home/leon/sandbox/gtd100/openembedded/tmp/work/ppce500v2-angstrom-linux-gnuspe/eglibc-2.10-r7.1/temp/log.do_stage.32628)
| cp: cannot stat
`/home/leon/sandbox/gtd100/openembedded/tmp/work/ppce500v2-angstrom-linux-gnuspe/eglibc-2.10-r7.1/image/usr/lib/st4rsJoc':
No such file or directory
| cp: cannot stat
`/home/leon/sandbox/gtd100/openembedded/tmp/work/ppce500v2-angstrom-linux-gnuspe/eglibc-2.10-r7.1/image/usr/lib/stRhhUms':
No such file or directory
NOTE: Task failed:
/home/leon/sandbox/gtd100/openembedded/tmp/work/ppce500v2-angstrom-linux-gnuspe/eglibc-2.10-r7.1/temp/log.do_stage.32628


After failure, indeed some other-named temporary files where left,
indicating there was still activity going on:

leon@bigtee:~/sandbox/gtd100/openembedded/tmp/work/ppce500v2-angstrom-linux-gnuspe/eglibc-2.10-r7.1/temp$
ls -al /home/leon/sandbox/gtd100/openembedded/tmp/work/ppce500v2-angstrom-linux-gnuspe/eglibc-2.10-r7.1/image/usr/lib/

-rw-r--r-- 1 leon leon   23002 2009-10-15 15:10 Scrt1.o
drwx------ 2 leon leon   40960 2009-10-15 15:37 stGPyioZ
-rw------- 1 leon leon       0 2009-10-15 15:26 stknPu33


Is it that the do_install() is racing with do_stage() here?


Must we add a task dependency to prevent concurrent tasking here?

Regards,
-- 
Leon



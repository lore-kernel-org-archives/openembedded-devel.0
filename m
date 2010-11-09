Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1PFe0w-0002dx-Hv
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 03:32:51 +0100
Received: by bwz10 with SMTP id 10so6132110bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 18:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bMawJnHQsmOSTF75cEz0G6xEmpIUqybQY87hAH3QM3U=;
	b=St6b20X1jWC6JzIlXeMJf+Eyv9z+IP1KsgBIeJhHGl9/kZh2rEKuwF39KUsWNHb7ae
	eYlKrj+PP09iwFEnGA8o2j7veb5xIjCwx6+NV2XjuO/ks+4lELeH5pZyrZogahl4JFX4
	squmz905XNRQjD+wQpfk4NtKwSjEB1dZynPlY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=ptp57i5+gwxdGoPrprcXBLxkZ9U+KRW+8Vj1kZRmOGsCSUmnP7xdWGewcZKD/QhO0H
	VsTSMHDjYTjTZx37h6hpAJSJoDjZRO+mRIe6c3xO61eogbEN3txmMIvgycjYauuWgGcw
	i1xfmGWf6ws9uFfL52VXqT5/1oGmt4g2PC4zs=
MIME-Version: 1.0
Received: by 10.204.73.78 with SMTP id p14mr5812825bkj.154.1289269915339; Mon,
	08 Nov 2010 18:31:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.2.75 with HTTP; Mon, 8 Nov 2010 18:31:55 -0800 (PST)
Date: Tue, 9 Nov 2010 00:31:55 -0200
X-Google-Sender-Auth: RFhqxmJEuqYkE6LIa5NrcjJUqMo
Message-ID: <AANLkTikVxU787_ktH03HKBdCCFiGZOvxXk6pJ94+RK6Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Fail to build eglibc on testing
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
X-List-Received-Date: Tue, 09 Nov 2010 02:32:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I got this build fail. Anyone knows anything about it?

| nscd.c:(.text+0x573): undefined reference to `__stack_chk_guard'
| nscd.c:(.text+0x5cd): undefined reference to `__stack_chk_guard'
| /home/otavio/hacking/ossystems/oe/oetmp-current/work/i586-oe-linux/eglibc=
-2.12-r15.6+svnr11762/build-i586-oe-linux/nscd/nscd.o:
In function `parse_opt':
| nscd.c:(.text+0x5fc): undefined reference to `__stack_chk_guard'
| nscd.c:(.text+0x8cf): undefined reference to `__stack_chk_guard'
| /home/otavio/hacking/ossystems/oe/oetmp-current/work/i586-oe-linux/eglibc=
-2.12-r15.6+svnr11762/build-i586-oe-linux/nscd/connections.o:
In function `restart':
| connections.c:(.text+0x153): undefined reference to `__stack_chk_guard'
| /home/otavio/hacking/ossystems/oe/oetmp-current/work/i586-oe-linux/eglibc=
-2.12-r15.6+svnr11762/build-i586-oe-linux/nscd/connections.o:connections.c:=
(.text+0x59f):
more undefined references to `__stack_chk_guard' follow
| collect2: ld returned 1 exit status
| make[2]: *** [/home/otavio/hacking/ossystems/oe/oetmp-current/work/i586-o=
e-linux/eglibc-2.12-r15.6+svnr11762/build-i586-oe-linux/nscd/nscd]
Error 1
| make[2]: Leaving directory
`/home/otavio/hacking/ossystems/oe/oetmp-current/work/i586-oe-linux/eglibc-=
2.12-r15.6+svnr11762/eglibc-2_12/libc/nscd'
| make[1]: *** [nscd/subdir_install] Error 2
| make[1]: Leaving directory
`/home/otavio/hacking/ossystems/oe/oetmp-current/work/i586-oe-linux/eglibc-=
2.12-r15.6+svnr11762/eglibc-2_12/libc'
| make: *** [install] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_install failed
NOTE: package eglibc-2.12-r15.6+svnr11762: task do_install: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/otavio/hacking/ossystems/oe/recipes/eglibc/eglibc_2.12.bb
do_install failed
ERROR: Task 2 (/home/otavio/hacking/ossystems/oe/recipes/eglibc/eglibc_2.12=
.bb,
do_install) failed with 256
ERROR: '/home/otavio/hacking/ossystems/oe/recipes/eglibc/eglibc_2.12.bb' fa=
iled
ERROR: '/home/otavio/hacking/ossystems/oe/recipes/eglibc/eglibc_2.12.bb' fa=
iled


--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 http://projetos.ossystems.com.br



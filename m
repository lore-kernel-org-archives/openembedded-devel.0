Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Spbta-00069d-Pa
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:10:42 +0200
Received: by ggnp4 with SMTP id p4so3105179ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0rtKtnWfpc1Rkxy+OxpAuO7vvbIBPJFuIoXrIA92qZw=;
	b=n4tc/+uFNzGkruh0Zd80wONPmSYesXWGOjIXdfI0mm3cPdQjtsmJ9p35X6aqyX4Fen
	UbUOB4RSEC/BuAj8OjyJFJw2MENMfDOd75G/KNOZYiBV0kNLrj4M05Ya8rc/KHve5Og0
	gPPZLcgb3cF+0ZykC+3SCHTPAyqFzbqHBkUOPGJVQmeP00td4kAmwn0yAgEu3KXhqDHp
	y+FUwomeknTh8VpngoeJISlQju/oJARknutnveBqt6pVc21LWYmoZujKyl4DSuokHgri
	Ut4k1lfLgxQ/2h/ug/HW+KEK2owEelInJhwP9it4PxRRP9em33Sn8/1LtsfgOHY7veSr
	PIXw==
MIME-Version: 1.0
Received: by 10.50.192.170 with SMTP id hh10mr618596igc.36.1342169968214; Fri,
	13 Jul 2012 01:59:28 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Fri, 13 Jul 2012 01:59:28 -0700 (PDT)
In-Reply-To: <jtonnb$ov3$1@dough.gmane.org>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
	<1342168240-7760-8-git-send-email-schnitzeltony@googlemail.com>
	<jtonnb$ov3$1@dough.gmane.org>
Date: Fri, 13 Jul 2012 10:59:28 +0200
Message-ID: <CALbNGRT0zCLbALNBpfGMX09b2ZHzEtiMhVqqp2tc5X5Uj8Vugg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe, V2 07/32] task-basic: move systemd support to meta systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 09:10:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2012 at 10:54 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 13-07-12 10:30, Andreas M=FCller schreef:
>>
>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com> ---
>> meta-oe/recipes-core/tasks/task-basic.bb           |    7 +++----
>> .../meta-oe/recipes-core/tasks/task-basic.bbappend |    6 ++++++ 2 files
>> changed, 9 insertions(+), 4 deletions(-) create mode 100644
>> meta-systemd/meta-oe/recipes-core/tasks/task-basic.bbappend
>>
>> diff --git a/meta-oe/recipes-core/tasks/task-basic.bb
>> b/meta-oe/recipes-core/tasks/task-basic.bb index d4a0bd9..47b09de 100644
>> --- a/meta-oe/recipes-core/tasks/task-basic.bb +++
>> b/meta-oe/recipes-core/tasks/task-basic.bb @@ -5,7 +5,7 @@ DESCRIPTION =
=3D
>> "Basic task to get a device online" LICENSE =3D "MIT" LIC_FILES_CHKSUM =
=3D
>> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
>>
>> -PR =3D "r8" +PR =3D "r9"
>>
>> inherit task
>>
>> @@ -21,7 +21,7 @@ MACHINE_EXTRA_RRECOMMENDS ?=3D "" # Select between
>> dropbear and openssh # Set TASK_BASIC_SSHDAEMON =3D "openssh-sshd
>> openssh-sftp openssh-sftp-server" in your DISTRO config to get
>> openssh(d) # -TASK_BASIC_SSHDAEMON ?=3D "dropbear-systemd openssh-sftp
>> openssh-sftp-server" +TASK_BASIC_SSHDAEMON ?=3D "dropbear openssh-sftp
>> openssh-sftp-server"
>
> If I understand this patchset correctly:
>
> * systemd.bbclass automagically adds ${PN}-systemd to RRECOMMENDS_${PN}
> * dropbear bbappend moves to meta-systemd
> * everything gets a PR bump
>
> So task-basic can safely drop *-systemd.
>
> Is that understanding correct?
>
> regards,
>
> Koen
Yes

Andreas



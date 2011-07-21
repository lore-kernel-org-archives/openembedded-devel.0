Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1QjxCy-0003FY-TG
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 19:38:48 +0200
Received: by fxh10 with SMTP id 10so3936259fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 10:34:41 -0700 (PDT)
Received: by 10.223.144.141 with SMTP id z13mr96458fau.18.1311269681297;
	Thu, 21 Jul 2011 10:34:41 -0700 (PDT)
Received: from mail-fx0-f51.google.com (mail-fx0-f51.google.com
	[209.85.161.51])
	by mx.google.com with ESMTPS id h10sm1522555fai.43.2011.07.21.10.34.38
	(version=SSLv3 cipher=OTHER); Thu, 21 Jul 2011 10:34:38 -0700 (PDT)
Received: by fxh10 with SMTP id 10so3936153fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 10:34:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.15.4 with SMTP id i4mr158320bka.320.1311269677284; Thu, 21
	Jul 2011 10:34:37 -0700 (PDT)
Received: by 10.204.102.139 with HTTP; Thu, 21 Jul 2011 10:34:37 -0700 (PDT)
In-Reply-To: <CAD=GYpZX0NqBTDO8Y9UG6kD4frg-s_uoa2r8LW5C0GOxK3h9LA@mail.gmail.com>
References: <1311199325-7532-1-git-send-email-agnel.joel@gmail.com>
	<j08h0v$tdv$3@dough.gmane.org>
	<CAD=GYpZX0NqBTDO8Y9UG6kD4frg-s_uoa2r8LW5C0GOxK3h9LA@mail.gmail.com>
Date: Thu, 21 Jul 2011 13:34:37 -0400
Message-ID: <CA+T6QP=wo0V5-_PVx2L5xkch0nAvcsJR3CYYL2X1oDQHZYhnVg@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [PATCH v2] linux-omap-psp, linux-omap: Added patch to fix MMC timeout errors
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
X-List-Received-Date: Thu, 21 Jul 2011 17:38:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 12:24 PM, Joel A Fernandes <agnel.joel@gmail.com> w=
rote:
> On Thu, Jul 21, 2011 at 1:29 AM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 21-07-11 00:02, Joel A Fernandes schreef:
>>> This fixes MMC errors due to timeouts on certain SD Cards following sug=
gestions to set dto to 14 by Jason Kridner and Steven Kipisz
>>>
>>> Details of the issue: http://talk.maemo.org/showthread.php?p=3D1000707#=
post1000707 --- Changes since v1: * Made patch to apply to org.openembedded=
.dev branch * Bumped PR of respective recipes
>>>
>>> ...mc-Adjust-dto-to-eliminate-timeout-errors.patch | =A0 27 +++++++++++=
+++ ...mc-Adjust-dto-to-eliminate-timeout-errors.patch | =A0 39 +++++++++++=
--------- recipes/linux/linux-omap-psp_2.6.32.bb =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +- recipes/linux/linux-omap_2.6.39.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A03 +-
>>
>> Could you please split that in 2? And for the .39 kernel, the master rec=
ipe is in meta-ti, not in .dev: http://git.angstrom-distribution.org/cgi-bi=
n/cgit.cgi/meta-texasinstruments/tree/recipes-kernel/linux/linux-omap_2.6.3=
9.bb?id=3D7018fe0a81fa33c6d73d6296d25517b5d427d0a7
>>
>
> Did you move it recently? If you don't mind, can you point me to some
> information on why this has changed?

Are we not keeping both up-to-date for the time being?  Is
Angstrom-next now officially oe-core?  Should Narcissus now rename
'next' to 'classic'?

>
> Thanks
> Joel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



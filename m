Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LwBVe-0000yj-1M
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 10:39:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 10AC52C7FD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 08:32:49 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7GOo4TFGOlu
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 08:32:47 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id C8B6D2C797
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 08:32:46 +0000 (UTC)
Message-ID: <49ED8530.2020402@gmail.com>
Date: Tue, 21 Apr 2009 10:34:56 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49ED22A1.7090208@tait.co.nz>
In-Reply-To: <49ED22A1.7090208@tait.co.nz>
Subject: Re: devshell "No protocol specified"
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
X-List-Received-Date: Tue, 21 Apr 2009 08:39:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Douglas Royds ha scritto:
> Failing to get a devshell console. Fails for both XTERM and KONSOLE:
>=20
> | No protocol specified
> | xterm Xt error: Can't open display: :0
>=20
> The failure is unique to one box (ie. it works fine on a different
> computer).
>=20
> Invoking run.do_devshell.15108 directly succeeds, so the problem only
> occurs when we try to launch the devshell from within bitbake.
>=20
> I used bitbake -D to see the list of environment variables that bitbake
> was unsetting. I tried listing the whole lot in BB_ENV_EXTRAWHITE, but
> still no joy.
>=20
> Suggestions?
> Douglas.
>=20
>=20
> $ bitbake zlib -c devshell
> NOTE: Handling BitBake files: \ (6591/6591) [100 %]
> NOTE: Parsing finished. 6305 cached, 0 parsed, 286 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: build 200904211325: started
> fatal: Not a git repository
>=20
> OE Build Configuration:
> BB_VERSION        =3D "1.8.12"
> METADATA_BRANCH   =3D "<unknown>"
> METADATA_REVISION =3D "25344"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "davinci-dcb"
> DISTRO            =3D "tait"
> DISTRO_VERSION    =3D "trunk-20090421"
> TARGET_FPU        =3D "soft"
>=20
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 32 of 32 (ID: 4,
> /media/storage/workspace/DBS/org.openembedded.dev/vendor/2009-02-21_dcb=
eaf393bed4d0b7071c100bf9e5d92ad3c20c5/packages/zlib/zlib_1.2.3.bb,
>=20
> do_devshell)
> NOTE: package zlib-1.2.3: started
> NOTE: package zlib-1.2.3-r5: task do_devshell: started
> ERROR: function do_devshell failed
> ERROR: log data follows
> (/media/storage/workspace/DBS/build/tmp/work/armv5te-tait-linux-gnueabi=
/zlib-1.2.3-r5/temp/log.do_devshell.15108)
>=20
> | No protocol specified
> | xterm Xt error: Can't open display: :0
> NOTE: Task failed:
> /media/storage/workspace/DBS/build/tmp/work/armv5te-tait-linux-gnueabi/=
zlib-1.2.3-r5/temp/log.do_devshell.15108
>=20
> NOTE: package zlib-1.2.3-r5: task do_devshell: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package zlib-1.2.3: failed
> ERROR: Build of
> /media/storage/workspace/DBS/org.openembedded.dev/vendor/2009-02-21_dcb=
eaf393bed4d0b7071c100bf9e5d92ad3c20c5/packages/zlib/zlib_1.2.3.bb
>=20
> do_devshell failed
> ERROR: Task 4
> (/media/storage/workspace/DBS/org.openembedded.dev/vendor/2009-02-21_dc=
beaf393bed4d0b7071c100bf9e5d92ad3c20c5/packages/zlib/zlib_1.2.3.bb,
>=20
> do_devshell) failed
> NOTE: Tasks Summary: Attempted 31 tasks of which 31 didn't need to be
> rerun and 1 failed.
> ERROR:
> '/media/storage/workspace/DBS/org.openembedded.dev/vendor/2009-02-21_dc=
beaf393bed4d0b7071c100bf9e5d92ad3c20c5/packages/zlib/zlib_1.2.3.bb'
>=20
> failed
> NOTE: build 200904211325: completed
>=20
>=20
>=20
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This email, including any attachments, is only for the intended
> addressee.  It is subject to copyright, is confidential and may be
> the subject of legal or other privilege, none of which is waived or
> lost by reason of this transmission.
> If the receiver is not the intended addressee, please accept our
> apologies, notify us by return, delete all copies and perform no
> other act on the email.
> Unfortunately, we cannot warrant that the email has not been
> altered or corrupted during transmission.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


we recently solved an identical issue
see thread 20/04/2009 "[oe] devshell not working with screen remote shell=
"

BTW could you descrive better what are you doing?
are you on local or remote machine?

Can you try calling xterm in your console?
What happens?

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com



Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1LwNFT-0006Y3-Aa
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 23:11:23 +0200
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id F14E546757
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 09:06:54 +1200 (NZST)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])by 
	gatekeeper.tait.co.nz (Postfix) with ESMTP id E01A746749for 
	<openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2009 09:06:54 
	+1200 (NZST)
Received: from conversion-daemon.sunstrike.tait.co.nz by 
	sunstrike.tait.co.nz(Sun Java System Messaging Server 6.1 (built Apr 28
	2004))id <0KIG00401TQIOQ00@sunstrike.tait.co.nz>(original mail from 
	douglas.royds@tait.co.nz)for openembedded-devel@lists.openembedded.org; 
	Wed,22 Apr 2009 09:06:54 +1200 (NZST)
Received: from [172.25.116.23] by sunstrike.tait.co.nz(Sun Java System 
	Messaging Server 6.1 (built Apr 28 2004))with ESMTP id 
	<0KIG001DXYNGXX30@sunstrike.tait.co.nz> 
	foropenembedded-devel@lists.openembedded.org; Wed,22 Apr 2009 09:06:53 
	+1200 (NZST)
Date: Wed, 22 Apr 2009 09:06:43 +1200
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <49ED8530.2020402@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <49EE3563.1060805@tait.co.nz>
MIME-version: 1.0
References: <49ED22A1.7090208@tait.co.nz> <49ED8530.2020402@gmail.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
X-imss-version: 2.053
X-imss-result: Passed
X-imss-approveListMatch: *@tait.co.nz
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
X-List-Received-Date: Tue, 21 Apr 2009 21:11:24 -0000
Content-type: text/plain;
	format=flowed;
	charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Marco Cavallini wrote:
> Douglas Royds ha scritto:
>  =20
>> Failing to get a devshell console. Fails for both XTERM and KONSOLE:
>>
>> | No protocol specified
>> | xterm Xt error: Can't open display: :0
>>
>> The failure is unique to one box (ie. it works fine on a different
>> computer).
>>
>> Invoking run.do_devshell.15108 directly succeeds, so the problem only
>> occurs when we try to launch the devshell from within bitbake.
>>
>> I used bitbake -D to see the list of environment variables that bitbak=
e
>> was unsetting. I tried listing the whole lot in BB_ENV_EXTRAWHITE, but
>> still no joy.
>>
>> Suggestions?
>> Douglas.
>>
>>
>> $ bitbake zlib -c devshell
>> NOTE: Handling BitBake files: \ (6591/6591) [100 %]
>> NOTE: Parsing finished. 6305 cached, 0 parsed, 286 skipped, 0 masked.
>> NOTE: Cache is clean, not saving.
>> NOTE: build 200904211325: started
>> fatal: Not a git repository
>>
>> OE Build Configuration:
>> BB_VERSION        =3D "1.8.12"
>> METADATA_BRANCH   =3D "<unknown>"
>> METADATA_REVISION =3D "25344"
>> TARGET_ARCH       =3D "arm"
>> TARGET_OS         =3D "linux-gnueabi"
>> MACHINE           =3D "davinci-dcb"
>> DISTRO            =3D "tait"
>> DISTRO_VERSION    =3D "trunk-20090421"
>> TARGET_FPU        =3D "soft"
>>
>> NOTE: Resolving any missing task queue dependencies
>> NOTE: Preparing runqueue
>> NOTE: Executing runqueue
>> NOTE: Running task 32 of 32 (ID: 4,
>> /media/storage/workspace/DBS/org.openembedded.dev/vendor/2009-02-21_dc=
beaf393bed4d0b7071c100bf9e5d92ad3c20c5/packages/zlib/zlib_1.2.3.bb,
>>
>> do_devshell)
>> NOTE: package zlib-1.2.3: started
>> NOTE: package zlib-1.2.3-r5: task do_devshell: started
>> ERROR: function do_devshell failed
>> ERROR: log data follows
>> (/media/storage/workspace/DBS/build/tmp/work/armv5te-tait-linux-gnueab=
i/zlib-1.2.3-r5/temp/log.do_devshell.15108)
>>
>> | No protocol specified
>> | xterm Xt error: Can't open display: :0
>> NOTE: Task failed:
>> /media/storage/workspace/DBS/build/tmp/work/armv5te-tait-linux-gnueabi=
/zlib-1.2.3-r5/temp/log.do_devshell.15108
>>
>> NOTE: package zlib-1.2.3-r5: task do_devshell: failed
>> ERROR: TaskFailed event exception, aborting
>> NOTE: package zlib-1.2.3: failed
>> ERROR: Build of
>> /media/storage/workspace/DBS/org.openembedded.dev/vendor/2009-02-21_dc=
beaf393bed4d0b7071c100bf9e5d92ad3c20c5/packages/zlib/zlib_1.2.3.bb
>>
>> do_devshell failed
>> ERROR: Task 4
>> (/media/storage/workspace/DBS/org.openembedded.dev/vendor/2009-02-21_d=
cbeaf393bed4d0b7071c100bf9e5d92ad3c20c5/packages/zlib/zlib_1.2.3.bb,
>>
>> do_devshell) failed
>> NOTE: Tasks Summary: Attempted 31 tasks of which 31 didn't need to be
>> rerun and 1 failed.
>> ERROR:
>> '/media/storage/workspace/DBS/org.openembedded.dev/vendor/2009-02-21_d=
cbeaf393bed4d0b7071c100bf9e5d92ad3c20c5/packages/zlib/zlib_1.2.3.bb'
>>
>> failed
>> NOTE: build 200904211325: completedmailman/listinfo/openembedded-devel
>>    =20
>
>
> we recently solved an identical issue
> see thread 20/04/2009 "[oe] devshell not working with screen remote she=
ll"
>
> BTW could you descrive better what are you doing?
> are you on local or remote machine?
>
> Can you try calling xterm in your console?
> What happens?
>
> Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
>  =20

Well, perhaps not identical: a different error message, no SSH, and no=20
"screen". This is happening locally.

xterm and konsole both open fine when you call them directly from the=20
command line. As I mentioned, invoking the bash script in=20
build/tmp/work/.../temp/run.do_devshell.12345 works fine. The problem=20
only occurs when BitBake tries to do it, and only on that machine:

    | No protocol specified
    | xterm Xt error: Can't open display: :0

I have yet to try it on a different KDE box - mine is opening Gnome=20
Terminal OK.

Thanks,
Douglas.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D




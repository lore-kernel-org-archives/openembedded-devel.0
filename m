Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mq9Ww-00055V-8c
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 19:52:01 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1268457qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2009 10:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QN7i36DyAXYRCkv7QnEe50ULgsxQY8hgOSwc3VweVO0=;
	b=we5/m+Cflx8f64jM2IkHhMZHAKhjlLwdnxAP1U0xq9QwjYgJDeyXZKgh/YT6wDsbQi
	KqAP0NmCQnxS9PoJ4SVNtUhhxZ6BNZLRzq6RYDAbwaQLUc8T3RwhaL6AuQBog0kUJ/lV
	BG9RQxyZBy4LM/+p6e4mvZSHcOc2GCBUA0XZQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Oza6rDTvHiJsoJBJSLF5mXwIXgUS0BVIwdu+Ku/zIdhP2OFahc3cD4wD9CDpDd+7or
	703JIL8EF3ERkHyExjWYk3nc2hsRQLSEa/ANzH+JIXj9W4OiYY4qSHrpnedJnjhP5FP1
	1BUFTvLqhgfe+rFQuZ3OL0K6cYkTESep2UT3I=
MIME-Version: 1.0
Received: by 10.229.129.133 with SMTP id o5mr588973qcs.45.1253641882390; Tue, 
	22 Sep 2009 10:51:22 -0700 (PDT)
In-Reply-To: <4AB8CF91.1070907@dresearch.de>
References: <4AB8CF91.1070907@dresearch.de>
Date: Tue, 22 Sep 2009 10:51:22 -0700
Message-ID: <19c1b8a90909221051x775eb576qb0813e26bdca7c09@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake freeze :(
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
X-List-Received-Date: Tue, 22 Sep 2009 17:52:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2009 at 6:22 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Since a few days i see this crazy behavior. Sometimes bitbake freezes (ev=
erytime at the same stages if it freezes) when building a target (e.g. with=
 "bitbake drapptempl"). top tells me that a "make all" process is running a=
nd consuming all resources of one cpu. The last lines of an strace show alw=
ays something like this:
>
> ...
> 5909 =C2=A0stat64(".deps/drapptempl-main.Po", {st_mode=3DS_IFREG|0644, st=
_size=3D8, ...}) =3D 0
> 5909 =C2=A0lstat64(".deps/drapptempl-main.Tpo", {st_mode=3DS_IFREG|0644, =
st_size=3D32496, ...}) =3D 0
> 5909 =C2=A0lstat64(".deps/drapptempl-main.Po", {st_mode=3DS_IFREG|0644, s=
t_size=3D8, ...}) =3D 0
> 5909 =C2=A0rename(".deps/drapptempl-main.Tpo", ".deps/drapptempl-main.Po"=
) =3D 0
> 5909 =C2=A0close(0) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0
> 5909 =C2=A0close(1) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0
> 5909 =C2=A0close(2) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0
> 5909 =C2=A0exit_group(0) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D ?
> 5898 =C2=A0<... wait4 resumed> [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}=
], 0, NULL) =3D 5909
> 5898 =C2=A0--- SIGCHLD (Child exited) @ 0 (0) ---
> 5898 =C2=A0sigreturn() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ? (mask now [])
> 5898 =C2=A0rt_sigprocmask(SIG_BLOCK, [HUP INT QUIT TERM XCPU], NULL, 8) =
=3D 0
> 5898 =C2=A0rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
> 5898 =C2=A0stat64("drapptempl-main.o", {st_mode=3DS_IFREG|0644, st_size=
=3D107848, ...}) =3D 0
>
> The recipe for the freezing task looks like this:
>
> =C2=A0DESCRIPTION =3D "HydraIP Linux Application Template"
> =C2=A0SECTION =3D "console/utils"
> =C2=A0PRIORITY =3D "optional"
> =C2=A0DEPENDS =3D "libdrhip"
>
> =C2=A0#SRCREV =3D "1390"
> =C2=A0SRCREV =3D "${AUTOREV}"
> =C2=A0PR =3D "r1"
>
> =C2=A0SRC_URI=3D"svn://something.else/repos/HydraIP/trunk/LINUX;module=3D=
drapptempl;proto=3Dhttps"
>
> =C2=A0PV =3D "svnr${SRCREV}"
> =C2=A0S =3D "${WORKDIR}/drapptempl"
>
> =C2=A0EXTRA_OECONF =3D "--with-libdrhip-path=3D${STAGING_DIR_TARGET}"
>
> =C2=A0inherit autotools
>
> Any idea what's going wrong here? Or how to isolate the problem?

you could try couple of things. Firstly try to isolate if its a
bitbake problem or not
likely its not but still make sure. You can go into the workdir and
run the task script
run.do_<task> whatever it is stuck at. If it succeeeds then you know
its a problem with
bitbake if not then the build mechanism for this particular package
has problem. You might
try to disable parallel build i.e. use -j 1 to make sure that its not
some parallel build
issue.

>
> Steffen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



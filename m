Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <piero.pezzin@gmail.com>) id 1Lhlj6-0003Yw-1w
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 15:17:37 +0100
Received: by fxm11 with SMTP id 11so398836fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=80u4rcfAsdY38Jl2N8zEqIxix5FbHD92J67yiGxxprQ=;
	b=nJx1kqIrwboaQ8STTsUPyxn1gn7qQ/bk4Tpyc4R4iA9h7NrGNsF14QExnGLSnRAq3Q
	oYFWNa1NOcc0Rb25TYHdfi4IoMfkcpelr1aiA1oocbEYc9evSVrq8y9T2kTmu1fASyhH
	BvphFQ7szcayCZaUAjBnjzRedMtQ/MB4O7Qfg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=puzL9SKcyySJjqDcN59K4EqZV4Nm/uBa50ytN+2WW1Tdale3l9ADh4AdaekSSCG8j2
	yZgMwC/daYqGEOdq8TemXRZ/kH+xfQ3xGXizXz1W+vdE+0zO/FLLtZy/rwnYRzl7Coy1
	7LbDPCOeMS1/uhzjxQonCtfyEiJvcFdniE+rw=
MIME-Version: 1.0
Received: by 10.86.92.7 with SMTP id p7mr23199fgb.24.1236867441164; Thu, 12 
	Mar 2009 07:17:21 -0700 (PDT)
In-Reply-To: <1236863674.6250.21.camel@northpole>
References: <49bdfd00903100733s3af6dc2o48f09b48593fe51f@mail.gmail.com>
	<19c1b8a90903101122r59d22d0fia19158c42583e784@mail.gmail.com>
	<49bdfd00903110149y39fb7aa4we99d373a4ff1790f@mail.gmail.com>
	<49B8C180.3010607@gmail.com> <20090312085123.GD30336@ibawizard.net>
	<1236863674.6250.21.camel@northpole>
Date: Thu, 12 Mar 2009 15:17:20 +0100
Message-ID: <49bdfd00903120717n40732eabt816abc4339d619b1@mail.gmail.com>
From: Piero Pezzin <piero.pezzin@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problem building kernel - too many files open
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
X-List-Received-Date: Thu, 12 Mar 2009 14:17:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Jader,

it works!

Thank you very much.

Regards,

Piero

On Thu, Mar 12, 2009 at 2:14 PM, Jader <jader@2mi.com.br> wrote:

> Hello.
> I had the same problem. It's inside classes/kernel.bbclass:298
> (reproduced below):
>
>
> python populate_packages_prepend () {
>        def extract_modinfo(file):
>                import tempfile, os, re
>                tempfile.tempdir =3D bb.data.getVar("WORKDIR", d, 1)
>                tmpfile =3D tempfile.mkstemp()[1]
>                cmd =3D "PATH=3D\"%s\" %sobjcopy -j .modinfo -O binary %s =
%s" %
> (bb.data.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or "",
> file, tmpfile)
>                os.system(cmd)
>                f =3D open(tmpfile)
>                l =3D f.read().split("\000")
>                f.close()
>                os.unlink(tmpfile)
>
>
> tempfile.mkstemp() is used to create a temporary file. This function
> return a tuple with an OS file descriptor and a filename. Filename is
> stored in "tmpfile" but descriptor is not stored anywhere, but it is
> still open because it's only an integer to python so it is not closed at
> the end of the function.
>
> For each iteration in which this function is called, a new OS file
> descriptor is opened, but not closed. The solution is to store the file
> descriptor and close it:
>
>
> python populate_packages_prepend () {
>        def extract_modinfo(file):
>                import tempfile, os, re
>                tempfile.tempdir =3D bb.data.getVar("WORKDIR", d, 1)
>                tf =3D tempfile.mkstemp()
>                tmpfile =3D tf[1]
>                cmd =3D "PATH=3D\"%s\" %sobjcopy -j .modinfo -O binary %s =
%s" %
> (bb.data.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or "",
> file, tmpfile)
>                os.system(cmd)
>                f =3D open(tmpfile)
>                l =3D f.read().split("\000")
>                f.close()
>                os.close(tf[0])
>                os.unlink(tmpfile)
>
>
> There's a patch attached. As I=E1=B8=BF new to git, I don know it it was =
created
> in the right way. Used command following:
>
>
> git format-patch cab70860b89f0fd856c5de1c37c6a3d31fd3cc9d --stdout classe=
s
> >kernel.bbclass.patch
>
>
> Jader H. Silva
> 2MI Tecnologia
>
> Em Qui, 2009-03-12 =C3=A0s 09:51 +0100, Petr =C5=A0tetiar escreveu:
>
> > Marco Cavallini <koansoftware@gmail.com> [2009-03-12 09:02:08]:
> >
> > > Piero Pezzin ha scritto:
> >
> > [...]
> >
> > > >>> During kernel building, I got the following error:
> > > >>>
> > > >>> OTE: package linux-2.6.28: started
> > > >>> NOTE: package linux-2.6.28-r6: task do_package: started
> > > >>> ERROR: Error in executing:
> > > >>>
> /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> > > >>> linux_2.6.28.bb
> > > >>> ERROR: Exception:exceptions.IOError Message:[Errno 24] Too many
> open
> > > >> files:
> > >
> > > this is a known error.
> > > Nobody solved it yet.
> >
> > Maybe, that increasing the numbers of max. file handles and number of
> max.
> > inodes might help you:
> >
> > /proc/sys/fs/file-max
> > /proc/sys/fs/inode-max
> >
> > -- ynezz
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lh6av-0003du-Iz
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2009 19:22:25 +0100
Received: by yw-out-1718.google.com with SMTP id 4so111487ywq.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2009 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xEJk21pp/95eTlwXiMsBB3OF1CyT74Rn/6vXw6PfkXA=;
	b=Vpos9rlXqA9Wr339iWl70XqAjy+rtAJrdHvrVOjUOVMidjGVKljIiJAfthfqFbmYLZ
	G95WT/HOjJ/U7CxQCjJLvQJMbS3Cz39+jRGbsLAtp8RWifusTn1MESrsem6HAgsflPK3
	JPjLwgdPak89l8WTTE8wpPV/1kSzuutRsdsOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EUF4WMu/9dmXd0lBOPwR5DTsY1tmHLw/VOAakqz4M/bMruGWINb7ByP467hb9bxc4f
	+mPjiVcWfSlMuDzwKN5YJTT2AtYcaTBtiIaaNC1SURtiblLYMA48vMmQODYFeEdj36tw
	iuc4p3cFAUTW0uSZUHa47jGvINFznkKtxULQE=
MIME-Version: 1.0
Received: by 10.143.15.14 with SMTP id s14mr3184987wfi.284.1236709343255; Tue, 
	10 Mar 2009 11:22:23 -0700 (PDT)
In-Reply-To: <49bdfd00903100733s3af6dc2o48f09b48593fe51f@mail.gmail.com>
References: <49bdfd00903100733s3af6dc2o48f09b48593fe51f@mail.gmail.com>
Date: Tue, 10 Mar 2009 11:22:23 -0700
Message-ID: <19c1b8a90903101122r59d22d0fia19158c42583e784@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 10 Mar 2009 18:22:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2009 at 7:33 AM, Piero Pezzin <piero.pezzin@gmail.com> wrot=
e:
> Hello everyone,
>
> I'm building a minimal distribution for a x86 machine (my host is a x86-6=
4
> with CentOS 4.4):
>
> OE Build Configuration:
> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.8.12"
> METADATA_BRANCH =C2=A0 =3D "org.openembedded.dev"
> METADATA_REVISION =3D "a8a23e995d108ecdfc31129941671551c591bc6e"
> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "i486"
> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux"
> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "x86"
> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "minimal"
> DISTRO_VERSION =C2=A0 =C2=A0=3D ".dev-snapshot-20090310"
> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ""
>
>
> During kernel building, I got the following error:
>
> OTE: package linux-2.6.28: started
> NOTE: package linux-2.6.28-r6: task do_package: started
> ERROR: Error in executing:
> /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> linux_2.6.28.bb
> ERROR: Exception:exceptions.IOError Message:[Errno 24] Too many open file=
s:
> '/home/piero/work/qong-nobk/openembedded/build/tmp/work/x86-oe-linux/linu=
x-2.6.28-r6/tmpQbp1Jr'
> ERROR: Error in executing:
> /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> linux_2.6.28.bb
> ERROR: Exception:exceptions.ImportError Message:No module named traceback
> ERROR: Error in executing:
> /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> linux_2.6.28.bb
> ERROR: Exception:exceptions.ImportError Message:No module named traceback
> ERROR: Error in executing:
> /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> linux_2.6.28.bb
> ERROR: Exception:exceptions.ImportError Message:No module named traceback
> ERROR: Build of
> /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> linux_2.6.28.bb do_package failed
> Traceback (most recent call last):
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/bin/bitbake", li=
ne 143,
> in ?
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/bin/bitbake", li=
ne 140,
> in main
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py=
", line
> 612, in cook
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py=
", line
> 514, in buildFile
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/runqueue.=
py",
> line 842, in execute_runqueue
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/runqueue.=
py",
> line 951, in execute_runqueue_internal
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py=
", line
> 137, in tryBuild
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py=
", line
> 111, in tryBuildPackage
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/build.py"=
, line
> 278, in exec_task
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/build.py"=
, line
> 113, in exec_func
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/build.py"=
, line
> 136, in exec_func_python
> =C2=A0File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/utils.py"=
, line
> 186, in better_exec
> ImportError: No module named traceback
> ERROR: Task 12
> (/home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> linux_2.6.28.bb, do_package) failed
>
> Does anyone know what's happening?

Someone else also saw this problem. Search the archives. Its most
probably your host.

>
> Thanks in advance and best regards.
>
> Piero
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



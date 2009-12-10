Received: from qw-out-1920.google.com ([74.125.92.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1NIiXu-0007wk-AE
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 13:55:05 +0100
Received: by qw-out-1920.google.com with SMTP id 4so1294705qwk.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2009 04:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xvkbIZG+YOOx3r4mJg/CqT3GeUWnkX8wTMzWoe/E/0E=;
	b=vmX48ZyJ0slPAekyjCr3EX8q5YjyRvbb/qKAHAyfw20dr2YV3AX9ueLavmN53fuvon
	em024mB9DLvUei3jjHWpNP2nP7SYE//jtmJmzU09UKhqe4e5OF2yNCp1rUT29y5zN27e
	yTNxxXAeQFq9kCYlN8dm689NVxFG+8hRs8/F0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tsxqqeAVNvsNIb7CwvVYGLSCgTnkapK7ciF6NTv1q7KccOt7VvJeecSOBw0v2uNiu0
	EP7Day6HZmAnJAOus2W/RO/ociFfMw59Y4J1/QykTfWgX4tt5Y1yXe3giwH28fwzg8Nu
	liASothq8cAWddZeS3So+J5xFJZ2c2GzyPmiM=
MIME-Version: 1.0
Received: by 10.229.111.195 with SMTP id t3mr2160496qcp.44.1260449601916; Thu, 
	10 Dec 2009 04:53:21 -0800 (PST)
In-Reply-To: <5f2b60912090739i1f62eb17jb747f91e26153cab@mail.gmail.com>
References: <5f2b60912090739i1f62eb17jb747f91e26153cab@mail.gmail.com>
Date: Thu, 10 Dec 2009 13:53:21 +0100
Message-ID: <5f2b60912100453x657f0859g1d0e2f38dd7a5f07@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.148
X-SA-Exim-Mail-From: bjorn.forsman@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OE builds LKMs not matching kernel version (MACHINE="dm6446-evm")
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
X-List-Received-Date: Thu, 10 Dec 2009 12:55:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/12/9 Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>:
> Hi all,
>
> I'm using MACHINE=3D"dm6446-evm" and DISTRO=3D"angstrom-2008.1" and OE
> builds different/incompatible versions of the kernel modules (LKM) and
> the kernel. How do I go about debugging this?
>
> The built images seem correct on the host (same version number):
>
> uImage-2.6.31+2.6.32-rc2-r28+gitr7b2683fd0168df1576fcea947ef9f63e905de807=
-r28-dm6446-evm.bin
> modules-2.6.31+2.6.32-rc2-r28+gitr7b2683fd0168df1576fcea947ef9f63e905de80=
7-r28-dm6446-evm.tgz
>
> But when booting the target, the kernel complains because the LKMs
> doesn't match the kernel version:
> ----
> WARNING: Couldn't open directory
> /lib/modules/2.6.32-rc2-09211-g17d857b: No such file or directory
> FATAL: Could not open
> /lib/modules/2.6.32-rc2-09211-g17d857b/modules.dep.temp for writing:
> No such file or directory
> WARNING: Couldn't open directory
> /lib/modules/2.6.32-rc2-09211-g17d857b: No such file or directory
> FATAL: Could not open
> /lib/modules/2.6.32-rc2-09211-g17d857b/modules.dep.temp for writing:
> No such file or directory
> ...snip...
> # ls -l /lib/modules
> drwxr-xr-x =C2=A0 =C2=A03 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 4096 Dec =C2=A09 00:10 2.6.32-rc2-davinci1
> # insmod /lib/modules/2.6.32-rc2-davinci1/kernel/fs/smbfs/smbfs.ko
> [ =C2=A0264.580000] smbfs: disagrees about version of symbol module_layou=
t
> insmod: cannot insert
> '/lib/modules/2.6.32-rc2-davinci1/kernel/fs/smbfs/smbfs.ko': invalid
> module format
> # uname -r
> 2.6.32-rc2-09211-g17d857b
> ----
>
> I really wish I knew OE well enough to debug this myself, but I don't
> (yet). What is the bitbake target for kernel modules? Where is is the
> decision on what kernel version to build the LKMs against? How is it
> possible for LKMs to end up being built for wrong kernels?
>
> (I have tried to generate a dependency graph with 'bitbake -g
> base-image', hoping that it would give me some clues. But my machine
> just hangs for a long time and then segfaults when trying to view
> depends.dot.)
>
> Best regards,
> Bj=C3=B8rn Forsman
>

This is embarrassing: there is no problem with OE, it was just that I had
not copied the correct uImage to /tftpboot. Sorry for the noise.

Best regards,
Bj=C3=B8rn Forsman



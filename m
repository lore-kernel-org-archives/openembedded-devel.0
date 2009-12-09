Received: from qw-out-1920.google.com ([74.125.92.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1NIOf1-0002MP-E8
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 16:41:06 +0100
Received: by qw-out-1920.google.com with SMTP id 4so1091772qwk.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2009 07:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=LGvnoYNSBJTZmWua7w/7/ImNQrCcgrrnSfiGOMbcgMI=;
	b=nBTEz4m2YTJ2j5GFZ7Euv4j4v9+z0UATo5CjdehdGWV3KeBfUazMRoaOXzRa0xJf24
	/UmcNRVRrAhfujZ9va6js5+J9sprv6OPh8F6NESEK2ox09nbstwJ9GCnGukyDEyTiZO4
	xu+W/7wbTLGyEH0qHw6FR2XIOvJeJqi/Iq3ZU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=vSMi40OzE9poOaGP/sNJlEg9rZ8ulB9xzJUMQw/q4lyJbxnsYL3/H5BCVjINtQnJdC
	+vffGh9H70HkVNoKCZnCjE3n0KljKcmXKvHZs0BIAVPskI2uK6l8Nb7KwBKj7JNFx/1X
	PsFg0mmrBxz8TCnSFe2zr7z6AvOr75ycjzrec=
MIME-Version: 1.0
Received: by 10.229.128.90 with SMTP id j26mr414428qcs.103.1260373158594; Wed, 
	09 Dec 2009 07:39:18 -0800 (PST)
Date: Wed, 9 Dec 2009 16:39:18 +0100
Message-ID: <5f2b60912090739i1f62eb17jb747f91e26153cab@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: bjorn.forsman@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE builds LKMs not matching kernel version (MACHINE="dm6446-evm")
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
X-List-Received-Date: Wed, 09 Dec 2009 15:41:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm using MACHINE=3D"dm6446-evm" and DISTRO=3D"angstrom-2008.1" and OE
builds different/incompatible versions of the kernel modules (LKM) and
the kernel. How do I go about debugging this?

The built images seem correct on the host (same version number):

uImage-2.6.31+2.6.32-rc2-r28+gitr7b2683fd0168df1576fcea947ef9f63e905de807-r=
28-dm6446-evm.bin
modules-2.6.31+2.6.32-rc2-r28+gitr7b2683fd0168df1576fcea947ef9f63e905de807-=
r28-dm6446-evm.tgz

But when booting the target, the kernel complains because the LKMs
doesn't match the kernel version:
----
WARNING: Couldn't open directory
/lib/modules/2.6.32-rc2-09211-g17d857b: No such file or directory
FATAL: Could not open
/lib/modules/2.6.32-rc2-09211-g17d857b/modules.dep.temp for writing:
No such file or directory
WARNING: Couldn't open directory
/lib/modules/2.6.32-rc2-09211-g17d857b: No such file or directory
FATAL: Could not open
/lib/modules/2.6.32-rc2-09211-g17d857b/modules.dep.temp for writing:
No such file or directory
...snip...
# ls -l /lib/modules
drwxr-xr-x    3 root     root         4096 Dec  9 00:10 2.6.32-rc2-davinci1
# insmod /lib/modules/2.6.32-rc2-davinci1/kernel/fs/smbfs/smbfs.ko
[  264.580000] smbfs: disagrees about version of symbol module_layout
insmod: cannot insert
'/lib/modules/2.6.32-rc2-davinci1/kernel/fs/smbfs/smbfs.ko': invalid
module format
# uname -r
2.6.32-rc2-09211-g17d857b
----

I really wish I knew OE well enough to debug this myself, but I don't
(yet). What is the bitbake target for kernel modules? Where is is the
decision on what kernel version to build the LKMs against? How is it
possible for LKMs to end up being built for wrong kernels?

(I have tried to generate a dependency graph with 'bitbake -g
base-image', hoping that it would give me some clues. But my machine
just hangs for a long time and then segfaults when trying to view
depends.dot.)

Best regards,
Bj=C3=B8rn Forsman



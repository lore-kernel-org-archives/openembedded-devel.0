Received: from [217.72.192.247] (helo=fmmailgate06.web.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <j.schauer@email.de>) id 1KJ1p2-0003j1-AD
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jul 2008 09:53:12 +0200
Received: from web.de by fmmailgate06.web.de (Postfix) with SMTP id 8C981375E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2008 09:52:31 +0200 (CEST)
Received: from [217.115.75.232] by freemailng5701.web.de with HTTP;
	Wed, 16 Jul 2008 09:52:31 +0200
Date: Wed, 16 Jul 2008 09:52:31 +0200
Message-Id: <735693612@web.de>
MIME-Version: 1.0
From: Johannes Schauer <j.schauer@email.de>
To: openembedded-devel@lists.openembedded.org
Precedence: fm-user
Organization: http://freemail.web.de/
X-Sender: j.schauer@web.de
X-Provags-Id: V01U2FsdGVkX1/duzGvCEtM4F4zVGXsKc6N/ZkNlcbS6Y6JFc7I6qXYgOzze
	Eor7jE5Yda0LlmFIu5Ld9aS5YiqIJ7+NiRyrM9jta10P0VHZgE=
Subject: squashfs-lzma bitbake recipe needed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 16 Jul 2008 07:53:12 -0000
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit

Hello openembedded devs!

Since quite some time now I'm into the creation of an offline wikipedia for embedded devices - specifically the openmoko neo1973 but of course this will work on every other linux too.
The most important ingredient for this to work is the use of the squashfs filesystem as the storage format as I did not want to create just another file format.
Together with lzma patches this solution provides compression ratios of 19-20% of the original size for wikipedia xhtml articles.
Out of a 1.3GB german wikipedia dump *every* article is seeked to, decompressed and read in only 0.57seconds on a openmoko neo1973.

the only "downside" of this solution is that the user will have to load the squashfs kernel module to be able to mount a wikipedia dump into his file system.
To minimize the efforts on installing the module i need help from your side in building a bitbake recipe for an easy to install ipk.

Of course such a module would not only benefit my work but many other possible scenarios where big amounts of read-only data is required on the small space, memory and processor power of embedded devices.

i already natively build the module on debian-armel on the neo1973 so i can confirm that everything works as expected and i already supply the ready to use armv4t module binaries for a 2.6.24 kernel here: http://rabenfrost.net/mokopedia/sqlzma_armv4t.tgz

you have to know that squashfs alone doesnt use lzma as they want to be included in mainline kernel which only uses gzip which performs much worse than lzma (compression of 33-35% and only slightly faster on decompression)
so one has to use some patches that were wrote for the slax distribution

there are two methods to build those modules:
first is to use the squashfs-lzma patches supplied here: http://www.squashfs-lzma.org/
as they are a bit unmaintained i wrote this howto to natively compile them against a 2.6.24 kernel source: http://mokopedia.mister-muffin.de/wiki/BuildingSquashfsLzma

second there are the scripts used by slax here: ftp://ftp.slax.org/source/slax/kernel/2.6.24.3/src-core/
the script supplied there builds the slax kernel together with aufs and squashfs-lzma kernel and is guaranteed to work
i modified the build.kernel script a bit for my purpose and removed the aufs parts and the kernel compilation and added a variable for the desired kernel tarball to unpack and use.
you can get the modified version here: http://pastebin.com/f29f6e053

in the end those two methods nearly work the same.
they load the squashfs and lzma source, patch those together with the kernel source and then build the modules as well as squashfs-tools with the supplied makefile

as you can see this process is rather complicated and i need guidance on how to best fit everything into a bitbake recipe as i'm not much into that.

thank you for your help!

josch



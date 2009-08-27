Received: from [209.85.221.196] (helo=mail-qy0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MgUeZ-0003AD-Vh
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 04:23:56 +0200
Received: by qyk34 with SMTP id 34so344820qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 19:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=hMDKBJTFSP5eKBiekYRK+EZLJrU3MeDh4h8G4pN4858=;
	b=VjSRCnzn/Df+aQft4Qy9zMRSlFfiWRs608iAA9r489P9GlwDgvr8WbSpX7a7iN4n5B
	WzeDefjgJahxUAqVRCfZzLrANTFVZBIcsSTF7TC+lYLtHIA28O7Un+ZA0Nkew7gm/oOY
	WtIKim+pOaOdxzp37iIyJEHY1D/YkQiKapuiQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	b=x3l1M7vX2bY/vuUIUfs9uQYjT6hqCV+u8gul3JjiNSzvA0Nwir9fukfUA09g76mffu
	OuTjclNpDiR75ytoUvJKE5ryTWfrD3PKGVSRmOcT1Gza51h66gEVyNhkfFnSqxvSZeL1
	QUbgkr5/Ju4MzniZOOHDlpw5jal7rxIsLb8ck=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.39.201 with SMTP id h9mr2694462qce.4.1251338753171; Wed, 
	26 Aug 2009 19:05:53 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 26 Aug 2009 19:05:33 -0700
X-Google-Sender-Auth: ee3ee16f18bc888f
Message-ID: <b6ebd0a50908261905r7d839647k6fc53460301efca0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: srctree & gitver
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
X-List-Received-Date: Thu, 27 Aug 2009 02:23:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'm going to summarize the features of the two classes I've created
over the past couple days.  I believe that they will make the lives of
app & kernel developers much easier when dealing with bitbake/OE/MVL6.

srctree facilitates bitbake builds in existing source trees, bypassing
the fetch/unpack/patch idiom.  It's easy to allow the user to put the
recipe in their source tree, if they want to store it in their scm
repository with their app/kernel code, or you can point the recipe at
external trees.  This works for app and kernel development.

gitver facilitates extraction of version information from git.  By
default, it runs 'git describe' to get the version.  If that fails, it
will set the version to 0.0-<sha1 hash>.  This version is stored in
the ${GITVER} variable, and can be used in the recipe's PV variable.
When using this, it will automatically detect changes to .git/HEAD
(i.e. commit your local changes, check out a different branch, ..) and
invalidate the bitbake cache, pick up the new PV, and know that it
needs to re-run the build steps.

Examples:
Common steps:

$ cd myproject
~/oe/projects/myproject
$ . ./setup.sh


Example of a user who wants bitbake to build their existing source
tree outside the project:
Userland:

$ cd myproject
~/oe/projects/myproject
$ . ./setup.sh
$ cat <<END >collections/custom/hello.bb
inherit srctree

# Pointing to the external source tree
S = "${HOME}/code/hello"
DESCRIPTION = "Hello, World"

do_install () {
   install -D -m 0755 hello ${D}${bindir}/hello
}
END
$ bitbake hello

Kernel:

$ cat <<END >collections/custom/linux.bb
inherit kernel srctree gitver

# Strip off the leading 'v' from the Linux kernel git tags
PV = "${@'${GITVER}'[1:]}"

# Point to my existing kernel development tree
S = "${HOME}/code/linux-2.6"
END
$ bitbake linux


Example of a user who wants their source tree to live in their project:
Userland:

$ mkdir collections/hello
$ cd collections/hello
~/oe/projects/myproject/collections/hello
$ cat <<END >hello.c
heredoc> #include <stdio.h>
heredoc>
heredoc> int main(int argc, char **argv)
heredoc> {
heredoc>     printf("Hello, World!\n");
heredoc> }
heredoc> END
$ cat <<END >Makefile
heredoc> all: hello
heredoc> hello: hello.c
heredoc>        \$(CC) \$(CFLAGS) \$(LDFLAGS) hello.c -o hello
heredoc> clean:
heredoc>        rm -f hello
heredoc> END
$ cat <<END >hello.bb
heredoc> inherit srctree
heredoc>
heredoc> DESCRIPTION = "Hello, World."
heredoc>
heredoc> do_install () {
heredoc>     install -D -m 0755 hello \${D}\${bindir}/hello
heredoc> }
heredoc> END
$ bitbake hello
NOTE: Handling BitBake files: \ (0010/0010) [100%%]
NOTE: Parsing finished. 0 cached, 10 parsed, 0 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 2 (ID: 1,
/home/clarson/oe/projects/myproject/collections/hello/hello.bb,
do_populate_staging)
NOTE: Running task 2 of 2 (ID: 0,
/home/clarson/oe/projects/myproject/collections/hello/hello.bb,
do_build)
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be
rerun and 0 failed.
$ ls
hello  hello.bb  hello.c  Makefile
$ ./hello
Hello, World!
$ bitbake -c clean hello
NOTE: Handling BitBake files: \ (0010/0010) [100%%]
NOTE: Parsing finished. 10 cached, 0 parsed, 0 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 1 (ID: 0,
/home/clarson/oe/projects/myproject/collections/hello/hello.bb,
do_clean)
NOTE: Removing stamps
NOTE: Removing /home/clarson/oe/projects/myproject/tmp/work/i486-linux/hello-1.0-r0
NOTE: Running make clean
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
rerun and 0 failed.
$ ls
hello.bb  hello.c  Makefile
$ sed -i -e 's,World,Country,' hello.c
$ bitbake hello
NOTE: Handling BitBake files: \ (0010/0010) [100%%]
NOTE: Parsing finished. 10 cached, 0 parsed, 0 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 2 (ID: 1,
/home/clarson/oe/projects/myproject/collections/hello/hello.bb,
do_populate_staging)
NOTE: Running task 2 of 2 (ID: 0,
/home/clarson/oe/projects/myproject/collections/hello/hello.bb,
do_build)
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be
rerun and 0 failed.
$ ./hello
Hello, Country!
$

Kernel:
$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
collections/linux-2.6
[... git output ...]
$ cat <<END >collections/linux-2.6/linux.bb
inherit kernel srctree gitver

# Strip off the leading 'v' from the Linux kernel git tags
PV = "${@'${GITVER}'[1:]}"
END
$ bitbake linux
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.



Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1JjxAS-0002E7-P9
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Apr 2008 15:50:21 +0200
Received: by nf-out-0910.google.com with SMTP id h3so2077115nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2008 06:50:14 -0700 (PDT)
Received: by 10.78.138.14 with SMTP id l14mr1592553hud.8.1207835414595;
	Thu, 10 Apr 2008 06:50:14 -0700 (PDT)
Received: by 10.78.160.9 with HTTP; Thu, 10 Apr 2008 06:50:14 -0700 (PDT)
Message-ID: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>
Date: Thu, 10 Apr 2008 15:50:14 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Apr 2008 13:50:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I'm going to try to build
svn://gcc.gnu.org/svn/gcc/branches/ubuntu/gcc-4_2-branch
Which is essentially a copy of gcc-4_2-branch with gcc/java, libjava,
zlib, libffi and boehm-gc merged from GCC trunk.

This includes a working GCJ for ARM EABI, which is what I'm interested in.

I'm not sure how I should go about this and if maybe one of you have
already tried something like this or have suggestions before I dive
in. I've already checked and all patches that are in OE for GCC 4.2.2
still apply.

I was thinking of calling my package 'gcc-4.2.3-ubuntu' does that make sense?

For now, I simply copied 4.2.2*.bb and 4.2.2*.inc files to 4.2.3-ubuntu files:
    gcc_4.2.3-ubuntu.bb
    gcc-cross_4.2.3-ubuntu.bb
    gcc-4.2.3-ubuntu.inc
    gcc-cross-sdk_4.2.3-ubuntu.bb
    gcc-cross-initial_4.2.3-ubuntu.bb
    gcc-4.2.3-ubuntu

and changed gcc-4.2.3-ubuntu.inc to point its SRC_URI to svn, S to the
correct dir and enabled JAVA by
JAVA_linux-gnueabi = ",java"

I'm running a build now (but that tends to take quite a while) and
I'll report back my findings. Any suggestions or general explanations
of how all these packages work together are more than welcome, because
I'm not really sure what I'm doing...

Regards,

Matthijs van de Water



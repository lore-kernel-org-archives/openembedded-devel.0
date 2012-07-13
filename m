Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SpboV-0005zH-Sk for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:05:27 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Spbdf-0003S6-3l for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:54:15 +0200
Received: from 188.207.89.201 ([188.207.89.201])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 10:54:15 +0200
Received: from koen by 188.207.89.201 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 10:54:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 13 Jul 2012 10:54:02 +0200
Message-ID: <jtonnb$ov3$1@dough.gmane.org>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
	<1342168240-7760-8-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 188.207.89.201
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <1342168240-7760-8-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-oe, V2 07/32] task-basic: move systemd support to meta systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 09:05:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-07-12 10:30, Andreas Müller schreef:
> 
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> --- 
> meta-oe/recipes-core/tasks/task-basic.bb           |    7 +++---- 
> .../meta-oe/recipes-core/tasks/task-basic.bbappend |    6 ++++++ 2 files
> changed, 9 insertions(+), 4 deletions(-) create mode 100644
> meta-systemd/meta-oe/recipes-core/tasks/task-basic.bbappend
> 
> diff --git a/meta-oe/recipes-core/tasks/task-basic.bb
> b/meta-oe/recipes-core/tasks/task-basic.bb index d4a0bd9..47b09de 100644 
> --- a/meta-oe/recipes-core/tasks/task-basic.bb +++
> b/meta-oe/recipes-core/tasks/task-basic.bb @@ -5,7 +5,7 @@ DESCRIPTION =
> "Basic task to get a device online" LICENSE = "MIT" LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
> 
> -PR = "r8" +PR = "r9"
> 
> inherit task
> 
> @@ -21,7 +21,7 @@ MACHINE_EXTRA_RRECOMMENDS ?= "" # Select between
> dropbear and openssh # Set TASK_BASIC_SSHDAEMON = "openssh-sshd
> openssh-sftp openssh-sftp-server" in your DISTRO config to get
> openssh(d) # -TASK_BASIC_SSHDAEMON ?= "dropbear-systemd openssh-sftp
> openssh-sftp-server" +TASK_BASIC_SSHDAEMON ?= "dropbear openssh-sftp
> openssh-sftp-server"

If I understand this patchset correctly:

* systemd.bbclass automagically adds ${PN}-systemd to RRECOMMENDS_${PN}
* dropbear bbappend moves to meta-systemd
* everything gets a PR bump

So task-basic can safely drop *-systemd.

Is that understanding correct?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFP/+IqMkyGM64RGpERAqQMAKCEaghQ1/6fTFqACChwIZKJae+slQCfdYHc
4HJHSKjK7VVTabOy2/Pv8OQ=
=qrFN
-----END PGP SIGNATURE-----




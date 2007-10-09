Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded-devel@lists.futaris.org>)
	id 1If3CK-0004dG-4n for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2007 02:43:44 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 9906630999
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2007 20:37:59 -0400 (EDT)
Received: from web7.messagingengine.com ([10.202.2.216])
	by compute1.internal (MEProxy); Mon, 08 Oct 2007 20:37:59 -0400
Received: by web7.messagingengine.com (Postfix, from userid 99)
	id 6AA68220FC; Mon,  8 Oct 2007 20:37:59 -0400 (EDT)
Message-Id: <1191890279.1583.1214831015@webmail.messagingengine.com>
X-Sasl-Enc: RQnBI7dHeavx+hH0XaktmGiLcC71vPoPsMfZu+ibibjv 1191890279
From: "Hasjim Williams" <openembedded-devel@lists.futaris.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
References: <f7kde4$rum$1@sea.gmane.org>
In-Reply-To: <f7kde4$rum$1@sea.gmane.org>
Date: Tue, 09 Oct 2007 10:37:59 +1000
Subject: Re: Packaging problem.
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
X-List-Received-Date: Tue, 09 Oct 2007 00:43:44 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"

Hi all,

I'm still having problems building an image using interactive mode.  Has
anyone looked at the bug below since July???

As mentioned before, images build fine using bitbake from the command
line, but not using "bitbake -i" ...  Does anyone else using interactive
mode to build images ???

Thanks

Hasjim

On Wed, 18 Jul 2007 14:54:07 +0800, "Rob Kramer" <robk@starhub.net.sg>
said:
> Hi all,
> 
> 
> I have a problem with my homebrew image, in that it doesn't create
> several
> packages, which results in dependency failures in do_rootfs. I'm using
> bitbake 1.8 svn head.
> 
> -------------
> BB>> build vides-image
> SHELL: Building vides-image
> 
> <big snip>
> 
> | log_check:
> Using
> /bulk/home/rob/oe/dev/build-epia/tmp/work/vides-image-1.0-r0/temp/log.do_rootfs.4203
> as logfile
> | log_check: There were error messages in the logfile
> | log_check: Matched keyword: [ERR]
> |
> | Successfully terminated.
> | Collected errors:
> | ERROR: Cannot satisfy the following dependencies for task-base:
> |        base-passwd update-rc.d initscripts modutils-initscripts netbase
> update-alternatives update-rc.d update-rc.d tinylogin update-rc.d
> sysfsutils module-init-tools acpid keymaps hdparm e2fsprogs
> | ERROR: Cannot satisfy the following dependencies for task-vides-linux:
> |        base-passwd initscripts netbase sysfsutils setserial tinylogin
> modutils-initscripts rsync
> | ERROR: Cannot satisfy the following dependencies for task-vides-base:
> |        aumix bash update-rc.d ethtool rsync bzip2
> -------------
> 
> On further investigation I found out that bitbake doesn't create ipk
> packages for these missing deps. Let's take base-passwd; during
> do_package,
> there's a problem:
> 
> -------------
> NOTE: the following files were installed but not shipped in any package:
> NOTE:   /usr/share/man/pl/man8/update-passwd.8.gz
> NOTE:   /usr/share/man/man8/update-passwd.8.gz
> NOTE:   /usr/share/base-passwd/passwd.master
> NOTE:   /usr/share/base-passwd/group.master
> NOTE:   /usr/sbin/update-passwd
> NOTE:   /usr/sbin/.debug/update-passwd
> <snip>
> NOTE: Not creating empty archive for base-passwd-3.5.9-r2
> -------------
> 
> I added a debug statement to see what it is trying to package:
> 
> -------------
> package.bbclass:404
> 
>                 filesvar = bb.data.getVar('FILES', localdata, 1) or ""
>                 files = filesvar.split()
> +               bb.note("ROB: pkg: '%s', files: '%s'" % (pkg, filesvar))
>                 cleandirs = []
> -------------
> 
> The interesting thing is that in bitbake file-mode everything works, but
> in
> interactive mode it fails (I cleaned before each command):
> 
> -------------
> [wrobbie] ~/oe/dev/build-epia> bitbake -cpackage -b
> ~/oe/dev/org.openembedded.dev/packages/base-passwd/base-passwd_3.5.9.bb
> NOTE: package base-passwd-3.5.9: started
> <snip>
> NOTE: package base-passwd-3.5.9-r2: task do_install: started
> NOTE: package base-passwd-3.5.9-r2: task do_install: completed
> NOTE: package base-passwd-3.5.9-r2: task do_package: started
> NOTE: ROB: pkg: 'base-passwd-dbg',
> files: '/usr/bin/.debug /usr/sbin/.debug /usr/libexec/.debug
> /usr/lib/.debug /bin/.debug /sbin/.debug /lib/.debug
> /usr/lib/base-passwd/.debug /usr/lib/matchbox-panel/.debug'
> NOTE: ROB: pkg: 'base-passwd',
> files: '/usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so.* /etc
> /usr/com /var /bin/* /sbin/* /lib/*.so* /usr/share/base-passwd
> /usr/lib/base-passwd/* /usr/share/pixmaps /usr/share/applications
> /usr/share/idl /usr/share/omf /usr/share/sounds /usr/lib/bonobo/servers'
> -------------
> 
> 
> -------------
> BB>> build base-passwd
> SHELL: This command needs to parse bbfiles...
> NOTE: Handling BitBake files: \ (3891/3891) [100 %]
> NOTE: Parsing finished. 3680 cached, 0 parsed, 211 skipped, 783 masked.
> 
> SHELL: Building base-passwd
> NOTE: Resolving missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 218 of 229 (ID:
> 9,
> /home/rob/oe/dev/org.openembedded.dev/packages/base-passwd/base-passwd_3.5.9.bb,
> do_fetch)
> 
> <snip>
> 
> NOTE: Running task 225 of 229 (ID:
> 1,
> /home/rob/oe/dev/org.openembedded.dev/packages/base-passwd/base-passwd_3.5.9.bb,
> do_install)
> NOTE: package base-passwd-3.5.9: started
> NOTE: package base-passwd-3.5.9-r2: task do_install: started
> NOTE: package base-passwd-3.5.9-r2: task do_install: completed
> NOTE: package base-passwd-3.5.9: completed
> NOTE: Running task 226 of 229 (ID:
> 5,
> /home/rob/oe/dev/org.openembedded.dev/packages/base-passwd/base-passwd_3.5.9.bb,
> do_package)
> NOTE: package base-passwd-3.5.9: started
> NOTE: package base-passwd-3.5.9-r2: task do_package: started
> NOTE: ROB: pkg: 'base-passwd-dbg', files: ''
> NOTE: ROB: pkg: 'base-passwd', files: ''
> NOTE: ROB: pkg: 'base-passwd-doc', files: ' /usr/share/doc'
> NOTE: ROB: pkg: 'base-passwd-dev', files: ''
> NOTE: ROB: pkg: 'base-passwd-locale', files: ''
> NOTE: the following files were installed but not shipped in any package:
> NOTE:   /usr/share/man/pl/man8/update-passwd.8.gz
> NOTE:   /usr/share/man/man8/update-passwd.8.gz
> NOTE:   /usr/share/base-passwd/passwd.master
> NOTE:   /usr/share/base-passwd/group.master
> NOTE:   /usr/sbin/update-passwd
> NOTE:   /usr/sbin/.debug/update-passwd
> NOTE: package base-passwd-3.5.9-r2: task do_package: completed
> NOTE: package base-passwd-3.5.9: completed
> NOTE: Running task 227 of 229 (ID:
> 7,
> /home/rob/oe/dev/org.openembedded.dev/packages/base-passwd/base-passwd_3.5.9.bb,
> do_package_write)
> NOTE: package base-passwd-3.5.9: started
> NOTE: package base-passwd-3.5.9-r2: task do_package_write: started
> NOTE: Not creating empty archive for base-passwd-dbg-3.5.9-r2
> NOTE: Not creating empty archive for base-passwd-3.5.9-r2
> Packaged contents of base-passwd-doc
> into
> /bulk/home/rob/oe/dev/build-epia/tmp/deploy/ipk/i586/base-passwd-doc_3.5.9-r2_i586.ipk
> NOTE: Not creating empty archive for base-passwd-dev-3.5.9-r2
> NOTE: Not creating empty archive for base-passwd-locale-3.5.9-r2
> NOTE: package base-passwd-3.5.9-r2: task do_package_write: completed
> NOTE: package base-passwd-3.5.9: completed
> -------------
> 
> 
> So, it seems the FILES variable in package.bbclass:404 is not set
> properly
> in the case of interactive mode. I can't find where FILES is set anyway;
> the rest of the class uses FILES_${PN}.
> 
> Any hints at what I should be looking at?
> 
> Cheers!
> 
>     Rob
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



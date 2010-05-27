Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OHfQI-000226-BL
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 17:55:06 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4RFooXB008670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 27 May 2010 17:50:50 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OHfM9-0000xc-KS; Thu, 27 May 2010 17:50:49 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <AANLkTin5ULxoMD23AleqaBLBxR8zinSd8OfO8NgpKvTn@mail.gmail.com>
Date: Thu, 27 May 2010 17:50:49 +0200
In-Reply-To: <AANLkTin5ULxoMD23AleqaBLBxR8zinSd8OfO8NgpKvTn@mail.gmail.com>
	(Raffaele Recalcati's message of "Wed, 26 May 2010 08:34:07 +0200")
Message-ID: <lyvda9gx7q.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: developmet setup
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
X-List-Received-Date: Thu, 27 May 2010 15:55:07 -0000
Content-Type: text/plain; charset=us-ascii

Raffaele Recalcati <lamiaposta71@gmail.com> writes:

> I was searching a clean way to develop in OE my new kernel and my new
> applications.

I wrote a recipe[1] which generates a special 'Makefile'[2].  It can be
used for developing an application in a way like

| $ make -C ~/src/my-app -f <workspace>/Makefile.ipan7 all
| $ make -f <workspace>/Makefile.ipan7 shell

and sets all the crosscompiler information.  There exist some extensions
for U-Boot[3] or common tasks like pkg-installation in NFS
rootfilesystems[4]. Sample commands are

| $ make -C ~/src/u-boot -f <workspace>/Makefile.ipan7 CFG=u-boot

or 

| $ make -f <workspace>/Makefile.ipan7 CFG=pkg pkg-install P=busybox
| $ make -f <workspace>/Makefile.ipan7 CFG=pkg pkg-upgrade


We started with a variation for the kernel which was placed into a
kernel recipe[5] and generates a more simple makefile[6]. It should be
probably ported to the previous, more modern method but it works and
I do not have time for it :(


Our development model is to work on NFS rootfs where applications are
installed on by the methods above. There are OE recipes for these apps
which fetch either from git repositories or fetch normal tarballs of
these apps.



Enrico

Footnotes: 
[1]  https://www.cvg.de/people/ensc/oe/elito-develcomp.bb
[2]  https://www.cvg.de/people/ensc/oe/Makefile.ipan7
[3]  https://www.cvg.de/people/ensc/oe/u-boot.mk
[4]  https://www.cvg.de/people/ensc/oe/pkg.mk
[5]  https://www.cvg.de/people/ensc/oe/elito-kernel.inc
[6]  https://www.cvg.de/people/ensc/oe/Makefile.kernel.ipan7



Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1O0F6e-0007Uk-JF
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 16:22:49 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o39EJNPo004956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Apr 2010 16:19:24 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>) id 1O0F3L-0002eV-6D
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 16:19:23 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1269730499.4033.176.camel@mattotaupa>
	<hon5i2$8iq$1@dough.gmane.org> <1269797481.8018.80.camel@mattotaupa>
	<hooat6$p3d$1@dough.gmane.org> <1269949824.4103.38.camel@mattotaupa>
Date: Fri, 09 Apr 2010 16:19:23 +0200
In-Reply-To: <1269949824.4103.38.camel@mattotaupa> (Paul Menzel's message of
	"Tue, 30 Mar 2010 13:50:24 +0200")
Message-ID: <ly6340yahg.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] autotool.bbclass: Remove `EXTRA_AUTORECONF = "--exclude=autopoint"`.
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
X-List-Received-Date: Fri, 09 Apr 2010 14:22:49 -0000
Content-Type: text/plain; charset=us-ascii

Paul Menzel <paulepanter@users.sourceforge.net> writes:

> I ran a build from scratch with `EXTRA_AUTORECONF = "--exclude=autopoint"`
> from `autotools.bbclass` and did not see any regressions.

There are regressions in projects using 'intltool' (e.g. 'pmount');
./configure will fail with 'po/Makefile.in.in was not created by
intltoolize' there.

A solution might be the swapping of 'intltoolize' + 'autoreconf' calls
in autotools.bbclass.  I did not extensive tests yet but this swapping
might be (independent from '--exclude=autopoint' removal) a good idea
because 'intltoolize' checks for 'intltool.m4' version information in
'aclocal.m4' which are added by 'autoreconf'.



Enrico



Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1NrWMI-00060h-W4
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 13:58:56 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.3) with ESMTP id o2GCtmMv005362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 13:55:48 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.69) (envelope-from <ensc@sigma-chemnitz.de>) id 1NrWJI-00034v-9I
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 13:55:48 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1268739774-10002-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1268741432.3701.32.camel@mattotaupa>
Date: Tue, 16 Mar 2010 13:55:48 +0100
In-Reply-To: <1268741432.3701.32.camel@mattotaupa> (Paul Menzel's message of
	"Tue, 16 Mar 2010 13:10:32 +0100")
Message-ID: <ly4okgl92j.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] autotools.bbclass: enhanced oe_runconf() to accept quoted arguments
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
X-List-Received-Date: Tue, 16 Mar 2010 12:58:56 -0000
Content-Type: text/plain; charset=us-ascii

Paul Menzel <paulepanter@users.sourceforge.net> writes:

>> This patch allows to pass quoted strings in EXTRA_OECONF.  E.g. with
>> this patch, it is possible to do
>> 
>> | EXTRA_OECONF = "--with-build-cflags='${BUILD_CFLAGS}'"
>> 
>> where 'BUILD_CFLAGS' contains multiple, whitespace separated arguments.
> ...
> Why did not it work before?

It was not used because it was not possible.  E.g. 'ncurses' accepts a
'--with-build-cflags' ./configure argument but recipe does not use it
but sets

| EXTRA_OEMAKE = '"BUILD_LDFLAGS=" "BUILD_CCFLAGS=${BUILD_CCFLAGS}"'

instead of (which is properly quoted by oe_runmake).


Doing the same with EXTRA_OECONF would result and expand to something
like

   | EXTRA_OECONF = "--with-build-cflags='${BUILD_CFLAGS}'"
-> | EXTRA_OECONF = "--with-build-cflags='-i/... -O2 -g3 ...'"
-> | cfgcmd=".../configure --with-build-cflags='-i/... -O2 -g3 ...'"
-> | $cfgcmd

This does not give the wanted result...  


E.g. the shorter

| cfgcmd="strace -eexecve true --with='a b c'"

does (the wrong)

| $cfgcmd 
| execve("/bin/true", ["true", "--with='a", "b", "c'"], [/* 60 vars */]) = 0



With my patch, you would get from

| set -- strace -eexecve true --with='a b c'

the expected

| $ "$@"
| execve("/bin/true", ["true", "--with=a b c"], [/* 60 vars */]) = 0



Enrico



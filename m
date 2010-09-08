Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OtKKg-0007Al-LR
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 15:05:04 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o88D472q026303
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Sep 2010 15:04:10 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>) id 1OtKJq-0007lL-Je
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 15:04:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <4C874458.3060101@nedap.com>
Date: Wed, 08 Sep 2010 15:04:06 +0200
In-Reply-To: <4C874458.3060101@nedap.com> (Jaap de Jong's message of "Wed, 08
	Sep 2010 10:07:52 +0200")
Message-ID: <lytym0e69l.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cmake-native trouble making
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
X-List-Received-Date: Wed, 08 Sep 2010 13:05:05 -0000
Content-Type: text/plain; charset=us-ascii

Jaap de Jong <jaap.dejong@nedap.com> writes:

> $ bitbake cmake-native
> ////
> | [ 87%] Building CXX object
> Source/CMakeFiles/CPackLib.dir/CPack/cmCPackNSISGenerator.o
> | /usr/bin/ld: cannot find -ltinfo
> | collect2: ld returned 1 exit status
> | make[2]: *** [bin/ccmake] Error 1
> | make[1]: *** [Source/CMakeFiles/ccmake.dir/all] Error 2
> | make[1]: *** Waiting for unfinished jobs....
> ////
>
> Is cmake-native_2.8.2.bb missing this line:
>
>     RDEPENDS = "ncurses-terminfo"

no, 'DEPENDS = "ncurses-native"'; BUT:

* it will cause problems on (host)distributions which do not have libtinfo
  (e.g. RHEL5) and have ncurses-native in their ASSUME_PROVIDED

* some hours ago I added a libtermcap.so compatibility symlink to
  ncurses(-native) so that 5ea3047995421d99f7f3537cb8f9ae23f3185a9f
  might not be needed anymore

* build of the curses frontend should be disabled for cmake-native because
  we do automated builds only; I do not know atm how to configure cmake
  for this...


Enrico



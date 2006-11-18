Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GlSt2-0006oS-0n
	for openembedded-devel@openembedded.org; Sat, 18 Nov 2006 17:17:48 +0100
Received: (qmail 28723 invoked by uid 813007); 18 Nov 2006 16:15:19 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 18 Nov 2006 16:15:18 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Nov 2006 17:15:35 +0100
User-Agent: KMail/1.9.5
References: <31406A3C-DA2A-420F-8DDC-D57F0B6FC345@inf.fu-berlin.de>
In-Reply-To: <31406A3C-DA2A-420F-8DDC-D57F0B6FC345@inf.fu-berlin.de>
MIME-Version: 1.0
Message-Id: <200611181715.36451.openembedded@hrw.one.pl>
Subject: Re: I need your number(s), BitBake/OE parsing speed
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
X-List-Received-Date: Sat, 18 Nov 2006 16:17:48 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia sobota, 18 listopada 2006 11:52, Holger Freyther napisa=C5=82:

> 1.) time bitbake -p opie-image   and do that three times and save the
> numbers

15:30 hrw@home:umbaumba$  for f in `seq 1 3`;do touch conf/local.conf;=20
time bitbake -p opie-image;done
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 0 cached, 3885 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    6m2.803s
user    5m9.364s
sys     0m9.919s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 0 cached, 3885 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    5m55.859s
user    5m2.017s
sys     0m9.308s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.=20
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 0 cached, 3885 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    5m42.314s
user    5m1.642s
sys     0m9.346s


> 2.) apply the oe_less_anon.patch to OpenEmbedded
> 3.) time bitbake -p opie-image and do that three times and save the
> numbers

15:48 hrw@home:umbaumba$  for f in `seq 1 3`;do touch conf/local.conf;=20
time bitbake -p opie-image;done
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it=20
to increase performance.
NOTE: Handling BitBake files: \ (4043/4043) [100 %][[D
NOTE: Parsing finished. 0 cached, 3885 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    5m39.058s
user    4m47.243s
sys     0m9.186s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it=20
to increase performance.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 0 cached, 3885 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    5m34.047s
user    4m46.000s
sys     0m8.915s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it=20
to increase performance.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 0 cached, 3885 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    5m40.806s
user    4m45.463s
sys     0m8.957s
16:12 hrw@home:umbaumba$

> 4.) apply the BitBake patch (it should apply to 1.6 as well)
> 5.) time bitbake -p opie-image and do that three times and save the
> numbers

16:57 hrw@home:umbaumba$  for f in `seq 1 3`;do touch conf/local.conf;=20
time bitbake -p opie-image;done
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it=20
to increase performance.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 0 cached, 3885 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    6m19.770s
user    4m38.340s
sys     0m9.419s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it=20
to increase performance.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 0 cached, 3885 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    5m15.508s
user    4m36.294s
sys     0m8.546s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it=20
to increase performance.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 0 cached, 3885 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    5m40.875s
user    4m37.985s
sys     0m8.901s
17:14 hrw@home:umbaumba$


=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

    42? 7 and a half million years and all you can come up with is 42?!





Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GlQkL-0003yM-Oo
	for openembedded-devel@openembedded.org; Sat, 18 Nov 2006 15:00:49 +0100
Received: (qmail 13840 invoked by uid 813007); 18 Nov 2006 13:58:11 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 18 Nov 2006 13:58:10 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Nov 2006 14:58:17 +0100
User-Agent: KMail/1.9.5
References: <31406A3C-DA2A-420F-8DDC-D57F0B6FC345@inf.fu-berlin.de>
In-Reply-To: <31406A3C-DA2A-420F-8DDC-D57F0B6FC345@inf.fu-berlin.de>
MIME-Version: 1.0
Message-Id: <200611181458.18269.openembedded@hrw.one.pl>
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
X-List-Received-Date: Sat, 18 Nov 2006 14:00:51 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 18 listopada 2006 11:52, Holger Freyther napisa=C5=82:

Athlon64 3200+ 64bit:

> 1.) time bitbake -p opie-image   and do that three times and save the
> numbers

14:37 hrw@home:umbaumba$ for f in `seq 1 3`;do time bitbake -p=20
opie-image;done
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 3885 cached, 0 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    0m11.991s
user    0m9.832s
sys     0m0.553s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 3885 cached, 0 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    0m12.177s
user    0m9.797s
sys     0m0.577s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 3885 cached, 0 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    0m11.711s
user    0m9.707s
sys     0m0.582s


> 2.) apply the oe_less_anon.patch to OpenEmbedded

and copy glib-2.0.inc into packages/glib-2.0/

> 3.) time bitbake -p opie-image and do that three times and save the
> numbers

14:51 hrw@home:umbaumba$  for f in `seq 1 3`;do time bitbake -p=20
opie-image;done
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 3870 cached, 15 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    0m12.251s
user    0m10.686s
sys     0m0.566s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 3885 cached, 0 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    0m11.041s
user    0m9.583s
sys     0m0.538s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 3885 cached, 0 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    0m11.208s
user    0m9.640s
sys     0m0.585s
14:54 hrw@home:umbaumba$=20


> 4.) apply the BitBake patch (it should apply to 1.6 as well)

> 5.) time bitbake -p opie-image and do that three times and save the
> numbers

14:54 hrw@home:umbaumba$  for f in `seq 1 3`;do time bitbake -p=20
opie-image;done
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 3885 cached, 0 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    0m11.052s
user    0m9.561s
sys     0m0.521s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 3885 cached, 0 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    0m10.978s
user    0m9.483s
sys     0m0.550s
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available.=20
NOTE: Handling BitBake files: \ (4043/4043) [100 %]
NOTE: Parsing finished. 3885 cached, 0 parsed, 158 skipped, 0 masked.

NOTE: Requested parsing .bb files only.  Exiting.

real    0m11.020s
user    0m9.505s
sys     0m0.571s
14:56 hrw@home:umbaumba$


> 6.) send me either a postcard with the numbers on it, or use email to
> transport the numbers

This time I choose email.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

       I'm broken. Please show this to someone who can fix me [TeX]





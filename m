Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pr5If-0008Si-Rt
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 10:09:53 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de (recycler-gw.in-dsl.de
	[217.197.85.167]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1K98bd2005239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 20 Feb 2011 10:08:37 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 048EB23926;
	Sun, 20 Feb 2011 10:08:35 +0100 (CET)
Message-ID: <4D60DA13.5070806@dresearch.de>
Date: Sun, 20 Feb 2011 10:08:35 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298049536.11289.3126.camel@rex>
In-Reply-To: <1298049536.11289.3126.camel@rex>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p1K98bd2005239
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake 1.12.0 released! - ImportError: No module named ply
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
X-List-Received-Date: Sun, 20 Feb 2011 09:09:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Trying bitbake 1.12.0 together with the testscript from contrib results i=
n an error for me (openSUSE 11.3 32bit, bitbake 1.10.2 works fine):

sledz@mobil-400-586:~/tmp/xy> MACHINE=3Dhipox TARGET_RECIPE=3Dminimal-ima=
ge DISTRO=3Dangstrom-2008.1 TESTING_BRANCH=3Dtesting-release-2011.03 BB_M=
IN_VERSION=3D1.12.0 ~/work/openembedded/contrib/testing/testscript.sh
Branch testing-release-2011.03 set up to track remote branch testing-rele=
ase-2011.03 from origin.
Already on 'testing-release-2011.03'
Already up-to-date.
hipox angstrom-2008.1 minimal-image testing-release-2011.03 72a088f7e1cf2=
eb0b50f285301478278c616c1cd
Traceback (most recent call last):
  File "/home/sledz/tmp/xy/bitbake-1.12.0/bin/bitbake", line 35, in <modu=
le>
    import bb
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/__init__.py", line 138, =
in <module>
    deprecate_import(__name__, "bb.fetch", ("MalformedUrl", "encodeurl", =
"decodeurl"))
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/__init__.py", line 126, =
in deprecate_import
    module =3D __import__(modulename, fromlist =3D fromlist)
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/fetch/__init__.py", line=
 32, in <module>
    from   bb import data
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/data.py", line 48, in <m=
odule>
    from bb import data_smart
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/data_smart.py", line 34,=
 in <module>
    import bb, bb.codeparser
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/codeparser.py", line 7, =
in <module>
    from pysh import pyshyacc, pyshlex
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/pysh/pyshyacc.py", line =
13, in <module>
    import pyshlex
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/pysh/pyshlex.py", line 2=
2, in <module>
    from ply import lex
ImportError: No module named ply
/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/event.py:87: RuntimeWarning: Par=
ent module 'bb' not found while handling absolute import
  from bb.msg import BBLogFormatter
Error in atexit._run_exitfuncs:
Traceback (most recent call last):
  File "/usr/lib/python2.6/atexit.py", line 24, in _run_exitfuncs
    func(*targs, **kargs)
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/event.py", line 87, in p=
rint_ui_queue
    from bb.msg import BBLogFormatter
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/__init__.py", line 138, =
in <module>
    deprecate_import(__name__, "bb.fetch", ("MalformedUrl", "encodeurl", =
"decodeurl"))
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/__init__.py", line 126, =
in deprecate_import
    module =3D __import__(modulename, fromlist =3D fromlist)
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/fetch/__init__.py", line=
 32, in <module>
    from   bb import data
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/data.py", line 48, in <m=
odule>
    from bb import data_smart
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/data_smart.py", line 34,=
 in <module>
    import bb, bb.codeparser
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/codeparser.py", line 7, =
in <module>
    from pysh import pyshyacc, pyshlex
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/pysh/pyshyacc.py", line =
13, in <module>
    import pyshlex
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/pysh/pyshlex.py", line 2=
2, in <module>
    from ply import lex
ImportError: No module named ply
Error in sys.exitfunc:
Traceback (most recent call last):
  File "/usr/lib/python2.6/atexit.py", line 24, in _run_exitfuncs
    func(*targs, **kargs)
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/event.py", line 87, in p=
rint_ui_queue
    from bb.msg import BBLogFormatter
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/__init__.py", line 138, =
in <module>
    deprecate_import(__name__, "bb.fetch", ("MalformedUrl", "encodeurl", =
"decodeurl"))
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/__init__.py", line 126, =
in deprecate_import
    module =3D __import__(modulename, fromlist =3D fromlist)
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/fetch/__init__.py", line=
 32, in <module>
    from   bb import data
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/data.py", line 48, in <m=
odule>
    from bb import data_smart
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/data_smart.py", line 34,=
 in <module>
    import bb, bb.codeparser
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/codeparser.py", line 7, =
in <module>
    from pysh import pyshyacc, pyshlex
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/pysh/pyshyacc.py", line =
13, in <module>
    import pyshlex
  File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/pysh/pyshlex.py", line 2=
2, in <module>
    from ply import lex
ImportError: No module named ply

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058





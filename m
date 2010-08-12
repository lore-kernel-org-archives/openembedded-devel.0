Received: from router.evertz.com ([204.187.63.106] helo=mail.evertz.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rlott@evertz.com>) id 1OjfN6-0002mU-A4
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 23:31:34 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 12 Aug 2010 17:29:44 -0400
Message-ID: <13B290A06827324E9ADB71AA314F8189231070@otis.burlington.evertz.tv>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: python-dir.bbclass question when using multiple versions of
	Python.
Thread-Index: Acs6ZXr4IoZAwRbPSjSqb350Lpr4Fw==
From: "Rodney Lott" <rlott@evertz.com>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 204.187.63.106
X-SA-Exim-Mail-From: rlott@evertz.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: python-dir.bbclass question when using multiple versions of Python.
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
X-List-Received-Date: Thu, 12 Aug 2010 21:31:34 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, there.

I am looking at the latest revision from org.openembedded.dev:=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
rlott@rlott-desktop:~/git/oe/oe-meta/classes$ git log -1
commit ad112ee1ce53dfaf3fa2d7a10a79f724c8dd6335
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Thu Aug 12 22:28:35 2010 +0200

    task-shr-feed: add supertux-qvga wesnoth
   =20
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
rlott@rlott-desktop:~/git/oe/oe-meta/classes$ git br
  master
* org.openembedded.dev
  org.openembedded.stable
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I am looking at the classes/python-dir.bbclass function:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
def python_dir(d):
    import os, bb
    staging_incdir =3D bb.data.getVar( "STAGING_INCDIR", d, 1 )
    for majmin in "2.6 2.5 2.4 2.3".split():
        if os.path.exists( "%s/python%s" % ( staging_incdir, majmin ) ): =
return "python%s" % majmin
    if not "python-native" in bb.data.getVar( "DEPENDS", d, 1 ).split():
        raise Exception("No Python in STAGING_INCDIR. Forgot to build =
python-native?")
    return "INVALID"

PYTHON_DIR =3D "${@python_dir(d)}"
PYTHON_SITEPACKAGES_DIR =3D "${libdir}/${PYTHON_DIR}/site-packages"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Now, if I am reading this correctly, it would seem that the logic of =
this function is as follows, "Look for python directories in =
STAGING_INCDIR, starting from 2.6 downward, and use the first one I =
find."

This works if one is only using one version of Python.  Let's say one is =
using Python 2.5 and Python 2.6 (i.e. for two different applications) =
and I am in the process of building something that I need to work with =
Python 2.6, it will set PYTHON_DIR to point to =
/usr/lib/python2.6/site-packages, which isn't what I want.

So, my question is this:  Is it OE's assumption that one is only to use =
a single version of Python within one build (i.e. one tmp directory), or =
should it work with multiple Pythons per temp directory?  If it is the =
later, then it would seem to me that using STAGING_INCDIR to determine =
the Python version isn't a good idea and that the Python version one is =
using should be derived (somehow) from the PREFERRED_VERSION_python and =
PREFERRED_VERSION_python-native settings. =20

Just an observation and I would like to know which paradigm is the =
correct one.

TIA.

Rodney Lott


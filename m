Received: from [129.104.30.34] (helo=mx1.polytechnique.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gregoire@gentil.com>) id 1Krz4H-0002VZ-TR
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 20:01:25 +0200
Received: from [192.168.0.2] (adsl-71-135-119-175.dsl.pltn13.pacbell.net
	[71.135.119.175])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.polytechnique.org (Postfix) with ESMTP id 69C143316C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 20:01:06 +0200 (CEST)
From: Gregoire Gentil <gregoire@gentil.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <mailman.87260.1224514145.11663.openembedded-devel@lists.openembedded.org>
References: <mailman.87260.1224514145.11663.openembedded-devel@lists.openembedded.org>
Organization: Gregoire Gentil
Date: Mon, 20 Oct 2008 11:00:50 -0700
Message-Id: <1224525650.9626.62.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1 
X-AV-Checked: ClamAV using ClamSMTP at djali.polytechnique.org (Mon Oct 20
	20:01:07 2008 +0200 (CEST))
X-Spam-Flag: No, tests=bogofilter, spamicity=0.001375, queueID=1454733171
X-Org-Mail: gregoire.gentil.1992@polytechnique.org
Subject: Firefox do_stage for gecko-mediaplayer package
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
X-List-Received-Date: Mon, 20 Oct 2008 18:01:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to create a recipe for gecko-mediaplayer which is a Firefox
plugin.

The recipe (http://pastebin.com/m5cd4d6ec) fails
(http://pastebin.com/m5a2c6a16) because firefox-plugin has not been
exported in the staging area:

configure: WARNING: firefox-plugin not found, trying another
checking for GECKO... no
...
checking for xpidl... no
configure: error: xpidl compiler not found


From my investigations in the gecko-mediaplayer configure and hte
compilation logs, it seems that we are missing:

- firefox-plugin.pc and firefox-xpcom.pc
(take a look at the gecko-mediaplayer configure:
GECKO_HOME=3D`$PKG_CONFIG --variable=3Dlibdir firefox-plugin`
GECKO_IDLDIR=3D`$PKG_CONFIG --variable=3Didldir firefox-xpcom`)

- some headers
=EF=BB=BFxpcom/base/*.idl
nsprpub/pr/include/*.h

- the xpidl program (host binary)


I copy the original Firefox-3.0.1 staging function for reference:

do_stage() {
        install -d ${STAGING_INCDIR}/firefox-${PV}
        cd dist/sdk/include
		rm -rf obsolete
        headers=3D`find . -name "*.h"`
        for f in $headers
        do
                install -D -m 0644 $f ${STAGING_INCDIR}/firefox-${PV}/
        done
        # removes 2 lines that call absent headers
        sed -e '178,179d'
${STAGING_INCDIR}/firefox-${PV}/nsIServiceManager.h
}



I suggest the following:
- remove the "rm -rf obsolete" as this folder contains important files
needed during the gecko-mediaplayer compilation
- add:

=EF=BB=BF        cd ../../../=EF=BB=BFnsprpub/pr/include
        headers=3D`find . -name "*.h"`
        for f in $headers
        do
                install -D -m 0644 $f ${STAGING_INCDIR}/firefox-${PV}/
        done
=EF=BB=BF=EF=BB=BF        cd ../../../=EF=BB=BF=EF=BB=BF=EF=BB=BFxpcom/ba=
se
        headers=3D`find . -name "*.idl"`
        for f in $headers
        do
                install -D -m 0644 $f ${STAGING_INCDIR}/firefox-${PV}/
        done


Now, I still have a couple of problems:
- First, xpidl should be copied
to =EF=BB=BF/OE/build/tmp/staging/i686-linux/usr/bin but it should be a h=
ost
binary. It's run at the last line of the configure to create a header
file. The one I found here:
tmp/work/armv7a-angstrom-linux-gnueabi/firefox-3.0.1-r7.1/mozilla/xpcom/t=
ypelib/xpidl/xpidl seems to be an ARM binary so I'm confused. How should =
I handle this situation?

- Secondly, how do I create those =EF=BB=BFfirefox-plugin.pc and
firefox-xpcom.pc so that it can be found by the gecko-mediaplayer
configure?

Perhaps, I'm not taking the problem on the right end. Any advice, code
or help would be appreciated. Thanks in advance,

Gr=C3=A9goire







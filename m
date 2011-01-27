Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PiZKc-0001Er-9l
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 22:24:42 +0100
Received: (qmail invoked by alias); 27 Jan 2011 21:23:53 -0000
Received: from p4FE0FAF7.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.224.250.247]
	by mail.gmx.net (mp011) with SMTP; 27 Jan 2011 22:23:53 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18jHvpjHFgjtkTgpGYCkIrUqDm4Fc/wg8fWtd/zeN
	WSQLe/DmzdWaTL
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jan 2011 22:21:15 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <201101242322.30470.schnitzeltony@gmx.de>
	<201101262327.31727.schnitzeltony@gmx.de>
	<20110127123832.GA31083@rhein.zuhause.netz>
In-Reply-To: <20110127123832.GA31083@rhein.zuhause.netz>
MIME-Version: 1.0
Message-Id: <201101272221.15874.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Question regarding gettext 0.18
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
X-List-Received-Date: Thu, 27 Jan 2011 21:24:43 -0000
X-Groupsio-MsgNum: 28541
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_LHeQNYAgz1tgXa4"

--Boundary-00=_LHeQNYAgz1tgXa4
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 27 January 2011 13:38:32 Henning Heinold wrote:
> Hi,
> 
> can you provide the recipes somewhere so I could easily test them.
> 
> Bye Henning
> 
Some comments on the files attached:
- the changes in clutter-common.inc were made to prepare clutter-toys. I don't know if they are required for this issue
- I successfully build (did not yet run on hardware) by simply commenting the line 'read dummy < /dev/tty' in sysroots/i686-linux/usr/bin/gettextize. 
- OE folks: Has anybody a problem patching gettext(-native) to make it accessible for automated environments?

good night

Andreas

--Boundary-00=_LHeQNYAgz1tgXa4
Content-Type: text/plain;
  charset="UTF-8";
  name="clutter_1.4.2.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="clutter_1.4.2.bb"

require clutter.inc

inherit autotools pkgconfig gettext

PR = "${INC_PR}.0"

SRC_URI = "http://source.clutter-project.org/sources/clutter/1.4/clutter-${PV}.tar.bz2 \
           ${INC_SRC_URI} \
          "

# not (yet) in clutter.inc: elder versions had json code included
STDDEPENDS += "json-glib"

# recommended for --clutter-debug / --cogl-debug params
BASE_CONF += " --enable-debug"

do_configure_prepend() {
	# align the test data location *.c (V1.2 and following use macro ASSETS_DIR for path in *.c)
	for i in $(find ${S}/tests -name Makefile.am) ; do
		sed -i -e 's:$(top_srcdir)/tests/data:${datadir}/${PN}-tests:g' $i
	done

	# prevent the conformance test suite from running
	sed -i -e 's:BUILT_SOURCES = wrappers:# BUILT_SOURCES = wrappers:g' ${S}/tests/conform/Makefile.am

	# 1. OE currently supports gettext 0.18 / clutter ships with 0.17
	# we assume no problem changing gettext version because clutter did too 
	# see http://git.clutter-project.org/clutter/commit/?id=0e325404aa50fcca400d0cb8020a36bcd81f4c37
	# 2. clutter moved to upstream gettext from glib one 
	# see http://git.clutter-project.org/clutter/commit/?id=98cac30d82299b3739f3801f71b5e2e931eb2e8d

	echo gettextize $(which gettextize)
	echo glib-gettextize $(which glib-gettextize)

	gettextize --force || true

	# gstreamer uses AG_GST_GETTEXT which autotools.bbclass doesn't grep for
	# glib-gettextize --force --copy || true
}

do_compile_prepend() {
	rebuild_shader_sources ${S}/clutter/cogl/cogl/driver/gles
	# align test data location *.json
	for full_name in $(find ${S}/tests/data -name *.png -o -name *.json) ; do
		data_name=${full_name##*/}
		for i in $(find ${S}/tests -name *.json) ; do
			sed -i -e s:${data_name}:${datadir}/${PN}-tests/${data_name}:g $i
		done
	done
}

do_install() {
	autotools_do_install
	install_tests
}

SRC_URI[md5sum] = "5a3c6d8414d4e286aba0a936f344c9b1"
SRC_URI[sha256sum] = "92fd67acce5105c933e54ad0c87d0f5ace1202fd0f87949cb49a3759e6e38892"

--Boundary-00=_LHeQNYAgz1tgXa4
Content-Type: text/plain;
  charset="UTF-8";
  name="clutter-common.inc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="clutter-common.inc"

# common functions for all clutter-libraries

# all .debug stuff goes to clutter*-dbg
FILES_${PN}-dbg += "${bindir}/.debug"

# helper for (git)-recipes which do not have gtk-doc.make
copy_gtk_doc_make() {
	if [ -e ${WORKDIR}/gtk-doc.make ] ; then
		cp ${WORKDIR}/gtk-doc.make ${S}/gtk-doc.make
	else
		touch ${S}/gtk-doc.make
	fi
}

# clutter packs assume building and target are the same
# for us they are definitely not
make_all_execs_installable() {
	for i in $(find ${S} -name Makefile.am) ; do
		sed -i -e s:noinst_PROGRAMS:bin_PROGRAMS:g \
		       -e s:check_PROGRAMS:bin_PROGRAMS:g $i
	done
}

#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
def get_clutter_fpu_setting(bb, d):
	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
		return "--without-fpu"
	return ""


--Boundary-00=_LHeQNYAgz1tgXa4--

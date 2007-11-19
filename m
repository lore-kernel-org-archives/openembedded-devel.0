Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1Iu6NL-00030Q-Dx
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2007 14:09:19 +0100
Received: by an-out-0708.google.com with SMTP id b33so311569ana
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2007 05:07:16 -0800 (PST)
Received: by 10.100.207.5 with SMTP id e5mr5641280ang.1195474104568;
	Mon, 19 Nov 2007 04:08:24 -0800 (PST)
Received: from lenovo ( [69.29.228.242])
	by mx.google.com with ESMTPS id j4sm5516672nzd.2007.11.19.04.08.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2007 04:08:23 -0800 (PST)
Received: by lenovo (sSMTP sendmail emulation); Mon, 19 Nov 2007 06:08:19 -0600
Date: Mon, 19 Nov 2007 06:08:19 -0600
From: David Farning <dfarning@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <20071119120819.GA17788@lenovo>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: Getting Started -Makefile
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
X-List-Received-Date: Mon, 19 Nov 2007 13:09:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I think that my getting started Makefile is ready for testing.

To setup a development BitBake\OpenEmbedded system:

##Do not run this from an existing bb/oe directory.  It will##
##overwrite parts of your local.conf.                       ##

make a new  test directory
change to the test directory
copy Makefile to directory

$make setup
$make build-package-vim

This eliminates many of problems the new users have setting up bb
and oe.  There is no need to know any thing about svn of monotone.

I am caching sources in HOME to reduce traffic while testing.
I am still working on the quem testing image setup so I did not 
include it.

Thanks
David Farning









# "Makefile" - a Makefile for setting up OpenEmbedded builds
#
# Copyright (c) 2007  David Farning <dfarning@gmail.com>
# All rights reserved.
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# version 2 as published by the Free Software Foundation.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor,
# Boston, MA  02110-1301, USA
#
# Thanks to Rod Whitby for the OpenMokoMakefile

# Set BITBAKE_SVN_REV to either HEAD or 1.8
BITBAKE_SVN_REV = HEAD

ifeq ("${BITBAKE_SVN_REV}","HEAD")
BB_SVN_PATH := bitbake/trunk/bitbake
else
BB_SVN_PATH := bitbake/branches/bitbake-1.8
endif

MTN := mtn
#Set OPENEMBEDDED_MTM_REV to either head of a specific revision
OPENEMBEDDED_MTN_REV = HEAD

ifneq ("${OPENEMBEDDED_MTN_REV}","HEAD")
OPENEMBEDDED_REV_FLAGS = -r ${OPENEMBEDDED_MTN_REV}
endif
OE_SNAPSHOT_SITE := http://www.openembedded.org/snapshots


MACHINE := qemux86
DISTRO := angstrom-2007.1

CWD := pwd

###############################################################################
# Setup
###############################################################################

.PHONY: setup
setup:  setup-bitbake setup-mtn setup-openembedded setup-config setup-env

.PHONY: setup-bitbake
setup-bitbake stamps/bitbake:
	[ -e stamps/bitbake ] || \
	( svn co -r ${BITBAKE_SVN_REV} svn://svn.berlios.de/${BB_SVN_PATH} bitbake )
	[ -d stamps ] || mkdir stamps
	touch stamps/bitbake

OE.mtn:
	if [ -z "`${MTN} --version | awk '{ print $$2; }'`" ] ; then \
	  echo 'Cannot determine version for monotone using "${MTN} --version"' ; \
	  false ; \
	fi
	[ -e OE.mtn ] || \
	( ( version=`${MTN} --version | awk '{ print $$2; }'` ; \
	    wget -c -O OE.mtn.bz2 \
		${OE_SNAPSHOT_SITE}/OE-this-is-for-mtn-$$version.mtn.bz2 || \
	    wget -c -O OE.mtn.bz2 \
		${OE_SNAPSHOT_SITE}/OE.mtn.bz2 ) && \
	  bunzip2 -c OE.mtn.bz2 > OE.mtn.partial && \
	  mv OE.mtn.partial OE.mtn )

.PHONY: setup-mtn
setup-mtn stamps/OE.mtn:
	[ -e OE.mtn ] || \
	${MAKE} OE.mtn
	[ -e stamps/OE.mtn ] || \
	( ${MTN} --db=OE.mtn db migrate && \
	  ${MTN} --db=OE.mtn pull monotone.openembedded.org org.openembedded.dev )
	[ -d stamps ] || mkdir stamps
	touch stamps/OE.mtn

.PHONY: setup-openembedded
setup-openembedded stamps/openembedded: stamps/OE.mtn
	[ -e stamps/openembedded ] || \
	( ${MTN} --db=OE.mtn checkout --branch=org.openembedded.dev \
		${OPENEMBEDDED_REV_FLAGS} openembedded ) || \
	( ${MTN} --db=OE.mtn checkout --branch=org.openembedded.dev \
		-r `${MTN} --db=OE.mtn automate heads org.openembedded.dev | head -n1` openembedded )
	[ -d stamps ] || mkdir stamps
	touch stamps/openembedded

.PHONY: setup-config
setup-config build/conf/local.conf:
	[ -e build/conf/local.conf ] || \
	(   mkdir -p build/conf; \
	    cp openembedded/conf/local.conf.sample build/conf/local.conf; \
	    sed -i -e 's/^#[[:space:]]*MACHINE[[:space:]]*=[[:space:]]*\".*\"/MACHINE = \"${MACHINE}\"/' build/conf/local.conf; \
	    sed -i -e 's/^#[[:space:]]*DISTRO[[:space:]]*=[[:space:]]*\".*\"/DISTRO = \"${DISTRO}\"/' build/conf/local.conf; \
	    sed -i -e 's|BBFILES := "$${@bb.*|BBFILES := "${shell pwd}/openembedded/packages/*/*.bb"|' build/conf/local.conf; \
	    sed -i -e 's|# EDIT THIS FILE.*||' build/conf/local.conf; \
	    sed -i -e 's|REMOVE_THIS_LINE.*||' build/conf/local.conf; )

setup-env:
	[ -e setup-env ] || \
	echo 'export OEDIR="'`pwd`'"'                            > setup-env

	echo \
	'export BBPATH="$${OEDIR}/build:$${OEDIR}/openembedded"' >> setup-env

	echo \
	'export PATH="$${OEDIR}/bitbake/bin:$${PATH}"'            >> setup-env
###############################################################################
# Update
###############################################################################

.PHONY: update
update: update-bitbake update-mtn update-openembedded 

.PHONY: update-bitbake
update-bitbake: stamps/bitbake
	cd bitbake && svn update -r ${BITBAKE_SVN_REV}

.PHONY: update-mtn
update-mtn: stamps/OE.mtn
	if [ "${OPENMOKO_MTN_REV}" != "`(cd openembedded && ${MTN} automate get_base_revision_id)`" ] ; then \
		${MTN} --db=OE.mtn pull monotone.openembedded.org org.openembedded.dev ; \
	fi

.PHONY: update-openembedded
update-openembedded: update-mtn stamps/openembedded
	( cd openembedded && ${MTN} update ${MTN_REV_FLAGS} ) || \
	( cd openembedded && ${MTN} update \
		-r `${MTN} automate heads | head -n1` )

###############################################################################
# Build Tests
###############################################################################

#FIXME build sdk should sdk be what I have been calling the cross compiler + tools?
#FIXME build test package
#FIXME build test distro
#FIXME build test qemu image

###############################################################################
# Build Package
###############################################################################

.PHONY: build-package-%
build-package-%: setup
	( . ./setup-env \
		&& echo $$PATH \
		&& echo $$BBPATH \
		&& bitbake -c build $* )

.PHONY: rebuild-package-%
rebuild-package-%: setup
	( . ./setup-env && bitbake -c rebuild $* )

.PHONY: clean-package-%
clean-package-%: setup
	( . ./setup-env && bitbake -c clean $* )

###############################################################################
# Clean
###############################################################################

.PHONY: clean
clean: clean-openembedded

.PHONY: clean-openembedded
clean-openembedded:
	rm -rf tmp

###############################################################################
#  Clobber
###############################################################################

.PHONY: clobber
clobber: clobber-bitbake clobber-openembedded clobber-config clobber-env

.PHONY: clobber-bitbake
clobber-bitbake:
	rm -rf bitbake stamps/bitbake

.PHONY: clobber-openembedded
clobber-openembedded: clean-openembedded
	rm -rf openembedded stamps/openembedded

.PHONY: clobber-config
clobber-config:
	rm -rf build/conf/local.conf

.PHONY: clobber-env
clobber-env:
	rm -rf setup-env





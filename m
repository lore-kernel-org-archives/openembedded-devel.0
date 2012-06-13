Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SesWT-0003MR-N3
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jun 2012 20:42:29 +0200
Received: by pbbrq2 with SMTP id rq2so2576578pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2012 11:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=Twj3cr2iGPkDc4fHS3/7BXs8v/p8iOtHfJzFPFBKdLk=;
	b=YdzE4IZMvDNoLf2h9nxMhVUxXz/LIX6ph2Xth0/CNXXhddGBpk/7umNvcoz0juUemR
	eFatkzVZYxDLJn4dFynDgwB0BmNY2lcl0BWMAAyt6Rg2MZjnB6mikXTZ7Q7kdRQk793Z
	mCSl/cV84UqgM8PXJftNRzGECA8lDJsKB4NveUhdNrp/NCNB3AmLNnCb0Otimzqj2rmE
	QFqr2Ls0sMSN+chskc542kwItYIxI8ZCM43uq/W0m150PXUPAp1p6tln5+6jI/BvPLe5
	pw0MQF9HbMuINkPY0aOVLzDjFX7xOSl7N+eCB/ch88m6EwusBrwaN3PVgHewFrExO5/n
	2efw==
Received: by 10.68.200.102 with SMTP id jr6mr54016905pbc.0.1339612312582;
	Wed, 13 Jun 2012 11:31:52 -0700 (PDT)
Received: from [192.168.1.102] ([94.205.109.242])
	by mx.google.com with ESMTPS id u5sm6529731pbu.76.2012.06.13.11.31.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jun 2012 11:31:52 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Wed, 13 Jun 2012 22:31:47 +0400
Message-Id: <219B8A48-C2ED-43D4-9875-9C774D837894@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: ERROR: No recipes available for: qt4-x11-free_4.7.4.bbappend qt4-embedded_4.7.4.bbappend
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
X-List-Received-Date: Wed, 13 Jun 2012 18:42:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
       I get the following error while building core-image-minimal, =
after just updating all my yocto repos. It was building fine just after =
manually fixing the yocto kernel 3.2 SRCREV typo commit that managed its =
way to the master branch.

Now apparently there is a new error.=20


ERROR: No recipes available for:
  =
/tool/yocto/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bb=
append
  =
/tool/yocto/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bb=
append
ERROR: Command execution failed: Exited with 1


My bblayers.conf looks like this

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION =3D "4"

BBFILES ?=3D ""
BBLAYERS ?=3D " \
  /tool/yocto/poky/meta \
  /tool/yocto/poky/meta-yocto \
  /tool/yocto/meta-openembedded/meta-oe \
  /tool/yocto/meta-xilinx \
  "

Shouldn't the Yocto build/integration/release team be testing =
everything, before committing changes to a public repo.=20

Elvis Dowson=



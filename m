Return-Path: <nilesh.kokane@mindastoneridge.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1B570820
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 11:37:03 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so1045360wes.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 04:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=Cw/Vdwd2SHXLkEp8bZwjuVjqUV8CKKjz15hVfaitY+c=;
	b=UW1FzX33COWYuveW71sdFRAtkM2p1N3VpsF3YEeJQiz7CZqe+kpRc4yO54De/DUhIy
	yASaaSMeWODYiLMZa8Pm4hEjUrIXRYV8v6w2Db3XDObU0ipaME8Q9XsmIR+T1bpPVFw4
	WDLE3xrFtEBNOpv8zoHt1VeK0OR6J8Ieb1PuA7ddV3r//WBoKNvES8gkgL0IRgm1Ve2e
	BorSTBeFyVDSHMZeWRImlw4JINbFG6Q/BgdGIzPWJwqZ16pxd/lFU46S4ILFRm8OK6fm
	vVzxHliH4TjeujeQS8cFheMWMtli13WzlNahIORzv11K5xNuvdBoLMjh3GXU8BSGz2Y9
	Ktzw==
X-Gm-Message-State: ALoCoQlxJh4iRpUB1IUaCtGhgPIgqL1qlsAW2yseTmytRVxnQbB8v8Lcd+lPrGv+FjUCQEhHze1HNeCQ4D+izpN8JmL4f6eHIyOefWjGYPZb+JAxElT3BpXLiOcx5mrd75mgmgfybNfF
MIME-Version: 1.0
X-Received: by 10.180.184.20 with SMTP id eq20mr2179599wic.37.1406115423934;
	Wed, 23 Jul 2014 04:37:03 -0700 (PDT)
Received: by 10.217.55.10 with HTTP; Wed, 23 Jul 2014 04:37:03 -0700 (PDT)
Date: Wed, 23 Jul 2014 17:07:03 +0530
Message-ID: <CAHURY+0mB2G3oGHNSBGAn+_jZ78uB4VLBS=817gdhL-WBjOMuw@mail.gmail.com>
From: Nilesh Kokane <nilesh.kokane@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Building Qt5 using yocto on Wandboard-Error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jul 2014 11:37:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello ,



I've created a yocto image using the following URL

http://wiki.wandboard.org/index.php/Getting_started_with_Yocto_on_Wandboard


And  trying to bring in Qt on wandboard using the following link

http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard


Every thing goes fine until i give the following command

 bitbake core-image-minimal

It pops out with following errors.


WARNING: Failed to fetch URL
http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodules/qt=
graphicaleffects-opensource-src-5.1.1.tar.xz,
attempting MIRRORS if available

ERROR: Fetcher failure: Fetch command failed with exit code 4, no output
ERROR: Function failed: Fetcher failure for URL: '
http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodules/qt=
graphicaleffects-opensource-src-5.1.1.tar.xz'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/minda/bin/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-l=
inux-gnueabi/qtgraphicaleffects/5.1.1-r0/temp/log.do_fetch.29384
ERROR: Task 1283
(/home/minda/bin/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/
qtgraphicaleffects_5.1.1.bb, do_fetch) failed with exit code '1'
WARNING: Failed to fetch URL
http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodules/qt=
declarative-opensource-src-5.1.1.tar.xz,
attempting MIRRORS if available

ERROR: Fetcher failure: Fetch command failed with exit code 4, no output
ERROR: Function failed: Fetcher failure for URL: '
http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodules/qt=
declarative-opensource-src-5.1.1.tar.xz'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/minda/bin/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-l=
inux-gnueabi/qtdeclarative/5.1.1-r0/temp/log.do_fetch.29383
ERROR: Task 1270
(/home/minda/bin/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/
qtdeclarative_5.1.1.bb, do_fetch) failed with exit code '1'


Please can anybody suggest.


--=20
Thanks
Nilesh Prakash Kokane

--=20
=E2=80=9CThe contents of this e-mail message and any attachments are confid=
ential=20
and are intended solely for addressee. The information may also be legally=
=20
privileged. This transmission is sent in trust, for the sole purpose of=20
delivery to the intended recipient. If you have received this transmission=
=20
in error, any use, reproduction or dissemination of this transmission is=20
strictly prohibited. If you are not the intended recipient, please=20
immediately notify the sender by reply e-mail or phone and delete this=20
message and its attachments, if any.=E2=80=9D


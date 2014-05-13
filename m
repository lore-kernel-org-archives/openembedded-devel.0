Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f43.google.com (unknown [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6C4E065DBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 14:48:56 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id d17so507778eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=gCBiKfCbc65TiM+++vXne2ndw0M4Pi7XPef+gDXLkRk=;
	b=BCbe5n9486z0iX4Bz51aHSklU0Qn+oRBAmCu8yuRRieGqdqtuMGiq1fqv6mraoJtAe
	ICPi9x0W2m0ZtiH3RAsqek3kEjxYo4CYkklvsaCTwNgyyx4YsKUt3Vuxp3QiCCpFM2BA
	oA3CaninawFN3pzzf1E4OPDwNwz4WtYw9sdRGp4Nv8PRiWUfcSD1E9Wivr4DJRxSw1jT
	HPkJvYNASuLAzUqQuRrGxAjeqjz0AfNAKpfMpbwI0j0ix+TQFV0mA6rhK344PBn4ppIA
	2UuGavvgEnhQuP6uQyceRfxJNIHafKnBMYdEy7OZn1k1+nCxvQgvw/IGXzhf2u2I1mOZ
	oZSQ==
X-Received: by 10.14.202.134 with SMTP id d6mr3846360eeo.92.1399992537642;
	Tue, 13 May 2014 07:48:57 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-161-153.unitymediagroup.de.
	[95.222.161.153]) by mx.google.com with ESMTPSA id
	m44sm40701315eeh.14.2014.05.13.07.48.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 07:48:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2014 16:48:45 +0200
Message-Id: <1399992528-10108-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH,V2][meta-qt5 0/3] qtwayland updates for hawaii
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
X-List-Received-Date: Tue, 13 May 2014 14:49:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1->V2:

* replace tabs by spaces in do_install
* fix wrong version location in do_install

Andreas Müller (3):
  qtwayland: move to latest revision
  qtwayland-native: make qtwayland find qtwaylandscanner
  qtwayland: install created private headers

 recipes-qt/qt5/qtwayland-native_git.bb             |  5 ++
 ...0001-xcomposite-glx-Fix-build-on-Qt-5.2.1.patch | 91 ----------------------
 recipes-qt/qt5/qtwayland_git.bb                    |  8 +-
 3 files changed, 11 insertions(+), 93 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtwayland/0001-xcomposite-glx-Fix-build-on-Qt-5.2.1.patch

-- 
1.8.3.1



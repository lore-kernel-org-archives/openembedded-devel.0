Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7Mz7-0007x9-3b
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:17:01 +0200
Received: by fxm19 with SMTP id 19so887124fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=n1WDF8XvDb3acL8gHhgreq7HBZpvGA49gz+bMV4zShY=;
	b=j+OsjdLkf8wJiIJSfL0nHhaXQ0jpj5pzQZmVC/Lk73zAUbFC9WqWYr2WMpXd07EhPS
	9bl6skLMTKzcMwUUkvN2coxCYTVSFVu6RTZeECB81KG8wAwVJLEkVLTRk3eSDDMncvJe
	r72apVN7zE29qFGJP5Y+LvsVPjqdxDSabJPqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=EDL1KTQ8RIV8FsRAVdtXVJS9tu78or4qvE0XZfmIVYL/r2TOQ4h892GZHY6WZxXAgH
	qvCnotcH4BhuF2QXoa8mfwBUfBby759qG4mRTDDJvyE7gZWmA4LscYCzymoJ920mXdyF
	h9CiMaLjt/Gi8dnrt74Hk2MGRUIlKlF0GBj0w=
Received: by 10.223.73.133 with SMTP id q5mr630222faj.127.1302074093267;
	Wed, 06 Apr 2011 00:14:53 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c21sm79431fac.46.2011.04.06.00.14.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:14:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 09:14:51 +0200
Message-Id: <cover.1302074016.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH 0/8] [meta-efl] Pull request #3
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
X-List-Received-Date: Wed, 06 Apr 2011 07:17:01 -0000

Sync with oe, add ephoto, bump SRCREV

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/meta-efl
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-efl

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (5):
  ephoto: inherit gettext
  elementary: inherit gettext
  e-base: bump SRCREV
  evas: drop PACKAGES_DYNAMIC_virtclass-native, not needed anymore
  azy: disable mysql tests

Philippe De Swert (3):
  eio: new recipe and include file for eio
  ephoto: new svn build recipe
  eeze: update to 1.0.1

 meta-efl/classes/e-base.bbclass            |    2 +-
 meta-efl/recipes-efl/e17/ephoto_svn.bb     |   14 ++++++++++++++
 meta-efl/recipes-efl/efl/azy_svn.bb        |    2 ++
 meta-efl/recipes-efl/efl/eeze_1.0.0.bb     |   10 ----------
 meta-efl/recipes-efl/efl/eeze_1.0.1.bb     |   10 ++++++++++
 meta-efl/recipes-efl/efl/eio.inc           |    8 ++++++++
 meta-efl/recipes-efl/efl/eio_svn.bb        |   13 +++++++++++++
 meta-efl/recipes-efl/efl/elementary_svn.bb |    2 +-
 meta-efl/recipes-efl/efl/evas.inc          |    1 -
 9 files changed, 49 insertions(+), 13 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/ephoto_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.0.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio.inc
 create mode 100644 meta-efl/recipes-efl/efl/eio_svn.bb

-- 
1.7.4.1




Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RxeZo-0004si-SQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 14:07:16 +0100
Received: by eekd41 with SMTP id d41so302240eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 04:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D7SaTTIl1i8FoTJtUhYqGnsaYpyLPJpvBPaW74oTF1c=;
	b=lxiGovHjGRTfNFOaTijNiDHKIS9wIm4OfDuZryKiOj8LCcESFXgS2hQgSr011KPypM
	9gkrKx3n+28j22rYYdePvHmm/YKlw3JO9M+dsmKob8pRMDr8xybqqo1E8tNAEKYzWlv0
	qYdoiXvjYDONkKIpAQa7tvFOjJibgPwNqIozs=
Received: by 10.213.13.218 with SMTP id d26mr1244688eba.56.1329310744755;
	Wed, 15 Feb 2012 04:59:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v51sm10978787eef.2.2012.02.15.04.59.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 04:59:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Feb 2012 13:58:50 +0100
Message-Id: <cover.1329310622.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][meta-efl][PATCH 0/2] Imagemagick upgrade and webkit-efl build fix
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
X-List-Received-Date: Wed, 15 Feb 2012 13:07:17 -0000

The following changes since commit 83281ff6b918b05f0d12d11a0a031db30f7fb1a5:

  xfce4-settings: Update to latest stable version 4.8.3. (2012-02-14 15:15:54 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (2):
  webkit-efl: resolve build error with missing eina lib when linked by
    gold
  imagemagick: upgrade to 6.7.5 because 6.4.4 is not compatible with
    zlib-1.2.6 we have now

 ...ore-add-EINA_LIBRARIES-to-shell-build-for.patch |   28 ++++++++++++++++++++
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |    2 +
 .../PerlMagic_MakePatch.patch                      |    0
 .../imagemagick-6.7.5/remove.dist-lzip.patch       |   17 ++++++++++++
 .../{imagemagick_6.4.4.bb => imagemagick_6.7.5.bb} |   19 ++++++++-----
 5 files changed, 58 insertions(+), 8 deletions(-)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick-6.4.4 => imagemagick-6.7.5}/PerlMagic_MakePatch.patch (100%)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove.dist-lzip.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick_6.4.4.bb => imagemagick_6.7.5.bb} (61%)

-- 
1.7.8.4




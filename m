Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQKFI-000717-DU
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 16:12:04 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2120968fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2011 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=RkgEjIMG78n41ZMeuY9sEXhmlYnmjOThL4d6SJ7d3oQ=;
	b=UdStsjIUR89X8HTKlL9JF7zdy8Q2+NeTo6P84m6vsMm1q0LOPZnh+9sUgiJU0n43xC
	K6VTFFRZnldVeH6ea5WDlrvAXJ40p4i4kezyACV8tsgMWhU49MqaEanI/H8enmkXTyRf
	J7mGvKR7zEJmLxqfdYtp3L+KxpQz6tJHHmR/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KwJZpOwurqZ/eshGd7FcgL11KFPdM2kofPJtsHfAVwIEUuPS1vaKaLhAedbyUvdApf
	aYEZw/iV2Zn74kfE1mQvCiOkvaryMIW7g32NiidjwZPFfhFWSG6LE2pnR1YrjptRBpck
	oRa3skhqgNlmWmRgpetXUaUCOAxNE60peuPnM=
Received: by 10.223.48.139 with SMTP id r11mr3555925faf.63.1306591694238;
	Sat, 28 May 2011 07:08:14 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 11sm171732fax.12.2011.05.28.07.08.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 07:08:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 May 2011 16:08:01 +0200
Message-Id: <cover.1306591578.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [meta-oe][PATCH 0/2] Pull request #11
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
X-List-Received-Date: Sat, 28 May 2011 14:12:04 -0000

The following changes since commit 7f9dbc16002bacf2ccc040a2de3ddc134e5fbbad:

  gcc-4.6: Update with patches from gcc-4_6-branch and linaro 2011.05 release (2011-05-28 09:36:14 +0200)

are available in the git repository at:
  git+ssh://git@git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
  http://cgit.openembedded.org/cgit.cgi/git+ssh://git@git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/meta-oe

Martin Jansa (2):
  gconf: depend on polkit not policykit
  policykit: drop recipes, oe-core has newer versions named right
    polkit

 meta-oe/recipes-gnome/gnome/gconf_2.28.0.bb        |    4 +-
 .../policykit/policykit-gnome_0.96.bb              |   25 -------
 meta-oe/recipes-gnome/policykit/policykit_0.96.bb  |   67 --------------------
 3 files changed, 2 insertions(+), 94 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/policykit/policykit-gnome_0.96.bb
 delete mode 100644 meta-oe/recipes-gnome/policykit/policykit_0.96.bb

-- 
1.7.5.rc3




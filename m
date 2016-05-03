Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8687D73181
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 May 2016 16:40:53 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id 77so12553512pfv.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2016 09:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=qiv/hkOufnAN9FkyFrJNQ9Cep1KbttvYUaUxTFe3cGk=;
	b=ivP4CCqqbn9AavKJubsTrwdwv0KhgzNK8baa6UWqaqel/w/v3g8tM0BdaUh7xP3/mq
	WNvLgBa+nrvWo3pulJ8Xk1eSOub1ueoqvUyMVzyH6ITB3dojzIfluCXE5GZhnPi7gDTh
	OJcfLkMeNU+2ycEodYCat/RoNhZqmRuX8WTyAk2f6bCCEij6FZkKyPlmqMeGAtFZuR+X
	EaO3nPaSmY9ZYf9jEgn1ParBW6as9afjDHfJT6iRLFmiL/zvc6O4Ws9jKwr0CERrvk75
	bTKSIk1x7X4Eg/7AbOoKpHd7cu1ILyNzO4mGvZLSJ0YtH4RDJkQy2GTr+70c7uUxT+JO
	1Png==
X-Gm-Message-State: AOPr4FXwIHAO1GydhqbTXzaD41Pip6Un7oFR9Y+g/PE9o32doRh6pwm/S5PhAFTtsn9VcQ==
X-Received: by 10.98.33.207 with SMTP id o76mr4931462pfj.80.1462293654850;
	Tue, 03 May 2016 09:40:54 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 71sm54160pfy.32.2016.05.03.09.40.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 09:40:53 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 03 May 2016 13:40:46 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  3 May 2016 13:40:46 -0300
Message-Id: <1462293646-16365-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe master krogoth PATCH] opencv: Ensure opencv-dev package do not rdepends on opencv-java
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 May 2016 16:40:54 -0000

The opencv-java is not always generated so we ought to include it,
only if it is available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index c1f9802..5a48799 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -96,7 +96,7 @@ python populate_packages_prepend () {
     metapkg_rdepends = [ ]
     packages = d.getVar('PACKAGES', 1).split()
     for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
+        if not pkg in blacklist and not pkg in metapkg_rdepends and (pkg.endswith('-dev') or pkg.endswith('-java')):
             metapkg_rdepends.append(pkg)
     d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
 
-- 
2.8.2



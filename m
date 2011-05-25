Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QPDa6-0002dH-Qb
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 14:52:58 +0200
Received: by fxm19 with SMTP id 19so6071028fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=hErMVozO4lDV1+lqbEsrwthzYhKBVCJ5wEF1GLAIoyM=;
	b=ExsmKqwHAkEKSF2XDtdrG9xVUgekCxVOZUbPEF2WLreEcXw5h9Gnqy0Kp5N8sfU/xd
	L4wfGBCvKpSYKCqObyKj6JgIhVA0eBmgz/bpdZsnH9fdhv7WiS8BGX86vrIvO35QhgkE
	CZ6rX7a13PDIbzjdLi31M+b5QM9+5yPh2wssQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=dOSI+naZJf7iS+5UjnQ5s0wdZx5maCtlsqJnJFwfMt/x0JCA1R3Tk8T0mQGSOEPDXo
	uBNmCql8ZBdunEwfLiyR4/k3XnEMiXU9EDNENNB6MBoPZYNy5SAX2xm5KpxhcIFuGLyi
	jMld/aGBaaVfFpLfzR31DnnfBA1H5CNHtlSCY=
Received: by 10.223.62.77 with SMTP id w13mr938336fah.53.1306327796487;
	Wed, 25 May 2011 05:49:56 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id d18sm220946fak.7.2011.05.25.05.49.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2011 05:49:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 May 2011 14:49:48 +0200
Message-Id: <cover.1306327689.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [meta-oe][PATCH 0/2] Pull request #10
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
X-List-Received-Date: Wed, 25 May 2011 12:52:58 -0000

Please merge following patches.

Pull URL: git://git.openembedded.org/meta-openembedded-contrib
  Branch: jansa/meta-oe
  Browse: http://git.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-oe

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (2):
  xserver-xorg: upgrade to 1.10.1.901 and return randr-support patch
  xf86-video-glamo: fix build with gcc-4.6

 ...-glamo-kms-driver-drop-unused-xf86_config.patch |   35 +++++
 .../xorg-driver/xf86-video-glamo_git.bb            |    3 +-
 ...ack-assume-pixman-supports-overlapped-blt.patch |    0
 .../hack-fbdev-ignore-return-mode.patch            |    0
 .../xserver-xorg-1.10.1.901/randr-support.patch    |  131 ++++++++++++++++++++
 .../replace-pkgconfig-sdkdir-poking.patch          |    0
 ...r-xorg_1.10.1.bb => xserver-xorg_1.10.1.901.bb} |    7 +-
 7 files changed, 172 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-kms-driver-drop-unused-xf86_config.patch
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1 => xserver-xorg-1.10.1.901}/hack-assume-pixman-supports-overlapped-blt.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1 => xserver-xorg-1.10.1.901}/hack-fbdev-ignore-return-mode.patch (100%)
 create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/randr-support.patch
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1 => xserver-xorg-1.10.1.901}/replace-pkgconfig-sdkdir-poking.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg_1.10.1.bb => xserver-xorg_1.10.1.901.bb} (85%)

-- 
1.7.5.rc3




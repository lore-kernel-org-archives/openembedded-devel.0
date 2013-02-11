Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U52Dd-0007Zx-TS
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 23:51:25 +0100
Received: by mail-ee0-f54.google.com with SMTP id c41so3624088eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 14:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=Ah+ALXtAVgfesDp+4t4Y24oiw62mMdoFTP33c+s8DwM=;
	b=NEfd8B8iZkynB69gWmKHH2oI7Hghmt8BNSyCI+L4lwp427RZOMIco0Jt2Wv0LdeFwT
	J+Ov7SLDmdMU9ZuaoVI8h5zyokpnDUq/vdZ2uQLNEFTHjEJ+jrtpg3tY6nbkGx7wwT38
	YLm6z0nYbb/LJ86FieJiSRrjLXTix4tlrbz69SjKVz4kyr9pTv/XyeQNesjYN3RKPub5
	UcZNLwKNARbGqw5ZO/n4/5manABy47ulN3voF8ACp5N48o/w+XndOMt0QVgW4CW7IE3R
	HlmYESGGSHZCzMA21/6dmSAo8AJ8hNItZei9nfDfW46dQP/PiJ2/Qg/wQ4j3m58AZQUa
	M2jg==
X-Received: by 10.14.199.135 with SMTP id x7mr54802629een.18.1360622127099;
	Mon, 11 Feb 2013 14:35:27 -0800 (PST)
Received: from localhost.localdomain (p4FDF102E.dip.t-dialin.net.
	[79.223.16.46])
	by mx.google.com with ESMTPS id q5sm64887228eep.11.2013.02.11.14.35.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 14:35:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 23:35:07 +0100
Message-Id: <1360622110-15419-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe 0/3] replace meta-oe's update-fonts.bbclass by oe-core's fontcache.bbclass
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
X-List-Received-Date: Mon, 11 Feb 2013 22:51:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 61911b23099c2658186179504ded318c987b5276:

  ttf: introduce update-fonts bbclass and change all ttf recipes to use it (2013-02-06 15:16:01 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git font-cache

Andreas Müller (3):
      ttf-fonts: inherit oe-core's fontcache.bbclass instead of update-fonts
      update-fonts.bbclass: remove - we now use oe-core's fontcache.bbclass     Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
      font-update-common: remove

 meta-oe/classes/update-fonts.bbclass               |   40 --------------------
 .../font-update-common/update-fonts                |    4 --
 .../font-update-common/font-update-common_0.1.bb   |   18 ---------
 .../ttf-fonts/ttf-arphic-uming_20080216.bb         |    4 +-
 .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |    4 +-
 .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |    4 +-
 .../recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb |    4 +-
 .../ttf-fonts/ttf-hunkyfonts_0.3.0.bb              |    4 +-
 .../ttf-fonts/ttf-liberation_0.2.bb                |    4 +-
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    7 +--
 .../ttf-fonts/ttf-sazanami_20040629.bb             |    4 +-
 .../ttf-fonts/ttf-ubuntu-font-family_0.80.bb       |    4 +-
 .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |    4 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf.inc         |    2 +-
 14 files changed, 21 insertions(+), 86 deletions(-)
 delete mode 100644 meta-oe/classes/update-fonts.bbclass
 delete mode 100644 meta-oe/recipes-graphics/font-update-common/font-update-common/update-fonts
 delete mode 100644 meta-oe/recipes-graphics/font-update-common/font-update-common_0.1.bb

-- 
1.7.4.4




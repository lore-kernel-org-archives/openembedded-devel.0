Received: from mail-yh0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTDBk-0002KZ-PK
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2012 15:53:08 +0100
Received: by mail-yh0-f47.google.com with SMTP id g23so60625yhg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2012 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=NhCTNDr9zEC2Y3CYrS0eb1GA00B/B/2tznLWNVUoq+A=;
	b=wrWeMoFGx9myBBN7JqTMQnHflqEsdT0HlNBwbZLFmKo16j4Ofh24oy+wWiQwYP5/QC
	VxX+YZurqQy5uLb988KGJUC0c3Ym17igFw7np9YIgqa1OOK4X8R6dNPho5NVsLQu/cFs
	6KGcdorjtu8uHJ7llJe9I4MMxrTfr+ty8MME3yNsoSq+FMIfewHUrx9WtzmPo4Enqwtf
	weriTIzmRuFYVY88UQ3ZuQa9/u2y78eB8IzgytO0MnwaBRFb5sZWeocf9GBNWNns2hOf
	P+xJVIIvdZUWFpldp8iRsoTUtPheZ/y0KPYF52KpAai/FipHSONarMczbE4Dg1N3hBrO
	/m8w==
Received: by 10.236.9.104 with SMTP id 68mr32701411yhs.89.1351607972666;
	Tue, 30 Oct 2012 07:39:32 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id u49sm801500yhd.18.2012.10.30.07.39.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Oct 2012 07:39:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Oct 2012 12:39:21 -0200
Message-Id: <1351607962-13469-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Tue, 30 Oct 2012 14:53:08 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/ntp/ntp/ntpd.service           |    0
 .../recipes-support/ntp/ntp/ntpdate.service        |    0
 .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp/ntpd.service (100%)
 rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp/ntpdate.service (100%)
 rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp_4.2.6p3.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpd.service
diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend
-- 
1.7.2.5




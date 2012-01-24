Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RpfPB-0001AA-4Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jan 2012 13:23:17 +0100
Received: by eaal12 with SMTP id l12so687016eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2012 04:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=0NGRmwiJNAuBWViLDfpt/cjkoZDiPbF6k3J0zL+N49c=;
	b=HMP81csEOtzsD6B3XAMT8DsBuusN/csLbG+UbtthGK3Nu4Qq+hI4jNqYjJa3QBomer
	7UvS79MK8jwLvfAPmb4Aq2ijGmZ2l1nkJkZQ9h4WWDwKcAd7fQM+kSKxWGhsrRkcdU5Q
	J1an7y2mXoJvuKxDEBVO10g9xnTFGEb5RhlHc=
Received: by 10.213.108.210 with SMTP id g18mr2233388ebp.123.1327407331977;
	Tue, 24 Jan 2012 04:15:31 -0800 (PST)
Received: from localhost.localdomain (ip-95-222-156-232.unitymediagroup.de.
	[95.222.156.232])
	by mx.google.com with ESMTPS id r2sm66900145eef.7.2012.01.24.04.15.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 04:15:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jan 2012 13:15:36 +0100
Message-Id: <1327407337-28571-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [meta-oe][V2 0/1] gimp: initial add 2.6.11
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
X-List-Received-Date: Tue, 24 Jan 2012 12:23:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2
  Configure caused native libraries to be dragged in if libwmf-native was 
  build. This is avoided by --without-wmf ( as in the original oe-classic
  recipe.

Andreas Müller (1):
  gimp: initial add 2.6.11

 .../gimp/gimp/gimp-2.6.11-poppler18.patch          |  150 ++++++++++++++++++++
 meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb       |   24 +++
 2 files changed, 174 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/gimp/gimp/gimp-2.6.11-poppler18.patch
 create mode 100644 meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb

-- 
1.7.6.4




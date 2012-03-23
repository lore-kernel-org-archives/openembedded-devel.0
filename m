Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAyRJ-00062M-O6
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 07:57:33 +0100
Received: by wibhm17 with SMTP id hm17so1402065wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 23:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=H3Xce/JVG6m+yF2VP9IeOMhQpRV/O5+zzTE1PRirGCQ=;
	b=ubESz3y4Zo+4REFuTg58M20q49QzekUoTHubrC/Za27CoAA8WvC5hbOg7zW1LasUD+
	5PbtUQuSax+jJRGzpFvVfJ6zs5MIllTCy5mAbuU1SdagKtWLjMrRztENzrEVjPsQZ7Vg
	lax4G4IiyM1uy7CFvRnUgARp9sA2pPZ9DCcxc6hMu2kS+C5wLp8hAfAryLNmEQJGdZkg
	gEwQc1ujflVHfXIX1OBRYjkJR1TXlPiMpz1wqsjYiGUXnZru2PJEEoze8ix4hwSZrO27
	iX2VsRVmpbhGx+9HDRnWRdTWLT8v7zZ6SVzRF0X3po05+AzhX/bKrE0Zejkr9+4Bfu9i
	70tw==
Received: by 10.216.134.155 with SMTP id s27mr7230563wei.80.1332485318165;
	Thu, 22 Mar 2012 23:48:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k7sm19111376wia.5.2012.03.22.23.48.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 23:48:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 07:48:32 +0100
Message-Id: <cover.1332485253.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-oe][PATCH 0/3] kernel.bbclass update
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
X-List-Received-Date: Fri, 23 Mar 2012 06:57:34 -0000

The following changes since commit 986de01251408605161e0f8343866a0e7ffe7910:

  qmake2: remove (2012-03-21 13:50:44 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/kernel
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/kernel

Martin Jansa (3):
  kernel.bbclass: import s/1/True/ changes from oe-core version
  kernel.bbclass: import QA warning fix for unpackaged files from
    oe-core
  kernel.bbclass: populate /etc/modules-load.d/ with module_autoload
    entries too

 meta-oe/classes/kernel.bbclass |   64 +++++++++++++++++++++++++---------------
 1 files changed, 40 insertions(+), 24 deletions(-)

-- 
1.7.8.5




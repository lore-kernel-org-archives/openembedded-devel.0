Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RNQMy-00019s-Nq
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 15:40:16 +0100
Received: by ggnp1 with SMTP id p1so2366991ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=JQ0xcqKaazcFlMFfMcUp125oOJZF24CEYYE4yMI3LaI=;
	b=oxp2001dK5p7ulkSXYa1YiqEy9YjozUllVOeb33duUc6280/VGfOzQlDn0oosbldMV
	/24G9qx6DaaaNiB/2nRaD3S+vmD60MTyp/OtJNDV8HsGNll3hnRTe3axOEzLhK0/knT2
	ZK1hgkv4I/Jfn7/DIMYoFVEBhIGQbj5ilmO8s=
Received: by 10.236.77.131 with SMTP id d3mr34326209yhe.124.1320676438942;
	Mon, 07 Nov 2011 06:33:58 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l8sm56038679anb.1.2011.11.07.06.33.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:33:58 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Nov 2011 14:33:48 +0000
Message-Id: <cover.1320676389.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] SystemD support for dhcp server
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
X-List-Received-Date: Mon, 07 Nov 2011 14:40:16 -0000

The following changes since commit 81a402b1f62a2d0cdbf6713c11ae5c6d6c22346f:

  ca-certificates: update to 20111025 and clean up packaging (2011-11-07 11:52:31 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  dhcp: add system support to dhcp-server

 .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |   19 +++++++++++++++++++
 .../recipes-connectivity/dhcp/files/dhcpd.service  |   12 ++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
 create mode 100644 meta-oe/recipes-connectivity/dhcp/files/dhcpd.service

-- 
1.7.2.5




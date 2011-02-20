Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PrAvz-0006lH-1m
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 16:10:51 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PrAuk-00063t-Q1 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 07:09:34 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 20 Feb 2011 07:09:34 -0800
Received: from localhost.localdomain ([172.30.80.150]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 20 Feb 2011 08:09:33 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Feb 2011 08:09:15 -0700
Message-Id: <1298214559-9650-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 20 Feb 2011 15:09:33.0395 (UTC)
	FILETIME=[2E237A30:01CBD110]
Subject: [PATCH 0/4] Pin gvfs before making 1.7.2 default
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
X-List-Received-Date: Sun, 20 Feb 2011 15:10:51 -0000

With the recent change to add glib-2.28.0 and make it default,
we need a gvfs that also works with 2.28.0 and newer.  This
currently is gvfs 1.7.2 (which is in the unstable line).

Based on the notion that defaults should build, everyone that
pins glib-2.0 to something older than 2.28.0 now pins gvfs
and then we make 1.7.2 the default.




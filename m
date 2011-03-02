Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Puu7T-0005zV-Uw
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 23:02:08 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Puu63-0005ep-KC from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 14:00:39 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 2 Mar 2011 14:00:39 -0800
Received: from localhost.localdomain ([172.30.80.189]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 2 Mar 2011 15:00:38 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2011 15:00:11 -0700
Message-Id: <1299103214-30434-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 02 Mar 2011 22:00:38.0430 (UTC)
	FILETIME=[43C6A3E0:01CBD925]
Subject: [PATCH 0/3] Update policykit, lock distros to older versions
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
X-List-Received-Date: Wed, 02 Mar 2011 22:02:08 -0000

Hey all,

policykit before 0.97 doesn't really support building without
pam support (which is why the DEPENDS isn't conditional).  This first
locks kaeilos and angstrom-2008 to 0.96 (as 0.98 of policykit requires
glib-2 2.25.12 or newer) and then introduces 0.100 as the new default
and keys auth based on the pam features.




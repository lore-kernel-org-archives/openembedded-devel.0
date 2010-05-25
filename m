Received: from fg-out-1718.google.com ([72.14.220.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OGuIb-0000e6-AL
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 15:36:01 +0200
Received: by fg-out-1718.google.com with SMTP id l26so279492fgb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 06:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=qPWBpCN117mEdeiJqJe5bhIOr81/ei5b+5qomtnKsQ8=;
	b=gKXOYTDyDdzwVqj46Vc6YxQvBn2Mf9h0yU1wWQ2wIEo6offwOfwsLZOBVT+Fs1hlQR
	xniaeudvnXT3+yAtuu2V5nmIEzotWOLCcMQMVwiEG/2uPsKflnonw2AVsp4nF3d8qeMg
	OCwhpWebZSdrfCg0IhqF1urFmSLnnqkK5DZS4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=EVD4X1cDMemqvt4uPfjfiHuN3HQQOqNNKHetFfmFTcKn0OV3z3FY/yLH5MI6i32O74
	d925CJD7Yzeb+FOl9FPRWph6ZcdqEdMuAdq/jIl8xxz26tv2cdPyLMUVLRdqs6pkSDud
	tvFAv5x30wTYmWisTNAkWf3ZoGOKK4KPHjRhg=
Received: by 10.223.26.69 with SMTP id d5mr6237582fac.20.1274794288732;
	Tue, 25 May 2010 06:31:28 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j23sm24823626faa.14.2010.05.25.06.31.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 06:31:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 May 2010 15:30:22 +0200
Message-Id: <1274794225-16222-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: linux-openmoko recipes cleanup
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
X-List-Received-Date: Tue, 25 May 2010 13:36:01 -0000

Hi,

I would like to clean linux-openmoko recipes a bit 
(as I'm also responsible for this mess by adding -shr-devel, -shr-drm-devel and all 2.6.3*). 

There are:
linux-openmoko-2.6.24_git (old stable)
linux-openmoko-2.6.28_git (stable branch)
linux-openmoko-devel_git (andy-tracking branch with old SRCREV)
linux-openmoko-shr-devel_git (andy-tracking branch with few extra patches and newer SRCREV)
linux-openmoko-shr-drm-devel_git (andy-tracking branch like shr-devel + DRM patches and WSOD on resume)
linux-openmoko-2.6.31_git (om-gta02-2.6.31 branch + DRM patches and WSOD on resume)
linux-openmoko-2.6.32_git (om-gta02-2.6.32 branch + DRM patches and WSOD on resume fixed in newer revisions)
linux-openmoko-2.6.34_git (om-gta02-2.6.34 branch + DRM patches and WSOD on resume fixed)

I propose to drop not much usable linux-openmoko-shr-drm-devel_git and linux-openmoko-2.6.31_git.
Merge linux-openmoko-devel_git linux-openmoko-shr-devel_git to linux-openmoko-2.6.29 
(andy-tracking is based on 2.6.29-rc3).
Rename all recipes to PN_PV scheme ie linux-openmoko_2.6.34.bb (many git recipes doesn't have _git.bb too).

Update for machine configs is part of 3rd patch. I don't think there is many 
users of those old recipes so if nobody NACKs I'll push it tomorrow.

Regards,




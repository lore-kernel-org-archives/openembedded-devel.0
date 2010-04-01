Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NxM6f-0002me-QI
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 17:15:52 +0200
Received: by fg-out-1718.google.com with SMTP id 19so366309fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 08:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=TN2N41/Uv9XuDR2Ebji3lJoVHFuA4SWbHukKwTg2Smw=;
	b=gkftPvhSU0Rw4vZtIH3ltFK6qwqASRYryIUAypNI84qdTXn7C4w7ij4Y2jklvXns05
	DQuxgbnrw0/G8P4x0kB/jgqG/2kZpqwGOZLhEHw6W/ZuxR9FEkDFCS0cqngBnGFlBTfL
	V4s6Tr6tcb4ObS3+kQPvCZW/Sm7GZFcl7bY+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=JvpDEQftTYtygurpK17ItogPGrUyUHHYWKscWktnNP17IsR0DB2wrG1XQzlmNdvGy6
	9mbi+/JTx78vGOQHiLSzxD8rbc2ixq/TevM4R8+Jm1eeIBpVFiTCsoNr6iBEfDpXbAdB
	GlSAOgK0+QT0V8KOCp4RhpQAk0u7JFo9ewdUA=
Received: by 10.87.70.7 with SMTP id x7mr2171209fgk.77.1270134699229;
	Thu, 01 Apr 2010 08:11:39 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm5658384fxm.12.2010.04.01.08.11.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Apr 2010 08:11:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Apr 2010 17:11:49 +0200
Message-Id: <1270134711-32158-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.3
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: sane-srcrevs.inc: moving all svn SRCREVs to recipes
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
X-List-Received-Date: Thu, 01 Apr 2010 15:15:59 -0000

Hi,

as already said here, global files are common place for conflicts and SRCREV
belongs to recipe metadata.

This 2 patches are moving all SRCREVs for svn recipes, with some cleanup in few
places, like renamed package to show it's from svn, or unified PV to contain
+svnr${SRCPV}.

Please ACK or NACK soon as this gets conflicts soon. If there is no NACK in 20 
hours I would like to push it. Thanks

Regards,

BTW: git SRCREVs weren't moved to recipes only because I'm maintaining SRCPV 
branch and I don't want even more conflicts, I'll move the rest as soon as SRCPV
is allowed in oe.dev branch for git recipes (please....).




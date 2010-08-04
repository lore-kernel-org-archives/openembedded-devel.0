Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgjAR-00063R-MP
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 20:58:34 +0200
Received: by pzk2 with SMTP id 2so2204163pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 11:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=x4Vxv+yR3Etfhi/4auZICaJoxOcf7XMnKMc1z3JN/yk=;
	b=kiTX2lZAO6iwU56Wt3Vr+3B6JiXWVwPaVkDO/DFLjlT11U3kWqnI//MFcxdRiRcur5
	6e+Dy3EiSjQ+wv5mqIp1JF+W9f6f547Ohx58lYHxmHuIqtb5P2UrXDn22iWcztuau9/U
	N3jjQBBvmvF7mESive7O7P87NF1EPbNdgs2xw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=LYusECLqoFnyV0KG7aQKc/KhfekFKfFqCmHXWmY8XryHME15eyQH5MwKQAw6j1ONXX
	20gGKvLJeDQC1aXStrIEECZpecWzVA5pKVmomWaTQyPecPnw9s60uxKFDQOn3jgNgM6s
	jA9eYX+epc1QmhJbs+gJbN4C6+8jkhv4G2Wcc=
Received: by 10.142.215.7 with SMTP id n7mr8190312wfg.194.1280948292821;
	Wed, 04 Aug 2010 11:58:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm10876016wfl.1.2010.08.04.11.58.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 11:58:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 11:57:58 -0700
Message-Id: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/7] recipes: Dont inherit autotools_stage (revised)
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
X-List-Received-Date: Wed, 04 Aug 2010 18:58:34 -0000

Hi

Following series of patches are for getting rid of
autotools_staging class and its usage. Its replaced with
autotools and staging functions are replaced

Please test these patches and if seem ok provide some ACKS/NACKS


Thanks
-Khem




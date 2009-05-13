Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2K-0006OE-5l
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:04 +0200
Received: by ewy20 with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=Z6QxUk2aSqLUQEBqpLbTyTSj2uloGbneWgFsMI50FEU=;
	b=Xp+Lg9lp8uDeC+Z8xGnZmoGhb8I+epTZ7565omWEGPKeVfGzTI736+3SszDjavviyh
	MQFZ69dfgk4R4c0lyuYXyLhgS6ZdesTrAzfsLbin0zYvIGqV+nroyVKIp9nzAtnakLLW
	c5GxTxUno3jHHHSO6fkDwBfCglQMmGUtU8K+U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=SS0tUSNR9p4rakdLcUquSfjId/P3OpzkRTMDAyXLqGpEIa1F/Zd1pWok51Qwyb+xkM
	Ix9CivSZsdW6Fv+uTCn0SxbPmPB+PGZiNEQGcOlpUmL2aDwY/L5cf2zjH1AVXEmfm6zD
	qo9uB/1D8GFcN2q5aQBxJSSRGME3HGh5vqltw=
Received: by 10.210.115.17 with SMTP id n17mr85676ebc.55.1242207559252;
	Wed, 13 May 2009 02:39:19 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 24sm2185015eyx.33.2009.05.13.02.39.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:18 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:39 +0200
Message-Id: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Subject: [STABLE][PATCH 00/37] Fix install -s problems
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
X-List-Received-Date: Wed, 13 May 2009 09:46:04 -0000

Hi,

In preparation to merging the coreutils-native improvements to stable/2009 we need to fix the associated problems with it. This series cherry-picks 37 patches from .dev to do so.




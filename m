Received: from mail-fx0-f65.google.com ([209.85.161.65])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87eC-0001Wk-2E
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:34:17 +0200
Received: by fxm20 with SMTP id 20so290398fxm.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=aUvhoDpnas3LGpBmYuw8gPjEijSaYaZ1QPPTSs2wr9g=;
	b=tjlD1ikq4PpcS+0q8IgYEF26mD+bBl/SUPJmrLa9FPV9EO1hroxPec2cx2GubXEL8B
	2oTVelIpiT6Vvkpk8QqPmmIct1xFE1B/Z8F9J2o/FHx/fWeXcRi/FKrqgS8kG8FUAoFj
	Bp/+gLPYZ4v1Yh75gsEL2C2Qm8dccAsTfymww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=tiApy1YaoPJ1i7/BDvPiJtlUbReJjqOTyE3+DG6ZNy90VdqGXAQnIbXq17ffzRPibE
	dxy8dAYcpxrKTocl4d0I+BwWjMGHBmZLfbLwZXGWxPeqRidVhYKLPTKZuu7VhPH58sLW
	X9tJU1D6pJnjuUZEhbQXzXWfxC7PbjbZ+QeeE=
Received: by 10.103.174.8 with SMTP id b8mr3742898mup.78.1287477221296;
	Tue, 19 Oct 2010 01:33:41 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id s18sm4725823fax.34.2010.10.19.01.33.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:33:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:14 +0200
Message-Id: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
X-SA-Exim-Connect-IP: 209.85.161.65
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Moving openmoko recipes and classes to obsolete
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
X-List-Received-Date: Tue, 19 Oct 2010 08:34:17 -0000

I was asked few times to cleanup old openmoko recipes.

Openmoko as distribution was obsoleted on Aug 10 2010 and SHR is marked as 
successor in that distro config.

Yesterday khem asked me to fix libmokoui2 or obsolete it. We don't use 
libmokoui2 in SHR and seems like nobody else does 
http://tinderbox.openembedded.org/packages/libmokoui2/

So I started to obsolete it and recipes depending on it.. and when it started
to fall apart I've moved last remaining parts to obsolete too.

Please check this patch serie if you found something usefull for you and if yes,
then became maintainer for it (as nobody seems to care now).

BTW: I have nothing against openmoko company/distro/recipes/machines :).




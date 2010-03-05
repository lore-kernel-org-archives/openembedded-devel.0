Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NnWA9-0006mG-5x
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 12:57:50 +0100
Received: by fxm20 with SMTP id 20so3761003fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 03:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=cNZAV2sVHlX5EOfymS3lVxIh180cxn0A+ebfDy0VQpc=;
	b=Jgx/+rSJGWMLvY8kCmINtONCU9u1nfr1pB/SI22pJWsO7ITDF1LUwzvAIZRfBKwW/b
	YRETaUld2+i5dfmRxi0mBx5oICjHAWF1znLklt1FYHqr2LaucpBFm7kWZxZBL3PLgLn6
	GPWXFVCs9ZiLhxGXrGIF0bi6jCWVr9T5RouYc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=J0gJCqYwdlmvqn5DLslKo2CbkNhvvqCffN/tx4D/tiuKgQq4JcLaVuQF4jE0oJkAo8
	pDvjbn9oiwbQ5u91IhsAxmrtcApKmLBafkgbK2Kd3h2xRJehbS3R3ctaiA6PZgvOucNj
	rRUePUSV20d4GtLK/1X+Xkr9tis0mUqn0aF8c=
Received: by 10.87.40.12 with SMTP id s12mr1111931fgj.38.1267790096243;
	Fri, 05 Mar 2010 03:54:56 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1104979fxm.1.2010.03.05.03.54.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Mar 2010 03:54:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Mar 2010 12:55:30 +0100
Message-Id: <1267790132-25931-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: busybox-mountall util-linux-ng-mountall collision on /etc/default/mountall
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
X-List-Received-Date: Fri, 05 Mar 2010 11:57:50 -0000

Hi,

util-linux-ng.inc has
RREPLACES_${PN}-mountall = "busybox-mountall"

but it still doesn't prevent to have both installed and opkg upgrade fails
Collected errors:
 * check_data_file_clashes: Package busybox-mountall wants to install file /etc/default/mountall
         But that file is already provided by package  * check_data_file_clashes: util-linux-ng-mountall

We can use u-a for that config as suggested in 2 following patches, or add maybe
RCONFLICTS_${PN}-mountall = "busybox-mountall"
and lowering RDEPENDS to RRECOMENDS for ${PN}-mountall would be enough.

What do you prefer?

If nobody reply today, I'll push this with u-a.

Regards




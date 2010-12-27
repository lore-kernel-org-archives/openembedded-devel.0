Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bgamari.foss@gmail.com>) id 1PXIPG-0000zd-WC
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 20:06:59 +0100
Received: by qyk8 with SMTP id 8so9289717qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Dec 2010 11:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=Zd9OTy5TAsbzAJYVfTQEvsUDg0vqa1IGXiY1TgY32NY=;
	b=T/gzdBScTcf2JJfDddtyNWw9h7vewh+CRpUaONPrAAttzm76cZk5SbD5CvTSs0hFxv
	iKa5RV7tF3t03YolTOWGI2CuhO8ErMfWU8Tiy/hJ17HnN8N9UNgwYcQ10OwzYMbuzbU8
	KuqTAxczlnWXJYj4WS6AE9aOXMa0uHIzEKuqg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=OV/NIP/5D9a3bILZVnPSQzgmPAMNfwSMz1e2f/qxKmAw4auiyHjMFfu2QoT3U800tr
	BKXawovRb/bisKn10uLE836fE/5fEXFkxehyVGWT9p6oUTvuPNkb88mfiiwTlrFvYDR9
	U0igtTwh5t+grpFPQHnE8AZvajGDViXAimPzg=
Received: by 10.224.2.79 with SMTP id 15mr12049981qai.177.1293476391551;
	Mon, 27 Dec 2010 10:59:51 -0800 (PST)
Received: from ben-laptop (c-24-61-223-13.hsd1.nh.comcast.net [24.61.223.13])
	by mx.google.com with ESMTPS id p13sm7119717qcu.5.2010.12.27.10.59.50
	(version=SSLv3 cipher=RC4-MD5); Mon, 27 Dec 2010 10:59:51 -0800 (PST)
From: Ben Gamari <bgamari.foss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Dec 2010 13:59:44 -0500
Message-Id: <1293476385-7289-1-git-send-email-bgamari.foss@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: Python 2.7.1 support
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
X-List-Received-Date: Mon, 27 Dec 2010 19:07:00 -0000


I spent a few hours over the last few days forward porting the python 2.6
recipes to 2.7.1. At this point I can build both python-native and python on
for my ARM target. I don't have time or access to hardware at the moment so I
can't test the produce binaries but I figured I'd send this out in the name of
release early, release often.

If someone has the time and inclination to test this, I'm sure it would be
appreciated. I believe the 2.7 series should be API compatible with 2.6, so all
of the existing extensions should work unmodified. Are there any other barriers
to merging that I haven't thought of?

Has anyone thought about how we are going to handle python 2/3 coexistence? Or,
even better, has anyone looked into putting together some recipes? 

Cheers,

- Ben




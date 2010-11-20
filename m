Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <luke.leighton@gmail.com>) id 1PJwGP-00065r-V3
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 23:50:34 +0100
Received: by qwi4 with SMTP id 4so680182qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 14:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=gFwt0+vxEsrMXlELpe+7d2XMteA/tbJS/pb8AZRNbMI=;
	b=xOGg+nAHn0BRs/pSDJnTogFcyhx5knzEn2zo3/ATkGphn9iNNPNETjzNObdlc3vqyK
	sEe7owXBlcBmk/OAg3PD8lCVE5w5NS2azodQPTwXUD/hslGKwRN0WXTjcDB/ZbrIshVU
	AnGesWBfNjaoOltAL3W4x/4DRleNFjEvLqFEc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=FTqCQ7iVX4NJ2x3I15hT4xAejk4DpB59+lByXzyD+8EQZDfk2+zQiKdIpPn3NHC1+C
	ieExDwfu8ONVJBVkGIZi+h21bjhfWKgWlj4UbirpShLrRHqOCIvfvjnO3u6zLbkKvZEo
	zFfwsgRU96FknIQ9H52OaTQlRFzJ1N7TMEMJE=
MIME-Version: 1.0
Received: by 10.229.241.194 with SMTP id lf2mr3389930qcb.164.1290293363519;
	Sat, 20 Nov 2010 14:49:23 -0800 (PST)
Sender: luke.leighton@gmail.com
Received: by 10.220.112.210 with HTTP; Sat, 20 Nov 2010 14:49:23 -0800 (PST)
Date: Sat, 20 Nov 2010 22:49:23 +0000
X-Google-Sender-Auth: 87WwQDY1TqQJ6EpAUIDsFECGbGU
Message-ID: <AANLkTinPGphYW71Ec6u7-BjWnqtW1sg-cggK6TnX08Xf@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: luke.leighton@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [patch] v8 recipe
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
X-List-Received-Date: Sat, 20 Nov 2010 22:50:34 -0000
Content-Type: text/plain; charset=UTF-8

http://bugs.openembedded.org/show_bug.cgi?id=5486

this is a recipe for a stand-alone libv8 _not_ as part of chromium.
it's part of an ongoing effort to get webkit dfb and other webkit
builds to build with v8 on ARM.  it depends on #5485.

l.



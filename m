Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UcDqI-0004sx-1S
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 13:56:32 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz10so387070vcb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 04:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:from:date:x-google-sender-auth
	:message-id:subject:to:content-type;
	bh=TaiWGHdKge4Kv8AGJ9olKQbz3jOyUeLA1DEgnByCckc=;
	b=sFwbUyRqbIIr9BBQnOFiRIkKzLY6QohfRWkySFnvYJFVOAWs9YE5ZhI8NFpPxoXY1V
	C1+o5WvhVLGE8ELIwehz0Tv4DGcR29fosINSuxgspi+I/oKtOkAF+0vYV/9JiSPlrHnX
	Kx6qstZxiAA++ltUaDLoH57WuHZcu7Wk7JzmtdEH/xVmW8MYU9blHUTlCfiM1aZeQ3ji
	y5psI6cuHEXBFjSJGTvnT0GYwPS9sVr2CoTD7odhKhf8dr9ZDyZLVFS/i7baLABP2OBs
	5cxo5MgzhFjedm4sEtcuYY0J1Gbv96cuyx8jOiufIU0WnR2OCXOUD2G9bgOB/RqST5CL
	h65A==
X-Received: by 10.58.132.232 with SMTP id ox8mr21372647veb.45.1368531496805;
	Tue, 14 May 2013 04:38:16 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Tue, 14 May 2013 04:37:56 -0700 (PDT)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 14 May 2013 12:37:56 +0100
X-Google-Sender-Auth: h7MkzF7B6EMp_5p8zjlqpgdS4Qk
Message-ID: <CANyK_8dZ+LZtpXhQ27frs6wX6PVzdBi=aHAeoJTQQKKwL+M-0w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] Unshipped systemd files
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
X-List-Received-Date: Tue, 14 May 2013 11:56:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

This is drawing on a build done over the weekend so apologies if these
have already been fixed and I've missed them.

gpsd-3.7: gpsd: Files/directories were installed but not shipped
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/gpsd.service
  /lib/systemd/system/gpsd.socket

zram-0.1: zram: Files/directories were installed but not shipped
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/zram.service

cloud9-0.6: cloud9: Files/directories were installed but not shipped
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/cloud9.service

Further QA log and build details available at
http://www.paulbarker.me.uk/yocto/20130510_poky-raspberrypi_userland/

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk



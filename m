Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1Osk4p-0005jU-SZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 00:22:13 +0200
Received: by wye20 with SMTP id 20so5198094wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 15:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=rweECwjUK0kL47kq6TtsNlCEzbSCfKV7Ry4Gu9wV4Pk=;
	b=EnmzEogUGZZ6+A9UDrJHabfg5hsTXCmb490JRv9GXYvR0wBbb78XTU9/ves3DANmEO
	WrEmvyvamhomp+Z76Cwn/+JPoPkz8KAD4Q6aQfJyrhSB+I7JHQCN/zKRxBaZ+Tg1W9Ox
	B1VigrukHqhF6zyaNr8HZqFQZDHcgqnhTRabk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=MMa76b6Z+Kp/V8awmNjh9gJeK1syRst1TWc/ZC36zVy4NZiNDp5dkfsyfHVjOpK4iC
	ry2iTUf6PqHWb4DeyFDc+oEjLI7mJg3+hAAgIdL1+oUwkMa/rDVdJodIPk8M8W8N3eiX
	qWffVsFozQtgtdp4WxGWNJdx/u6yVPQVN7vcg=
MIME-Version: 1.0
Received: by 10.216.179.137 with SMTP id h9mr2804586wem.39.1283811692032; Mon,
	06 Sep 2010 15:21:32 -0700 (PDT)
Received: by 10.216.16.193 with HTTP; Mon, 6 Sep 2010 15:21:31 -0700 (PDT)
Date: Mon, 6 Sep 2010 15:21:31 -0700
Message-ID: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Mon, 06 Sep 2010 22:22:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Using current top of tree to build some of my images I noticed that
quite a few apps seems to be broken at run time (Firefox, Epiphany,
Gnome-mplayer, and others).

All were complaining about libstdc++6 being missing.  Manually
installing the libstdc++6 package fixed the issue.

Any idea what changed that introduced this issue?

Steve



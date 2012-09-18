Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TDzSB-0000xp-4w
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 17:11:11 +0200
Received: by obblz20 with SMTP id lz20so10744657obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to:cc
	:content-type:x-gm-message-state;
	bh=q+Gf60Bc+PGAjzIcsS4OTJF8c/gbbgxx9qYqKTx6QQw=;
	b=c6NaVXwWnJvtvRP080lUSYzIHu5w9VOkm1gvLxR/j5BMCZYxD/7XNuX49lvS25zX4q
	pyVM5AsDoq/Am77/+XeWCow+9KtOSspRb0VCZu8EMm3r6+ez8yDaczhBDD+MT1qrAl2L
	BjopBx6KDPdtktrOG5q3ML8BUDmRjEiEdk3fWFp1QgLsXqy2LtToYkfczqz2/hFLEFKo
	Ya0+KKjXUrHiShx13Hm1i20xi4T3tmwN/zqgyLNPsQB6Ham9ObsHS6BxSErqStKXlAFB
	TVOY5wbg457qH++PnF/VRn0tXBrkT1msoPVTAkxlLFdjXoghXATjtbkbGL+bwcyLbGE2
	qQZQ==
Received: by 10.60.13.37 with SMTP id e5mr88954oec.98.1347980310573; Tue, 18
	Sep 2012 07:58:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.93.35 with HTTP; Tue, 18 Sep 2012 07:58:09 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 18 Sep 2012 17:58:09 +0300
Message-ID: <CAK18fxHzC+3nrhVbsntm+3DbF=pzwtZoF8R0EcZ33z3G4uv9Mg@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn24aIUkHn2077obenOsrgoAB3gkwFJqvMZm0OrYYpVemph6rnW4svwzNrQj+hl3UMT/IEG
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] zram service in meta-systemd
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
X-List-Received-Date: Tue, 18 Sep 2012 15:11:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I would like to move the zram service from meta-raspberrypi to
meta-systemd. This is not specific to raspberrypi and can be used by others
as well.
Koen, what do you think about this move? And if so, what recipes directory
should i use? recipes-extended?

ag


Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id C548975EE7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 12:58:32 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so116877719qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 04:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=G06PrLcWwB+CZkR+YPhTAn5fPKcpcA7thGbbLsZnJhw=;
	b=yw5KyTM8S5Ub3/90ckkv6fJ30nQFkka5sQog7sMD9LXmS9Qhr7u4dHtKIP7tSKjrRW
	Z65/goQUgUYQ6KBN3fNfVj9ZoEHJK1kTNyD11EubFAfVjuEwhEYUvvsxQAD3Vp1p0KsO
	telZS4XtZx4WThIVIhr/tbP8RGNnf9q1rODEFLPlN0LfwiPRvGSr+kW4djTo7I9+akv3
	2i4xbGGXbD6ELy+uUAc8G6v1J87Z4uNgTCfsOIuN59MN9PeR9kpKzDqERt8qczqscRIw
	CbnjvhjaD11u1hQtCxEBlONpt6WzHF91TD0+lZOGJ2faj3TGwsNepTsrJ631T4baYm7H
	rYzw==
X-Received: by 10.140.169.5 with SMTP id p5mr4122414qhp.78.1447160312523;
	Tue, 10 Nov 2015 04:58:32 -0800 (PST)
Received: from localhost ([177.100.174.62])
	by smtp.gmail.com with ESMTPSA id 44sm1246547qgh.11.2015.11.10.04.58.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 04:58:31 -0800 (PST)
Message-ID: <5641e9f7.af138c0a.d2160.560f@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Tue, 10 Nov 2015 10:58:27 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Tue, 10 Nov 2015 10:58:27 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-browser (master) in 2015-11-10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 12:58:33 -0000

Hello,

I pushed following updates:

commit 06aab8ea56aa130f26a3651fc3a370fba3d967f1 (HEAD -> pending, origin/master, origin/HEAD)
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Mon Nov 9 21:04:59 2015 +0100

    cef3: rework "fix build with gcc 4.9.4"
    
    The link errors addressed with commit
    '7887e66d5df998b91d4df24a150c32a692784451 fix build with gcc 4.9.4'
    occur only when linking with gold.
    Thus apply the fix only if distro features contain ld-is-gold.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7C68F736BA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Apr 2015 19:54:16 +0000 (UTC)
Received: by qgfi89 with SMTP id i89so494917qgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2015 12:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:date:to:subject:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=Y3ocwMgFU4R6H++o8x4v5TIPVH4cd9EUk5S1rVgOYms=;
	b=zBQ3y4f/ZBfCqDulMp1P2ix5IFvRSFuElJbgbNLomt07rjpLH5cA49wVRESGrw2iBl
	o5ANZa8pxjkadImEEcjYd11DlmrHbpU0+3UScOFFVC/HihjuMe/X7dMXaD1smhxNWEwM
	DIBcknI/fw6cz12SUqcXPz/G3nk3lbqcR+TyZioZzYO9ydtVMYmAMTgZs36jwJh6W6mZ
	11TE3HOF0WGVkHYWYSQ2sasyKGU0Gdx0k28nL4USnNn6TxEkDU8jres+Bqj2t1eqIvxm
	qIzxpnfrQixJFz1dIUzljmS5WyFRb/pOxfLqAIyl9W8kpHqBMxuOZiPbOb1ksZZo2Tt9
	Snxw==
X-Received: by 10.229.61.134 with SMTP id t6mr9508485qch.7.1428177257082;
	Sat, 04 Apr 2015 12:54:17 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id g64sm56447qkh.18.2015.04.04.12.54.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Apr 2015 12:54:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
X-Google-Original-From: otavio@nano.lab.ossystems.com.br (Otavio Salvador)
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id E34AD1CDF57C3; Sat,  4 Apr 2015 16:54:12 -0300 (BRT)
Date: Sat, 04 Apr 2015 16:54:12 -0300
To: <openembedded-devel@lists.openembedded.org>,
	listing@nano.lab.ossystems.com.br, Mailing@nano.lab.ossystems.com.br,
	Meta-OpenEmbedded@nano.lab.ossystems.com.br
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Message-Id: <20150404195412.E34AD1CDF57C3@nano.lab.ossystems.com.br>
Subject: Updates to meta-java (master) in 2015-04-04
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
X-List-Received-Date: Sat, 04 Apr 2015 19:54:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

I pushed following updates:

commit d5a2a31aaad8f6bdf19860f7a858b10d7dba08b6 (HEAD, origin/master, origin/HEAD, pending)
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Sun Jan 25 23:11:51 2015 -0200

    openjdk-6: Add libxslt-native as dependency
    
    The build system looks for xsltproc during configure, when bootstrap
    is required, so we need to have it around. This has been catch when
    building the recipe in a clean tmp directory.
    
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


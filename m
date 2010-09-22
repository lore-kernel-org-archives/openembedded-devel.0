Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OyClu-0002hC-LK
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 02:01:57 +0200
Received: by pwj1 with SMTP id 1so25737pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 17:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=zliVd7pHWDeMOXxxDAp9hu/Trofnl6uU7NN7LosimhQ=;
	b=gXYlu+QwifCwd5bfWjKLLhHWq2hJJSD/+z0MuMT68g7LACkxE/SuW27jRujkYQ5tBG
	NZ1G/6suGaZXZ0vahVKqIlDreL4MxxgWyiqAS9R3Sj7F06lQac3jeVLC/rH/Dit+qqtD
	u5cVRVXBT0cxQ4EC+1Jd/wFzQ7M9ph41su21k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=N6ZvlHH1Z4oT3F2WB2YiaH1rLf+UOglt3K1tr3DmUaetoFmg1N6+kOy3luHNqqGV9W
	ec/XQwHgXJTvycu8O04/ofWG4XM1e1h2ZDYv8Msu+WvBpY7Zm0nzM/q/Vky4v814FNfC
	URGuYDWMOhLFlNjgJMLG8tlEuDVjvt3rjC+qE=
Received: by 10.114.208.20 with SMTP id f20mr12783516wag.69.1285113667788;
	Tue, 21 Sep 2010 17:01:07 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	d39sm16437396wam.16.2010.09.21.17.01.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 17:01:06 -0700 (PDT)
Message-ID: <4C99473D.9020308@gmail.com>
Date: Wed, 22 Sep 2010 09:31:01 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u-boot-env.bb: Mark as COMPATIBLE_MACHINE=neuros-osd2.
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
X-List-Received-Date: Wed, 22 Sep 2010 00:02:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/u-boot/u-boot-env.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/u-boot/u-boot-env.bb b/recipes/u-boot/u-boot-env.bb
index 1bee272..35c467b 100644
--- a/recipes/u-boot/u-boot-env.bb
+++ b/recipes/u-boot/u-boot-env.bb
@@ -4,6 +4,7 @@ PR = "r1"
 
 inherit kernel-arch
 
+COMPATIBLE_MACHINE = "(neuros-osd2)"
 SRC_URI = "file://default-env.ascr"
 
 
-- 
1.7.1




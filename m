Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PIZdp-0006qF-Rb
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 05:29:07 +0100
Received: by gxk2 with SMTP id 2so930060gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 20:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=C2yoEz882lYv3p7idIsgj8mj6tnn+iR9jvHBjQprhxc=;
	b=nZoGMLBciQQyT/bfaRiwqB3Mllgh0Ovp/HeR1nj+FYZb/bgNs0fW/WKDbBiC4P0BwL
	3JvF/S+JHIB3MukGAz2DCTkrFc5zMje8q5WWImKtNuWZOPvhYy+qXeVelTwSIhn2d9IT
	ve/sPwfFIOMOSN+SRomu+0hg3WRtJB0Zx5M1c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=ezi7Zq1ZvvykWi1rltA6nNXIf6bjG7NY5kXySkGdWXg8fCbIVFt4PTyM2Yz/bNZb+y
	3m9WHVYbeVuAdelvxGTjUrZq0igpCaxaEhG9FEYKAyFZYePgBalAucO+5Am+qphdhdz3
	dEdrpUOlkW5uzkHvFrct/VIV9RWob9SGSi4Rg=
Received: by 10.151.9.3 with SMTP id m3mr13173065ybi.183.1289968078373;
	Tue, 16 Nov 2010 20:27:58 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id v8sm4386584yba.14.2010.11.16.20.27.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Nov 2010 20:27:57 -0800 (PST)
Message-ID: <4CE359C8.5030808@gmail.com>
Date: Wed, 17 Nov 2010 14:57:52 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sane-toolchain.inc: remove duplicate line.
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
X-List-Received-Date: Wed, 17 Nov 2010 04:29:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 conf/distro/include/sane-toolchain.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index 6d460a2..100009e 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -20,7 +20,6 @@ PREFERRED_GCC_VERSION_486sx          ?= "4.3.2"
 PREFERRED_GCC_VERSION_avr32          ?= "4.2.2"
 PREFERRED_GCC_VERSION_bfin           ?= "4.1.2"
 PREFERRED_GCC_VERSION_xilinx-ml403   ?= "4.1.1"
-PREFERRED_GCC_VERSION_xilinx-ml403   ?= "4.1.1"
 
 # This is unrelated to the kernel version, but glibc and some userspaceapps require a recent version to build against
 PREFERRED_VERSION_linux-libc-headers ?= "2.6.31"
-- 
1.7.1




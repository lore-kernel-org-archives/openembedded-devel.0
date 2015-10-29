Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id A07EA73695
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 11:06:37 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so30523151qgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 04:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=FM166gKNc0/ZWyGlFK5ZHUxiykxKzd5V5PB8g4iPynE=;
	b=a4q/btE0MfS59HgPMc8AaBSjXGQFZMz9mFhNXj0NrQt7zq8VkdVL2g2mNjbaovKE/5
	zZYj3AwPdrhu1AWqxDnb6hzB40WkPeuQMK8QFaJDYcZLYSqDRtkdK5RZkA2Y+bw0ScVU
	ogPTpm0iQ8ZMPn+zbpzaFZxXj13VkLdA2TlqNxOHStt+P4Rhuvu4rs0/Nwa2ZYcUE0dh
	ico10yieqYSlUFNydw8EIyFc1KHWPUF9jTI0TDkFbUVCPRkpOFrUW5kdG3c8FXfOM5R7
	TVrHzGtMRisMC9lAeEAWUX93SgVPUTtV82NVTvHny2mMnCs6r3l+7pzAMY9l2/khde+F
	iNaw==
X-Received: by 10.140.106.7 with SMTP id d7mr1217957qgf.98.1446116798029;
	Thu, 29 Oct 2015 04:06:38 -0700 (PDT)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	f133sm102222qkb.22.2015.10.29.04.06.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 04:06:37 -0700 (PDT)
Message-ID: <5631fdbd.8b51370a.27a8b.09a5@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Thu, 29 Oct 2015 09:06:32 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Thu, 29 Oct 2015 09:06:32 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-java (master) in 2015-10-29
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
X-List-Received-Date: Thu, 29 Oct 2015 11:06:39 -0000

Hello,

I pushed following updates:

commit a88718b6a6ec2a9429cbfd364d590ae69eb661e4 (HEAD -> pending, yocto/master, m/master)
Author: Jens Rehsack <rehsack@gmail.com>
Date:   Wed Oct 28 18:58:24 2015 +0100

    Avoid parse time errors due to dependency on x11, for distros without x11
    
    BitBake raises some errors when processing recipes that depend on x11
    for distros that don't have x11 in DISTRO_FEATURES. To work around
    that issue, REQUIRED_DISTRO_FEATURES = "x11" (from
    distro_features_check.bbclass) has been set for the following recipes:
    
    * cacao (_class-target)
    * classpath (_class-target)
    * jamvm (_class-target)
    * openjdk-7-release
    
    That makes BitBake skip those recipes during the cache generation
    (they'd still be parsed, but ignored).
    
    This patch improves the idea from Mario Domenech Goulart <mario@ossystems.com.br>
    
    Signed-off-by: Jens Rehsack <sno@netbsd.org>
    Acked-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


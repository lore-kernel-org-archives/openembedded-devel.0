Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <castroenrico@gmail.com>) id 1LoXCG-0003zg-1N
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 08:11:40 +0200
Received: by ewy20 with SMTP id 20so2226513ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2009 23:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=Jrn+mfMX4UCk7bCFrLAcq9YLjLOfwBvPHK1wzz4KDh8=;
	b=AQQKQ1Vpd+d8uW5/lJQ44cJ+RZViJNdTWBUPTIEZk+fDpENg+cROja8y0PCwTE/SHi
	uJc7VnzNW7loDNsMu1/ry59RNxL21XuMq4vcdekO4kGZqApO5HXvJmG2MHm26gT5UEz5
	9GTNdVjRuG4TG7dWwqvYlDOrVsfmQvv5zp+7I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=FEuS2F6+4nHyaL42Fb+nTg55wNEZIXCbHORWeaB/7poRX6JiEqj+TBicwd7+K+uV/H
	V89XKXEH/6xeQnzYTCm6s81NvVzBov+8gHCnLgvqoogWHLu0ch1dIs5n4jDUVsYdmFwh
	LoplcmIpbBn9m6u/SSpzzcYcOeJTvXB2++yT0=
Received: by 10.210.86.10 with SMTP id j10mr3254097ebb.41.1238479767290;
	Mon, 30 Mar 2009 23:09:27 -0700 (PDT)
Received: from ubuntu.redarrow (net-93-144-44-111.t2.dsl.vodafone.it
	[93.144.44.111])
	by mx.google.com with ESMTPS id 10sm2497623eyz.49.2009.03.30.23.09.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 30 Mar 2009 23:09:26 -0700 (PDT)
Message-ID: <49D1B395.7050004@gmail.com>
Date: Tue, 31 Mar 2009 08:09:25 +0200
From: Enrico Castro <castroenrico@gmail.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: problem with qt-embedded
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
X-List-Received-Date: Tue, 31 Mar 2009 06:11:40 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

I installed OE [1] and I build a console-image successful.
After I tried to build my image:

IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"

ANGSTROM_EXTRA_INSTALL ?= ""

DEPENDS = "task-base-extended \
            ${@base_contains("MACHINE_FEATURES", "screen", "psplash-
zap", "",d)} \
            mplayer omapfbplay \
            qt-embedded \
            gdb \
            rt73-firmware wireless-tools zd1211-firmware \
            "

IMAGE_INSTALL = "task-base-extended \
             ${ANGSTROM_EXTRA_INSTALL} \
             ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap",
"",d)} \
             mplayer omapfbplay \
             qt-embedded \
             qt-embedded-plugin-imageformat-gif \
             qt-embedded-plugin-imageformat-ico \
             qt-embedded-plugin-imageformat-jpeg \
             qt-embedded-plugin-imageformat-mng \
             qt-embedded-plugin-imageformat-svg \
             qt-embedded-plugin-imageformat-tiff \
             gdb \
             rt73-firmware wireless-tools zd1211-firmware \
            "

export IMAGE_BASENAME = "my-image"
IMAGE_LINGUAS = ""

inherit image

But I had the next error:

ERROR: Required build target 'my-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['my-image', 'qt-
embedded']

Maybe do I made any mistake? Then, I tried to build a neuros-osd-base-
image but I had such error:

ERROR: '['/home/****/oe/openembedded/recipes/images/neuros-osd-base-
image.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime
entity 'qt-embedded' but it wasn't found in any PACKAGE or RPROVIDES
variables
NOTE: Runtime target 'qt-embedded' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['qt-embedded']
ERROR: Required build target 'neuros-osd-base-image' has no buildable
providers.
Missing or unbuildable dependency chain was: ['neuros-osd-base-image',
'qt-embedded']

[1] http://elinux.org/BeagleBoardAndOpenEmbeddedGit



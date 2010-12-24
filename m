Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PVwY9-0005bk-Ej
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 02:34:29 +0100
Received: by pwi8 with SMTP id 8so565162pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 17:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=ZAYxGPks8deyZ2fZTbxoFU9ye2k7ZiZ0VH76C9n1+PY=;
	b=Jc7n5lxDSLpPNLbrPOIz45NzO8KGf2J9ZbX12tblAHTSNL7JSc+NtcVrxceG53anSj
	CLo7d16W9gVUf1U+CWPiQ75akmG+Sdj4CSSX+rQx+4KhY4/uMzHscNZWXkg+6CgfSzIz
	EWhO4kB0o9koOZZcDKsVlSReCYGXLzopSaw1A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=OnusezOZmQs4+HZPblrHwcX1K3TWazZ5Lr69AZCcWKYRuYoDhzksTk2gMwMtO0cWaY
	+2y6cnbrtrtgw8Bg6eUW5Mq41D1xVG6Ut9rvkyaRcZ6GrDokiTh7QsK0qNF2dDUvMg61
	Tg2r/J5mrN+g8WTQZWB9EpkQJHcdTjJap2Eoo=
Received: by 10.142.156.5 with SMTP id d5mr7040852wfe.204.1293154459183;
	Thu, 23 Dec 2010 17:34:19 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	e14sm11513553wfg.20.2010.12.23.17.34.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Dec 2010 17:34:18 -0800 (PST)
Message-ID: <4D13F894.4010100@gmail.com>
Date: Fri, 24 Dec 2010 12:04:12 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] micro.conf: Pin an older udev to avoid space consuming dependencies.
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
X-List-Received-Date: Fri, 24 Dec 2010 01:34:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

micro-uclibc/micro-image with udev 124 = 957207 bytes.
micro-uclibc/micro-image with udev 162 = 2303604 bytes.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 conf/distro/micro.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 102afa1..2b19b84 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -79,6 +79,8 @@ MACHINE_OVERRIDES += "${MACHINE_CLASS}"
 #############################################################################
 require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
 
+PREFERRED_VERSION_udev ?= "124"
+
 #############################################################################
 # NLS
 #############################################################################
-- 
1.7.1




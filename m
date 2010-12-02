Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNxH5-0007ah-R0
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 01:43:53 +0100
Received: by pvd12 with SMTP id 12so1215814pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 16:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=pr8B+/KkWXYzwRQ/O4bzZo0RRQ8JIPlPbEaVPXly6MM=;
	b=W9c4fPQo1q7Ykv6gZzOIbszkZYMP1+Qps8A2IDgz/UMAhh1n90fhcpPBj3XX8CIyOK
	TEy5QMQrTdr5hSxbXQrEhqD7MpFdSDa8saWxeVehtUWBrGg2/+dBExvFrYyFqyNvg5fi
	W+AJs1x7OWch7NMYxpTcsIxgaZ//9wczLoQM0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=SaOcgxHhvhuzqUUN5HOvG01CqPJH/d2E1BXnaEKsfo+855SienQrlVCaSTn1eYPQsj
	46nTAnBjxgXF0TEGriEGmEXOuysnq+WCaQ4ZKIbx2TsY81L1IP3IYMQ1BIMSldNWH8sZ
	MNZUY0q41ZXYan1OGgAsxWRee9a/T9YTrY4TE=
Received: by 10.142.88.18 with SMTP id l18mr9730847wfb.338.1291250547879;
	Wed, 01 Dec 2010 16:42:27 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w22sm683402wfd.19.2010.12.01.16.42.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 16:42:26 -0800 (PST)
Message-ID: <4CF6EB6D.8080404@gmail.com>
Date: Thu, 02 Dec 2010 11:12:21 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] task-proper-tools.bb: Exclude some packages if DISTRO_FEATURES lacks ipv6.
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
X-List-Received-Date: Thu, 02 Dec 2010 00:43:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From 3fa2634efe81e5d711a423497e3b76a66a821766 Mon Sep 17 00:00:00 2001
From: Graham Gower <graham.gower@gmail.com>
Date: Thu, 2 Dec 2010 11:10:47 +1030
Subject: [PATCH] task-proper-tools.bb: Exclude some packages if DISTRO_FEATURES lacks ipv6.


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/tasks/task-proper-tools.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/tasks/task-proper-tools.bb b/recipes/tasks/task-proper-tools.bb
index 5162749..bda774c 100644
--- a/recipes/tasks/task-proper-tools.bb
+++ b/recipes/tasks/task-proper-tools.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Full versions of tools provided by busybox"
-PR = "r15"
+PR = "r16"
 
 inherit task
 
@@ -21,9 +21,9 @@ RDEPENDS_${PN} = "\
 		grep \
 		gzip \
 		ifupdown \
-		iproute2 \
+		${@base_contains('DISTRO_FEATURES', 'ipv6', 'iproute2', '', d)} \
 		iputils-arping \
-		iputils-ping6 \
+		${@base_contains('DISTRO_FEATURES', 'ipv6', 'iputils-ping6', '', d)} \
 		iputils-ping \
 		iputils \
 		less \
-- 
1.7.1




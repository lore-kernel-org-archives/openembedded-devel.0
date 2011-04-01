Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5XMf-0006nQ-Nm
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 07:57:45 +0200
Received: by iwn10 with SMTP id 10so3489065iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 22:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=VcAT+SNHTdKGE50yGqHURHhSznRGKvYtpA+SMwZShIU=;
	b=UCO9MorhgrWIkCYOFr9vrTgwPC5ldoQg6LvHXb0GKnq127NOsmDVekYmQe+yTn4WbD
	iUWXUpRsQIi4AjwBiTv7EvVTMyIa+75jJgP3D6cU1weJEvDlnxJxsTlDl3ASNoR0+g2E
	lLI4NBh+cRSllDRiprbpAykoWP4yeZey4fX4c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EUAyzkIXuY/4LKRllDlfN4mEk/6N3chFn2UPeiaUflQG6ips6QJEJLtfqqTc5UAWBB
	6BTCYIgvpw4gjOSzmCLe4oQo9Erl9FIoegoPSh3xWIRAQwfG/023dIjmb8yhE9gotbAZ
	1voANGbTYSxhZ+GOrYWxwGnismh22TKAbhaoo=
Received: by 10.43.54.135 with SMTP id vu7mr1951570icb.68.1301637344570;
	Thu, 31 Mar 2011 22:55:44 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id xi12sm1086554icb.6.2011.03.31.22.55.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 22:55:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 22:55:22 -0700
Message-Id: <1301637327-26825-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
References: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/7] siteinfo.bbclass: Use linux-uclibceabi instead of uclibcgnueabi
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
X-List-Received-Date: Fri, 01 Apr 2011 05:57:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/siteinfo.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/siteinfo.bbclass b/meta-oe/classes/siteinfo.bbclass
index c0db539..f1db913 100644
--- a/meta-oe/classes/siteinfo.bbclass
+++ b/meta-oe/classes/siteinfo.bbclass
@@ -109,13 +109,13 @@ def get_siteinfo_list(d):
                "armeb-linux":             "endian-big bit-32 common-glibc arm-common",\
                "armeb-linux-gnueabi":     "endian-big bit-32 common-glibc arm-common armeb-linux",\
                "armeb-linux-uclibc":      "endian-big bit-32 common-uclibc arm-common",\
-               "armeb-linux-uclibcgnueabi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
+               "armeb-linux-uclibceabi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
                "arm-darwin":              "endian-little bit-32 common-darwin",\
                "arm-darwin8":              "endian-little bit-32 common-darwin",\
                "arm-linux":               "endian-little bit-32 common-glibc arm-common",\
                "arm-linux-gnueabi":       "endian-little bit-32 common-glibc arm-common arm-linux",\
                "arm-linux-uclibc":        "endian-little bit-32 common-uclibc arm-common",\
-               "arm-linux-uclibcgnueabi": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
+               "arm-linux-uclibceabi": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
                "avr32-linux":             "endian-big bit-32 common-glibc avr32-common",\ 
                "avr32-linux-uclibc":      "endian-big bit-32 common-uclibc avr32-common",\
                "bfin-uclinux-uclibc":       "endian-little bit-32 common-uclibc bfin-common",\
-- 
1.7.4.1




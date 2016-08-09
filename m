Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2CD77215
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 15:40:50 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h186so1072317pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 08:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ArN4Ih4Cxrm579gOw3Ejir1HySoTqIYJdIotYXBkzT4=;
	b=iiZwrydulVasmp2rmcnnvjVRkZR0LLKfrXnskhXrLPQUXUPjNMNPcLG/jb9SscQIJL
	iGNYv1hFSdfegGERUE3Od+2jtrSX64TW2qFq+sybXPM39fWx2bwUYpkEUrH+3Wlvv4X9
	5Ks80lyyK6O/Hp4reBrUqi+ns4UVBsyC8pbUtFzd4YVkllovYNKgUhm2sEHr1EpCEdSQ
	kWhpdFZ2NDJASMsb5/ZMQMrCTPc2+kkqAmxpL+vbp0g6ZZoHbVJHqKhS2Zi3FChvkS6u
	aUbxwMHkPrYL8yQ9HtV2evAgCxBkEr07myWHK4fg6XdyhqntS/q9LuqD53HV0k1haKIf
	K8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ArN4Ih4Cxrm579gOw3Ejir1HySoTqIYJdIotYXBkzT4=;
	b=IIKUYCgKIWPlezD3iGWJsAx30GIXtiztfK05Zk88+umx/JoFrNODUcAoWdv1fABDGl
	Lclcuzh3IV+EJtOYaKJnH2eZUZWM5qjs6r1jftOHMTUZwIySVX0tgedqGzFXrink8wb3
	OCLlOZELf0ORFaI4fVV7RTWzQX0mAc3u74U6KX7gW6KdLhrQ2XauviZS/9IE4R1Zitj0
	sTgF/YTocT2pjnfTdUvSSEJEvKCNA2y9ge2z9LK46bfdMKRPv39TiAH+V7N3jTMMlLKe
	UN0WBtaxcmQ0u23mmfj5H+OzRxXIUnYtTR7Nd3fwirFI/x/yMb8jgQ521sYh3c/ZVVc3
	uE3A==
X-Gm-Message-State: AEkoouvSoCQSIsdeKyn1Oy0vdH+1YGuLTojENXcS7NDXX762QXjby0KcJIkHhi1/xLe1ew==
X-Received: by 10.98.21.131 with SMTP id 125mr173181582pfv.92.1470757251060;
	Tue, 09 Aug 2016 08:40:51 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	k9sm56963914pfj.63.2016.08.09.08.40.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 08:40:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster@mvista.com
Date: Tue,  9 Aug 2016 08:40:37 -0700
Message-Id: <1470757240-9091-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1470757240-9091-1-git-send-email-akuster808@gmail.com>
References: <1470757240-9091-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH][master][krogoth 3/6] openwsman: fix fetch error.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Aug 2016 15:40:50 -0000

ERROR: openwsman-2.6.2-r0 do_fetch: Function failed: Fetcher failure for URL: 'git://github.com/Openwsman/openwsman.git;protocol=http'. Unable to fetch URL from any source.

removed "protocol=http"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
index af9633d..6397bed 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "curl libxml2 openssl libpam"
 SRCREV = "ed7a119e036c53078d70fd85936d94dc9b9b98be"
 PV = "2.6.2"
 
-SRC_URI = "git://github.com/Openwsman/openwsman.git;protocol=http \
+SRC_URI = "git://github.com/Openwsman/openwsman.git \
            file://libssl-is-required-if-eventint-supported.patch \
            file://openwsmand.service"
 
-- 
2.3.5



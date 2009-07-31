Received: from [209.85.222.197] (helo=mail-pz0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MWwaZ-00079Q-4d
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Jul 2009 20:12:27 +0200
Received: by pzk35 with SMTP id 35so1694962pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2009 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=PJOvE/8ANafNAeuR5FfNOfyJRHlKD/kJ38tM2wLXloA=;
	b=curd8R5ded5UI3N0Qj7OfgQ4fOZLLqtKKj8e12JjM489AH55CEU7s43202f+HW6QCZ
	nKXwWarN16bceRHozEV63QyTZYAKzfoS/eDR/uv6Pv4KmOeGeqaX9AObt5nZe6MIIVgx
	xAonv+Js/UZ37PDE73ARoi0EvbGFe7KkBg/SI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ja1yMPad+D5dvyKjznvNVKr3lGavEq1lTTf/KxGA1yhXumShh0p6pF5l0J8u/LW4QN
	EG/rMcBI2XkXT8mYbrvdVA5kPGfQnvTw89hj1lb0ngsNrb7Bkr/YTRUwpS1Mm3hF/EV6
	aPI8H8JbRBDYD1HXmKgsWRFjH/Zv8fQFsifrk=
Received: by 10.115.107.12 with SMTP id j12mr3925972wam.94.1249063028755;
	Fri, 31 Jul 2009 10:57:08 -0700 (PDT)
Received: from localhost (adsl-71-146-25-49.dsl.pltn13.sbcglobal.net
	[71.146.25.49])
	by mx.google.com with ESMTPS id l30sm5555958waf.0.2009.07.31.10.57.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 31 Jul 2009 10:57:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jul 2009 10:56:50 -0700
Message-Id: <1249063010-19157-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] minimal.conf: Add PREFERRED_PROVIDER for libusb0.
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
X-List-Received-Date: Fri, 31 Jul 2009 18:12:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/minimal.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 8b834d0..9212aa1 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -93,6 +93,7 @@ PREFERRED_PROVIDER_virtual/db = "db3"
 PREFERRED_PROVIDER_virtual/db-native = "db3-native"
 PREFERRED_PROVIDER_virtual/libsdl = "libsdl-x11"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
+PREFERRED_PROVIDER_virtual/libusb0 ?= "libusb"
 
 #############################################################################
 # PREFERRED VERSIONS
-- 
1.6.3.3




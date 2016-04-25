Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D343F60043
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 16:53:23 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id c189so23945210pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=XWOR6IXHyUjJ88CfRIIVJLyIYitftOZFdBtCTCqKP3U=;
	b=aAo+HSZY+ElcCZ6/rYNdteOhlhWNnrPTBcN6yYBSUlXn7F1VCRSMMseITh8qANxDpA
	fgD0kc9yzGlc6NMgzhvo1y+tQAvSBA/5AIWxgtbOoL9Mzqyh2l5MEX/mvjt7iyyVbIYd
	8B0DcjHAcckIU6AMQtOXSXq8MRxBuESDGnhswH2t2OtlsO8C4ph5Wr8fHtmjXRBm9ZHo
	NXZ4Dr5yS3EDp93BgaSUKfVlYElrWgUpZNDYYhE01ioH7khAej3hOkx0Boco9low3mwo
	7aMWQuVEQnZDJKY74UBtLCdTU80mTfSFnZqrNQUPyI80xEsmnCSgRRS3XIeWIb+ri2V0
	ijSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XWOR6IXHyUjJ88CfRIIVJLyIYitftOZFdBtCTCqKP3U=;
	b=PMm7iB+AuQmXPLfPFI615Y2lKuyx5hnRe0j+EDVKyCmDiy5T829RxYTbH4jA+HD2AL
	N6PHpLrOC2736PqWsfHtadpcrpFa9+0HG8GxIqPbYdOWoCouTgbCegEHOTEFuiIqswF6
	DxfgSzHfr0JR0Kf3vkAT9vXehuvc8f5eZQO/m3cLh5+96ALCVUzDeETzuLNN8/8jxcI/
	OvVJoTJE2n5gc2xZwsCVa5G0r2MiBzCh/SeucJ+15bU3Wc+lTVB/ifC9NGFDQh41yuRG
	/ggWTJKfXwDNmGlkYnkTxTRH1KAzaBqWN1VrsxCEntbSWf+e2nd2PfHLh1irkz3do5Zt
	NFWg==
X-Gm-Message-State: AOPr4FWopQmeCq7IBnAsps6RN8wz0e1Ol6aXUUXrt0EoA5jyWFaRKu1gwzdVai6hIisYlw==
X-Received: by 10.98.20.131 with SMTP id 125mr7108409pfu.166.1461603203838;
	Mon, 25 Apr 2016 09:53:23 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	lz5sm31349605pab.34.2016.04.25.09.53.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Apr 2016 09:53:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Mon, 25 Apr 2016 09:53:17 -0700
Message-Id: <1461603197-8093-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] wireshark: update package to 2.0.3
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
X-List-Received-Date: Mon, 25 Apr 2016 16:53:25 -0000

No CVE's assigned.

The following vulnerabilities have been fixed:
  * [1]wnpa-sec-2016-19
The NCP dissector could crash. ([2]Bug 11591)
  * [3]wnpa-sec-2016-20
TShark could crash due to a packet reassembly bug. ([4]Bug 11799)
  * [5]wnpa-sec-2016-21
The IEEE 802.11 dissector could crash. ([6]Bug 11824, [7]Bug 12187)
  * [8]wnpa-sec-2016-22
The PKTC dissector could crash. ([9]Bug 12206)
  * [10]wnpa-sec-2016-23
The PKTC dissector could crash. ([11]Bug 12242)
  * [12]wnpa-sec-2016-24
The IAX2 dissector could go into an infinite loop. ([13]Bug 12260)
  * [14]wnpa-sec-2016-25
Wireshark and TShark could exhaust the stack. ([15]Bug 12268)
  * [16]wnpa-sec-2016-26
The GSM CBCH dissector could crash. ([17]Bug 12278)
  * [18]wnpa-sec-2016-27
  MS-WSP dissector crash. ([19]Bug 12341)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.0.2.bb => wireshark_2.0.3.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.0.2.bb => wireshark_2.0.3.bb} (94%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.3.bb
similarity index 94%
rename from meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.0.3.bb
index b140099..b264e67 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.3.bb
@@ -8,8 +8,8 @@ DEPENDS = "perl-native pcre expat glib-2.0 sbc"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "204d053e0796c7da09292e0b54bc8503"
-SRC_URI[sha256sum] = "e921fb072085a5654d899949bb561d0687f4819f7b63ba35777bb949a9b6b9c1"
+SRC_URI[md5sum] = "62dc20f5a77542feed2e38f18db8ae3b"
+SRC_URI[sha256sum] = "e196376e75fe21fdef41b4eaa27ce2e1b2b561e7f7b20328a8e96657cc4465fc"
 
 PE = "1"
 
-- 
2.3.5



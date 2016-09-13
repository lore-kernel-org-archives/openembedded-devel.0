Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8F513771F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 12:38:01 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id s29so7104183lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 05:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=te0acayI21QWu7D9hO0kLNAhmrqvcV4RTNm5qfrggGY=;
	b=gH/tA1RNrmNUVqXGFJslH+tYAFcS9coemb5gTwEv0QgEUAJDIGoUHsRgP0ff/CutYr
	+uDxHTpkDAHi8Lgw1xixJk5y3nM97YKLqWjgp+/wMsnZjll2nFdw8DyjpIe8Guq0qXmh
	0UdgauxQZwKu6cYuWHypSW5qa1Jq5izY634ZRhCwfuJGVKNJ6cglQwC9pxbzPpLsysbA
	lFhEZ0UNYOcR6X0wF7Q6xtmcxzrPA5RAt6TgZSI+xHoa9QOHLEIocd2x8jsPM3gVjunN
	Sff9vfyr+BcIup8w2OvU3kLg1n1SUMWFl3xF57gJwQs+3Va4cbK1HrXbzbjOstIEfhKp
	/8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=te0acayI21QWu7D9hO0kLNAhmrqvcV4RTNm5qfrggGY=;
	b=AS01pb8ISq6uh2Tj8FAu067WQVso9a56mJ1QQG7Mda0LtNHgYo/UdHdh0s8QRxAbza
	iGBHjPfuGHLqsSQ58fFxTYgrJcMP3wpfC1+ZYNiozNfMWMFNHw1xdHy+rv/bboFOgs85
	rW4HpU2f5HfROPZC/ERLhGvsSkDsw1bMhs8ODtRwY+KKlZZN/ZPUSl74Hm8lilcT6RGY
	s9UHyVKNqruGqNpbRzyvJtC+rV8M8rBwO2TdZPZv366GrzF/29tThK/Gd6TBmRu9eoeL
	ox7ZyDwmrM6KVdYNRe+PraPsN1ihyb96HGOdWX0JmPf+ww36xglVNYYFmufzpA10j9aa
	wSpQ==
X-Gm-Message-State: AE9vXwMMsRABU2JQb3/PSAbif49dZhktwoDkw40z4OzCncIsFjr6dog5J8G1BbHiV/h+vQ==
X-Received: by 10.25.169.213 with SMTP id s204mr6374652lfe.57.1473770281848;
	Tue, 13 Sep 2016 05:38:01 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	p128sm3951596lfb.32.2016.09.13.05.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Sep 2016 05:38:00 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, maxin.john@intel.com,
	chris_larson@mentor.com
Date: Tue, 13 Sep 2016 14:37:57 +0200
Message-Id: <20160913123757.15798-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-java][PATCH v2] xpp3: Fix bashism
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
X-List-Received-Date: Tue, 13 Sep 2016 12:38:07 -0000

findpath var must also be fixed on its second occurrence.

Without this patch:

ERROR: xpp3-1.1.3.4.O-r0 do_compile: Function failed: do_compile (log
		file is located at
		/home/ricardo/curro/qt5022/build-qt5022-open/build/tmp/work/all-poky-linux/xpp3/1.1.3.4.O-r0/temp/log.do_compile.14262)
ERROR: Logfile of failure stored in:
/home/ricardo/curro/qt5022/build-qt5022-open/build/tmp/work/all-poky-linux/xpp3/1.1.3.4.O-r0/temp/log.do_compile.14262
Log data follows:
| DEBUG: Executing shell function do_compile
| ----------
| 1. WARNING in src/java/api/org/xmlpull/v1/XmlPullParserException.java
(at line 11)
| 	public class XmlPullParserException extends Exception {
| 	             ^^^^^^^^^^^^^^^^^^^^^^
| The serializable class XmlPullParserException does not declare a static final serialVersionUID field of type long

/home/ricardo/curro/qt5022/build-qt5022-open/build/tmp/work/all-poky-linux/xpp3/1.1.3.4.O-r0/temp/run.do_compile.14262:
Bad substitution
| WARNING: exit code 2 from a shell command.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
index f264022ffe60..808a9372338f 100644
--- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
+++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
@@ -33,7 +33,7 @@ do_compile() {
     mkdir -p build-xpath
 
     sourcepath="src/java/xpath"
-    findpath="${sourcepath//:/ }"
+    findpath=${sourcepath}
     javac -sourcepath $sourcepath -cp build-oe -d build-xpath `find $findpath -name "*.java"`
 
     fastjar -C build-xpath -c -f xpp3-xpath-${PV}.jar .
-- 
2.9.3



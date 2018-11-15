Return-Path: <nick83ola@gmail.com>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7081E6C187
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2018 13:18:50 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id c206so11148984oib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2018 05:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=8upWKmODYhJ9+Bgn0iMC/+gHfQsZGesYYpfk3mWWiY4=;
	b=hhiatBAJFR4SmQo5sQRr/nn6ERgnT6eH+S/eDwzjxo0phrw9FyFbdnnsuXKZY2Yfb4
	8ZfgpY2G8QHyb0QK5PduSKtG3C/wdG27pWBAwRD/yRnmC1mWaBKzNrGW1HLxEuBu4otL
	ojUYm1SCFJjf/WGT5GdBVUtbmKzT8SI4OXkuDi13C2gPwbAD19o/zxzvVyQOImsp7byP
	5+HEXv5UD0GTyYrNt9LEJgZfyfFeTKD+tpMVO9zfIFxSBzG+jPTQ6gFmpjcTl4J2Q8ne
	JSKdlQN9qBj2CCGXNXzsoCPDc9F62h8QZHNd2PNkmb5bfPsjMaWXS7pkoSkb8+XUPKiL
	w2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=8upWKmODYhJ9+Bgn0iMC/+gHfQsZGesYYpfk3mWWiY4=;
	b=L6LjwztRBW1Xa9NB9AA7WDG+cFBh5yMXNtwtrlBqJPzu/oKpM+Gk+ioL1Tq1M0mu1I
	BTns/e4blqiL38Zn1I/+zLQOPYik+/XthY8AysVibFOGz0fVU9aOaUJTbiH8dkUEQUVz
	jITTnHPKlH1HyfuffrZg592/5yxgy/SGyOps79xoUP/qJx7Nz/cdtQ5ALZeJFDpPn8oT
	KcaevtmWTDstl9yJoVeQjKBv+CIxATgCxN1jjzzzSWQrI6trLIyTLrX2QBmYAXoAxQ0x
	Ty9Plj0X7f6w+8StK2wA3/735Q8frCdGxus1mBlsE5F16SXf0+9q5y4003gm2n3BFY0c
	er0w==
X-Gm-Message-State: AGRZ1gL6cSaJ7tChatvp4hm9pkGb0ZlTYZqv+mCquGAs7FhAyfu8ya1t
	2jF6GNg8Kp3q7CMMIGcwgeBEBUTw5xMQ+P2ZRSLysQIc
X-Google-Smtp-Source: AJdET5eeoyxn2mh1R5JP0l5JeetF0MumhY6jTOnT4Y1IrOK+3B6ejyXpLrb42uxMxisG1RHWpX2RzE88MyF8IxQeNaE=
X-Received: by 2002:aca:5842:: with SMTP id
	m63-v6mr3756343oib.162.1542287931025; 
	Thu, 15 Nov 2018 05:18:51 -0800 (PST)
MIME-Version: 1.0
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 15 Nov 2018 13:18:39 +0000
Message-ID: <CABPh3UOf31aGZHypgUFtokwjY9iBY3jrw7Mdv2H5bh_ttaJ6DA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-java][bug] java-library inherit allarch
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
X-List-Received-Date: Thu, 15 Nov 2018 13:18:50 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

got some issue compiling the rxtx package in meta java.

In particular regarding this patch

https://patchwork.openembedded.org/patch/89023/

this approach is still valid (inherit allarch in java-library class)?

Regards
Nicola Lunghi

=======================================================

[meta-java,v2,4/6] java-library: inherit allarch

Use the allarch class to make every packages in the 'all' ARCH.
Recipes inheriting java-library which build additional packages which
don't belong in to all ARCH must manually setting PACKAGE_ARCH after
inheritting java-library.

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index a74c8d3..144cd2f 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -7,8 +7,12 @@
 # starts with "lib" and/or ends with "-java". In case the "lib"
prefix is part of
 # your package's normal name (e.g. liberator) the guessing is wrong
and you have
 # to set JPN manually!
+#
+# package archs are set to all, if the recipe builds also packages which
+# can not be used for all archs, then set the PACKAGE_ARCH of that package
+# manually, see rxtx_xx.bb for an example.

-inherit java
+inherit java allarch

.......

 inherit java-library
+PACKAGE_ARCH = "${TUNE_PKGARCH}"


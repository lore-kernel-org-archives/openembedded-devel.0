Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4576A6D681
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:39:22 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id d41so544356eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=+cE8Kc23ch6VhCdTXYqg/jcRZ8iHYdlAgLkfjAgjwkA=;
	b=cSo1gpNA6b8+2vlohmdcqkjCkRGQQT6ZYEuykg5RI5Dp96xokwhLbFQPrOKEaJicHJ
	/7GE/bqgrvUgZ8VY2eS//6w581ElYabU44ymuVQeDOeAxazJRGLYb4m/ZPak/PxBG5uA
	zDffRwz1lfYLqMyd0USl6tWoz4mSB9DicjsZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=+cE8Kc23ch6VhCdTXYqg/jcRZ8iHYdlAgLkfjAgjwkA=;
	b=bYqNO5V/0UzEC6PHQ//Y6eJDOupG5A6N5CGOiTDQuhaCmMpX6gVb6hBHv5lI1oluIn
	NGTVpZIA/gWYyDvJR+0IESFIEOw3vtdsmOLcY20fg0STWLrF4tNA1FjdMAU955MySrQt
	wRAmTMaMF97bbOkX2oNwf3GdqGVxv2ulBaNGyp87Q5LcynY+mP/Ja+XX08a/lFvOUYqb
	5+WSJ4roTbdU5NMtcuNhmYTn13Uj0dNimIYdgx9FPHcZ3ZHfTRfzaYq37RTZFaVj9jrf
	yqQ1wztJ4bC5/L/4eias5RmU1UtU0r2swVWAfj/DOxMHdx+s852nwwVlHrWiVrzJ1yNT
	/QsA==
X-Gm-Message-State: ALoCoQmqnsKMXzWbggkjVaD8UKav0PBHpGu97PoA9yKzoTCSs9LYxux3H3BUxMuejdDjTpmil3WA
MIME-Version: 1.0
X-Received: by 10.14.208.200 with SMTP id q48mr4643431eeo.50.1384540762068;
	Fri, 15 Nov 2013 10:39:22 -0800 (PST)
Sender: rstreif@linuxfoundation.org
Received: by 10.223.85.208 with HTTP; Fri, 15 Nov 2013 10:39:21 -0800 (PST)
Date: Fri, 15 Nov 2013 10:39:21 -0800
X-Google-Sender-Auth: fMJrFEIGS6LtnorTKx3ErAlL35M
Message-ID: <CA+gsK-reC5jKTGB=4nPqWR5i0a_+MRQRBj9gbBXz6E8gc6OpdQ@mail.gmail.com>
From: Rudolf Streif <rudolf.streif@linux.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java] Building openjdk-7-jre for PPC
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
X-List-Received-Date: Fri, 15 Nov 2013 18:39:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

While building openjdk-7-jre 25b30 for PPC architecture with dylan I ran
into the following issues:

The patch icedtea-jdk-nio-use-host-cc.patch is conditionally applied to PPC
only. It also requires this patch of the patch [1]. This patch has not yet
been included with meta-java although a pull request was sent a while ago.

Furthermore, the original  icedtea-jdk-nio-use-host-cc.patch includes this
change of the Sun toplevel makefile:

Index: openjdk/jdk/make/sun/Makefile
===================================================================
--- openjdk/jdk/make/sun/Makefile       2013-07-25 09:10:09.000000000 -0700
+++ openjdk/jdk/make/sun/Makefile       2013-10-01 21:32:01.625839149 -0700
@@ -55,7 +55,7 @@
     endif
   endif
   HEADLESS_SUBDIR = headless
-  XAWT_SUBDIR     = xawt
+  XAWT_SUBDIR     =
 endif

This removes the xawt subdir from the build process resulting in XToolkit
and other Java classes not to be build and also not to be included into
rt.jar. Hence, applications using awt UI classes will break with a "class
not found" error.

I reverted the change and now it builds correctly, but I would like to
understand why this change was made in the first place.


Cheers,
Rudi

[1]
https://github.com/kraj/meta-java/commit/22983b1ab80b3393ecc27e5c3d3a9b52e3b8e692


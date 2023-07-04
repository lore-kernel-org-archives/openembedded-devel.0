Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350AAEB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 06:50:47 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.53052.1688453443276818410
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jul 2023 23:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=YdIQXvMD;
 spf=pass (domain: mvista.com, ip: 209.85.222.172, mailfrom: hprajapati@mvista.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-76571dae5feso472410585a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jul 2023 23:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688453442; x=1691045442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxpijLbt56JSK9pzJ2s8PURoXZdTGseaoOBGjgqMRh0=;
        b=YdIQXvMD6nEKmv5VX1LJpGN6oOPdD1qzBak6YAJ6b6sR8Nkl/bhe16FK0q2wOmPvB7
         khOEf+wnX6Pqfln+uk1v3ZfLNdAKxbKYh2C2RfZsAW0V40M5mB0IIGpaDYtXKJbKTEMs
         WEN9y3MaE9QHVLxuRQjl0IQj7KcmG+YLVpxZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688453442; x=1691045442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxpijLbt56JSK9pzJ2s8PURoXZdTGseaoOBGjgqMRh0=;
        b=Vg7gGaMK302fkPHgT8tXr/6Xt9Sh9u+yIKr0jGR/h0V8XhowKo4MtgTTVvOVPu0wmH
         DbHVi1gs6/UYdkEixNXWXjKE3T7erO/HXtl+7Iqmv8rEpRWCOeunZQtPgIziCUawBmDV
         c0DztbqfMB3bunz7EvuCdgO13yimuYqXBp4BM/8sH49t9oOZCCB4iN3oFcscBsTnbMbg
         PvSZHwblSvk+6ypKQNTXb5bXgiWHsbmnFMF804fPOlWzXD/tRu5lBkqcMc56mPfxhHOp
         J2qS2F8vwceE4HyzZqAg6oHALMWKw9Q2zIlgIt/XvuQqxK5ynwjnQzJGrFFxOIyjunYR
         RxXw==
X-Gm-Message-State: ABy/qLb9WKrsDnGgLZ/0R41goKPGO4th07SKz2EemQyIe8Tv2y2w9Zoq
	zQCqqU6+hRawDpQoejsNauQYNUebpD6KyDnrhJw=
X-Google-Smtp-Source: ACHHUZ7GS+t8/UG6QSvvgGZVlW3aTo2x72MizOx/FYyyf8m7tUE3+l93xWCkG7ZRDtCKac28RmC06g==
X-Received: by 2002:a05:620a:4496:b0:75b:23a0:e7c9 with SMTP id x22-20020a05620a449600b0075b23a0e7c9mr15140686qkp.42.1688453441816;
        Mon, 03 Jul 2023 23:50:41 -0700 (PDT)
Received: from MVIN00024 ([49.34.79.60])
        by smtp.gmail.com with ESMTPSA id y11-20020a62b50b000000b0063f0068cf6csm14926437pfe.198.2023.07.03.23.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 23:50:41 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 04 Jul 2023 12:18:25 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] ntp: backport patch for 5 CVEs CVE-2023-26551/2/3/4/5
Date: Tue,  4 Jul 2023 12:18:24 +0530
Message-Id: <20230704064824.114198-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 06:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103655

Upstream-Status: Backport from https://archive.ntp.org/ntp4/ntp-4.2/ntp-4.2.8p15-3806-3807.patch

Patch taken from https://archive.ntp.org/ntp4/ntp-4.2/ntp-4.2.8p15-3806-3807.patch
It is linked as official patch for p15 in:
- https://www.ntp.org/support/securitynotice/ntpbug3807/
- https://www.ntp.org/support/securitynotice/ntpbug3806/

Small adaptation to build is needed because of how tests are built.

Backport fixes for:
CVE: CVE-2023-26551
CVE: CVE-2023-26552
CVE: CVE-2023-26553
CVE: CVE-2023-26554
CVE: CVE-2023-26555

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../ntp/ntp/CVE-2023-2655x.patch              | 340 ++++++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p15.bb       |  10 +-
 2 files changed, 349 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch

diff --git a/meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch b/meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch
new file mode 100644
index 0000000000..734c6f197b
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch
@@ -0,0 +1,340 @@
+ntp: backport patch for 5 CVEs CVE-2023-26551/2/3/4/5
+
+Upstream-Status: Backport [https://archive.ntp.org/ntp4/ntp-4.2/ntp-4.2.8p15-3806-3807.patch]
+CVE: CVE-2023-26551
+CVE: CVE-2023-26552
+CVE: CVE-2023-26553
+CVE: CVE-2023-26554
+CVE: CVE-2023-26555
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ include/ntp_fp.h         |   4 +-
+ libntp/mstolfp.c         | 108 +++++++++++++++------------------------
+ ntpd/refclock_palisade.c |  50 +++++++++++++++---
+ tests/libntp/strtolfp.c  |  33 +++++++-----
+ 4 files changed, 104 insertions(+), 91 deletions(-)
+
+diff --git a/include/ntp_fp.h b/include/ntp_fp.h
+index afd1f82..fe6e390 100644
+--- a/include/ntp_fp.h
++++ b/include/ntp_fp.h
+@@ -195,9 +195,9 @@ typedef u_int32 u_fp;
+ 	do { \
+ 		int32 add_f = (int32)(f); \
+ 		if (add_f >= 0) \
+-			M_ADD((r_i), (r_f), 0, (uint32)( add_f)); \
++			M_ADD((r_i), (r_f), 0, (u_int32)( add_f)); \
+ 		else \
+-			M_SUB((r_i), (r_f), 0, (uint32)(-add_f)); \
++			M_SUB((r_i), (r_f), 0, (u_int32)(-add_f)); \
+ 	} while(0)
+ 
+ #define	M_ISNEG(v_i)			/* v < 0 */ \
+diff --git a/libntp/mstolfp.c b/libntp/mstolfp.c
+index 3dfc4ef..a906d76 100644
+--- a/libntp/mstolfp.c
++++ b/libntp/mstolfp.c
+@@ -14,86 +14,58 @@ mstolfp(
+ 	l_fp *lfp
+ 	)
+ {
+-	register const char *cp;
+-	register char *bp;
+-	register const char *cpdec;
+-	char buf[100];
++	int        ch, neg = 0;
++	u_int32    q, r;
+ 
+ 	/*
+ 	 * We understand numbers of the form:
+ 	 *
+ 	 * [spaces][-|+][digits][.][digits][spaces|\n|\0]
+ 	 *
+-	 * This is one enormous hack.  Since I didn't feel like
+-	 * rewriting the decoding routine for milliseconds, what
+-	 * is essentially done here is to make a copy of the string
+-	 * with the decimal moved over three places so the seconds
+-	 * decoding routine can be used.
++	 * This is kinda hack.  We use 'atolfp' to do the basic parsing
++	 * (after some initial checks) and then divide the result by
++	 * 1000.  The original implementation avoided that by
++	 * hacking up the input string to move the decimal point, but
++	 * that needed string manipulations prone to buffer overruns.
++	 * To avoid that trouble we do the conversion first and adjust
++	 * the result.
+ 	 */
+-	bp = buf;
+-	cp = str;
+-	while (isspace((unsigned char)*cp))
+-	    cp++;
+ 	
+-	if (*cp == '-' || *cp == '+') {
+-		*bp++ = *cp++;
+-	}
+-
+-	if (*cp != '.' && !isdigit((unsigned char)*cp))
+-	    return 0;
+-
++	while (isspace(ch = *(const unsigned char*)str))
++		++str;
+ 
+-	/*
+-	 * Search forward for the decimal point or the end of the string.
+-	 */
+-	cpdec = cp;
+-	while (isdigit((unsigned char)*cpdec))
+-	    cpdec++;
+-
+-	/*
+-	 * Found something.  If we have more than three digits copy the
+-	 * excess over, else insert a leading 0.
+-	 */
+-	if ((cpdec - cp) > 3) {
+-		do {
+-			*bp++ = (char)*cp++;
+-		} while ((cpdec - cp) > 3);
+-	} else {
+-		*bp++ = '0';
++	switch (ch) {
++	    case '-': neg = TRUE;
++	    case '+': ++str;
++	    default : break;
+ 	}
+ 
+-	/*
+-	 * Stick the decimal in.  If we've got less than three digits in
+-	 * front of the millisecond decimal we insert the appropriate number
+-	 * of zeros.
+-	 */
+-	*bp++ = '.';
+-	if ((cpdec - cp) < 3) {
+-		size_t i = 3 - (cpdec - cp);
+-		do {
+-			*bp++ = '0';
+-		} while (--i > 0);
+-	}
++	if (!isdigit(ch = *(const unsigned char*)str) && (ch != '.'))
++		return 0;
++	if (!atolfp(str, lfp))
++		return 0;
+ 
+-	/*
+-	 * Copy the remainder up to the millisecond decimal.  If cpdec
+-	 * is pointing at a decimal point, copy in the trailing number too.
++	/* now do a chained/overlapping division by 1000 to get from
++	 * seconds to msec. 1000 is small enough to go with temporary
++	 * 32bit accus for Q and R.
+ 	 */
+-	while (cp < cpdec)
+-	    *bp++ = (char)*cp++;
+-	
+-	if (*cp == '.') {
+-		cp++;
+-		while (isdigit((unsigned char)*cp))
+-		    *bp++ = (char)*cp++;
+-	}
+-	*bp = '\0';
++	q = lfp->l_ui / 1000u;
++	r = lfp->l_ui - (q * 1000u);
++	lfp->l_ui = q;
+ 
+-	/*
+-	 * Check to make sure the string is properly terminated.  If
+-	 * so, give the buffer to the decoding routine.
+-	 */
+-	if (*cp != '\0' && !isspace((unsigned char)*cp))
+-	    return 0;
+-	return atolfp(buf, lfp);
++	r = (r << 16) | (lfp->l_uf >> 16);
++	q = r / 1000u;
++	r = ((r - q * 1000) << 16) | (lfp->l_uf & 0x0FFFFu);
++	lfp->l_uf = q << 16;
++	q = r / 1000;
++	lfp->l_uf |= q;
++	r -= q * 1000u;
++
++	/* fix sign */
++	if (neg)
++		L_NEG(lfp);
++	/* round */
++	if (r >= 500)
++		L_ADDF(lfp, (neg ? -1 : 1));
++	return 1;
+ }
+diff --git a/ntpd/refclock_palisade.c b/ntpd/refclock_palisade.c
+index cb68255..15c21d8 100644
+--- a/ntpd/refclock_palisade.c
++++ b/ntpd/refclock_palisade.c
+@@ -1225,9 +1225,9 @@ palisade_poll (
+ 		return;  /* using synchronous packet input */
+ 
+ 	if(up->type == CLK_PRAECIS) {
+-		if(write(peer->procptr->io.fd,"SPSTAT\r\n",8) < 0)
++		if (write(peer->procptr->io.fd,"SPSTAT\r\n",8) < 0) {
+ 			msyslog(LOG_ERR, "Palisade(%d) write: %m:",unit);
+-		else {
++		} else {
+ 			praecis_msg = 1;
+ 			return;
+ 		}
+@@ -1249,20 +1249,53 @@ praecis_parse (
+ 
+ 	pp = peer->procptr;
+ 
+-	memcpy(buf+p,rbufp->recv_space.X_recv_buffer, rbufp->recv_length);
++	if (p + rbufp->recv_length >= sizeof buf) {
++		struct palisade_unit *up;
++		up = pp->unitptr;
++
++		/*
++		 * We COULD see if there is a \r\n in the incoming
++		 * buffer before it overflows, and then process the
++		 * current line.
++		 *
++		 * Similarly, if we already have a hunk of data that
++		 * we're now flushing, that will cause the line of
++		 * data we're in the process of collecting to be garbage.
++		 *
++		 * Since we now check for this overflow and log when it
++		 * happens, we're now in a better place to easily see
++		 * what's going on and perhaps better choices can be made.
++		 */
++
++		/* Do we need to log the size of the overflow? */
++		msyslog(LOG_ERR, "Palisade(%d) praecis_parse(): input buffer overflow",
++			up->unit);
++
++		p = 0;
++		praecis_msg = 0;
++
++		refclock_report(peer, CEVNT_BADREPLY);
++
++		return;
++	}
++
++	memcpy(buf+p, rbufp->recv_buffer, rbufp->recv_length);
+ 	p += rbufp->recv_length;
+ 
+-	if(buf[p-2] == '\r' && buf[p-1] == '\n') {
++	if (   p >= 2
++	    && buf[p-2] == '\r'
++	    && buf[p-1] == '\n') {
+ 		buf[p-2] = '\0';
+ 		record_clock_stats(&peer->srcadr, buf);
+ 
+ 		p = 0;
+ 		praecis_msg = 0;
+ 
+-		if (HW_poll(pp) < 0)
++		if (HW_poll(pp) < 0) {
+ 			refclock_report(peer, CEVNT_FAULT);
+-
++		}
+ 	}
++	return;
+ }
+ 
+ static void
+@@ -1407,7 +1440,10 @@ HW_poll (
+ 
+ 	/* Edge trigger */
+ 	if (up->type == CLK_ACUTIME)
+-		write (pp->io.fd, "", 1);
++		if (write (pp->io.fd, "", 1) != 1)
++			msyslog(LOG_WARNING,
++				"Palisade(%d) HW_poll: failed to send trigger: %m",
++				up->unit);
+ 		
+ 	if (ioctl(pp->io.fd, TIOCMSET, &x) < 0) { 
+ #ifdef DEBUG
+diff --git a/tests/libntp/strtolfp.c b/tests/libntp/strtolfp.c
+index 6855d9b..9090159 100644
+--- a/tests/libntp/strtolfp.c
++++ b/tests/libntp/strtolfp.c
+@@ -26,6 +26,13 @@ setUp(void)
+ 	return;
+ }
+ 
++static const char* fmtLFP(const l_fp *e, const l_fp *a)
++{
++    static char buf[100];
++    snprintf(buf, sizeof(buf), "e=$%08x.%08x, a=$%08x.%08x",
++	     e->l_ui, e->l_uf, a->l_ui, a->l_uf);
++    return buf;
++}
+ 
+ void test_PositiveInteger(void) {
+ 	const char *str = "500";
+@@ -37,8 +44,8 @@ void test_PositiveInteger(void) {
+ 	TEST_ASSERT_TRUE(atolfp(str, &actual));
+ 	TEST_ASSERT_TRUE(mstolfp(str_ms, &actual_ms));
+ 
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual));
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual_ms));
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual), fmtLFP(&expected, &actual));
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual_ms), fmtLFP(&expected, &actual_ms));
+ }
+ 
+ void test_NegativeInteger(void) {
+@@ -54,8 +61,8 @@ void test_NegativeInteger(void) {
+ 	TEST_ASSERT_TRUE(atolfp(str, &actual));
+ 	TEST_ASSERT_TRUE(mstolfp(str_ms, &actual_ms));
+ 
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual));
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual_ms));
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual), fmtLFP(&expected, &actual));
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual_ms), fmtLFP(&expected, &actual_ms));
+ }
+ 
+ void test_PositiveFraction(void) {
+@@ -68,8 +75,8 @@ void test_PositiveFraction(void) {
+ 	TEST_ASSERT_TRUE(atolfp(str, &actual));
+ 	TEST_ASSERT_TRUE(mstolfp(str_ms, &actual_ms));
+ 
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual));
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual_ms));
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual), fmtLFP(&expected, &actual));
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual_ms), fmtLFP(&expected, &actual_ms));
+ }
+ 
+ void test_NegativeFraction(void) {
+@@ -85,8 +92,8 @@ void test_NegativeFraction(void) {
+ 	TEST_ASSERT_TRUE(atolfp(str, &actual));
+ 	TEST_ASSERT_TRUE(mstolfp(str_ms, &actual_ms));
+ 
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual));
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual_ms));
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual), fmtLFP(&expected, &actual));
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual_ms), fmtLFP(&expected, &actual_ms));
+ }
+ 
+ void test_PositiveMsFraction(void) {
+@@ -100,9 +107,8 @@ void test_PositiveMsFraction(void) {
+ 	TEST_ASSERT_TRUE(atolfp(str, &actual));
+ 	TEST_ASSERT_TRUE(mstolfp(str_ms, &actual_ms));
+ 
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual));
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual_ms));
+-
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual), fmtLFP(&expected, &actual));
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual_ms), fmtLFP(&expected, &actual_ms));
+ }
+ 
+ void test_NegativeMsFraction(void) {
+@@ -118,9 +124,8 @@ void test_NegativeMsFraction(void) {
+ 	TEST_ASSERT_TRUE(atolfp(str, &actual));
+ 	TEST_ASSERT_TRUE(mstolfp(str_ms, &actual_ms));
+ 
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual));
+-	TEST_ASSERT_TRUE(IsEqual(expected, actual_ms));
+-
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual), fmtLFP(&expected, &actual));
++	TEST_ASSERT_TRUE_MESSAGE(IsEqual(expected, actual_ms), fmtLFP(&expected, &actual_ms));
+ }
+ 
+ void test_InvalidChars(void) {
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index 7e168825e0..1a223db6fa 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://sntp.service \
            file://sntp \
            file://ntpd.list \
+           file://CVE-2023-2655x.patch \
 "
-
 SRC_URI[sha256sum] = "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
@@ -61,6 +61,14 @@ PACKAGECONFIG[debug] = "--enable-debugging,--disable-debugging"
 PACKAGECONFIG[mdns] = "ac_cv_header_dns_sd_h=yes,ac_cv_header_dns_sd_h=no,mdns"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
+do_configure_append() {
+    # tests are generated but also checked-in to source control
+    # when CVE-2023-2655x.patch changes timestamp of test source file, Makefile detects it and tries to regenerate it
+    # however it fails because of missing ruby interpretter; adding ruby-native as dependency fixes it
+    # since the regenerated file is identical to the one from source control, touch the generated file instead of adding heavy dependency
+    touch ${S}/tests/libntp/run-strtolfp.c
+}
+
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
     install -m 644 ${WORKDIR}/ntp.conf ${D}${sysconfdir}
-- 
2.25.1



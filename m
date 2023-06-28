Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C427BEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 20:07:39 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.462.1687982853394143627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 13:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BQsQaMPR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20230628200730beca2a37a174e7629e-v6qy1d@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20230628200730beca2a37a174e7629e
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 28 Jun 2023 22:07:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=S4Ov2tKcYUQV8PRS+C90kQTNeRQGazGdboW+UXvLcpc=;
 b=BQsQaMPRJe7UrMurVp8HdD2IwqTYhce5om8NfU0Aldu5+iO3DaKgoofFlsHdtT6/xBHJ1D
 sa9UwiVSl8HybhOMJlLeGiamBbX0wbE3EidIQ9nFx7i9AftpHa7JAQxD2PZeYthQQRAA+7T5
 eSv1YCb48s1CHRZ+t+ra+2cVn9zf4=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][kirkstone][PATCH] ntp: backport patch for 5 CVEs CVE-2023-26551/2/3/4/5
Date: Wed, 28 Jun 2023 22:06:37 +0200
Message-Id: <20230628200637.1393267-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 20:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103636

From: Peter Marko <peter.marko@siemens.com>

Patch taken from https://archive.ntp.org/ntp4/ntp-4.2/ntp-4.2.8p15-3806-3807.patch
It is linked as official patch for p15 in:
- https://www.ntp.org/support/securitynotice/ntpbug3807/
- https://www.ntp.org/support/securitynotice/ntpbug3806/

Small adaptation to build is needed because of how tests are built.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ntp/ntp/CVE-2023-2655x.patch              | 323 ++++++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p15.bb       |   9 +
 2 files changed, 332 insertions(+)
 create mode 100755 meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch

diff --git a/meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch b/meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch
new file mode 100755
index 0000000000..fbd0ec151a
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/CVE-2023-2655x.patch
@@ -0,0 +1,323 @@
+CVE: CVE-2023-26551
+CVE: CVE-2023-26552
+CVE: CVE-2023-26553
+CVE: CVE-2023-26554
+CVE: CVE-2023-26555
+Upstream-Status: Backport [https://archive.ntp.org/ntp4/ntp-4.2/ntp-4.2.8p15-3806-3807.patch]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+--- include/ntp_fp.h	2019-06-03 23:41:14.000000000 -0500
++++ ../ntp-stable-p16-sec/include/ntp_fp.h	2023-04-17 03:17:01.655121000 -0500
+@@ -195,9 +195,9 @@
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
+--- libntp/mstolfp.c	2019-06-03 23:41:14.000000000 -0500
++++ ../ntp-stable-p16-sec/libntp/mstolfp.c	2023-04-17 03:07:38.598581000 -0500
+@@ -14,86 +14,58 @@
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
+-
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
+-	}
+-
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
+-
+-	/*
+-	 * Copy the remainder up to the millisecond decimal.  If cpdec
+-	 * is pointing at a decimal point, copy in the trailing number too.
+-	 */
+-	while (cp < cpdec)
+-	    *bp++ = (char)*cp++;
++	while (isspace(ch = *(const unsigned char*)str))
++		++str;
+ 	
+-	if (*cp == '.') {
+-		cp++;
+-		while (isdigit((unsigned char)*cp))
+-		    *bp++ = (char)*cp++;
++	switch (ch) {
++	    case '-': neg = TRUE;
++	    case '+': ++str;
++	    default : break;
+ 	}
+-	*bp = '\0';
+-
+-	/*
+-	 * Check to make sure the string is properly terminated.  If
+-	 * so, give the buffer to the decoding routine.
+-	 */
+-	if (*cp != '\0' && !isspace((unsigned char)*cp))
+-	    return 0;
+-	return atolfp(buf, lfp);
++	
++	if (!isdigit(ch = *(const unsigned char*)str) && (ch != '.'))
++		return 0;
++	if (!atolfp(str, lfp))
++		return 0;
++
++	/* now do a chained/overlapping division by 1000 to get from
++	 * seconds to msec. 1000 is small enough to go with temporary
++	 * 32bit accus for Q and R.
++	 */
++	q = lfp->l_ui / 1000u;
++	r = lfp->l_ui - (q * 1000u);
++	lfp->l_ui = q;
++
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
+--- ntpd/refclock_palisade.c	2020-04-11 04:31:33.000000000 -0500
++++ ../ntp-stable-p16-sec/ntpd/refclock_palisade.c	2023-04-15 18:09:29.787588000 -0500
+@@ -1225,9 +1225,9 @@
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
+@@ -1249,20 +1249,53 @@
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
+@@ -1407,7 +1440,10 @@
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
+--- tests/libntp/strtolfp.c	2020-05-22 01:33:24.000000000 -0500
++++ ../ntp-stable-p16-sec/tests/libntp/strtolfp.c	2023-04-16 03:28:16.967582000 -0500
+@@ -26,6 +26,13 @@
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
+@@ -37,8 +44,8 @@
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
+@@ -54,8 +61,8 @@
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
+@@ -68,8 +75,8 @@
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
+@@ -85,8 +92,8 @@
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
+@@ -100,9 +107,8 @@
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
+@@ -118,9 +124,8 @@
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
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index 91e4945a17..7861a5e3e6 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://sntp.service \
            file://sntp \
            file://ntpd.list \
+           file://CVE-2023-2655x.patch;striplevel=0 \
 "
 
 SRC_URI[sha256sum] = "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19"
@@ -92,6 +93,14 @@ PACKAGECONFIG[debug] = "--enable-debugging,--disable-debugging"
 PACKAGECONFIG[mdns] = "ac_cv_header_dns_sd_h=yes,ac_cv_header_dns_sd_h=no,mdns"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
+do_configure:append() {
+    # tests are generated but also checked-in to source control
+    # when CVE-2023-2655x.patch changes timestamp of test source file, Makefile detects it and tries to regenerate it
+    # however it fails because of missing ruby interpretter; adding ruby-native as dependency fixes it
+    # since the regenerated file is identical to the one from source control, touch the generated file instead of adding heavy dependency
+    touch ${S}/tests/libntp/run-strtolfp.c
+}
+
 do_install:append() {
     install -d ${D}${sysconfdir}/init.d
     install -m 644 ${WORKDIR}/ntp.conf ${D}${sysconfdir}
-- 
2.30.2



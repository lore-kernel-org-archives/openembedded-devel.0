Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3485.1794950600499141086
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 13:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CywMv88W;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild08.wrs.com, ip: 205.220.178.238, mailfrom: prvs=5781c8dfd1=st10@oak-lpgbuild08.wrs.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ4hcJ2652808
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 21:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1vqv1FC1XUQd1GrBYhv42QKgHktxpB22EBnJFsT44gM=; b=
	CywMv88WfQQcgEF4V0wUXZjC5OoDqeXnJ7+/PKb4T+N/1h7Zzfdjei+vVdRyRJJ+
	kxJZhMVlMsLsREEmRynEn56Mw6yUDnB2nCgHhPYxWXoYmKybF1zZVUZvkzEGhW4J
	uhb0xDK09Nyobvo680b/K+BpAP6eopEsO5hIs5+3lHeF5YUJlEVtAd+DpseM6sQH
	MpVVarLelhVD8AjDvJUnLstmZfAVIELMdeouvVlNvZ+A0qWJ+V/PsQ+Tw7bLpNIc
	Ab7523fBR5D6UK0oQpqItJkQp5QQdHCYziv+IX0UFJPBdbbyoESN2rpOcB9hjIgy
	r7b+Hx9HnLBZS2X3gbJfhg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxgwae055-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 21:23:19 +0000 (GMT)
Received: from ala-p2exch02.corp.ad.wrs.com (10.11.226.102) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Tue, 17 Nov 2026 13:23:17 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-p2exch02.corp.ad.wrs.com (10.11.226.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 17 Nov 2026 13:23:16 -0800
Received: from oak-lpgbuild08.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 17 Nov 2026 13:23:16 -0800
Received: by oak-lpgbuild08.wrs.com (Postfix, from userid 1762445530)
	id CEF4F41DBEDC; Tue, 17 Nov 2026 21:23:16 +0000 (UTC)
From: SaiSireesha T <saisireesha.t@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Sumanth.Gavini@windriver.com>,
        SaiSireesha T
	<saisireesha.t@windriver.com>
Subject: [PATCH] soup-auth-ntlm: Reject excessively long passwords
Date: Tue, 17 Nov 2026 21:23:14 +0000
Message-ID: <20261117212314.3466658-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106195125.102739-1-saisireesha.t@windriver.com>
References: <20261106195125.102739-1-saisireesha.t@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PslxqNvkSKohLnh7zyyvP8GxDF-Gm5XS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4NSBTYWx0ZWRfXyVMiyruRdWwL
 MTx3BJqt829q/AN0/bgHl0jUtnzfAPck0hDaPiAE5VVDZryBwwj8dDIj/QOV6/5c0FJd/1aA8tf
 RSr+LELT7DszjfDO8XC/AHnaaIpCDtovZZF08lXT57K20VxkKzmxm0T+nbhU/WNHpLIBeSmDjtd
 6ekd50w5Bi8ZFifr4eeKT1zEd+qDOOP+5m86QWZqXMuBtrMen5j5shUY/OkEp7Byiabf4sONmvK
 NszrNy1j9Y3IkwtgLMfJB/92pk8wYKqbq1dmt3U45QQ2OGqHIlaLaGabsxIn0HA7BOAaTdqAS65
 nzhQnR2sWiSyN+qY6Kn+RIo/YrB+6q41kxvjvW4MbFiY8clkmIZdVLFtulyGD8mvG2NciQnIhkJ
 A4Bz7BLuLNxSaejI439pyXG+q/ss0XW9KpEDor2TdgKh6SzZz9ZNHv3z7EMLTBTpx7UknWbx2wE
 yE9bUsRkjdA5HttAqTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4NSBTYWx0ZWRfXyF60Kvq3xGHr
 +wm8Ga9wYfTgd+C0BCpfk7u8aItt4RiQ1BApp6IyX/Z8k7Z6JCuw4FH4LOSb65hJg77LKUg4MQd
 gQvcTtRbQMJtIf288fCMyXMp0xSyTpBD4pBu1s9zk+JancDGNzNc
X-Authority-Analysis: v=2.4 cv=OJWyTiaB c=1 sm=1 tr=0 ts=6afcc5c7 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=Ig0ZtvGesqF_3ZK0nFsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PslxqNvkSKohLnh7zyyvP8GxDF-Gm5XS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 21:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132587
Content-Type: text/plain; charset="utf-8"

CVE: CVE-2026-0719

Upstream-Status: Backport [https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf921b4125b513]

Signed-off-by: SaiSireesha T <saisireesha.t@windriver.com>
---
 libsoup/soup-auth-ntlm.c | 29 +++++++++++++++++++-------
 tests/ntlm-test.c        | 44 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 7 deletions(-)

diff --git a/libsoup/soup-auth-ntlm.c b/libsoup/soup-auth-ntlm.c
index 2d078461..08eac15b 100644
--- a/libsoup/soup-auth-ntlm.c
+++ b/libsoup/soup-auth-ntlm.c
@@ -349,6 +349,16 @@ soup_auth_ntlm_update_connection (SoupConnectionAuth *auth, SoupMessage *msg,
 		return FALSE;
 	}
 
+	static const guchar zero_hash[21] = { 0 };
+	if (priv->password_state == SOUP_NTLM_PASSWORD_PROVIDED &&
+	    !memcmp (priv->nt_hash, zero_hash, sizeof (zero_hash))) {
+		/* This can happen if an excessively long password was
+		 * provided, in which case we don't try to hash */
+		conn->state = SOUP_NTLM_FAILED;
+		priv->password_state = SOUP_NTLM_PASSWORD_REJECTED;
+		return TRUE;
+	}
+
 	if (!soup_ntlm_parse_challenge (auth_header + 5, &conn->nonce,
 					priv->domain ? NULL : &priv->domain,
 					&conn->ntlmv2_session, &conn->negotiate_target,
@@ -439,8 +449,10 @@ soup_auth_ntlm_authenticate (SoupAuth *auth, const char *username,
 		priv->username = g_strdup (username);
 	}
 
-	soup_ntlm_nt_hash (password, priv->nt_hash);
-	soup_ntlm_lanmanager_hash (password, priv->lm_hash);
+	if (strlen (password) < 256) {
+		soup_ntlm_nt_hash (password, priv->nt_hash);
+		soup_ntlm_lanmanager_hash (password, priv->lm_hash);
+	}
 
 	priv->password_state = SOUP_NTLM_PASSWORD_PROVIDED;
 }
@@ -594,7 +606,7 @@ soup_auth_ntlm_class_init (SoupAuthNTLMClass *auth_ntlm_class)
 }
 
 static void md4sum                (const unsigned char *in, 
-				   int                  nbytes, 
+				   size_t               nbytes, 
 				   unsigned char        digest[16]);
 
 typedef guint32 DES_KS[16][2]; /* Single-key DES key schedule */
@@ -640,7 +652,7 @@ soup_ntlm_nt_hash (const char *password, guchar hash[21])
 {
 	unsigned char *buf, *p;
 
-	p = buf = g_malloc (strlen (password) * 2);
+	p = buf = g_malloc_n (strlen (password), 2);
 
 	while (*password) {
 		*p++ = *password++;
@@ -1079,15 +1091,16 @@ calc_response (const guchar *key, const guchar *plaintext, guchar *results)
 #define ROT(val, n) ( ((val) << (n)) | ((val) >> (32 - (n))) )
 
 static void
-md4sum (const unsigned char *in, int nbytes, unsigned char digest[16])
+md4sum (const unsigned char *in, size_t nbytes, unsigned char digest[16])
 {
 	unsigned char *M;
 	guint32 A, B, C, D, AA, BB, CC, DD, X[16];
-	int pbytes, nbits = nbytes * 8, i, j;
+	size_t pbytes, nbits = nbytes * 8;
+	int i, j;
 
 	/* There is *always* padding of at least one bit. */
 	pbytes = ((119 - (nbytes % 64)) % 64) + 1;
-	M = alloca (nbytes + pbytes + 8);
+	M = g_malloc_n (nbytes + pbytes + 8, 1);
 	memcpy (M, in, nbytes);
 	memset (M + nbytes, 0, pbytes + 8);
 	M[nbytes] = 0x80;
@@ -1187,6 +1200,8 @@ md4sum (const unsigned char *in, int nbytes, unsigned char digest[16])
 	digest[13] = (D >>  8) & 0xFF;
 	digest[14] = (D >> 16) & 0xFF;
 	digest[15] = (D >> 24) & 0xFF;
+
+	g_free (M);
 }
 
 
diff --git a/tests/ntlm-test.c b/tests/ntlm-test.c
index dcacd74e..a8b968a0 100644
--- a/tests/ntlm-test.c
+++ b/tests/ntlm-test.c
@@ -685,6 +685,47 @@ do_retrying_test (TestServer *ts,
 	soup_test_session_abort_unref (session);
 }
 
+static void
+long_password_test_authenticate (SoupSession *session, SoupMessage *msg,
+				  SoupAuth *auth, gboolean retrying,
+				  gpointer user_data)
+{
+	if (!retrying) {
+		char *password = g_malloc (65536);
+		memset (password, 'A', 65535);
+		password[65535] = '\0';
+		soup_auth_authenticate (auth, "alice", password);
+		g_free (password);
+	}
+}
+
+static void
+do_long_password_test (TestServer *ts, gconstpointer data)
+{
+	SoupSession *session;
+	SoupMessage *msg;
+	SoupURI *uri;
+
+	g_setenv ("SOUP_NTLM_AUTH_DEBUG", "", TRUE);
+
+	session = soup_test_session_new (SOUP_TYPE_SESSION,
+					 SOUP_SESSION_ADD_FEATURE_BY_TYPE, SOUP_TYPE_AUTH_NTLM,
+					 NULL);
+	g_signal_connect (session, "authenticate",
+			  G_CALLBACK (long_password_test_authenticate), NULL);
+
+	uri = soup_uri_new_with_base (ts->uri, "/alice");
+	msg = soup_message_new_from_uri ("GET", uri);
+	soup_uri_free (uri);
+
+	soup_session_send_message (session, msg);
+
+	soup_test_assert_message_status (msg, SOUP_STATUS_UNAUTHORIZED);
+
+	g_object_unref (msg);
+	soup_test_session_abort_unref (session);
+}
+
 int
 main (int argc, char **argv)
 {
@@ -708,6 +749,9 @@ main (int argc, char **argv)
 	g_test_add ("/ntlm/retry", TestServer, NULL,
 		    setup_server, do_retrying_test, teardown_server);
 
+	g_test_add ("/ntlm/long-password", TestServer, NULL,
+		    setup_server, do_long_password_test, teardown_server);
+
 	ret = g_test_run ();
 
 	test_cleanup ();
-- 
2.54.0


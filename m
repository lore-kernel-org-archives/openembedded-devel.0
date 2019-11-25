Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EE8587FC8B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 06:06:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,240,1571673600"; d="scan'208";a="79031549"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Nov 2019 14:06:31 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F9944CE1C93
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 13:58:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 25 Nov 2019 14:06:27 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Nov 2019 15:11:59 +0800
Message-ID: <1574665919-27970-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 7F9944CE1C93.A8F71
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libsdl: Refresh patch
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
X-List-Received-Date: Mon, 25 Nov 2019 06:06:32 -0000
Content-Type: text/plain

Refresh CVE-2019-7577.patch as it can't be applyed when using PATCHTOOL = "patch".

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libsdl/libsdl-1.2.15/CVE-2019-7577.patch       | 55 ++++++++++------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch
index 92e40ae..63680b8 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch
@@ -47,10 +47,17 @@ CVE: CVE-2019-7577
 Upstream-Status: Backport
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 
-diff -r a6e3d2f5183e -r 416136310b88 src/audio/SDL_wave.c
---- a/src/audio/SDL_wave.c	Mon Jun 10 08:50:59 2019 -0700
-+++ b/src/audio/SDL_wave.c	Mon Jun 10 08:54:11 2019 -0700
-@@ -115,7 +115,7 @@
+Refresh CVE-2019-7577.patch as it can't be applyed when using PATCHTOOL = "patch".
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ src/audio/SDL_wave.c | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/src/audio/SDL_wave.c b/src/audio/SDL_wave.c
+index b4ad6c7..0bcf7e2 100644
+--- a/src/audio/SDL_wave.c
++++ b/src/audio/SDL_wave.c
+@@ -115,7 +115,7 @@ static Sint32 MS_ADPCM_nibble(struct MS_ADPCM_decodestate *state,
  static int MS_ADPCM_decode(Uint8 **audio_buf, Uint32 *audio_len)
  {
  	struct MS_ADPCM_decodestate *state[2];
@@ -59,7 +66,7 @@ diff -r a6e3d2f5183e -r 416136310b88 src/audio/SDL_wave.c
  	Sint32 encoded_len, samplesleft;
  	Sint8 nybble, stereo;
  	Sint16 *coeff[2];
-@@ -124,6 +124,7 @@
+@@ -124,6 +124,7 @@ static int MS_ADPCM_decode(Uint8 **audio_buf, Uint32 *audio_len)
  	/* Allocate the proper sized output buffer */
  	encoded_len = *audio_len;
  	encoded = *audio_buf;
@@ -67,7 +74,7 @@ diff -r a6e3d2f5183e -r 416136310b88 src/audio/SDL_wave.c
  	freeable = *audio_buf;
  	*audio_len = (encoded_len/MS_ADPCM_state.wavefmt.blockalign) * 
  				MS_ADPCM_state.wSamplesPerBlock*
-@@ -141,6 +142,7 @@
+@@ -141,10 +142,14 @@ static int MS_ADPCM_decode(Uint8 **audio_buf, Uint32 *audio_len)
  	state[1] = &MS_ADPCM_state.state[stereo];
  	while ( encoded_len >= MS_ADPCM_state.wavefmt.blockalign ) {
  		/* Grab the initial information for this block */
@@ -75,7 +82,14 @@ diff -r a6e3d2f5183e -r 416136310b88 src/audio/SDL_wave.c
  		state[0]->hPredictor = *encoded++;
  		if ( stereo ) {
  			state[1]->hPredictor = *encoded++;
-@@ -188,6 +190,8 @@
+ 		}
++		if (state[0]->hPredictor >= 7 || state[1]->hPredictor >= 7) {
++			goto invalid_predictor;
++		}
+ 		state[0]->iDelta = ((encoded[1]<<8)|encoded[0]);
+ 		encoded += sizeof(Sint16);
+ 		if ( stereo ) {
+@@ -188,6 +193,8 @@ static int MS_ADPCM_decode(Uint8 **audio_buf, Uint32 *audio_len)
  		samplesleft = (MS_ADPCM_state.wSamplesPerBlock-2)*
  					MS_ADPCM_state.wavefmt.channels;
  		while ( samplesleft > 0 ) {
@@ -84,7 +98,7 @@ diff -r a6e3d2f5183e -r 416136310b88 src/audio/SDL_wave.c
  			nybble = (*encoded)>>4;
  			new_sample = MS_ADPCM_nibble(state[0],nybble,coeff[0]);
  			decoded[0] = new_sample&0xFF;
-@@ -209,6 +213,10 @@
+@@ -209,6 +216,14 @@ static int MS_ADPCM_decode(Uint8 **audio_buf, Uint32 *audio_len)
  	}
  	SDL_free(freeable);
  	return(0);
@@ -92,28 +106,6 @@ diff -r a6e3d2f5183e -r 416136310b88 src/audio/SDL_wave.c
 +	SDL_SetError("Too short chunk for a MS ADPCM decoder");
 +	SDL_free(freeable);
 +	return(-1);
- }
- 
- struct IMA_ADPCM_decodestate {
-
-
-diff -r 416136310b88 -r faf9abbcfb5f src/audio/SDL_wave.c
---- a/src/audio/SDL_wave.c	Mon Jun 10 08:54:11 2019 -0700
-+++ b/src/audio/SDL_wave.c	Mon Jun 10 08:54:29 2019 -0700
-@@ -147,6 +147,9 @@
- 		if ( stereo ) {
- 			state[1]->hPredictor = *encoded++;
- 		}
-+		if (state[0]->hPredictor >= 7 || state[1]->hPredictor >= 7) {
-+			goto invalid_predictor;
-+		}
- 		state[0]->iDelta = ((encoded[1]<<8)|encoded[0]);
- 		encoded += sizeof(Sint16);
- 		if ( stereo ) {
-@@ -217,6 +220,10 @@
- 	SDL_SetError("Too short chunk for a MS ADPCM decoder");
- 	SDL_free(freeable);
- 	return(-1);
 +invalid_predictor:
 +	SDL_SetError("Invalid predictor value for a MS ADPCM decoder");
 +	SDL_free(freeable);
@@ -121,3 +113,6 @@ diff -r 416136310b88 -r faf9abbcfb5f src/audio/SDL_wave.c
  }
  
  struct IMA_ADPCM_decodestate {
+-- 
+2.7.4
+
-- 
2.7.4





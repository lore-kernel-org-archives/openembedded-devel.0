Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id ACF54611C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 17:19:18 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id b8so1291282plx.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 09:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=T2oJ+neMKZ/SXN+Xvr8FjzBB/ZcQtAdrqmnKDt4aPBE=;
	b=UA63dAO+JQMHeVanV2KXhGOtDmfzY+s5rnA4HiYezZsvA4mdlotnL+hh8Oxa7etWz1
	mm2y4QHkx3WwPOPAVJsScDv07cXxvhEGGOMPp1vEmE15g+yansPo+al+WVrIj5aZ5/Wv
	1XKSPkeHbZVnOnX/bgSuJpXzhhQtQ/X2XrGpHV5daRisko/uJmPrqOKFnGZCzHrFLwua
	oWtqsqb+WCw15wvWLKj9fRQa61ymzbTXGbYj1a3CQF6xlNRl/ZmG6rsITSZbCouGrbX/
	cnMH7a4YVVKo8bWhunQkzsPj/Jt0vtIIvycWZwee+tcia1EYd07P95gZ63SsbyX2CuuL
	Sadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=T2oJ+neMKZ/SXN+Xvr8FjzBB/ZcQtAdrqmnKDt4aPBE=;
	b=KG1IBO96tYGMxxpj/QAnjpvoZ6hkgXgPREl4KK6Nc51ZbQvb8tk4rpig1umDkixmD/
	Z0YNetfmput3gCuh2kTu/WH8X4AJ9y8RK62g+NRJOJrQjJ+8K8hhohB2iFk8yTorutoO
	K5iSVJESnsxSkhPcwwvt69LYNeBGXwcMSmtw5jr38fl57FgPenQyMzuDu+5tF7Z85gnm
	L9wnS8y6l3C81e8B6RRU8s1oxqKnZy+geHvP6AFv9tE5oET1YH/RxU93J2OzkETYh38N
	Ft2N39rwhQth+BkHx2mCWe6euPTFvCXhLZ6ToGAnl0lGpvCg7HtJa++8J6KZUBv5HXCV
	tR0w==
X-Gm-Message-State: ANhLgQ1k9F7veOFKxk7o/aIrYwqx/KAWZP0neMz7yYzTZhWKP3jauzjU
	NcNnhJHhy9dCI+lHTuI5pHACT+TB84Y=
X-Google-Smtp-Source: ADFU+vvKBrtiavIMFh6Yw6jL2J8DObl+1vtaTJQLa2KRt44Q0NCfH5PzgNkE3MHivzHMM7ZUU/UvrA==
X-Received: by 2002:a17:902:9a84:: with SMTP id
	w4mr3898778plp.21.1583342358145; 
	Wed, 04 Mar 2020 09:19:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8ce3])
	by smtp.gmail.com with ESMTPSA id
	g10sm29343645pfo.166.2020.03.04.09.19.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 09:19:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2020 09:19:24 -0800
Message-Id: <20200304171927.2068660-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304171927.2068660-1-raj.khem@gmail.com>
References: <20200304171927.2068660-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 2/5] vlc: Depend on gst-1.0 ugly plugins instead of 0.10
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
X-List-Received-Date: Wed, 04 Mar 2020 17:19:18 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
index 7fadca4399..c15ff9a431 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
@@ -65,7 +65,7 @@ PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc,libpostproc"
 PACKAGECONFIG[libva] = "--enable-libva,--disable-libva,libva"
 PACKAGECONFIG[opencv] = "--enable-opencv,--disable-opencv,opencv"
 PACKAGECONFIG[speex] = "--enable-speex,--disable-speex,speex"
-PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gst-plugins-bad"
+PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
 PACKAGECONFIG[qt5] = "--enable-qt,--disable-qt, qtbase-native qtx11extras qtsvg"
 PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
-- 
2.25.1



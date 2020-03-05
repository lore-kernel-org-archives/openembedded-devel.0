Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id C09AB61027
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 22:39:44 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id l8so208312pjy.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2020 14:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8UAAlH9G2NGDcGxhJ/D1yAIcC0VdbqPF+R7gu8pGHGc=;
	b=m0ESBo0mVhkDCkdvh3q5GuDoKpLa5wokJSs0o4FhaTr5gwwdvM85b8T+78oBRV6lb6
	yu2CE4wTx51sG9R4sUgQb/T8edn0Qns57OoFIXiHMxqbuSKeU+E+y7eYiOzRFtOJMF3f
	p7OrWW9+3L4OPk0ap9NFeaWz1nMOU4gxFOyHr3CHLyVBTSz0J97Zzimf30JjS3V1reC9
	nV/U6dhwwpJycH2FW9AJ9zyQYaghHzZpQ6rc559YRgyXDAia4l+TfN0d7kMey8KCOQI6
	WWb2nF3pmxwq+5taI5UnsgkkfmshBUBf1S/RjPei4t2AUVDui6m7VKUNPAPL9Nu+9o5H
	mWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8UAAlH9G2NGDcGxhJ/D1yAIcC0VdbqPF+R7gu8pGHGc=;
	b=EI8Gbxk9OhL5lmaYZjhX7vLJZ+r7ca3R3jyPT4AjFm+XBPQQK4zKQFVlG802d6Y9t+
	xiuyaJBDnpYfK17z8M/ZKSW/rext1zjM1giRhKnFswHNSeQlldGgNb4SJGdEPOhoKTvi
	gocW6hw6OtcVvqC8HjuDXokKPR5YYsZBu+K5LAtwIU+4xa6OfU4y4rCaV4aHlTg6xYuf
	Uyn39/SCSCZLAUpB5XYne2mxSqOec70Zlf5OcHf73B7Rr7ZBtjfdelwp7Qmba+S1flVe
	NlcJeRaBxLoM4qJnVvXVQaosJt9lH3TFWmluUUdrWxfSRQsKaOoVtNR7fcRkYDiPzRJN
	QLAQ==
X-Gm-Message-State: ANhLgQ1iY4USwL01UQkBfYfFFqAhHr5Ie6g0/3woQ0D/sXOmZrJksA1F
	BUqLJyE46/h5sW8U55Iqso9Ys6+lpFE=
X-Google-Smtp-Source: ADFU+vsECTJR7VwCwVwgnfsVYskUHnLHcUAEujVDQk8wEONHw7AjCSamHx8TaQDCi6GgHe/pUzpxfg==
X-Received: by 2002:a17:90a:5285:: with SMTP id w5mr371433pjh.77.1583447985644;
	Thu, 05 Mar 2020 14:39:45 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	x11sm32871795pfn.53.2020.03.05.14.39.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 14:39:45 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 5FD9D2A0501; Thu,  5 Mar 2020 14:39:44 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2020 14:39:36 -0800
Message-Id: <20200305223937.12418-6-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305223937.12418-1-jpuhlman@mvista.com>
References: <20200305223937.12418-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 6/7] proftpd: remove macro-prefix-map from prxs
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
X-List-Received-Date: Thu, 05 Mar 2020 22:39:44 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

macro-prefix-map points to build WORKDIR which will
cause reproducibilty failures.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
index 409947265..a080bec81 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
@@ -110,6 +110,7 @@ do_install () {
     sed -e 's|--sysroot=${STAGING_DIR_HOST}||g' \
         -e 's|${STAGING_DIR_NATIVE}||g' \
         -e 's|-fdebug-prefix-map=[^ ]*||g' \
+        -e 's|-fmacro-prefix-map=[^ ]*||g' \
         -i ${D}/${bindir}/prxs
 
     # ftpmail perl script, which reads the proftpd log file and sends
-- 
2.20.1



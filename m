Return-Path: <ashcharles@gmail.com>
Received: from mail-pb0-f41.google.com (unknown [209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5706FAC4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 16:43:44 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id uo5so9625161pbc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 09:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tgzNt/fF4vtYJSNDKpMqFRlEUTl//fSPQqJQrxZzbII=;
	b=WwILlOPvPAA7IvPcpGgUv4C8rOKazJSnNjhlvJMBli8GTKlQz7bIqQda/Ev2pLmuYR
	5DLY3GFIj5M81YWPlfDLflNQvvkI66Qd/vPMwUIVm3ApoLehxXX7ycHSrjwHUVCG6diQ
	7GX5h1yNU5/JtNH9Y06VjdXNVnmPVWofLC6EtzNX8kwBYuiT2mmQB/6jnb8C+PORddBA
	aglAzbFJPUPrL2vIF7h14vc5UqFSaTc6kKRxdU5K3IqstDby1ZhVtamz3SlKRp2vSp9J
	496OUMUTSnoWNFNWIk7RGRjVWELVO8utNXWM+e90kmxplGzeERjyr/ABmmsPdnox19iU
	t28A==
X-Received: by 10.66.164.135 with SMTP id yq7mr38283629pab.126.1401209025533; 
	Tue, 27 May 2014 09:43:45 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	xc1sm75633553pab.39.2014.05.27.09.43.44 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 May 2014 09:43:44 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 May 2014 09:43:36 -0700
Message-Id: <1401209016-6182-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <CAP9ODKrwoKgT377SUfe6e9=VbuwX4s-7tzdTwXgdxqC=fzPAkg@mail.gmail.com>
References: <CAP9ODKrwoKgT377SUfe6e9=VbuwX4s-7tzdTwXgdxqC=fzPAkg@mail.gmail.com>
Subject: [meta-oe][PATCH v2] eject: copy po subdirectory for out-of-tree build
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
X-List-Received-Date: Tue, 27 May 2014 16:43:45 -0000

The po subdirectory found on the VPATH for an out-of-tree build so we
copy it over. See [1] for discussion.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/096052.html

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index c47c653..b6e181f 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -16,6 +16,11 @@ S = "${WORKDIR}/${BPN}"
 
 PR = "r1"
 
+do_compile_prepend() {
+    # PO subdir must be in build directory
+    cp -r ${S}/po ${B}/po
+}
+
 ALTERNATIVE_${PN} = "volname eject"
 ALTERNATIVE_LINK_NAME[volname] = "${bindir}/volname"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
-- 
1.8.3.2



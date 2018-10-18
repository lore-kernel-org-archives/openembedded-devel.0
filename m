Return-Path: <danismostlikely@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id CDE8C79B13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 15:46:45 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d14-v6so34766077qto.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fDfEhsRFWJTcdMnPgXzmJK6JkgHo1R/jIWsw3eK+x60=;
	b=r9eftGL25OJoopuUVSKrSeC7YCgYeqDfcmIsVqIOXdzT6h2gECaQEshZrGOWW6iHi5
	PAYYQmtElz+dHbgb2GVWDkkajr0FO17ac+CgGZFFmlC4ZgAwBEglyM+5OEpo8T99+a11
	kqAATff1uwEQ40I/A53ukQFvGfEjjP01lctX6h08Y9f9FWc3Uv2xm0b/oVZo0rpYY9m2
	EboJdIzt4COFRJLRdhlV9pQly44Fco361gptCoPiPGCLFGMHVqVMEY8k2KWX9aSdh16/
	6jGq22sindwv1POVKh+CP6aa1sm2zCvybFndntIW48tWGa4OKSgyGwDavnFuDqk8laMd
	bX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fDfEhsRFWJTcdMnPgXzmJK6JkgHo1R/jIWsw3eK+x60=;
	b=MF8ME7J1SOST/g/JNIZGO3imk5R6YXQEqHRiLZJA/3h6uYB9Sn6irmWElvhGnIfMiQ
	mg9lVXkFNAMiBv2VcyCkwgrP0b8sW6Wn4jahY9CUL+fnE0msUXBYFtvpmcR+IUsRG710
	le2PJ5gX0n8ES/0wmjOgAykYQARqiuCDL6cvaN4vUiyEMqHcaMVa3hzRJU8ftOyzqnsc
	VsB6oc5IA0N8QqLFj7EOpK+Abk+cYWkYVXzno03SPkhfbAn9Fh0jTadM34kqbBNtL9Xp
	EdjvuL7osN1hipLOhrkQBqSvxfcqvESBcmX2toWcdwnqX75Fe+zFshF/nPGcQWpAz9zD
	EM6A==
X-Gm-Message-State: ABuFfoh4M22i9Hq7SQvrtxFukL/pzX5RqwejD/sksbAo8jBh7NoVS028
	FhXVX+Qe3dRd7Upg4NGrcJsGGaW7
X-Google-Smtp-Source: ACcGV61m76OI52EupWH7dbdJbr7Xf4qcE/NJBOdHlAxERqnvGkutK85tW+u5hlROKqP+YRpApUKBjA==
X-Received: by 2002:ac8:c6:: with SMTP id d6-v6mr3548763qtg.376.1539877606359; 
	Thu, 18 Oct 2018 08:46:46 -0700 (PDT)
Received: from mediabox.local (204-83-204-143.prna.hsdb.sasknet.sk.ca.
	[204.83.204.143]) by smtp.gmail.com with ESMTPSA id
	o4-v6sm14922401qtb.44.2018.10.18.08.46.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Oct 2018 08:46:45 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2018 09:46:27 -0600
Message-Id: <20181018154628.27229-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.19.0-dev
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] vim: alternatify xxd
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
X-List-Received-Date: Thu, 18 Oct 2018 15:46:46 -0000
Content-Transfer-Encoding: 8bit

From: Dan McGregor <dan.mcgregor@usask.ca>

toybox also provides xxd.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/recipes-support/vim/vim_8.1.0347.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vim/vim_8.1.0347.bb b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
index 8713d66ed4..46d229e03b 100644
--- a/meta-oe/recipes-support/vim/vim_8.1.0347.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
@@ -106,10 +106,12 @@ RDEPENDS_${BPN} = "ncurses-terminfo-base"
 # Recommend that runtime data is installed along with vim
 RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
 
-ALTERNATIVE_${PN} = "vi vim"
+ALTERNATIVE_${PN} = "vi vim xxd"
+ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
 ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
 ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
-ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
+ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 
 BBCLASSEXTEND = "native"
-- 
2.19.0-dev



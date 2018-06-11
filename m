Return-Path: <remi.rerolle@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id B679D78B85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 13:43:45 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id v16-v6so14795837wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 06:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=37jgSemLfgTTJDwuzetlT2rEST0qoY5pJmeCbGNfNbQ=;
	b=A6uJ6cE/r7m41YExc/yyTWKPf80ZngtFBqfHEx6QP65QHLd8qChEGMeqRZOiPqznXp
	3zJ0l2qAXAkfPccyt0Eit1YIUP6dRQFHuNmeK+bB18iXNu4swyE65Z4a2zb4YBSkD4T+
	oQNEWLRy/w3euDL1laqNp8WyJDbHWAcBfzBUSsM6VwSAyPC61Ewr5atwqRDR4TUksfCz
	yypt4+2O8dFlLyQ0T3MzGPU1YUJLLYA+3EDFp0n6WGkh5W/Gh3TuTJpnA9k6wLhIY0eF
	llvaZEgzfXO/uAqXTKqVozg4GuG/LyrTYvrBZQFtGZx3s+Y2Dms9j6QPOrbknsfeFrx1
	3LLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=37jgSemLfgTTJDwuzetlT2rEST0qoY5pJmeCbGNfNbQ=;
	b=CRi0ZPCeHg42NEZVkD3bhmJgHySWpW0fv4iPwsquZw9hF8Vx5LVGtYLnlGzVW0EWEN
	LTAbd+C3kHPN84yXVUoEnJhizP0a3TQmuccmqvd13EkVmrPwB3YdYkS67YG8E32z5fu3
	CTVaBKvn56h9coiV6g4NaAb9ORC8/f6sAOlY5L10rd+6u6vvkcdl21FTHH+lCwVZ1MUL
	79bOCa+ntAJGAlGLYMUvBVN5f+GSabWfeloh5zUt48F68vA/EXresW7TUwG1lKDCOUV+
	aRXRB3YIDDTAxKL4iGivSHjD7say6YzAGfIARitPzGj4rFsRSmH+pNm1uKk4/ceMId0h
	01AQ==
X-Gm-Message-State: APt69E3IxhUVUyWPuIi8hUcIyofjm5mNCdNunhc82BAFElgc18mwToD/
	84D6M6bLKvs0gjPTXoV+vcMpWSGh
X-Google-Smtp-Source: ADUXVKJGxkw7F1uN675XqrmXFqI05DTtz1LgfjGtAczSP84ru9QxsHMC9dPw/GaaWAJ8S6qJbjHv9w==
X-Received: by 2002:a1c:6503:: with SMTP id z3-v6mr7737417wmb.11.1528724626093;
	Mon, 11 Jun 2018 06:43:46 -0700 (PDT)
Received: from vps58393.ovh.net (vps.neonex.fr. [92.222.2.205])
	by smtp.gmail.com with ESMTPSA id
	m16-v6sm28274761wro.91.2018.06.11.06.43.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jun 2018 06:43:45 -0700 (PDT)
From: =?UTF-8?q?R=C3=A9mi=20R=C3=A9rolle?= <remi.rerolle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jun 2018 15:43:42 +0200
Message-Id: <1528724622-16649-1-git-send-email-remi.rerolle@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-networking][PATCH] samba: add dynamic packages regexp for auth and pdb modules
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
X-List-Received-Date: Mon, 11 Jun 2018 13:43:46 -0000

Since those modules are dynamically split into sub-packages, they need
a regexp added to PACKAGES_DYNAMIC in order for the samba recipe to
RPROVIDE those packages. Without that, those packages are only known as
RRECOMMENDS for samba-base, which can be an issue when building an image
with NO_RECOMMENDATIONS = "1".
---
 meta-networking/recipes-connectivity/samba/samba_4.7.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb b/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
index a8517c5..ee298b3 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
@@ -218,6 +218,7 @@ python samba_populate_packages() {
 }
 
 PACKAGESPLITFUNCS_prepend = "samba_populate_packages "
+PACKAGES_DYNAMIC = "samba-auth-.* samba-pdb-.*"
 
 RDEPENDS_${PN} += "${PN}-base ${PN}-python ${PN}-dsdb-modules"
 RDEPENDS_${PN}-python += "pytalloc python-tdb"
-- 
2.1.4



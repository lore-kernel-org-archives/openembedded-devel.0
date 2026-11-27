Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10264.1795753010020516307
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=j1xWsgq0;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so1416291c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753009; x=1796357809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ccm4l/gImKKqN1JGbSSgTZ0q8a6RKZ2lAcXM9ZS+07w=;
        b=j1xWsgq0rfw7UTmjWhi5XnaVOrJuI7KaN18GWEFETs8vKpqCGFAQ1GnjoFJo8Xk4UV
         ZLwX0GkRmIgsDtyf7XvfK053e3xTlmRSeGo/PT5bp5MGot+BTLglBQPMNB7VGa3I8K9r
         eiUO2f/L0EqBSyb24w++opR6t0JDCgpsI7xmxTTNO52quDBAfDiRwivbqF8ZhdwQU6Q5
         VMW24HuDi2w2hjU6qCEw05WA3Ct9B9q38GnOJZ260rZBfdbiifnHHjHd276AOVhBTjhH
         Gzeq09wGGpYIO3Pa1bDZzJmy3xCJmCxTzwwpWKpWVzUYga/X9jIWXnxNPEBFe2OYJw6Q
         PmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753009; x=1796357809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ccm4l/gImKKqN1JGbSSgTZ0q8a6RKZ2lAcXM9ZS+07w=;
        b=QsC3G92CEG6z3X2pn9hUlo7ZTJHMz1vDdKgZrYez52AMubkmIL2Jlbtm30QIC8ZT4p
         zksR1tidqQhm3mWVLtFPQnQTbtaufq5GeCIotp5OSnZlwgi2zfsU/x1xKJh1LlgQPeip
         pePuufECzmxhrgDgHLztsbKSexnCQ7m1jPBeZBSR+tV+9f0AEf7ykgw+g4snRG3+CfqP
         sE6DRR0/zGgBBhgfMR5TvY4XtytfAYZyBZPagNAI6D/0rrxhwCJytUc+z2H/B04rxI5v
         jflMSKikY7MwdPVKP+PITeuETIIZiG7ot5Tu8i1ZiOBqZUAJ1kKKixEzfctHaA4XDP4n
         EQaw==
X-Gm-Message-State: APuU4Z9zLypb2vIeRa+t4XqRYfFuVd8nzl0/nM6EFcdoeJbCRM3PPdBv
	YDjE2t4Jaae76Z8Lr4mniVEYUc6NDcXQB743/45+VhOYf/HZcDjc4PhxEk8XwXRy
X-Gm-Gg: AZFdTZeNKi0G+dvRPTf6hSgrj8dI048XakJJL/x2W8+qOwDVqXCjzrXe3yXFRVCClnI
	ySt64h+fR5XKn20JcGwkuzJcZRVst3CKbY0e6oW5XQKZ9PLrQpI/bj26AE98e24UMugrs5VNU1l
	iDaAc335ltgX0vpeoDk0AO51gGzxjdSNiBzzNdDdvD16lecyV/qGdagvbNsA7i4DjBUF8WU3CcO
	Qa99JqzaOkNqgU6ct0Y7hP0PPiFkzblEcUxpHc7IczQj9MfaexSdx8h7az89zfXbSeFWo/Mo8Bx
	qVhj36Lu0/F/15c2096ldpytxPXUjz1k1n6yRnzKstlx91mtISFb5kisL3lzNjf9e4J7IlgRXZn
	W2ueD2skvxcSdI7Gy4ZiAsu3yGtsIlwl2Bla4SqNxYp77yd9U1LdodimaO/9neevyNXge8nIRu8
	nKx4GbES3qwtpUwrj/dk8qERlCK3zEr7ei9/d/9iLKJaRUp+bsuWjBBpoWltuGLLTowEMRhnQ7F
	vGvNttKP34ktAsi/+8aNQeUJgEOrPHBtxF0Kb8lm+5uRqKZ6YU86l1ul58wOn8H4Vsr4mTCSC+z
	uJzhviSNnzpuMXLN/uiTFdsrT/tH/QqhjbElnYjoAD9b0qylkPut8OxtSUTBX3gjEpzmsFGqkaV
	AWZlzhTSBF/W9B+b1SIsOi/eKL6M9V31qT+uPFk37O6fdOrmR/C8mc+WWZBH6rpaAM5ivFAiA24
	BCy4D0gEftzW8UHSp6BOx6OELd1qQiApvPyqlqE2rAZl13Wtx5si+T3RXaSx4bZslhgEBKr9N5x
	C2FeMj2JPiNbDdd8M3/pmbAzFgTiWLo4+wRSNHCG3ObNltH6sWsseT8EQK9JXeoUB7O/7nP0keM
	UiaF
X-Received: by 2002:a05:701b:2608:b0:15b:afce:62c2 with SMTP id a92af1059eb24-1b55691337bmr19906558c88.41.1795753009406;
        Thu, 26 Nov 2026 20:16:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 30/32] python3-filelock: Build with the python-sbom hatch hook
Date: Thu, 26 Nov 2026 20:16:12 -0800
Message-ID: <20261127041614.1775064-31-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133249
Content-Type: text/plain; charset="utf-8"

python-sbom is packaged now, so stop stripping its hatch hook from
pyproject.toml and depend on python3-python-sbom-native like the other
tox-dev recipes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-filelock_4.3.1.bb       | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_4.3.1.bb b/meta-python/recipes-devtools/python/python3-filelock_4.3.1.bb
index f0ee1943d2..5e1759599e 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.3.1.bb
@@ -18,13 +18,9 @@ inherit pypi python_hatchling ptest-python-pytest
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
     python3-hatch-vcs-native \
+    python3-python-sbom-native \
 "
 
-# python-sbom (an SBOM metadata hatch hook) isn't packaged in OE
-do_configure:prepend() {
-    sed -i -e '/python-sbom\[hatch\]/d' -e '/build.hooks.python-sbom/d' ${S}/pyproject.toml
-}
-
 RDEPENDS:${PN} += " \
     python3-core \
     python3-crypt \

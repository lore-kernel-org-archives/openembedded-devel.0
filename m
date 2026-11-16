Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33657.1794851701345225662
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GaO+I7wz;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so10472730eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851701; x=1795456501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8l0F5omloOpNH5gIFBiRPISDwefPT80pzsvRdxBeSE=;
        b=GaO+I7wzkqnLR3VJRRDtq7XPbP+UrafuuC4Jxg5mYEfDBhrhUu4QgDrC+DGgCsCE7l
         MDmGyTO3EhSQLBoMmb1Hiz7tjpU+0sYwDNHQnxGu+E4KYwsiVZEFDcK9Lm1zPO2ctggx
         n12Ltu2npq/5RsP4/G4qO4S49IUujbqK3vuSXl7S7RLvkx0xZajuvq3duHFx4BIzfrsL
         x8gISZInTzXmOIk8gRGMNC3RJeqzRdx2fm5yCQ+AGbe0pJn0nIG55oTBdexuH7+5XZ8g
         GYmUgTGTtE8S9OOBoi1sSt7TW+5IF+sQPSAj8qjo84g0HX80U3oecXL71R8ua6cDcZdj
         PvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851701; x=1795456501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8l0F5omloOpNH5gIFBiRPISDwefPT80pzsvRdxBeSE=;
        b=kSWddU3bHhq0XnIwnoaq69dLL9YUh4t4Qrk7kE4LMIpShreMmwlGkLcbiUYyncQZ+H
         2XSflM7UVmv8pOU6pulf3LAYdwVGMrKc1vwLj9ZTjsE4XNSN9tfKtJ6KSBDunKnhhRZM
         Izv3PzUCUxoo6qGxi6tbyXyridn+WSWkTeBy7rJsC+Mtqni94tPj+vMHSIsL2UsZwwsc
         /7ECD3ZezwAY1Tuo14YpusnharoOYn0ifZoqI6GZhtyUgBNio/AF18rRG+jcZkGTJJm/
         zqInYDIj882TPz+VnhhA9fodyIWH9n/nUjExI6MNzfdgMIMUi+a5o8ZUtu/7Nnn/nnFw
         qi7g==
X-Gm-Message-State: APuU4Z+5r+m75wbOHRoKf5hMu2OkNsykdmqC3YJvTluxVL0LSGAl14f9
	WilfqrO9sCa5XsQ5cd2xcELcRfwpqxBeMdo1SqedwEkw1WrUuqZLm3ug5B0H6GtU
X-Gm-Gg: AZFdTZeFPkLLIPEYNuQd31EzT6Xjh35EnSeuz/0hOpq/etC9ovRFlueVLfJrixU6lN/
	POUscovxnnEiTl+Tkz/P/A09v/ebtBW4BJXLG2wRZ7cD02MbWqEPjewsNQEtxY4W0uZ4ibvKG+o
	Ym+bLfAzQgCMhhWu6NUN6SspsUcmtPOeZqDT0mIQONeClp+agJ2Ebp+sFnLLbUDWBpYcgwOQz8p
	8mhTaomrUXqKUsLyxSZvwQ44+/p8UA/dZBFWHwjmIRIhiNwiuC9nMgdwrS79q722FhW2LrWsrm5
	dWlZPjZ6z/kpX/PZwjyQhQ8MV+Zh75yTwHeUIjALkO+svjCPnBVkBigGs5LJHrsVWMEmWg63/iH
	yBFAlKBtcUaSH3q1gHuyzGqPr1zBGGVYGxF3PiJiyN+sYMfY5/n9cqZdP/wDhdZYC8TdqvUKpgQ
	w5ANN0NEoK5o9YgviFJMXeU10B3VhhtypHlfX39qPs8BMPC41gXrWQr1PbqIHkdtsKnOWoBt21J
	ixjPNmaUqcoFu3uuh+ACae3oazFjM6ihLBJiEYt7qsOZFzF9MHHl13PGFug1RIfpiaFdCh1HztI
	3LBF8SwWtCvKPsdJ56XW7rJAChEzgY04Gph0ihriQbt70s1xWf6bt7OsFlNUfckNSYh/MlDlME9
	VgFXa9knBciQuDhBRVAaCNtdwgQEpbVl/P1cOchC38YknKqITrwyssCocBjlt+eUnl5wJqhBmzM
	OweoC20OAtH+PA59TQ0qcBCo3fT1j/Woo5tOBWw+Chgba5kRvmojH3k6Nh4l8SFVpsEn+psJe2S
	AWs/jXv1Ux6QxIKnznq7aFKc9mXKuIGfaUD2qCEz5icUBhGVb735W5U1qHXtm15N9r47ds64VjJ
	/oJr
X-Received: by 2002:a05:693c:6384:20b0:36a:1709:458 with SMTP id 5a478bee46e88-379675fc98cmr11878935eec.27.1794851700694;
        Mon, 16 Nov 2026 09:55:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 041/105] python3-gunicorn: upgrade 27.0.0 -> 27.0.1
Date: Mon, 16 Nov 2026 09:52:53 -0800
Message-ID: <20261116175359.342679-41-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132497
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-gunicorn_27.0.0.bb => python3-gunicorn_27.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_27.0.0.bb => python3-gunicorn_27.0.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_27.0.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_27.0.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gunicorn_27.0.0.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_27.0.1.bb
index 658abb9830..fecea2227c 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_27.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_27.0.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "WSGI HTTP Server for UNIX"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dc9171ccd8fcbd7827c850148b3ca98"
 
-SRC_URI[sha256sum] = "88d52e7c60b3af07bc8db431fbb450a94780f2cbe7c420c7cf1891392661c591"
+SRC_URI[sha256sum] = "b1514965361c8b7e8107a80aa2a92636878df1ccfac6dd204a676426e04d9e3e"
 
 inherit pypi python_setuptools_build_meta ptest
 

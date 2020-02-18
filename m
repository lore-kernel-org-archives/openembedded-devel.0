Return-Path: <jpuhlman@gmail.com>
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
	[209.85.167.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8B69F60573
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 21:55:28 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id r137so2160236oie.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ivdMRZOO3VoYGtawmShiD3DDNbGHU7wfkUbKWmxWAfs=;
	b=mn43r9ohj7YRv/eJTJHzF94zo2N0qttI/pSC8zcPzRlbJh43FoMagrOnD4p2BSdZCY
	OzwK7lHfIPPvHzgp2c2Ixh/Yq+AZM3bQO1djzUVeeWCiyqQu6+VDaqqJ0KREROMaLbVx
	8XWdPWGbrsWlsRTliNyb9w2MBIRZZzZH3npNyAkdZ+fMV9hoz/bB62AHo1JupW+XGZM1
	syhyOmxnj4AznHC2fk+O87nDt0/pvdDxQNGsA8TYWd6oNrxuhO5/KHwtoK4AKtd2wgc7
	EAJZNtAyv8dEcsIKEPJqCNee6xDaV+tE0s7JxoWYSJEvAbys+xOuYzERoEtub6JzeoH+
	joyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=ivdMRZOO3VoYGtawmShiD3DDNbGHU7wfkUbKWmxWAfs=;
	b=b3U7IL1A7XQF0AzfQjXq0sJk8BcengYDl3mmhcFGJ0SrFFKeW5ug/3ketfpjPtPYsp
	MiY1fsBy2dMSqTblCGqOCoqIA9aABb/MgRmSmRS43DkUP3XgLawlHE0oYXsXPqWwh9wc
	hkcMLztChP0Dyz2QfUq+y9yaDw6OJ+bFoDwAzdwy4qDWFSdBgpU/Egv1L9C5XRPcjjy7
	yQb5AOrMFqBYho/xapcrC2M7ez4gqJhY85cBhulqOjM4lhnn5B/ZILCqO0dOkO/PlA9/
	pb0PT0KY2MqB2p0RMR1qdyXZEafU9lbO/GpdUb2UVqc4Xsdv7UVv58UXXI5MCmM0t0x4
	wUMA==
X-Gm-Message-State: APjAAAUfyc0PssPEAbE38mu8NavH1uLiCYrA7IoNrCF0A7a1ny44/rZE
	AAgLMNTBQBhYoMBHjIZjX5wOxxFL4rrMqw==
X-Google-Smtp-Source: APXvYqxhNiOq3fDplqCA1jdXjR8crE/H0FK5SnO6xMxbZigap/35f+GvcOnz7CmYtbjqY25BDC59aQ==
X-Received: by 2002:a05:6808:8ee:: with SMTP id
	d14mr2517749oic.138.1582062929131; 
	Tue, 18 Feb 2020 13:55:29 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id r2sm1776033otk.22.2020.02.18.13.55.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 13:55:28 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 609392A04CB; Tue, 18 Feb 2020 13:55:25 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2020 13:55:22 -0800
Message-Id: <20200218215522.13099-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: Add pam_auth to server package.
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
X-List-Received-Date: Tue, 18 Feb 2020 21:55:28 -0000
Content-Transfer-Encoding: 8bit

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

When pam is enabled, the pam plugin in pulled into the
server package but not the auth tool which results in
following error on boot:

Starting to install database for mariadb
chown: cannot access '/usr/lib/plugin/auth_pam_tool_dir': No such file
or directory
Cannot change ownership of the '/usr/lib/plugin/auth_pam_tool_dir'
directory
 to the 'mysql' user. Check that you have the necessary permissions and
try again.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 23de69dd2..6888c64e3 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -299,6 +299,7 @@ FILES_${PN}-server = "\
     ${sbindir}/ndbd \
     ${sbindir}/ndb_mgmd \
     ${libdir}/plugin/*.so \
+    ${libdir}/plugin/auth_pam_tool_dir/auth_pam_tool \
     ${datadir}/mysql/ \
     ${localstatedir}/mysql/ \
     ${sysconfdir}/init.d/mysqld \
-- 
2.20.1



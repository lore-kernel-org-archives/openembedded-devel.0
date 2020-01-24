Return-Path: <kraaggorim@gmail.com>
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
	[209.85.219.177])
	by mail.openembedded.org (Postfix) with ESMTP id D30E37D6B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:42:39 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id o199so1110146ybc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=PnVvJsyFfeEHmeBnbZt3CkbaeUR//Tfw5Kt1z76jpso=;
	b=OA49cwpkPrcbXm79yNKCxngKW85YLVsZgar8G1h2N8QdHWotXjSRCXGz2JKChLVS+U
	q7mwNd8QQ6yMukpgmOj73PgnqJvtSGkdonJuCzVpwD4z9tdGMEDccAIFSMctozRgb0/7
	ANrzWInFhsD7m33xts941IvrPRCj/L8Zfl+iJWnEa7FWPZiiMmhefhGEHWgMsoLEtsLJ
	iYjE4LqCx+N7uGDZrZ9ONbdPvrR2023YZzvUxLwssF3STaeTKKCJeLvbmepGqsw7hWE8
	RnwXg3RwlsRBp7O60m3ZaYZIXo8AvWmptoH7zLijsVDeNKoiuS+9HXsZ7iuFT6Z2jGvt
	C1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=PnVvJsyFfeEHmeBnbZt3CkbaeUR//Tfw5Kt1z76jpso=;
	b=REVLefLiD+HpbLKZc1PNR1OX/sUMsdPCkRQPZ/4mq+1hC/sYyUQm757JP2rQgY5+UA
	AClu6mCD5bh5IiyqKfZhTunDACZrNMckjSKiNnJpvxYEIo0ZJpquZysCBK9YYPFh7NZx
	cY7a37yeN9QSNC+ed6rL8pxbvtCEIcL3O4Qvp1/aKbhRBNrl9MzTAmjfyxFboB+SOC8l
	LpQGFVYUSe/DKF23NnrqtpbQqZs4zSeKRA2z9jK5Xrzr0U8JSLbTSSumngVGW2+Cwmpq
	6kPJ6dja02IkGmAn+QtNlqaxfvLSDrI0bxu8KlDLxU/c0StIXUJXnWnqt/1npvlyx9YN
	/uBQ==
X-Gm-Message-State: APjAAAUR7tdGwPd/BeGW920SGkn3CkZJidxrOwoSGnHwvN4P6hCw2+99
	jLrj7oJOzUTyIhZZoPnjTqrUKiIPT+ba/oNyArdN5s/4iPg=
X-Google-Smtp-Source: APXvYqzvclH2XPnJcOpg3+K3VKut2iU+8fotAN1jbmD3XXD2HBwLcfOX0TLQQQCwGl/+VAaqquWV6mRo9ssf3+Ex9A0=
X-Received: by 2002:a25:aa0a:: with SMTP id s10mr2831176ybi.367.1579880560712; 
	Fri, 24 Jan 2020 07:42:40 -0800 (PST)
MIME-Version: 1.0
From: Kraag Gorim <kraaggorim@gmail.com>
Date: Fri, 24 Jan 2020 16:42:30 +0100
Message-ID: <CACc3Zv76egeazQ=aNtU7w=w3-Tn0=2Q7uThehJzHdPJ2mYrYpQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [PATCH 1/2] java-library: inherit python native
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
X-List-Received-Date: Fri, 24 Jan 2020 15:42:40 -0000
Content-Type: text/plain; charset="UTF-8"

Several components make use of python in their build process. To not
rely on python being part of the HOSTTOOLS python should be inherited.

Signed-off-by: Kraag Gorim <kraaggorim@gmail.com>
---
 classes/java-library.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index e0159ba..adc4cb8 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -17,6 +17,7 @@ PACKAGE_ARCH ?= "all"
 # Fully expanded - so it applies the overrides as well
 PACKAGE_ARCH_EXPANDED := "${PACKAGE_ARCH}"
 inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED') == 'all',
'allarch', '')}
+inherit pythonnative

 # use java_stage for native packages
 JAVA_NATIVE_STAGE_INSTALL = "1"
-- 
2.24.0


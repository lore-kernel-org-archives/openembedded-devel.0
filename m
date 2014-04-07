Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4075B6B523
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Apr 2014 08:52:42 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so382761eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2014 01:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=oibIAsSBQYKE0XLGm0YnPerffBv/UST+nZ/yRBbnNdc=;
	b=J8NU/Nd9Ou7QrJkLqbFdI4SgSgA1HPXHZf2/+QPdtPxw9S31FMEL5xcWihiUDQScoO
	YZk1rV3u4UJ3GY4yiwbxXjoq55TZ+FF7LC56OVZz5ahNg69nhW3NL7gtH1RqdvkcxTuV
	VgdsotJ8roxr8IELnApBAFJfI9lo76UxzN5tJ1JF0J6FcQuELQ7C6fOL7U1vXVWsKWKY
	BABJivyzxWHWv2/02CdSB5wzTyIVEeHbyLCcHDQzwivUmSK3KLRy6C2IJCAhtFQ3XTQv
	M/4dJopepAwHG0OfealLp0HlwYbgIIDOE6KfrzQxhFjOjymL1KEA6w48IGrKfLKhXb+K
	K/CQ==
X-Received: by 10.14.109.201 with SMTP id s49mr122877eeg.88.1396860763026;
	Mon, 07 Apr 2014 01:52:43 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id w1sm40445641eel.16.2014.04.07.01.52.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Apr 2014 01:52:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Apr 2014 10:52:25 +0200
Message-Id: <1396860746-17944-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-gnome] abiword: workaround compile races by disabling
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
X-List-Received-Date: Mon, 07 Apr 2014 08:52:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Could not reproduce world build error here so we need to wait for
autobuilder results.

Andreas Müller (1):
  abiword: workaround compile races by disabling parallel make

 meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

-- 
1.8.3.1



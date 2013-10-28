Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8561F6CE55
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 23:06:33 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so4939776eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 16:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=q+pWJbk1nYRwmnigBDqfaUdz/Fofz3M14POEqX8AjUo=;
	b=0XrMj7K0J070oyOTC00cEtNOV0z0fdMCLu+2hV2tife0vPxibaCRMQQ6ru5tPxm/+W
	22q3zZn2XpsdbYcCwYzmGBeJdgl6fcOYSabrS6e1wweKfoFYKS1iDHBT8D9z4kCf+OA8
	Pijw2MnaWscNfjEbiuTTzjjO92ZPRJNZwD+0iC//LmkJPgFag2pdqRHBs4rNwivi/wvP
	tq/d5rlwH9mbDFXpm2C9Sip+Q24EpadNY+nkF7+pV0XMjIIufvxW2Et4vAV+ACPn1Tmk
	7CsqmA2LIDn6/sKkRjmxsASIRoTwg9zqsvnYgNWAblbtyS5JjteBLj+3YbLfadykaeGA
	/0bw==
X-Received: by 10.15.44.202 with SMTP id z50mr4738954eev.68.1383001594747;
	Mon, 28 Oct 2013 16:06:34 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2A8E.dip0.t-ipconnect.de.
	[91.10.42.142])
	by mx.google.com with ESMTPSA id i1sm62756400eeg.0.2013.10.28.16.06.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 16:06:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2013 00:06:15 +0100
Message-Id: <1383001576-26578-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-qt5][RFC] qtbase: fix build for gles2 enabled by PACKAGECONFIG
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
X-List-Received-Date: Mon, 28 Oct 2013 23:06:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While playing around with QtQuick I needed gles2 support. Doing so I faced tons
of error messages as mentionet in patch. It is caused by include chain:

EGL/egl.h -> EGL/eglplatform.h -> X11/Xlib.h -> X.h

In X.h we find definitions like

#ifndef None
#define None                 0L	/* universal null resource or null atom */
#endif

This causes building Qt to crash when using these kind of symbols.

The patch was sent as RFC because:

1.  I would like ro discuss this at interest@qt-project.org and/or 
    development@qt-project.org but it was not possible to subscribe. I sent
    a mail to listmaster but no response either.
2.  qtbase_git might need same (and fails with the patch)
3.  This is not a proper solution: It is fragile and will return for future
    changes. Proper soultion would be renaming the symbols Qt but I cannot
    discuss due to 1.
4.  Nobody reported a build error for meta-qt5 so far.

Andreas Müller (1):
  qtbase: fix build for gles2 enabled by PACKAGECONFIG

 ...-reorder-includes-to-fix-build-with-eglfs.patch | 238 +++++++++++++++++++++
 recipes-qt/qt5/qtbase.inc                          |   1 +
 2 files changed, 239 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase-5.1.1/0027-reorder-includes-to-fix-build-with-eglfs.patch

-- 
1.8.3.1



Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id A70226F157
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 03:40:16 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id rl12so8638962iec.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 20:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BUwCkRqvE+HkYCUqEz4wceXK1KI4+y0JI+B9qXx00AQ=;
	b=k3vsOztR0HwbQyjfs8aN3yDR4be4MbtREd6RO1ViBZ3M6dU/pvHSuBauToUFsCTlSM
	a6hJs3lfVVBL5abDq3+IyxrhXBncuKbl4mdRL9DfUTNjB9GI7S29zWXRZdlb/7KNrN/O
	mUpSDT71xKe8GGRznjR578eceVV+b3RSGL9P9EK1pcrObNaYGgjFsRZcjwMvZqGza+F4
	DiotiQ8leGK20Gy2r2Ncbzsglj7NkS2tFfinl8hYiRDZOye4PUZQ+8cccuhXoJht3mki
	20EYaB4b1c/DDG9m1Eiae+GS18C9jV9QgGZYXg2ILShM0miFU1Q9u2Tu2z1XPxRiun4C
	Zy2Q==
X-Gm-Message-State: ALoCoQnpIif09qU57e3PRrKQhAtwiRlt8NyLS3/kzof2i9tw6p+rtXzjYwHKzqYPNxTC5/nnVfLa
X-Received: by 10.43.170.4 with SMTP id no4mr38227346icc.15.1396323617531;
	Mon, 31 Mar 2014 20:40:17 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id gd5sm29556295igd.5.2014.03.31.20.40.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 20:40:16 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2014 23:39:24 -0400
Message-Id: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 0/4] 'gtkmathview' fix for SOBBW (2014-03-29)
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
X-List-Received-Date: Tue, 01 Apr 2014 03:40:20 -0000

Hi Martin,

Here is a fix for your "State of bitbake world, Failed tasks 2014-03-29". This
patch set provides fixes and some clean-up for the gtkmathview package.

Best regards,
    Trevor

Trevor Woerner (4):
  gtkmathview: fix B!=S
  gtkmathview: fix qa issue
  gtkmathview: fix build error
  gtkmathview: run through oe-stylize.py

 .../mml-widget/gtkmathview/qualify-lookup.diff              | 13 +++++++++++++
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb    |  9 +++------
 2 files changed, 16 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/qualify-lookup.diff

-- 
1.9.0



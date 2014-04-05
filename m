Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC4F6A9C4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Apr 2014 12:39:55 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so4464880iec.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Apr 2014 05:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xYs22ME9rDIVhG9n6h5QYNnLhcugqFZiKn4YtE4arEs=;
	b=csmsVGhm8WlKcGATZiKkZmLqHUPQQsD8jjBswoPrciFRduD+IMm3rtWqQD9kEbNa1W
	ko0LF28P0q/KoquKoAud1XhJBdB2VzNCFBSZNz/NBJnZQno4cWjchwyDoWPsfV1c4jsY
	SkTXa4uj1crP1tEDDGJHynKzjJNWdODZKhKPSYjypSaFtJJDLO2KHseUj6YQDvXlLjNK
	y0nk2j6IqvHuONNVA0PgG1umC5SuJ+uLMvMp4McEnDMgcn+lJNpRSL7SA22zZq1uBd14
	nai+uXj3+IxUbAQFD6kML7L6gakbm+Oc48EEDF0Bs5s21/9Qt7er3b3ArGXOUltikB9X
	AsPw==
X-Gm-Message-State: ALoCoQlsx2a0aNJGDDWcHPg3EPPKE3y2mbqbN1wiIPND7d916fjAcRwXW20n7yBBQyeI4RFEY74y
X-Received: by 10.42.113.137 with SMTP id c9mr136102icq.90.1396701596838;
	Sat, 05 Apr 2014 05:39:56 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id b8sm13735966igx.3.2014.04.05.05.39.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Apr 2014 05:39:56 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Apr 2014 08:39:39 -0400
Message-Id: <1396701582-15906-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 0/3] liblockfile updates for SOBBW
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
X-List-Received-Date: Sat, 05 Apr 2014 12:40:00 -0000

This series implements a bunch of fixups to remove QA configure warnings. The
first patch gets rid of a warning which is logged, the remaining patches get
rid of warnings which are suppressed.

Trevor Woerner (3):
  liblockfile: remove configure warning
  liblockfile: remove dependency tracking option
  liblockfile: remove silent rules option

 .../liblockfile/liblockfile-1.09/configure.patch       | 18 ++++++++++++++----
 .../recipes-extended/liblockfile/liblockfile_1.09.bb   |  6 ++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

-- 
1.9.0



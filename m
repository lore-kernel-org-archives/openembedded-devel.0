Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 01A6B7FA1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 01:07:01 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id l24so18839914pgk.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 17:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9K4XivBIVUMrnoWrdhTKChI96kaxgz6HuF9abqCzl9Q=;
	b=fakwOGBzCYjPDZHab+CRQd6IvJNkR7ZgWMqOwq7YESHZtvxAql6WaHg2smFT+AZArY
	1dxxvzTEpSI+1oaCw1CvgtGIoOYrG2C6T26pJKUKSfmShTML0PUUlrSDoZirw4AR50De
	qYVKuDLguMcqpfMFhs/A8LKa+UMFjMJ7df3gJh4QV+5Jin82BVezpkkwGIMBtanEoUtt
	knNp/ork8EGIxnU15z6y1B20DxLPZfEHiLS2xF1MkWutjImIvMwI2iaXlb0VwLhwlR2Y
	+m7jUbMKZK7pvBRF3vvQYsXo9v6WmHVO8P+LKyXDym5qou7sZlSVxEEML8aL0wAmtOpR
	uUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9K4XivBIVUMrnoWrdhTKChI96kaxgz6HuF9abqCzl9Q=;
	b=jd/szLBiaYW6iLNY0gi7FBkuoOK5uTrvwRqu1+3p/mRRGPpylB2VZZQoFNMo+KYI0l
	Nr5GPCT9cNvt4phOBSL9XbT72RNdYOyRPJJaaglFFjJhdNZijR3UXUWjI3mqHVdQbkve
	Aqq93dXLmLRjof2LIf6Ps4/5Xf6JzncfeDNI0DEVK2TH+NGyW27wuxGxIohOs5kK+QxH
	IUIIur3xB960hrz+4jY2r0ERWu+WLPCFOqmqWygYPv1oP8yLXPXjbb55i8DfT4TylKYd
	zanzxP+H3v+bXu87eXrk+B1uR5PAXPzsRHyzLc6JJB21lYRpFYoj+W4uG7HZkiBsoMR0
	tCEw==
X-Gm-Message-State: APjAAAW8tk7Uu7TkLFZX0ai1rqs4WSqxvBJm4kEmwe5etXtb+f+qJa08
	LQo/E2wjQVJCiUarbG0U4ChyWAf/lSk=
X-Google-Smtp-Source: APXvYqwVl5OmwSk9v1YVJA/eAvQlsr+4l+MoTBTq/bR5r5ARyb9wIo9ohzZOiq0M4nywPrrU+VTfCw==
X-Received: by 2002:a63:480f:: with SMTP id v15mr74322355pga.201.1577754421638;
	Mon, 30 Dec 2019 17:07:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	k1sm47345844pgq.70.2019.12.30.17.07.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 17:07:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Dec 2019 17:06:52 -0800
Message-Id: <20191231010652.3206534-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191231010652.3206534-1-raj.khem@gmail.com>
References: <20191231010652.3206534-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 8/8] libyui: Disable Warnings as errors
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
X-List-Received-Date: Tue, 31 Dec 2019 01:07:02 -0000
Content-Transfer-Encoding: 8bit

Fixes -Wimplicit-int-float-conversion warning
with new compilers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libyui/0001-Fix-build-with-clang.patch    | 96 +------------------
 .../recipes-graphics/libyui/libyui_3.6.0.bb   |  2 +
 2 files changed, 3 insertions(+), 95 deletions(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-build-with-clang.patch b/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-build-with-clang.patch
index 4269018192..b03723ac04 100644
--- a/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-build-with-clang.patch
+++ b/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-build-with-clang.patch
@@ -65,8 +65,6 @@ Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/123]
  src/YWizard.h             | 2 +-
  47 files changed, 48 insertions(+), 48 deletions(-)
 
-diff --git a/src/YAlignment.h b/src/YAlignment.h
-index d716c77..7276944 100644
 --- a/src/YAlignment.h
 +++ b/src/YAlignment.h
 @@ -28,7 +28,7 @@
@@ -78,8 +76,6 @@ index d716c77..7276944 100644
  
  /**
   * Implementation of all the alignment widgets:
-diff --git a/src/YBarGraph.h b/src/YBarGraph.h
-index 29f7f26..d7eaad2 100644
 --- a/src/YBarGraph.h
 +++ b/src/YBarGraph.h
 @@ -29,7 +29,7 @@
@@ -91,8 +87,6 @@ index 29f7f26..d7eaad2 100644
  class YBarGraphSegment;
  
  /**
-diff --git a/src/YBusyIndicator.h b/src/YBusyIndicator.h
-index 9530fa5..75297d8 100644
 --- a/src/YBusyIndicator.h
 +++ b/src/YBusyIndicator.h
 @@ -27,7 +27,7 @@
@@ -104,8 +98,6 @@ index 9530fa5..75297d8 100644
  
  
  /**
-diff --git a/src/YButtonBox.h b/src/YButtonBox.h
-index 84f8dbb..ca51f57 100644
 --- a/src/YButtonBox.h
 +++ b/src/YButtonBox.h
 @@ -30,7 +30,7 @@
@@ -126,8 +118,6 @@ index 84f8dbb..ca51f57 100644
  
  protected:
      /**
-diff --git a/src/YCheckBox.h b/src/YCheckBox.h
-index 793cc77..03f3faa 100644
 --- a/src/YCheckBox.h
 +++ b/src/YCheckBox.h
 @@ -30,7 +30,7 @@
@@ -139,8 +129,6 @@ index 793cc77..03f3faa 100644
  
  enum YCheckBoxState
  {
-diff --git a/src/YCheckBoxFrame.h b/src/YCheckBoxFrame.h
-index 243f1a0..7017110 100644
 --- a/src/YCheckBoxFrame.h
 +++ b/src/YCheckBoxFrame.h
 @@ -29,7 +29,7 @@
@@ -152,8 +140,6 @@ index 243f1a0..7017110 100644
  
  
  /**
-diff --git a/src/YComboBox.h b/src/YComboBox.h
-index 416359a..ad0e550 100644
 --- a/src/YComboBox.h
 +++ b/src/YComboBox.h
 @@ -27,7 +27,7 @@
@@ -165,8 +151,6 @@ index 416359a..ad0e550 100644
  
  
  /**
-diff --git a/src/YCommandLine.h b/src/YCommandLine.h
-index 70cb4fe..f344a3b 100644
 --- a/src/YCommandLine.h
 +++ b/src/YCommandLine.h
 @@ -28,7 +28,7 @@
@@ -178,8 +162,6 @@ index 70cb4fe..f344a3b 100644
  
  
  /**
-diff --git a/src/YContextMenu.h b/src/YContextMenu.h
-index a4acb1c..1253002 100644
 --- a/src/YContextMenu.h
 +++ b/src/YContextMenu.h
 @@ -29,7 +29,7 @@
@@ -191,8 +173,6 @@ index a4acb1c..1253002 100644
  
  
  /**
-diff --git a/src/YDateField.h b/src/YDateField.h
-index e5a468d..6164fba 100644
 --- a/src/YDateField.h
 +++ b/src/YDateField.h
 @@ -27,7 +27,7 @@
@@ -204,8 +184,6 @@ index e5a468d..6164fba 100644
  
  /**
   * Input field for entering a date.
-diff --git a/src/YDialog.h b/src/YDialog.h
-index 66c25c0..371209b 100644
 --- a/src/YDialog.h
 +++ b/src/YDialog.h
 @@ -32,7 +32,7 @@
@@ -217,8 +195,6 @@ index 66c25c0..371209b 100644
  class YEvent;
  class YEventFilter;
  
-diff --git a/src/YDownloadProgress.h b/src/YDownloadProgress.h
-index c47ec4f..fe09a9d 100644
 --- a/src/YDownloadProgress.h
 +++ b/src/YDownloadProgress.h
 @@ -28,7 +28,7 @@
@@ -230,8 +206,6 @@ index c47ec4f..fe09a9d 100644
  
  /**
   * DownloadProgress: A progress bar that monitors downloading a file by
-diff --git a/src/YDumbTab.h b/src/YDumbTab.h
-index aec17a3..f8fb250 100644
 --- a/src/YDumbTab.h
 +++ b/src/YDumbTab.h
 @@ -27,7 +27,7 @@
@@ -243,8 +217,6 @@ index aec17a3..f8fb250 100644
  
  /**
   * DumbTab: A very simple tab widget that can display and switch between a
-diff --git a/src/YEmpty.h b/src/YEmpty.h
-index 9a3cb36..9b88fbc 100644
 --- a/src/YEmpty.h
 +++ b/src/YEmpty.h
 @@ -29,7 +29,7 @@
@@ -256,8 +228,6 @@ index 9a3cb36..9b88fbc 100644
  
  /**
   * A widget with zero size, useful as a placeholder.
-diff --git a/src/YEventFilter.h b/src/YEventFilter.h
-index 3dc1803..74aa62d 100644
 --- a/src/YEventFilter.h
 +++ b/src/YEventFilter.h
 @@ -32,7 +32,7 @@
@@ -269,8 +239,6 @@ index 3dc1803..74aa62d 100644
  
  
  /**
-diff --git a/src/YFrame.h b/src/YFrame.h
-index 111e8ec..4f8c61e 100644
 --- a/src/YFrame.h
 +++ b/src/YFrame.h
 @@ -29,7 +29,7 @@
@@ -282,8 +250,6 @@ index 111e8ec..4f8c61e 100644
  
  
  /**
-diff --git a/src/YGraph.h b/src/YGraph.h
-index d90d1ae..287d800 100644
 --- a/src/YGraph.h
 +++ b/src/YGraph.h
 @@ -37,7 +37,7 @@
@@ -295,8 +261,6 @@ index d90d1ae..287d800 100644
  
  /**
   * A graph with nodes and edges, rendered with Graphviz.
-diff --git a/src/YImage.h b/src/YImage.h
-index 17bea21..84eb674 100644
 --- a/src/YImage.h
 +++ b/src/YImage.h
 @@ -29,7 +29,7 @@
@@ -308,8 +272,6 @@ index 17bea21..84eb674 100644
  
  /**
   * A picture, possibly animated, loaded from a file.
-diff --git a/src/YInputField.h b/src/YInputField.h
-index 70641ce..fa29b42 100644
 --- a/src/YInputField.h
 +++ b/src/YInputField.h
 @@ -28,7 +28,7 @@
@@ -321,8 +283,6 @@ index 70641ce..fa29b42 100644
  
  
  
-diff --git a/src/YIntField.h b/src/YIntField.h
-index 9da0537..8ad2949 100644
 --- a/src/YIntField.h
 +++ b/src/YIntField.h
 @@ -27,7 +27,7 @@
@@ -334,8 +294,6 @@ index 9da0537..8ad2949 100644
  
  
  
-diff --git a/src/YLabel.h b/src/YLabel.h
-index d2fff61..bf06d8b 100644
 --- a/src/YLabel.h
 +++ b/src/YLabel.h
 @@ -30,7 +30,7 @@
@@ -347,8 +305,6 @@ index d2fff61..bf06d8b 100644
  
  /**
   * Implementation of the Label, Heading and OutputField widgets
-diff --git a/src/YLayoutBox.h b/src/YLayoutBox.h
-index e652a45..070eaff 100644
 --- a/src/YLayoutBox.h
 +++ b/src/YLayoutBox.h
 @@ -29,7 +29,7 @@
@@ -360,8 +316,6 @@ index e652a45..070eaff 100644
  
  /**
   * A vertical or horizontal stacking of widgets, implementing HBox and VBox.
-diff --git a/src/YLogView.h b/src/YLogView.h
-index 53fb9ee..5b44229 100644
 --- a/src/YLogView.h
 +++ b/src/YLogView.h
 @@ -27,7 +27,7 @@
@@ -373,8 +327,6 @@ index 53fb9ee..5b44229 100644
  
  
  /**
-diff --git a/src/YMenuButton.h b/src/YMenuButton.h
-index 205e730..5df7efb 100644
 --- a/src/YMenuButton.h
 +++ b/src/YMenuButton.h
 @@ -29,7 +29,7 @@
@@ -386,8 +338,6 @@ index 205e730..5df7efb 100644
  
  
  /**
-diff --git a/src/YMultiLineEdit.h b/src/YMultiLineEdit.h
-index c52a6ae..1f792f8 100644
 --- a/src/YMultiLineEdit.h
 +++ b/src/YMultiLineEdit.h
 @@ -27,7 +27,7 @@
@@ -399,8 +349,6 @@ index c52a6ae..1f792f8 100644
  
  /**
   * A multi-line plain-text area
-diff --git a/src/YMultiProgressMeter.h b/src/YMultiProgressMeter.h
-index 57c758d..f6bec91 100644
 --- a/src/YMultiProgressMeter.h
 +++ b/src/YMultiProgressMeter.h
 @@ -28,7 +28,7 @@
@@ -412,8 +360,6 @@ index 57c758d..f6bec91 100644
  
  
  /**
-diff --git a/src/YMultiSelectionBox.h b/src/YMultiSelectionBox.h
-index bbe5a20..f3a2947 100644
 --- a/src/YMultiSelectionBox.h
 +++ b/src/YMultiSelectionBox.h
 @@ -27,7 +27,7 @@
@@ -425,8 +371,6 @@ index bbe5a20..f3a2947 100644
  
  
  /**
-diff --git a/src/YPartitionSplitter.h b/src/YPartitionSplitter.h
-index 2839bbc..9de1174 100644
 --- a/src/YPartitionSplitter.h
 +++ b/src/YPartitionSplitter.h
 @@ -28,7 +28,7 @@
@@ -438,8 +382,6 @@ index 2839bbc..9de1174 100644
  
  
  /**
-diff --git a/src/YProgressBar.h b/src/YProgressBar.h
-index 718352f..baab662 100644
 --- a/src/YProgressBar.h
 +++ b/src/YProgressBar.h
 @@ -27,7 +27,7 @@
@@ -451,8 +393,6 @@ index 718352f..baab662 100644
  
  
  /**
-diff --git a/src/YPushButton.h b/src/YPushButton.h
-index 5b65c98..e288252 100644
 --- a/src/YPushButton.h
 +++ b/src/YPushButton.h
 @@ -27,7 +27,7 @@
@@ -464,8 +404,6 @@ index 5b65c98..e288252 100644
  
  
  
-diff --git a/src/YRadioButton.h b/src/YRadioButton.h
-index 9dc62de..5a7c0dd 100644
 --- a/src/YRadioButton.h
 +++ b/src/YRadioButton.h
 @@ -28,7 +28,7 @@
@@ -477,8 +415,6 @@ index 9dc62de..5a7c0dd 100644
  
  
  /**
-diff --git a/src/YRadioButtonGroup.h b/src/YRadioButtonGroup.h
-index 063a52e..671a257 100644
 --- a/src/YRadioButtonGroup.h
 +++ b/src/YRadioButtonGroup.h
 @@ -28,7 +28,7 @@
@@ -490,8 +426,6 @@ index 063a52e..671a257 100644
  
  typedef std::list<YRadioButton *> 		YRadioButtonList;
  typedef YRadioButtonList::iterator		YRadioButtonListIterator;
-diff --git a/src/YRichText.h b/src/YRichText.h
-index 149bfb3..86b3f80 100644
 --- a/src/YRichText.h
 +++ b/src/YRichText.h
 @@ -30,7 +30,7 @@
@@ -503,8 +437,6 @@ index 149bfb3..86b3f80 100644
  
  
  /**
-diff --git a/src/YSelectionBox.h b/src/YSelectionBox.h
-index 7fc4fb8..9bbf9f3 100644
 --- a/src/YSelectionBox.h
 +++ b/src/YSelectionBox.h
 @@ -27,7 +27,7 @@
@@ -516,8 +448,6 @@ index 7fc4fb8..9bbf9f3 100644
  
  
  /**
-diff --git a/src/YSelectionWidget.h b/src/YSelectionWidget.h
-index abbdfb4..cf05afd 100644
 --- a/src/YSelectionWidget.h
 +++ b/src/YSelectionWidget.h
 @@ -29,7 +29,7 @@
@@ -529,8 +459,6 @@ index abbdfb4..cf05afd 100644
  
  /**
   * Base class for various kinds of multi-value widgets.
-diff --git a/src/YSimpleInputField.h b/src/YSimpleInputField.h
-index 6d926d4..b93fe6b 100644
 --- a/src/YSimpleInputField.h
 +++ b/src/YSimpleInputField.h
 @@ -27,7 +27,7 @@
@@ -542,8 +470,6 @@ index 6d926d4..b93fe6b 100644
  
  
  /**
-diff --git a/src/YSlider.h b/src/YSlider.h
-index d29f6b8..4bcd7d3 100644
 --- a/src/YSlider.h
 +++ b/src/YSlider.h
 @@ -27,7 +27,7 @@
@@ -555,8 +481,6 @@ index d29f6b8..4bcd7d3 100644
  
  
  /**
-diff --git a/src/YSpacing.h b/src/YSpacing.h
-index e8aafd3..066cd68 100644
 --- a/src/YSpacing.h
 +++ b/src/YSpacing.h
 @@ -28,7 +28,7 @@
@@ -568,8 +492,6 @@ index e8aafd3..066cd68 100644
  
  
  /**
-diff --git a/src/YSquash.h b/src/YSquash.h
-index 4bd0fb6..3804cc4 100644
 --- a/src/YSquash.h
 +++ b/src/YSquash.h
 @@ -29,7 +29,7 @@
@@ -581,8 +503,6 @@ index 4bd0fb6..3804cc4 100644
  
  /**
   * HSquash, VSquash HVSquash: reduce child to its preferred size.
-diff --git a/src/YTable.h b/src/YTable.h
-index 6694f10..469b8ca 100644
 --- a/src/YTable.h
 +++ b/src/YTable.h
 @@ -30,7 +30,7 @@
@@ -594,8 +514,6 @@ index 6694f10..469b8ca 100644
  
  
  
-diff --git a/src/YTableHeader.h b/src/YTableHeader.h
-index 70166c2..4ae99b4 100644
 --- a/src/YTableHeader.h
 +++ b/src/YTableHeader.h
 @@ -31,7 +31,7 @@
@@ -607,8 +525,6 @@ index 70166c2..4ae99b4 100644
  
  /**
   * Helper class for YTable for table column properties:
-diff --git a/src/YTimeField.h b/src/YTimeField.h
-index ab2f9a3..f3a7b94 100644
 --- a/src/YTimeField.h
 +++ b/src/YTimeField.h
 @@ -27,7 +27,7 @@
@@ -620,8 +536,6 @@ index ab2f9a3..f3a7b94 100644
  
  
  /**
-diff --git a/src/YTimezoneSelector.cc b/src/YTimezoneSelector.cc
-index 9259b64..e2f9b6f 100644
 --- a/src/YTimezoneSelector.cc
 +++ b/src/YTimezoneSelector.cc
 @@ -32,7 +32,7 @@
@@ -633,8 +547,6 @@ index 9259b64..e2f9b6f 100644
  };
  
  
-diff --git a/src/YTree.h b/src/YTree.h
-index 14fa279..70e1364 100644
 --- a/src/YTree.h
 +++ b/src/YTree.h
 @@ -28,7 +28,7 @@
@@ -646,8 +558,6 @@ index 14fa279..70e1364 100644
  
  
  /**
-diff --git a/src/YUILog.h b/src/YUILog.h
-index 0890bc5..4a927a7 100644
 --- a/src/YUILog.h
 +++ b/src/YUILog.h
 @@ -64,7 +64,7 @@
@@ -659,11 +569,9 @@ index 0890bc5..4a927a7 100644
  
  enum YUILogLevel_t
  {
-diff --git a/src/YWidget.h b/src/YWidget.h
-index 5b285d0..636a41b 100644
 --- a/src/YWidget.h
 +++ b/src/YWidget.h
-@@ -45,7 +45,7 @@ typedef YChildrenManager<YWidget>	YWidgetChildrenManager;
+@@ -45,7 +45,7 @@ typedef YChildrenManager<YWidget>	YWidge
  typedef YSingleChildManager<YWidget>	YSingleWidgetChildManager;
  typedef YChildrenRejector<YWidget>	YWidgetChildrenRejector;
  
@@ -672,8 +580,6 @@ index 5b285d0..636a41b 100644
  
  
  /**
-diff --git a/src/YWizard.h b/src/YWizard.h
-index 7671cbf..975b597 100644
 --- a/src/YWizard.h
 +++ b/src/YWizard.h
 @@ -28,7 +28,7 @@
diff --git a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb b/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
index d8a921925a..7c6f4c13d2 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
@@ -18,6 +18,8 @@ inherit cmake gettext pkgconfig
 
 DEPENDS += "boost"
 
+EXTRA_OECMAKE += "-DENABLE_WERROR=OFF"
+
 BBCLASSEXTEND = "native nativesdk"
 
 do_configure_prepend () {
-- 
2.24.1



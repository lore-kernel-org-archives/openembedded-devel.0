Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8234CA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:05:54 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.502.1756998344311837348
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LJAptJwD;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b7d497ab9so11373945e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756998343; x=1757603143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfbMNiAAP5edR042oQCopG4Ro7cA32VI7hWXOpBm0wA=;
        b=LJAptJwDTqNOgZOuMRA6VytYUMtQ4Y0osyMUmZvYaJqF8X7UZc/zt7EHNbuYd8Io1r
         rxKWjm87BsfLqnKpCHO64Y8NDctzXYnbO4X7jlze5jrFLfy3+1dbIXuE2mTTyiAvhyiy
         NRahKNSfQI61hgz2KUi9XCjrL8tFg2PPIB3hJmOBAVLH7Bhp0HHwo0ZapLXinDA33y0M
         6JvirTgr+6+bzh/Lk8sNqJXujWjBj7OkSvvdFcgBNEWO860orpLVtNtOHsEoRs9sdeZ9
         q9PvObD+Tx96uW4Vy6Jv7hxGc4e69hcof466a9tK3ygkkFTrhkqQX1YiiB6I/OzPMqqS
         tngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756998343; x=1757603143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfbMNiAAP5edR042oQCopG4Ro7cA32VI7hWXOpBm0wA=;
        b=eEpLwv9jlSdMBxSZw2WLUgXkSQviztaLvvTPbs3sgLcIC4WisdqLRH/B7cmFvwuu9t
         4GnwIn6tHJbCGsCfnKYRUXhD4YcEEOL3o/7JOr3gxo25XbeVPpb5xzVmag3P2x4gdd3h
         kn1B7Ph6YmQgePYRSpQgWMhyGNk/RhsRySFfC+8PI8JonyhqO+GVr/rcYIeucL9vzpFE
         4iJuoUcA11HYstkfxRoqttFMPxOLv6ISSyZYoW03Ww36e08NJzIVtw3JCO7rb6fR9OHX
         RjwKFffu8H/WBzqKnv1XoUTI95R32fp3z7jK1+UESQrkICHMcHxqdAakdJLqtreIZuHn
         oZEQ==
X-Gm-Message-State: AOJu0Ywv7SNl12us8/rl3Oi9D43G+AwUCd0BWtHe6wLKlGgTQyaZnrqR
	YdB1MKLD244kPP2AgQAH4TFnaauX+1ANieHG7uufG1CSaeLNSF5mJ0TbjfDcbg==
X-Gm-Gg: ASbGncsvrs+C9HuN2oIm1+Kw33Zb3WtL5xgbu6w/IfjELtREyloes2t1I3gEqhPlAmW
	HmtOBwahfPdyVx5kW0wP4ap0oWpxiSaMhzSgfWvMiLMDxQCpl40Gc++X9Idoyjn8HEQBIlRu80Z
	ywPw+4RgqMi5GRI4dDjDbwb0/tmdoiNXhh/yrruww0L52yO6gn/PAX6B1M4q6xqMIY38ms2sY33
	4idVRwVAPYRSMEUWmqPPDFL6dMquomPxktHN7v8AqzR1D38/beksY99cnMcoXmZbflzzUhQmJoA
	lyvOQRrkNnr824Y3fw1E+rJEvigfS/HRjgIGxyvP0WjuKqO7cBE2Gz58MooesKwREJj6Y7MwTR0
	CB0gr77I/TIW7IChDIli3
X-Google-Smtp-Source: AGHT+IGUcTEJgZxHqQ6yccWmOvn/ztyjjwyz27LlyU1d7Xwd8bb0cPsQqxp5tjIxzuDfDYyzkr1wVw==
X-Received: by 2002:a05:6000:2dc2:b0:3cd:7200:e031 with SMTP id ffacd0b85a97d-3d1dd52ac90mr14967483f8f.28.1756998342013;
        Thu, 04 Sep 2025 08:05:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcfc481b5sm20761165e9.0.2025.09.04.08.05.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:05:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] poppler: fix typos in CVE-2025-52886-0001.patch
Date: Thu,  4 Sep 2025 17:05:40 +0200
Message-ID: <20250904150540.3041738-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 15:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119286

There were a some accidenal typos in the CVE-2025-52886-0001.patch file
that introduced a number of syntactical errors in the qt5/src/poppler-annotation.cc
file, which failed the compilation, in case qt5 PACKAGECONFIG is enabled.

This change fixes these typos. Since qt6 is not enabled in the recipe,
only the qt5 related parts were verified.

While reworking the backport, unfortunately some line number differences
were introduced, which inflate the size of this patch - just scroll
past those.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../poppler/poppler/CVE-2025-52886-0001.patch | 144 +++++++++---------
 1 file changed, 69 insertions(+), 75 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0001.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0001.patch
index 4f0dc61a8b..4de3f8bcdc 100644
--- a/meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0001.patch
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0001.patch
@@ -1595,7 +1595,7 @@ index 1f8d756..8970f49 100644
      DocumentData *parentDoc;
 
 diff --git a/qt5/src/poppler-annotation.cc b/qt5/src/poppler-annotation.cc
-index e15523c..f148671 100644
+index e15523c..4964563 100644
 --- a/qt5/src/poppler-annotation.cc
 +++ b/qt5/src/poppler-annotation.cc
 @@ -65,6 +65,12 @@
@@ -1636,7 +1636,7 @@ index e15523c..f148671 100644
 +AnnotationPrivate::~AnnotationPrivate() = default;
 
 -void AnnotationPrivate::tieToNativeAnnot(Annot *ann, ::Page *page, Poppler::DocumentData *doc)
-+void AnnotationPrivate::tieToNativeAnnot(std::shared_ptr<Annot> *ann, ::Page *page, Poppler::DocumentData *doc)
++void AnnotationPrivate::tieToNativeAnnot(std::shared_ptr<Annot> ann, ::Page *page, Poppler::DocumentData *doc)
  {
      if (pdfAnnot) {
          error(errIO, -1, "Annotation is already tied");
@@ -1661,11 +1661,10 @@ index e15523c..f148671 100644
 
      // Since pdfAnnot has been set, this calls will write in the Annot object
      q->setAuthor(author);
-@@ -250,13 +245,7 @@ void AnnotationPrivate::flushBaseAnnotationProperties()
-     q->setStyle(style);
+@@ -251,12 +246,7 @@ void AnnotationPrivate::flushBaseAnnotationProperties()
      q->setPopup(popup);
 
--    // Flush revisions
+     // Flush revisions
 -    foreach (Annotation *r, revisions) {
 -        // TODO: Flush revision
 -        delete r; // Object is no longer needed
@@ -1676,12 +1675,13 @@ index e15523c..f148671 100644
 
      // Clear some members to save memory
      author.clear();
-@@ -455,14 +444,14 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
+@@ -455,14 +445,15 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
 
      // Create Annotation objects and tie to their native Annot
      QList<Annotation *> res;
 -    for (Annot *ann : annots->getAnnots()) {
 +    for (const std::shared_ptr<Annot> &ann : annots->getAnnots()) {
++
          if (!ann) {
              error(errInternal, -1, "Annot is null");
              continue;
@@ -1693,7 +1693,7 @@ index e15523c..f148671 100644
          if (!markupann) {
              // Assume it's a root annotation, and skip if user didn't request it
              if (parentID != -1) {
-@@ -536,7 +525,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
+@@ -536,7 +527,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
                  continue;
              }
              // parse Link params
@@ -1702,7 +1702,7 @@ index e15523c..f148671 100644
              LinkAnnotation *l = new LinkAnnotation();
              annotation = l;
 
-@@ -566,7 +555,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
+@@ -566,7 +557,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
              if (!wantFileAttachmentAnnotations) {
                  continue;
              }
@@ -1711,7 +1711,7 @@ index e15523c..f148671 100644
              FileAttachmentAnnotation *f = new FileAttachmentAnnotation();
              annotation = f;
              // -> fileIcon
-@@ -581,7 +570,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
+@@ -581,7 +572,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
              if (!wantSoundAnnotations) {
                  continue;
              }
@@ -1720,7 +1720,7 @@ index e15523c..f148671 100644
              SoundAnnotation *s = new SoundAnnotation();
              annotation = s;
 
-@@ -596,7 +585,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
+@@ -596,7 +587,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
              if (!wantMovieAnnotations) {
                  continue;
              }
@@ -1729,7 +1729,7 @@ index e15523c..f148671 100644
              MovieAnnotation *m = new MovieAnnotation();
              annotation = m;
 
-@@ -614,7 +603,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
+@@ -614,7 +605,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
              if (!wantScreenAnnotations) {
                  continue;
              }
@@ -1738,7 +1738,7 @@ index e15523c..f148671 100644
              // TODO Support other link types than Link::Rendition in ScreenAnnotation
              if (!screenann->getAction() || screenann->getAction()->getKind() != actionRendition) {
                  continue;
-@@ -644,7 +633,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
+@@ -644,7 +635,7 @@ QList<Annotation *> AnnotationPrivate::findAnnotations(::Page *pdfPage, Document
              annotation = new WidgetAnnotation();
              break;
          case Annot::typeRichMedia: {
@@ -1747,7 +1747,7 @@ index e15523c..f148671 100644
 
              RichMediaAnnotation *richMediaAnnotation = new RichMediaAnnotation;
 
-@@ -852,9 +841,9 @@ Link *AnnotationPrivate::additionalAction(Annotation::AdditionalActionType type)
+@@ -852,9 +843,9 @@ Link *AnnotationPrivate::additionalAction(Annotation::AdditionalActionType type)
 
      std::unique_ptr<::LinkAction> linkAction = nullptr;
      if (pdfAnnot->getType() == Annot::typeScreen) {
@@ -1759,7 +1759,7 @@ index e15523c..f148671 100644
      }
 
      Link *link = nullptr;
-@@ -875,7 +864,7 @@ void AnnotationPrivate::addAnnotationToPage(::Page *pdfPage, DocumentData *doc,
+@@ -875,7 +866,7 @@ void AnnotationPrivate::addAnnotationToPage(::Page *pdfPage, DocumentData *doc,
 
      // Unimplemented annotations can't be created by the user because their ctor
      // is private. Therefore, createNativeAnnot will never return 0
@@ -1768,18 +1768,18 @@ index e15523c..f148671 100644
      Q_ASSERT(nativeAnnot);
 
      if (ann->d_ptr->annotationAppearance.isStream()) {
-@@ -908,8 +897,8 @@ class TextAnnotationPrivate : public AnnotationPrivate
+@@ -908,8 +899,8 @@ class TextAnnotationPrivate : public AnnotationPrivate
  {
  public:
      TextAnnotationPrivate();
 -    Annotation *makeAlias() override;
 -    Annot *createNativeAnnot(::Page *destPage, DocumentData *doc) override;
 +    std::unique_ptr<Annotation> makeAlias() override;
-+    std::unique_ptr<Annot> createNativeAnnot(::Page *destPage, DocumentData *doc) override;
++    std::shared_ptr<Annot> createNativeAnnot(::Page *destPage, DocumentData *doc) override;
      void setDefaultAppearanceToNative();
      std::unique_ptr<DefaultAppearance> getDefaultAppearanceFromNative() const;
 
-@@ -1419,7 +1408,7 @@ QString Annotation::author() const
+@@ -1419,7 +1410,7 @@ QString Annotation::author() const
          return d->author;
      }
 
@@ -1788,7 +1788,7 @@ index e15523c..f148671 100644
      return markupann ? UnicodeParsedString(markupann->getLabel()) : QString();
  }
 
-@@ -1432,7 +1421,7 @@ void Annotation::setAuthor(const QString &author)
+@@ -1432,7 +1423,7 @@ void Annotation::setAuthor(const QString &author)
          return;
      }
 
@@ -1797,7 +1797,7 @@ index e15523c..f148671 100644
      if (markupann) {
          markupann->setLabel(std::unique_ptr<GooString>(QStringToUnicodeGooString(author)));
      }
-@@ -1535,7 +1524,7 @@ QDateTime Annotation::creationDate() const
+@@ -1535,7 +1526,7 @@ QDateTime Annotation::creationDate() const
          return d->creationDate;
      }
 
@@ -1806,7 +1806,7 @@ index e15523c..f148671 100644
 
      if (markupann && markupann->getDate()) {
          return convertDate(markupann->getDate()->c_str());
-@@ -1553,7 +1542,7 @@ void Annotation::setCreationDate(const QDateTime &date)
+@@ -1553,7 +1544,7 @@ void Annotation::setCreationDate(const QDateTime &date)
          return;
      }
 
@@ -1815,7 +1815,7 @@ index e15523c..f148671 100644
      if (markupann) {
          if (date.isValid()) {
              const time_t t = date.toSecsSinceEpoch();
-@@ -1686,7 +1675,7 @@ Annotation::Style Annotation::style() const
+@@ -1686,7 +1677,7 @@ Annotation::Style Annotation::style() const
      Style s;
      s.setColor(convertAnnotColor(d->pdfAnnot->getColor()));
 
@@ -1824,7 +1824,7 @@ index e15523c..f148671 100644
      if (markupann) {
          s.setOpacity(markupann->getOpacity());
      }
-@@ -1713,11 +1702,11 @@ Annotation::Style Annotation::style() const
+@@ -1713,11 +1704,11 @@ Annotation::Style Annotation::style() const
      AnnotBorderEffect *border_effect;
      switch (d->pdfAnnot->getType()) {
      case Annot::typeFreeText:
@@ -1838,7 +1838,7 @@ index e15523c..f148671 100644
          break;
      default:
          border_effect = nullptr;
-@@ -1741,7 +1730,7 @@ void Annotation::setStyle(const Annotation::Style &style)
+@@ -1741,7 +1732,7 @@ void Annotation::setStyle(const Annotation::Style &style)
 
      d->pdfAnnot->setColor(convertQColor(style.color()));
 
@@ -1847,7 +1847,7 @@ index e15523c..f148671 100644
      if (markupann) {
          markupann->setOpacity(style.opacity());
      }
-@@ -1765,9 +1754,9 @@ Annotation::Popup Annotation::popup() const
+@@ -1765,9 +1756,9 @@ Annotation::Popup Annotation::popup() const
      AnnotPopup *popup = nullptr;
      int flags = -1; // Not initialized
 
@@ -1859,7 +1859,7 @@ index e15523c..f148671 100644
          w.setSummary(UnicodeParsedString(markupann->getSubject()));
      }
 
-@@ -1783,7 +1772,7 @@ Annotation::Popup Annotation::popup() const
+@@ -1783,7 +1774,7 @@ Annotation::Popup Annotation::popup() const
      }
 
      if (d->pdfAnnot->getType() == Annot::typeText) {
@@ -1868,7 +1868,7 @@ index e15523c..f148671 100644
 
          // Text annotations default to same rect as annotation
          if (flags == -1) {
-@@ -1839,7 +1828,7 @@ Annotation::RevScope Annotation::revisionScope() const
+@@ -1839,7 +1830,7 @@ Annotation::RevScope Annotation::revisionScope() const
          return d->revisionScope;
      }
 
@@ -1877,7 +1877,7 @@ index e15523c..f148671 100644
 
      if (markupann && markupann->isInReplyTo()) {
          switch (markupann->getReplyTo()) {
-@@ -1861,7 +1850,7 @@ Annotation::RevType Annotation::revisionType() const
+@@ -1861,7 +1852,7 @@ Annotation::RevType Annotation::revisionType() const
          return d->revisionType;
      }
 
@@ -1886,7 +1886,7 @@ index e15523c..f148671 100644
 
      if (textann && textann->isInReplyTo()) {
          switch (textann->getState()) {
-@@ -1892,8 +1881,9 @@ QList<Annotation *> Annotation::revisions() const
+@@ -1892,8 +1883,9 @@ QList<Annotation *> Annotation::revisions() const
      if (!d->pdfAnnot) {
          /* Return aliases, whose ownership goes to the caller */
          QList<Annotation *> res;
@@ -1898,7 +1898,7 @@ index e15523c..f148671 100644
          return res;
      }
 
-@@ -1910,7 +1900,7 @@ std::unique_ptr<AnnotationAppearance> Annotation::annotationAppearance() const
+@@ -1910,7 +1902,7 @@ std::unique_ptr<AnnotationAppearance> Annotation::annotationAppearance() const
  {
      Q_D(const Annotation);
 
@@ -1907,7 +1907,7 @@ index e15523c..f148671 100644
  }
 
  void Annotation::setAnnotationAppearance(const AnnotationAppearance &annotationAppearance)
-@@ -1934,15 +1924,15 @@ void Annotation::setAnnotationAppearance(const AnnotationAppearance &annotationA
+@@ -1934,15 +1926,15 @@ void Annotation::setAnnotationAppearance(const AnnotationAppearance &annotationA
 
  TextAnnotationPrivate::TextAnnotationPrivate() : AnnotationPrivate(), textType(TextAnnotation::Linked), textIcon(QStringLiteral("Note")), inplaceAlign(0), inplaceIntent(TextAnnotation::Unknown) { }
 
@@ -1915,20 +1915,19 @@ index e15523c..f148671 100644
 +std::unique_ptr<Annotation> TextAnnotationPrivate::makeAlias()
  {
 -    return new TextAnnotation(*this);
-+    return std::unique_ptr<Annotation>(new TextAnnotation(*this);
++    return std::unique_ptr<Annotation>(new TextAnnotation(*this));
  }
 
 -Annot *TextAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *doc)
-+std::shared_ptr<Annot> *TextAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *doc)
++std::shared_ptr<Annot> TextAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *doc)
  {
--    // Setters are defined in the public class
+     // Setters are defined in the public class
 -    TextAnnotation *q = static_cast<TextAnnotation *>(makeAlias());
-+    // Setters are defined in the public clas
-+    std::unique_ptr<TextAnnotation> q = static_pointer_cast<TextAnnotation *>(makeAlias());
++    std::unique_ptr<TextAnnotation> q = static_pointer_cast<TextAnnotation>(makeAlias());
 
      // Set page and contents
      pdfPage = destPage;
-@@ -1951,13 +1941,13 @@ Annot *TextAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *
+@@ -1951,13 +1943,13 @@ Annot *TextAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *
      // Set pdfAnnot
      PDFRectangle rect = boundaryToPdfRectangle(boundary, flags);
      if (textType == TextAnnotation::Linked) {
@@ -1944,7 +1943,7 @@ index e15523c..f148671 100644
      }
 
      // Set properties
-@@ -1967,8 +1957,6 @@ Annot *TextAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *
+@@ -1967,8 +1959,6 @@ Annot *TextAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *
      q->setCalloutPoints(inplaceCallout);
      q->setInplaceIntent(inplaceIntent);
 
@@ -1953,7 +1952,7 @@ index e15523c..f148671 100644
      inplaceCallout.clear(); // Free up memory
 
      setDefaultAppearanceToNative();
-@@ -1979,7 +1967,7 @@ Annot *TextAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *
+@@ -1979,7 +1969,7 @@ Annot *TextAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *
  void TextAnnotationPrivate::setDefaultAppearanceToNative()
  {
      if (pdfAnnot && pdfAnnot->getType() == Annot::typeFreeText) {
@@ -1962,7 +1961,7 @@ index e15523c..f148671 100644
          const double pointSize = textFont ? textFont->pointSizeF() : AnnotFreeText::undefinedFontPtSize;
          if (pointSize < 0) {
              qWarning() << "TextAnnotationPrivate::createNativeAnnot: font pointSize < 0";
-@@ -2008,7 +1996,7 @@ void TextAnnotationPrivate::setDefaultAppearanceToNative()
+@@ -2008,7 +1998,7 @@ void TextAnnotationPrivate::setDefaultAppearanceToNative()
  std::unique_ptr<DefaultAppearance> TextAnnotationPrivate::getDefaultAppearanceFromNative() const
  {
      if (pdfAnnot && pdfAnnot->getType() == Annot::typeFreeText) {
@@ -1971,7 +1970,7 @@ index e15523c..f148671 100644
          return ftextann->getDefaultAppearance();
      } else {
          return {};
-@@ -2165,7 +2153,7 @@ QString TextAnnotation::textIcon() const
+@@ -2165,7 +2155,7 @@ QString TextAnnotation::textIcon() const
      }
 
      if (d->pdfAnnot->getType() == Annot::typeText) {
@@ -1980,7 +1979,7 @@ index e15523c..f148671 100644
          return QString::fromLatin1(textann->getIcon()->c_str());
      }
 
-@@ -2182,7 +2170,7 @@ void TextAnnotation::setTextIcon(const QString &icon)
+@@ -2182,7 +2172,7 @@ void TextAnnotation::setTextIcon(const QString &icon)
      }
 
      if (d->pdfAnnot->getType() == Annot::typeText) {
@@ -1989,7 +1988,7 @@ index e15523c..f148671 100644
          QByteArray encoded = icon.toLatin1();
          GooString s(encoded.constData());
          textann->setIcon(&s);
-@@ -2256,7 +2244,7 @@ int TextAnnotation::inplaceAlign() const
+@@ -2256,7 +2246,7 @@ int TextAnnotation::inplaceAlign() const
      }
 
      if (d->pdfAnnot->getType() == Annot::typeFreeText) {
@@ -1998,7 +1997,7 @@ index e15523c..f148671 100644
          return static_cast<int>(ftextann->getQuadding());
      }
 
-@@ -2273,7 +2261,7 @@ void TextAnnotation::setInplaceAlign(int align)
+@@ -2273,7 +2263,7 @@ void TextAnnotation::setInplaceAlign(int align)
      }
 
      if (d->pdfAnnot->getType() == Annot::typeFreeText) {
@@ -2007,7 +2006,7 @@ index e15523c..f148671 100644
          ftextann->setQuadding((VariableTextQuadding)align);
      }
  }
-@@ -2300,7 +2288,7 @@ QVector<QPointF> TextAnnotation::calloutPoints() const
+@@ -2300,7 +2290,7 @@ QVector<QPointF> TextAnnotation::calloutPoints() const
          return QVector<QPointF>();
      }
 
@@ -2016,7 +2015,7 @@ index e15523c..f148671 100644
      const AnnotCalloutLine *callout = ftextann->getCalloutLine();
 
      if (!callout) {
-@@ -2332,7 +2320,7 @@ void TextAnnotation::setCalloutPoints(const QVector<QPointF> &points)
+@@ -2332,7 +2322,7 @@ void TextAnnotation::setCalloutPoints(const QVector<QPointF> &points)
          return;
      }
 
@@ -2025,7 +2024,7 @@ index e15523c..f148671 100644
      const int count = points.size();
 
      if (count == 0) {
-@@ -2345,7 +2333,7 @@ void TextAnnotation::setCalloutPoints(const QVector<QPointF> &points)
+@@ -2345,7 +2335,7 @@ void TextAnnotation::setCalloutPoints(const QVector<QPointF> &points)
          return;
      }
 
@@ -2034,7 +2033,7 @@ index e15523c..f148671 100644
      double x1, y1, x2, y2;
      double MTX[6];
      d->fillTransformationMTX(MTX);
-@@ -2355,12 +2343,12 @@ void TextAnnotation::setCalloutPoints(const QVector<QPointF> &points)
+@@ -2355,13 +2345,12 @@ void TextAnnotation::setCalloutPoints(const QVector<QPointF> &points)
      if (count == 3) {
          double x3, y3;
          XPDFReader::invTransform(MTX, points[2], x3, y3);
@@ -2046,11 +2045,12 @@ index e15523c..f148671 100644
      }
 
 -    ftextann->setCalloutLine(callout);
+-    delete callout;
 +    ftextann->setCalloutLine(std::move(callout));
-     delete callout;
  }
 
-@@ -2373,7 +2361,7 @@ TextAnnotation::InplaceIntent TextAnnotation::inplaceIntent() const
+ TextAnnotation::InplaceIntent TextAnnotation::inplaceIntent() const
+@@ -2373,7 +2362,7 @@ TextAnnotation::InplaceIntent TextAnnotation::inplaceIntent() const
      }
 
      if (d->pdfAnnot->getType() == Annot::typeFreeText) {
@@ -2059,7 +2059,7 @@ index e15523c..f148671 100644
          return (TextAnnotation::InplaceIntent)ftextann->getIntent();
      }
 
-@@ -2390,7 +2378,7 @@ void TextAnnotation::setInplaceIntent(TextAnnotation::InplaceIntent intent)
+@@ -2390,7 +2379,7 @@ void TextAnnotation::setInplaceIntent(TextAnnotation::InplaceIntent intent)
      }
 
      if (d->pdfAnnot->getType() == Annot::typeFreeText) {
@@ -2068,7 +2068,7 @@ index e15523c..f148671 100644
          ftextann->setIntent((AnnotFreeText::AnnotFreeTextIntent)intent);
      }
  }
-@@ -2400,8 +2388,8 @@ class LineAnnotationPrivate : public AnnotationPrivate
+@@ -2400,8 +2389,8 @@ class LineAnnotationPrivate : public AnnotationPrivate
  {
  public:
      LineAnnotationPrivate();
@@ -2079,7 +2079,7 @@ index e15523c..f148671 100644
 
      // data fields (note uses border for rendering style)
      QLinkedList<QPointF> linePoints;
-@@ -2421,15 +2409,15 @@ LineAnnotationPrivate::LineAnnotationPrivate()
+@@ -2421,15 +2410,15 @@ LineAnnotationPrivate::LineAnnotationPrivate()
  {
  }
 
@@ -2095,11 +2095,11 @@ index e15523c..f148671 100644
  {
      // Setters are defined in the public class
 -    LineAnnotation *q = static_cast<LineAnnotation *>(makeAlias());
-+    std::unique_ptr<LineAnnotation> q = static_pointer_cast<LineAnnotation *>(makeAlias());
++    std::unique_ptr<LineAnnotation> q = static_pointer_cast<LineAnnotation>(makeAlias());
 
      // Set page and document
      pdfPage = destPage;
-@@ -2438,9 +2426,9 @@ Annot *LineAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *
+@@ -2438,9 +2427,9 @@ Annot *LineAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *
      // Set pdfAnnot
      PDFRectangle rect = boundaryToPdfRectangle(boundary, flags);
      if (lineType == LineAnnotation::StraightLine) {
@@ -2111,7 +2111,7 @@ index e15523c..f148671 100644
      }
 
      // Set properties
-@@ -2454,8 +2442,6 @@ Annot *LineAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *
+@@ -2454,8 +2443,6 @@ Annot *LineAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *
      q->setLineShowCaption(lineShowCaption);
      q->setLineIntent(lineIntent);
 
@@ -2120,7 +2120,7 @@ index e15523c..f148671 100644
      linePoints.clear(); // Free up memory
 
      return pdfAnnot;
-@@ -2621,14 +2607,14 @@ QLinkedList<QPointF> LineAnnotation::linePoints() const
+@@ -2621,14 +2608,14 @@ QLinkedList<QPointF> LineAnnotation::linePoints() const
 
      QLinkedList<QPointF> res;
      if (d->pdfAnnot->getType() == Annot::typeLine) {
@@ -2137,14 +2137,7 @@ index e15523c..f148671 100644
          const AnnotPath *vertices = polyann->getVertices();
 
          for (int i = 0; i < vertices->getCoordsLength(); ++i) {
-@@ -2645,13 +2631,14 @@ void LineAnnotation::setLinePoints(const QLinkedList<QPointF> &points)
- {
-     Q_D(LineAnnotation);
-
-+    if (!d->pdfAnnot) {
-     if (!d->pdfAnnot) {
-         d->linePoints = points;
-         return;
+@@ -2651,7 +2638,7 @@ void LineAnnotation::setLinePoints(const QLinkedList<QPointF> &points)
      }
 
      if (d->pdfAnnot->getType() == Annot::typeLine) {
@@ -2336,7 +2329,7 @@ index e15523c..f148671 100644
 -    Annotation *makeAlias() override;
 -    Annot *createNativeAnnot(::Page *destPage, DocumentData *doc) override;
 +    std::unique_ptr<Annotation> makeAlias() override;
-+    std::unique_ptr<Annot> createNativeAnnot(::Page *destPage, DocumentData *doc) override;
++    std::shared_ptr<Annot> createNativeAnnot(::Page *destPage, DocumentData *doc) override;
 
      // data fields (note uses border for rendering style)
      GeomAnnotation::GeomType geomType;
@@ -2356,7 +2349,7 @@ index e15523c..f148671 100644
  {
      // Setters are defined in the public class
 -    GeomAnnotation *q = static_cast<GeomAnnotation *>(makeAlias());
-+    std::unique_ptr<GeomAnnotation> q = static_pointer_cast<GeomAnnotation *>(makeAlias());
++    std::unique_ptr<GeomAnnotation> q = static_pointer_cast<GeomAnnotation>(makeAlias());
 
      // Set page and document
      pdfPage = destPage;
@@ -2409,7 +2402,7 @@ index e15523c..f148671 100644
 -    Annotation *makeAlias() override;
 -    Annot *createNativeAnnot(::Page *destPage, DocumentData *doc) override;
 +    std::unique_ptr<Annotation> makeAlias() override;
-+    std::shared_ptr<Annot> *createNativeAnnot(::Page *destPage, DocumentData *doc) override;
++    std::shared_ptr<Annot> createNativeAnnot(::Page *destPage, DocumentData *doc) override;
 
      // data fields
      HighlightAnnotation::HighlightType highlightType;
@@ -2434,7 +2427,7 @@ index e15523c..f148671 100644
  {
      // Setters are defined in the public class
 -    HighlightAnnotation *q = static_cast<HighlightAnnotation *>(makeAlias());
-+    std::unique_ptr<HighlightAnnotation> q = static_pointer_cast<HighlightAnnotation *>(makeAlias());
++    std::unique_ptr<HighlightAnnotation> q = static_pointer_cast<HighlightAnnotation>(makeAlias());
 
      // Set page and document
      pdfPage = destPage;
@@ -2512,7 +2505,7 @@ index e15523c..f148671 100644
 +std::shared_ptr<Annot> StampAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *doc)
  {
 -    StampAnnotation *q = static_cast<StampAnnotation *>(makeAlias());
-+    std::unique_ptr<StampAnnotation> q = static_pointer_cast<StampAnnotation *>(makeAlias());
++    std::unique_ptr<StampAnnotation> q = static_pointer_cast<StampAnnotation>(makeAlias());
 
      // Set page and document
      pdfPage = destPage;
@@ -2595,7 +2588,7 @@ index e15523c..f148671 100644
 -    Annotation *makeAlias() override;
 -    Annot *createNativeAnnot(::Page *destPage, DocumentData *doc) override;
 +    std::unique_ptr<Annotation> makeAlias() override;
-+    std::shared_ptr<Annot> *createNativeAnnot(::Page *destPage, DocumentData *doc) override;
++    std::shared_ptr<Annot> createNativeAnnot(::Page *destPage, DocumentData *doc) override;
 
      // data fields
      QList<QLinkedList<QPointF>> inkPaths;
@@ -2604,7 +2597,7 @@ index e15523c..f148671 100644
  InkAnnotationPrivate::InkAnnotationPrivate() : AnnotationPrivate() { }
 
 -Annotation *InkAnnotationPrivate::makeAlias()
-+std::unique_ptr<Annotation> *InkAnnotationPrivate::makeAlias()
++std::unique_ptr<Annotation> InkAnnotationPrivate::makeAlias()
  {
 -    return new InkAnnotation(*this);
 +    return std::unique_ptr<InkAnnotation>(new InkAnnotation(*this));
@@ -2616,11 +2609,11 @@ index e15523c..f148671 100644
  }
 
 -Annot *InkAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *doc)
-+std::shared_ptr<Annot> *InkAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *doc)
++std::shared_ptr<Annot> InkAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *doc)
  {
      // Setters are defined in the public class
 -    InkAnnotation *q = static_cast<InkAnnotation *>(makeAlias());
-+    std::shared_ptr<InkAnnotation> q = static_pointer_cast<InkAnnotation *>(makeAlias());
++    std::unique_ptr<InkAnnotation> q = static_pointer_cast<InkAnnotation>(makeAlias());
 
      // Set page and document
      pdfPage = destPage;
@@ -2714,7 +2707,7 @@ index e15523c..f148671 100644
  {
      // Setters are defined in the public class
 -    CaretAnnotation *q = static_cast<CaretAnnotation *>(makeAlias());
-+    std::unique_ptr<CaretAnnotation> q = static_pointer_cast<CaretAnnotation *>(makeAlias());
++    std::unique_ptr<CaretAnnotation> q = static_pointer_cast<CaretAnnotation>(makeAlias());
 
      // Set page and document
      pdfPage = destPage;
@@ -2774,7 +2767,7 @@ index e15523c..f148671 100644
  }
 
 -Annot *FileAttachmentAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *doc)
-+std::shared_ptr<Annot> *FileAttachmentAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *doc)
++std::shared_ptr<Annot> FileAttachmentAnnotationPrivate::createNativeAnnot(::Page *destPage, DocumentData *doc)
  {
      return nullptr; // Not implemented
  }
@@ -2893,6 +2886,7 @@ index e15523c..f148671 100644
      {
          Q_UNUSED(destPage);
          Q_UNUSED(doc);
+
 diff --git a/qt5/src/poppler-form.cc b/qt5/src/poppler-form.cc
 index dfdcd39..760a891 100644
 --- a/qt5/src/poppler-form.cc


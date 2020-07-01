Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.12405.1593569265295811281
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 19:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R0HcEXg8;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id cm21so983583pjb.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 19:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=zVq5+so+otGaT8AZpeKH8TPk/PXFh5uWJqFcInbqChk=;
        b=R0HcEXg8esCKKjq5PWAS2jSId+YE8nTNdenrepcRNoqeNSbVy5ESCrhd3HLEeOhSSa
         EeqWpE858LUoKvYvMZW00jU529LClF9DyMO9w9IkOdS5ilRkUHxzizXCkFXL1oPb1PDe
         EUI8i1MGbGkJyxfAzoV8hYNCchR1kdfbEE+v0+e5CK47E63/VK/RtQB4Vg6ug5qKmnAB
         bHtvxKiWJ3ddsPepJ21105GAb0nJsKyE1zh9Yj6m3tBtUhoiJOQ/WDsXl17fNyOKLQkP
         vMoRae9gqEnETpjsnNUIH8NSiM8DlyWx86uq1CjwtYZiUIvszSXsDWLADYGHrBVMH6el
         ZG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=zVq5+so+otGaT8AZpeKH8TPk/PXFh5uWJqFcInbqChk=;
        b=ca+89PRqqnN/uWSHZ9VmSvL+VlhJShQqc1os/5VSuq5/I9wnikodDGWtXWf1zcAYhY
         Fa/Il6cvG4cI0ciR7L8RU5yCXwGe6tRsGSXKlyUFlEoaN2OdCGWFA0+RI8LgX6jgg5V0
         qF2MmMRG51M7tz9xrcqdnQZwiqqLG7zUk3jbNcjkVlpnAMOyFgfWCneGKxlzSjEkTnGw
         WvHPJ8A2OBBSll40kT6vLH3Yn0BtMb+/X4F0wttczovQiVjBi+NOUck+YjuJzyQ1m6sa
         +4iNbZzsuKyDMIG+TZukOFYPOUI9VDIZCLjau6bqCXlPUP12bijLtUqyzXY5wn/PtX7M
         5Jeg==
X-Gm-Message-State: AOAM5324Pz7Ylqd8DSeisGzcn35wXgvXRswJbHpGuHn9yKfv3NVSi9iT
	DYGYHwyryoXAeuOviIx25NAehuO7PME=
X-Google-Smtp-Source: ABdhPJweCiRvmvqT3QK7g7813CWtx9RkyUSw4gUCZT5/cQnbgrjePljf8g6KD4QihzrIPhTB/zBnWw==
X-Received: by 2002:a17:902:7807:: with SMTP id p7mr20684551pll.242.1593569264419;
        Tue, 30 Jun 2020 19:07:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c85d:3ce:5443:9164? ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z9sm4020343pgh.94.2020.06.30.19.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 19:07:43 -0700 (PDT)
Subject: Re: [oe] [dunfel 11/32] vlc: Fix build with qt5 in PACKAGECONFIG and Qt >= 5.15 / renumber patches
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1593561840.git.akuster808@gmail.com>
 <24303fe200ad0d7f273bb36d93fa1756c6d665cd.1593561840.git.akuster808@gmail.com>
 <CA+chaQe_eVez=igr79bc1uBokxZpZsL+pBsA=hE+ikY_NECg8A@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <9ec9db48-7a3d-e630-38a6-f76760d31e85@gmail.com>
Date: Tue, 30 Jun 2020 19:07:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQe_eVez=igr79bc1uBokxZpZsL+pBsA=hE+ikY_NECg8A@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------72F4F4F4DAB185FC70CB2C7C"
Content-Language: en-US

--------------72F4F4F4DAB185FC70CB2C7C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 6/30/20 5:28 PM, Martin Jansa wrote:
> >  [AK: meta-QT5 dufell has 5.15 so this is seems reasonable.]
>
> I don't know which meta-QT5 had 'dufell' :) but 'dunfell' branch
> in https://github.com/meta-qt5/meta-qt5 has 5.15
Hmm, I did try double checking... looks something went wrong in my
checking not to mention my spelling.

I will drop this.

thanks for reviewing.

-armin
> only in master branch and dunfell will stay on 5.14.*, but the
> 0005-Fix-build-with-Qt-5.15.patch seems to be backwards compatible, I
> guess it does no harm backporting this and might be useful for someone
> (as people are often mixing different meta-qt5 branches when they
> needs specific Qt release for whatever reason)
>
> On Tue, Jun 30, 2020 at 5:07 PM akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     From: Andreas Müller <schnitzeltony@gmail.com
>     <mailto:schnitzeltony@gmail.com>>
>
>     Signed-off-by: Andreas Müller <schnitzeltony@gmail.com
>     <mailto:schnitzeltony@gmail.com>>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     (cherry picked from commit aadbc77f8e132301403c1187e8d0488d526f8817)
>     [AK: meta-QT5 dufell has 5.15 so this is seems reasonable.]
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      ...ch => 0001-make-opencv-configurable.patch} |  0
>      ...isidec.patch => 0002-use-vorbisidec.patch} |  0
>      ...int.patch => 0003-fix-luaL-checkint.patch} |  0
>      ...ackageconfig-to-detect-mmal-support.patch} |  0
>      .../vlc/vlc/0005-Fix-build-with-Qt-5.15.patch | 56
>     +++++++++++++++++++
>      .../recipes-multimedia/vlc/vlc_3.0.9.2.bb
>     <http://vlc_3.0.9.2.bb>     |  9 +--
>      6 files changed, 61 insertions(+), 4 deletions(-)
>      rename
>     meta-multimedia/recipes-multimedia/vlc/vlc/{0006-make-opencv-configurable.patch
>     => 0001-make-opencv-configurable.patch} (100%)
>      rename
>     meta-multimedia/recipes-multimedia/vlc/vlc/{0007-use-vorbisidec.patch
>     => 0002-use-vorbisidec.patch} (100%)
>      rename
>     meta-multimedia/recipes-multimedia/vlc/vlc/{0008-fix-luaL-checkint.patch
>     => 0003-fix-luaL-checkint.patch} (100%)
>      rename
>     meta-multimedia/recipes-multimedia/vlc/vlc/{0001-Use-packageconfig-to-detect-mmal-support.patch
>     => 0004-Use-packageconfig-to-detect-mmal-support.patch} (100%)
>      create mode 100644
>     meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
>
>     diff --git
>     a/meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurable.patch
>     b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch
>     similarity index 100%
>     rename from
>     meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurable.patch
>     rename to
>     meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch
>     diff --git
>     a/meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
>     b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
>     similarity index 100%
>     rename from
>     meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
>     rename to
>     meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
>     diff --git
>     a/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
>     b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch
>     similarity index 100%
>     rename from
>     meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
>     rename to
>     meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch
>     diff --git
>     a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch
>     b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
>     similarity index 100%
>     rename from
>     meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch
>     rename to
>     meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
>     diff --git
>     a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
>     b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
>     new file mode 100644
>     index 0000000000..c4465b6af3
>     --- /dev/null
>     +++
>     b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
>     @@ -0,0 +1,56 @@
>     +From c805c6f64da6d8b03355b4796865b75e2f3b500d Mon Sep 17 00:00:00
>     2001
>     +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com
>     <mailto:schnitzeltony@gmail.com>>
>     +Date: Mon, 8 Jun 2020 00:50:08 +0200
>     +Subject: [PATCH] Fix build with Qt >= 5.15
>     +MIME-Version: 1.0
>     +Content-Type: text/plain; charset=UTF-8
>     +Content-Transfer-Encoding: 8bit
>     +
>     +Upstream-Status: Pending
>     +
>     +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com
>     <mailto:schnitzeltony@gmail.com>>
>     +---
>     + modules/gui/qt/components/playlist/views.cpp | 1 +
>     + modules/gui/qt/dialogs/plugins.cpp           | 1 +
>     + modules/gui/qt/util/timetooltip.hpp          | 1 +
>     + 3 files changed, 3 insertion(+)
>     +
>     +diff --git a/modules/gui/qt/components/playlist/views.cpp
>     b/modules/gui/qt/components/playlist/views.cpp
>     +index 24db9d9..71d8514 100644
>     +--- a/modules/gui/qt/components/playlist/views.cpp
>     ++++ b/modules/gui/qt/components/playlist/views.cpp
>     +@@ -35,6 +35,7 @@
>     + #include <QMetaType>
>     + #include <QHeaderView>
>     + #include <QSvgRenderer>
>     ++#include <QPainterPath>
>     +
>     + #include <assert.h>
>     +
>     +diff --git a/modules/gui/qt/dialogs/plugins.cpp
>     b/modules/gui/qt/dialogs/plugins.cpp
>     +index d233382..9ae9a63 100644
>     +--- a/modules/gui/qt/dialogs/plugins.cpp
>     ++++ b/modules/gui/qt/dialogs/plugins.cpp
>     +@@ -66,6 +66,7 @@
>     + #include <QSplitter>
>     + #include <QToolButton>
>     + #include <QStackedWidget>
>     ++#include <QPainterPath>
>     +
>     + //match the image source (width/height)
>     + #define SCORE_ICON_WIDTH_SCALE 4
>     +diff --git a/modules/gui/qt/util/timetooltip.hpp
>     b/modules/gui/qt/util/timetooltip.hpp
>     +index 6a1329e..9f50b18 100644
>     +--- a/modules/gui/qt/util/timetooltip.hpp
>     ++++ b/modules/gui/qt/util/timetooltip.hpp
>     +@@ -25,6 +25,7 @@
>     + #include "qt.hpp"
>     +
>     + #include <QWidget>
>     ++#include <QPainterPath>
>     +
>     + class TimeTooltip : public QWidget
>     + {
>     +--
>     +2.26.2
>     +
>     diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
>     <http://vlc_3.0.9.2.bb>
>     b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
>     <http://vlc_3.0.9.2.bb>
>     index f6c7a606d5..24898a5a7f 100644
>     --- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
>     <http://vlc_3.0.9.2.bb>
>     +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
>     <http://vlc_3.0.9.2.bb>
>     @@ -19,10 +19,11 @@ LDFLAGS_append_riscv64 = " -latomic"
>      LICENSE_FLAGS = "commercial"
>
>      SRC_URI =
>     "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz
>     <http://download.videolan.org/pub/videolan/$%7BBPN%7D/$%7BPV%7D/$%7BBP%7D.tar.xz>
>     \
>     -           file://0006-make-opencv-configurable.patch \
>     -           file://0007-use-vorbisidec.patch \
>     -           file://0008-fix-luaL-checkint.patch \
>     -         
>      file://0001-Use-packageconfig-to-detect-mmal-support.patch \
>     +           file://0001-make-opencv-configurable.patch \
>     +           file://0002-use-vorbisidec.patch \
>     +           file://0003-fix-luaL-checkint.patch \
>     +         
>      file://0004-Use-packageconfig-to-detect-mmal-support.patch \
>     +           file://0005-Fix-build-with-Qt-5.15.patch \
>      "
>      SRC_URI[sha256sum] =
>     "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19e00021e071e47601"
>
>     -- 
>     2.17.1
>
>     
>


--------------72F4F4F4DAB185FC70CB2C7C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/30/20 5:28 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQe_eVez=igr79bc1uBokxZpZsL+pBsA=hE+ikY_NECg8A@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">&gt; 
        [AK: meta-QT5 dufell has 5.15 so this is seems reasonable.]
        <div><br>
        </div>
        <div>I don't know which meta-QT5 had 'dufell' :) but 'dunfell'
          branch in <a href="https://github.com/meta-qt5/meta-qt5"
            moz-do-not-send="true">https://github.com/meta-qt5/meta-qt5</a> has
          5.15</div>
      </div>
    </blockquote>
    Hmm, I did try double checking... looks something went wrong in my
    checking not to mention my spelling.<br>
    <br>
    I will drop this.<br>
    <br>
    thanks for reviewing.<br>
    <br>
    -armin<br>
    <blockquote type="cite"
cite="mid:CA+chaQe_eVez=igr79bc1uBokxZpZsL+pBsA=hE+ikY_NECg8A@mail.gmail.com">
      <div dir="ltr">
        <div> only in master branch and dunfell will stay on 5.14.*, but
          the 0005-Fix-build-with-Qt-5.15.patch seems to be backwards
          compatible, I guess it does no harm backporting this and might
          be useful for someone (as people are often mixing different
          meta-qt5 branches when they needs specific Qt release for
          whatever reason)</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Tue, Jun 30, 2020 at 5:07
          PM akuster &lt;<a href="mailto:akuster808@gmail.com"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Andreas Müller &lt;<a href="mailto:schnitzeltony@gmail.com"
            target="_blank" moz-do-not-send="true">schnitzeltony@gmail.com</a>&gt;<br>
          <br>
          Signed-off-by: Andreas Müller &lt;<a
            href="mailto:schnitzeltony@gmail.com" target="_blank"
            moz-do-not-send="true">schnitzeltony@gmail.com</a>&gt;<br>
          Signed-off-by: Khem Raj &lt;<a
            href="mailto:raj.khem@gmail.com" target="_blank"
            moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
          (cherry picked from commit
          aadbc77f8e132301403c1187e8d0488d526f8817)<br>
          [AK: meta-QT5 dufell has 5.15 so this is seems reasonable.]<br>
          Signed-off-by: Armin Kuster &lt;<a
            href="mailto:akuster808@gmail.com" target="_blank"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt;<br>
          ---<br>
           ...ch =&gt; 0001-make-opencv-configurable.patch} |  0<br>
           ...isidec.patch =&gt; 0002-use-vorbisidec.patch} |  0<br>
           ...int.patch =&gt; 0003-fix-luaL-checkint.patch} |  0<br>
           ...ackageconfig-to-detect-mmal-support.patch} |  0<br>
           .../vlc/vlc/0005-Fix-build-with-Qt-5.15.patch | 56
          +++++++++++++++++++<br>
           .../recipes-multimedia/vlc/<a href="http://vlc_3.0.9.2.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">vlc_3.0.9.2.bb</a> 
             |  9 +--<br>
           6 files changed, 61 insertions(+), 4 deletions(-)<br>
           rename
meta-multimedia/recipes-multimedia/vlc/vlc/{0006-make-opencv-configurable.patch
          =&gt; 0001-make-opencv-configurable.patch} (100%)<br>
           rename
          meta-multimedia/recipes-multimedia/vlc/vlc/{0007-use-vorbisidec.patch
          =&gt; 0002-use-vorbisidec.patch} (100%)<br>
           rename
          meta-multimedia/recipes-multimedia/vlc/vlc/{0008-fix-luaL-checkint.patch
          =&gt; 0003-fix-luaL-checkint.patch} (100%)<br>
           rename
meta-multimedia/recipes-multimedia/vlc/vlc/{0001-Use-packageconfig-to-detect-mmal-support.patch
          =&gt; 0004-Use-packageconfig-to-detect-mmal-support.patch}
          (100%)<br>
           create mode 100644
meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch<br>
          <br>
          diff --git
a/meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurable.patch
b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch<br>
          similarity index 100%<br>
          rename from
meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurable.patch<br>
          rename to
meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch<br>
          diff --git
          a/meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch<br>
          similarity index 100%<br>
          rename from
          meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch<br>
          rename to
          meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch<br>
          diff --git
a/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch<br>
          similarity index 100%<br>
          rename from
          meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch<br>
          rename to
          meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch<br>
          diff --git
a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch
b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch<br>
          similarity index 100%<br>
          rename from
meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch<br>
          rename to
meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch<br>
          diff --git
a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch<br>
          new file mode 100644<br>
          index 0000000000..c4465b6af3<br>
          --- /dev/null<br>
          +++
b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch<br>
          @@ -0,0 +1,56 @@<br>
          +From c805c6f64da6d8b03355b4796865b75e2f3b500d Mon Sep 17
          00:00:00 2001<br>
          +From: =?UTF-8?q?Andreas=20M=C3=BCller?= &lt;<a
            href="mailto:schnitzeltony@gmail.com" target="_blank"
            moz-do-not-send="true">schnitzeltony@gmail.com</a>&gt;<br>
          +Date: Mon, 8 Jun 2020 00:50:08 +0200<br>
          +Subject: [PATCH] Fix build with Qt &gt;= 5.15<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=UTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +Upstream-Status: Pending<br>
          +<br>
          +Signed-off-by: Andreas Müller &lt;<a
            href="mailto:schnitzeltony@gmail.com" target="_blank"
            moz-do-not-send="true">schnitzeltony@gmail.com</a>&gt;<br>
          +---<br>
          + modules/gui/qt/components/playlist/views.cpp | 1 +<br>
          + modules/gui/qt/dialogs/plugins.cpp           | 1 +<br>
          + modules/gui/qt/util/timetooltip.hpp          | 1 +<br>
          + 3 files changed, 3 insertion(+)<br>
          +<br>
          +diff --git a/modules/gui/qt/components/playlist/views.cpp
          b/modules/gui/qt/components/playlist/views.cpp<br>
          +index 24db9d9..71d8514 100644<br>
          +--- a/modules/gui/qt/components/playlist/views.cpp<br>
          ++++ b/modules/gui/qt/components/playlist/views.cpp<br>
          +@@ -35,6 +35,7 @@<br>
          + #include &lt;QMetaType&gt;<br>
          + #include &lt;QHeaderView&gt;<br>
          + #include &lt;QSvgRenderer&gt;<br>
          ++#include &lt;QPainterPath&gt;<br>
          + <br>
          + #include &lt;assert.h&gt;<br>
          + <br>
          +diff --git a/modules/gui/qt/dialogs/plugins.cpp
          b/modules/gui/qt/dialogs/plugins.cpp<br>
          +index d233382..9ae9a63 100644<br>
          +--- a/modules/gui/qt/dialogs/plugins.cpp<br>
          ++++ b/modules/gui/qt/dialogs/plugins.cpp<br>
          +@@ -66,6 +66,7 @@<br>
          + #include &lt;QSplitter&gt;<br>
          + #include &lt;QToolButton&gt;<br>
          + #include &lt;QStackedWidget&gt;<br>
          ++#include &lt;QPainterPath&gt;<br>
          + <br>
          + //match the image source (width/height)<br>
          + #define SCORE_ICON_WIDTH_SCALE 4<br>
          +diff --git a/modules/gui/qt/util/timetooltip.hpp
          b/modules/gui/qt/util/timetooltip.hpp<br>
          +index 6a1329e..9f50b18 100644<br>
          +--- a/modules/gui/qt/util/timetooltip.hpp<br>
          ++++ b/modules/gui/qt/util/timetooltip.hpp<br>
          +@@ -25,6 +25,7 @@<br>
          + #include "qt.hpp"<br>
          + <br>
          + #include &lt;QWidget&gt;<br>
          ++#include &lt;QPainterPath&gt;<br>
          + <br>
          + class TimeTooltip : public QWidget<br>
          + {<br>
          +-- <br>
          +2.26.2<br>
          +<br>
          diff --git a/meta-multimedia/recipes-multimedia/vlc/<a
            href="http://vlc_3.0.9.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">vlc_3.0.9.2.bb</a>
          b/meta-multimedia/recipes-multimedia/vlc/<a
            href="http://vlc_3.0.9.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">vlc_3.0.9.2.bb</a><br>
          index f6c7a606d5..24898a5a7f 100644<br>
          --- a/meta-multimedia/recipes-multimedia/vlc/<a
            href="http://vlc_3.0.9.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">vlc_3.0.9.2.bb</a><br>
          +++ b/meta-multimedia/recipes-multimedia/vlc/<a
            href="http://vlc_3.0.9.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">vlc_3.0.9.2.bb</a><br>
          @@ -19,10 +19,11 @@ LDFLAGS_append_riscv64 = " -latomic"<br>
           LICENSE_FLAGS = "commercial"<br>
          <br>
           SRC_URI = "<a
href="http://download.videolan.org/pub/videolan/$%7BBPN%7D/$%7BPV%7D/$%7BBP%7D.tar.xz"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz</a>
          \<br>
          -           <a class="moz-txt-link-freetext" href="file://0006-make-opencv-configurable.patch">file://0006-make-opencv-configurable.patch</a> \<br>
          -           <a class="moz-txt-link-freetext" href="file://0007-use-vorbisidec.patch">file://0007-use-vorbisidec.patch</a> \<br>
          -           <a class="moz-txt-link-freetext" href="file://0008-fix-luaL-checkint.patch">file://0008-fix-luaL-checkint.patch</a> \<br>
          -         
           <a class="moz-txt-link-freetext" href="file://0001-Use-packageconfig-to-detect-mmal-support.patch">file://0001-Use-packageconfig-to-detect-mmal-support.patch</a> \<br>
          +           <a class="moz-txt-link-freetext" href="file://0001-make-opencv-configurable.patch">file://0001-make-opencv-configurable.patch</a> \<br>
          +           <a class="moz-txt-link-freetext" href="file://0002-use-vorbisidec.patch">file://0002-use-vorbisidec.patch</a> \<br>
          +           <a class="moz-txt-link-freetext" href="file://0003-fix-luaL-checkint.patch">file://0003-fix-luaL-checkint.patch</a> \<br>
          +         
           <a class="moz-txt-link-freetext" href="file://0004-Use-packageconfig-to-detect-mmal-support.patch">file://0004-Use-packageconfig-to-detect-mmal-support.patch</a> \<br>
          +           <a class="moz-txt-link-freetext" href="file://0005-Fix-build-with-Qt-5.15.patch">file://0005-Fix-build-with-Qt-5.15.patch</a> \<br>
           "<br>
           SRC_URI[sha256sum] =
          "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19e00021e071e47601"<br>
          <br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------72F4F4F4DAB185FC70CB2C7C--

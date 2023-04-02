Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6B3C77B60
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:10 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.56502.1680474610619466242
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TCrMas+i;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id ce4so4849338pfb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7WgAWzjFfyrfEpXi424/+1dvdmRlEALzrvwg9pnBig=;
        b=TCrMas+inJBOR99m08hsWc+818RDlg7ECN5vFMw++Y4XT5sv5Gw788tCkh+rxsDd0w
         modc1SvQDX/sG+1RvmdoiYhdzUrnem4hB4tBAiU45D0/I/MCDZ7v8x4MdByTgSzujb1p
         4xAMII0rHoLSFjdqREznYi4qLcvKnnYse7QTBDMFKfNao5bSgGV9GAdtqXhGwBkRd+jL
         ZhrJYLb1HY770aG7Ka36YGLzFquIMAWxHmy5tPKzUPV2jxd6wSFBD+E1hubBJ2M/2YCa
         f4bSSC+0vXUV+z9nBM/OaqDCxC8XhH8w+3NKxDO0N3JZ0qHBuk8lNhpBBsirEY2BeYmH
         Hb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7WgAWzjFfyrfEpXi424/+1dvdmRlEALzrvwg9pnBig=;
        b=PNqpAYmN9L/ONQ5e7QtJkOHl+FzvTnskrxhrbGqrL2rDpU2/WTNACkQOD7uth3c90f
         1yVmq+dL9VDLbJF6rI9tHKk2lVo52ZMrExjnNzZPO+8NQLPpujW/w2nW+WIdam964tqy
         js5e/9EhYNRzqhN830IwTuBlVHZrB0L/ptYOJgwwx6kd4ZGGo3Hr4QOZ0Ios4M4lXZK1
         3dGhAFanT4I5uoOEvURMRByNbXNlyg4LlDuNJnez8XopkEsOygOyz/ljX47GDu17cEUp
         IXuHOgppHRzdoVbI3OGgv/Xq3LF448GZFqoD+lGocKs0lP3uuP9D9xyo1yTjYnre0QHy
         F6YA==
X-Gm-Message-State: AAQBX9cevWOLOTAUAv1kLT32dJEwDN/yI10X/eZtTiRDzsNCgghSYFfj
	cnV1MtUdZDv/PHrZ6BsDMh7zek0D9Us=
X-Google-Smtp-Source: AKy350YEz5sjQtgpZcyv2JYLJfunKXHdI7/46RbclxtbMcPPJQR7xnO10p77ycZllQpNTZKYc3qsmw==
X-Received: by 2002:a62:4e4e:0:b0:626:166f:6db1 with SMTP id c75-20020a624e4e000000b00626166f6db1mr32583741pfb.13.1680474609717;
        Sun, 02 Apr 2023 15:30:09 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.30.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:30:09 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 08/11] ptest-packagelists-meta-perl.inc: add ptest recipes
Date: Sun,  2 Apr 2023 15:29:40 -0700
Message-Id: <b9bac7a1402bdcc449d81ad145cb831e8033920f.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680473253.git.tim.orling@konsulko.com>
References: <cover.1680473253.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101886

Similar to ptest-packagelists.inc in oe-core, this list enables
per image ptest (isolated ptests for a given recipe)

* Add recipes to PTEST_FAST_META_PERL for ptests which take less than ~30s
* Add recipes to PTEST_SLOW_META_PERL for ptests which take longer
* Add recipes to PTEST_PROBLEMS_META_PERL for ptests which have failing tests
  or other issues with ptest package

The initial list was taken from:

meta_perl_ptest_recipes=$(bitbake-layers show-recipes --recipes-only \
    --layer meta-perl --inherits ptest --bare | tr '\n' ' ' | \
    pcregrep -o1 '^NOTE:.+===(.+)$')

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../include/ptest-packagelists-meta-perl.inc  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta-perl/conf/include/ptest-packagelists-meta-perl.inc

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
new file mode 100644
index 000000000..1a8c759b1
--- /dev/null
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -0,0 +1,50 @@
+#
+# Lists of the ptest in meta-perl, sorted into two sets by the time they take
+# Please keep these sorted in alphabetical order
+#
+# A first pass at getting all meta-perl recipes which inherit ptest
+# meta_perl_ptest_recipes=$(bitbake-layers show-recipes --recipes-only --layer meta-perl --inherits ptest --bare | tr '\n' ' ' | pcregrep -o1 '^NOTE:.+===(.+)$')
+#
+# ptests which take less than ~30s each
+PTESTS_FAST_META_PERL = "\
+    libcapture-tiny-perl \
+    libcgi-perl \
+    libcrypt-openssl-random-perl \
+    libextutils-config-perl \
+    libhtml-tagset-perl \
+    libmozilla-ca-perl \
+    libstrictures-perl \
+    libterm-readkey-perl \
+    libtest-nowarnings-perl \
+"
+
+PTESTS_SLOW_META_PERL = "\
+    libio-socket-ssl-perl \
+"
+
+PTESTS_PROBLEMS_META_PERL ="\
+    libauthen-sasl-perl \
+    libconfig-autoconf-perl \
+    libcrypt-openssl-guess-perl \
+    libcrypt-openssl-rsa-perl \
+    libdata-hexdump-perl \
+    libdbd-sqlite-perl \
+    libdigest-hmac-perl \
+    libdigest-sha1-perl \
+    libnet-dns-perl \
+    libnet-dns-sec-perl \
+    libnet-ldap-perl \
+    libencode-perl \
+    libextutils-installpaths-perl \
+    libfile-slurper-perl \
+    libhtml-parser-perl \
+    libmime-types-perl \
+    libnet-ssleay-perl \
+    libsub-uplevel-perl \
+    libtest-deep-perl \
+    libtest-harness-perl \
+    libtest-warn-perl \
+    libunicode-linebreak-perl \
+    libunix-statgrab \
+    libxml-libxml-perl \
+"
-- 
2.34.1



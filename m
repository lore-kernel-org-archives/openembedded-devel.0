Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20765.1794801689592180314
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 20:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CtaY0uEq;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b10d24345dso25820827b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 20:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794801688; x=1795406488; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVVNlMswOCKhrJ0KhLBc6eBuA4jvYQbv5SRT8bvk+Sc=;
        b=CtaY0uEqzPGJpyxP3RjSyJDlWW+k17Owf7zCZSPa7jU3c3yUrsvwhVu6tLpqrCo48s
         Ub3KxQETG0oq/3fnGTmi8LM7NNGRHpTwbltkvEuhoKvxjj9KL7tuWB4RITtANUNjnnnj
         ALOCVvdQscs0usxAZLp/Lb9Bya7W8vppbHa64t5TD6OlUDyN7RGbVTx+NoaoNMJZqW+I
         imfVoTSV9UakIcwVYpMVvzB6BIjROc/c9TW2wtLRuS/j9rWE/6aUOZLueH6vUJkob0A9
         RdKwB2VEngfqNm9DPMa4I7X+EAa1g4noldaU9V7tEAxTfXRJMyRU5XHiOiqIYsjq2+xC
         SPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801688; x=1795406488;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GVVNlMswOCKhrJ0KhLBc6eBuA4jvYQbv5SRT8bvk+Sc=;
        b=D48OuAwWhA4oOdN9lfkR/gnt4pZ6uIvFR9r1lbuRosZ4VqTNoazPjQ/j9mDWT+pFhE
         lacLqjw9ZlsOzkcI9HZD8WBNa1NfhXx2Xb6mGANlXFst5Gauo5CXavVsrQOjFrLkiSv/
         QPdeu+GoDGkQh75gDfp67OVZ0Nwt1pbgbIFCTEwLD5s4B1Nli2eLr8ereHaw0hEKvXLx
         WCw9nurVrbhJ4GhN6/g9mZ2/TL1NgJ2ayVUPQdD8dWnfEI1DqihnKQXpThM9jp5472RU
         ITB2dB9fStWz1QrbOU1VA8UE8uX9jq5e3YWkIMN/Evz0kMxFasGZkfub6v2WM9JIh1l/
         Suow==
X-Gm-Message-State: APuU4Z9kjPdPqUM+Xn7q+joqfTCkhPnV34EsacoU/GBLUR0vhQ8ZxHos
	+O7NQNiuzQw8+er2fEB8Erfc84ofjMkujRugkKIK/jeXlZKbU00HnKCGtrnhZSvE
X-Gm-Gg: AZFdTZc/1jOK+QbVZ9lUxBnS5GUBBCUXWXZBii44fctnjG7c6G6NjTeMdk1jFCzvqiy
	khGNZoBcV9AqywzexxYu1lIhsZbQRzyTMmEP350b1Jp3dOCelv7kJJKbrUSlCpaskPCvA/T/VXs
	nZuBdgqhldPGJ8LveVJawLqtUMTluS8o5FBeeesHmn8cisO/POb/FNDhAuVL0z9579rmExGOsuB
	L3Ep/09ddK1895gkS7CMCmcqSb+JlK1lmKwXe0hJiD8oYAXcIXxAuclnbxU8Bg1u/G0Goq84Z5d
	qnKgpcD09MgWYBjwezwNCii72VD6rZi0bwDVtwVylufj8IbahUviTkQsnywoa93Cnz8HFXAX2kY
	kXgBnd5MhBm4oLDHvDGsK/zV2j8DZTjlrSyqg4U7Irp612dO9WmXhz4lyGa/+w6Zp+h6sc5RAE4
	SKe6yax6aNVPr63lXUptUt/7qWtEu1YSMDRcJyi1B32zvO3MM+MfoPBsOBNVJERzEmXHqWM/U1B
	4HrRL0MkVku0YyP9DgZIqy1NYDVzhx/HTGgHV7aPc21eSH4F94smgwnczDDdVmIQHKmXuJzcIvr
	tAhrjW56pVEHI5kJ32CJqq/doDuslJJ3QgxY9MbSEKqkyZqDVCXv3SEdFUSf0K/18G3NheZr7++
	ID30V8yO1B7Dl53YtXwvNo/kVO9xXta4R6wikQAwk41U/8tDWGLC/UFQrDZZAuEekTKZSoZxCjg
	==
X-Received: by 2002:a05:690c:9213:b0:8b3:b31a:19d9 with SMTP id 00721157ae682-8b4aa353049mr44951807b3.51.1794801688330;
        Sun, 15 Nov 2026 20:01:28 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.3.193.106])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9dc1c9sm77673117b3.36.2026.11.15.20.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:01:27 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] liburi-perl: upgrade 5.35 -> 5.36
Date: Sun, 15 Nov 2026 23:00:22 -0500
Message-ID: <20261116040114.25347-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 04:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132398
Content-Type: text/plain; charset="utf-8"

Refresh patches.

Changes for version 5.36 - 2026-08-19

    Apply Unicode NFC normalization in URI::_idna nameprep so IDNA host
    encoding matches other clients instead of emitting a non-standard,
    non-round-tripping A-label [CVE-2026-19953] (reported by Naseeb Dangi, @naseeb0) (GH#191)

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../0001-Skip-TODO-test-cases-that-fail.patch | 72 +++++++++++--------
 ...iburi-perl_5.35.bb => liburi-perl_5.36.bb} |  2 +-
 2 files changed, 43 insertions(+), 31 deletions(-)
 rename meta-perl/recipes-perl/liburi/{liburi-perl_5.35.bb => liburi-perl_5.36.bb} (94%)

diff --git a/meta-perl/recipes-perl/liburi/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta-perl/recipes-perl/liburi/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
index c15c3be93a..3a5c7871a3 100644
--- a/meta-perl/recipes-perl/liburi/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
+++ b/meta-perl/recipes-perl/liburi/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -9,16 +9,16 @@ Upstream-Status: Inappropriate [ptest-runner specific]
 
 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 ---
- t/escape-char.t | 20 ++++++++++----------
- t/iri.t         | 18 +++++++++---------
- t/mailto.t      | 12 ++++++------
- 3 files changed, 25 insertions(+), 25 deletions(-)
+ t/escape-char.t | 22 +++++++++++-----------
+ t/iri.t         | 22 +++++++++++-----------
+ t/mailto.t      | 18 +++++++++---------
+ 3 files changed, 31 insertions(+), 31 deletions(-)
 
 diff --git a/t/escape-char.t b/t/escape-char.t
-index c6ce79c..5e62ad5 100644
+index 5a5ad11..098bd5f 100644
 --- a/t/escape-char.t
 +++ b/t/escape-char.t
-@@ -6,16 +6,16 @@ use warnings;
+@@ -6,17 +6,17 @@ use warnings;
  use Test::More;
  use URI ();
  
@@ -30,7 +30,8 @@ index c6ce79c..5e62ad5 100644
 -    local $TODO = 'URI::Escape::escape_char misunderstands utf8';
 -
 -    # http://foo/%C3%A9
--    is("$uri", 'http://foo/%E9', 'correctly created a URI from a utf8-upgraded string');
+-    is("$uri", 'http://foo/%E9',
+-        'correctly created a URI from a utf8-upgraded string');
 -}
 +#TODO: {
 +#    my $str = "http://foo/\xE9";
@@ -40,35 +41,40 @@ index c6ce79c..5e62ad5 100644
 +#    local $TODO = 'URI::Escape::escape_char misunderstands utf8';
 +#
 +#    # http://foo/%C3%A9
-+#    is("$uri", 'http://foo/%E9', 'correctly created a URI from a utf8-upgraded string');
++#    is("$uri", 'http://foo/%E9',
++#        'correctly created a URI from a utf8-upgraded string');
 +#}
  
  {
      my $str = "http://foo/\xE9";
 diff --git a/t/iri.t b/t/iri.t
-index cf983d6..884b36e 100644
+index 1f76c19..2411e87 100644
 --- a/t/iri.t
 +++ b/t/iri.t
 @@ -6,7 +6,7 @@ use Test::More;
  use Config qw( %Config );
  
  if (defined $Config{useperlio}) {
--    plan tests=>30;
-+    plan tests=>28;
- } else {
-     plan skip_all=>"this perl doesn't support PerlIO layers";
+-    plan tests => 30;
++    plan tests => 28;
  }
-@@ -67,17 +67,17 @@ is $u->as_iri, "http://➡.ws/";
- # draft-duerst-iri-bis.txt examples (section 3.7.1):
- is(URI->new("http://www.example.org/D%C3%BCrst")->as_iri, "http://www.example.org/D\xFCrst");
- is(URI->new("http://www.example.org/D%FCrst")->as_iri, "http://www.example.org/D%FCrst");
+ else {
+     plan skip_all => "this perl doesn't support PerlIO layers";
+@@ -70,19 +70,19 @@ is(URI->new("http://www.example.org/D%C3%BCrst")->as_iri,
+     "http://www.example.org/D\xFCrst");
+ is(URI->new("http://www.example.org/D%FCrst")->as_iri,
+     "http://www.example.org/D%FCrst");
 -TODO: {
--    local $TODO = "some chars (like U+202E, RIGHT-TO-LEFT OVERRIDE) need to stay escaped";
--is(URI->new("http://xn--99zt52a.example.org/%e2%80%ae")->as_iri, "http://\x{7D0D}\x{8C46}.example.org/%e2%80%ae");
+-    local $TODO
+-        = "some chars (like U+202E, RIGHT-TO-LEFT OVERRIDE) need to stay escaped";
+-    is(URI->new("http://xn--99zt52a.example.org/%e2%80%ae")->as_iri,
+-        "http://\x{7D0D}\x{8C46}.example.org/%e2%80%ae");
 -}
 +#TODO: {
-+#    local $TODO = "some chars (like U+202E, RIGHT-TO-LEFT OVERRIDE) need to stay escaped";
-+#is(URI->new("http://xn--99zt52a.example.org/%e2%80%ae")->as_iri, "http://\x{7D0D}\x{8C46}.example.org/%e2%80%ae");
++#    local $TODO
++#        = "some chars (like U+202E, RIGHT-TO-LEFT OVERRIDE) need to stay escaped";
++#    is(URI->new("http://xn--99zt52a.example.org/%e2%80%ae")->as_iri,
++#        "http://\x{7D0D}\x{8C46}.example.org/%e2%80%ae");
 +#}
  
  # try some URLs that can't be IDNA encoded (fallback to encoded UTF8 bytes)
@@ -85,24 +91,30 @@ index cf983d6..884b36e 100644
 +#}
  is $u->as_iri, "http://" . ("ü" x 128);
 diff --git a/t/mailto.t b/t/mailto.t
-index 79e9a13..c68cfb2 100644
+index 92e4111..60f1c97 100644
 --- a/t/mailto.t
 +++ b/t/mailto.t
-@@ -48,12 +48,12 @@ $u = URI->new('mailto:user+detail@example.com');
+@@ -48,15 +48,15 @@ $u = URI->new('mailto:user+detail@example.com');
  is $u->to, 'user+detail@example.com', 'subaddress with `+` parsed correctly';
- is $u, 'mailto:user+detail@example.com', '... and stringification works';
+ is $u,     'mailto:user+detail@example.com', '... and stringification works';
  
 -TODO: {
--    local $TODO = "We can't handle quoted local parts without properly parsing the email addresses";
+-    local $TODO
+-        = "We can't handle quoted local parts without properly parsing the email addresses";
 -    $u = URI->new('mailto:"foo bar+baz"@example.com');
--    is $u->to, '"foo bar+baz"@example.com', 'address with quoted local part containing spaces is parsed correctly';
--    is $u, 'mailto:%22foo%20bar+baz%22@example.com', '... and stringification works';
+-    is $u->to, '"foo bar+baz"@example.com',
+-        'address with quoted local part containing spaces is parsed correctly';
+-    is $u, 'mailto:%22foo%20bar+baz%22@example.com',
+-        '... and stringification works';
 -}
 +#TODO: {
-+#    local $TODO = "We can't handle quoted local parts without properly parsing the email addresses";
++#    local $TODO
++#        = "We can't handle quoted local parts without properly parsing the email addresses";
 +#    $u = URI->new('mailto:"foo bar+baz"@example.com');
-+#    is $u->to, '"foo bar+baz"@example.com', 'address with quoted local part containing spaces is parsed correctly';
-+#    is $u, 'mailto:%22foo%20bar+baz%22@example.com', '... and stringification works';
++#    is $u->to, '"foo bar+baz"@example.com',
++#        'address with quoted local part containing spaces is parsed correctly';
++#    is $u, 'mailto:%22foo%20bar+baz%22@example.com',
++#        '... and stringification works';
 +#}
  
  # RFC 5321 (4.1.3) - Address Literals
diff --git a/meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb b/meta-perl/recipes-perl/liburi/liburi-perl_5.36.bb
similarity index 94%
rename from meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb
rename to meta-perl/recipes-perl/liburi/liburi-perl_5.36.bb
index a0e18de756..145eda3376 100644
--- a/meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb
+++ b/meta-perl/recipes-perl/liburi/liburi-perl_5.36.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "89648964ce5ae006726951f42f718576fbefe9e98a41bd2212d57386163092d2"
+SRC_URI[sha256sum] = "32719e57413db6e18492e104707b95c2210df637614c512e7368c9ec3c2f783b"
 
 S = "${UNPACKDIR}/URI-${PV}"
 
-- 
2.43.0


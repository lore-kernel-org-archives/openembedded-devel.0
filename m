Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22465.1794808954720991998
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hLh+mHtR;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2050440c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808954; x=1795413754; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ix/j6GCNiagSSIHBh8mJEssv8cODMnSUv1FLy7haolQ=;
        b=hLh+mHtR4FZ/LtJulSxICi2seie0pCeL7mOqGN5EyhvxM0ko6pvmgoS37JAiLRnFAR
         tGrYRi0YagQluO7HpTZz78qpP5r10d7iHNU1xqoNiTXUq3lpPslt4vhSlwlBZp44LjvO
         TLSDPRvN4bRwyGDdRhobnGYBacSPdddpDocJCQgKpc7TUNQ+6aDnx2Pj0u/taUDQSXZs
         VbttrkIqv+89hu7cQHmpefHMkEuhaQy7VN6xbdPR/kwh6gy0bEMsKvQYvr903T0uv8oI
         VugBWSJK59O4M5QTwH5r0KbPXTFo51OTUWeOjhyChlDXdLe41AWEHw4hDKIt8mYivIvu
         G0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808954; x=1795413754;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ix/j6GCNiagSSIHBh8mJEssv8cODMnSUv1FLy7haolQ=;
        b=E5G8CUy21jcO43rLCqMR+FL2P/+966CqMHN3oHIJLqGTg48zXUeJ+C4+6hNNJkiweL
         UZoqUn61dCYTaDq814iL6mNJWF8HcBJSZTSeh9DHmlfY5mdYcCwaJzAsZ8WxKSkcHb1+
         wDCaeXkHMwKDYP3v9LBtWA9/9ouX745RryRIJViMsCLr+HUASCHnKFN6pWsriJrppc6B
         qcOj3lY5Ll5TjWZQCtqq2mYDlfgNZNklUc5XpRminJgUoE391C+0C/rwqr2HjM+QuYvc
         1IqyladejCTGtX+8jug9EiRM/dKNpD2L/h63W4sx+aUQNs/6AjBiWjC9BHP46umS/mzt
         K7aA==
X-Gm-Message-State: APuU4Z/LH65V6TuCR7KoAC9WV6RhCq4fBQfTIFvATk3Pu4XA+h8cRRAT
	Vjn1JijG5gDB5KoMYXdiD1gE8gx15cZ3QsjJiqVjK2xALm0CuLBOqzvzNItQjvsf
X-Gm-Gg: AYBFou0n5JQnTZBlvoFvBgCmjPrtBmZYax/MWosnow7mou6ZxJshzrTTAkeHCc7JZ+6
	jFUu4Ie6eyrfiz8r+qzAyTU8FxwHb9pOhKkTNadh6FUaQ6Rl8SA+PofRoiMS22RQWV0VmD39pFx
	ZsbSoBPW+5xl4ob6UUNtdX0p4qUYuw6IagmqWi15YjA6+nkUy5yKcSX5PP05E9+P5wHJVDqND4U
	OZiW7LSDgTqHizwJezC7aq+vVMKHY9bXWPKzHlEpG78PjSIGcU6v5+2Uz6pbVLU8UVkl3pEJDIi
	970MVciSo09wCNY6GgzZB9IP/xFYgTxFdlRiWEyHZLPGKs+G9oSeNs7ISrc6SQ3JcRk+JBhLSF4
	i00IkVug4RxnLjuS5ZWJSd498/38R8olsC8MgmZUg99eY215V6YMIFDSQM6a6owaZo4Gi1ww6cg
	gU1lDEwkr2jM3QW95vQ320JKXyAEj9SIS7aBRHZOnxtQAToLzWuXOdi0o3j0+Q8xnPmXob7O1oz
	u5Z1gdBVmAV9Os4W8eXb1pk24Eq6I9yhKtKkqjoBFlMnLKoeXBPfCfob7ctf2AiY985uo3EAIQ8
	n45Qkz/aPrHbFsNk/Odp4ZFh5Z5hlUqi5ZpA2CDR5C51jTako+L/UN9RCW9NRpp6gvBVvibRvfX
	d8EQoWswevAv+DD3Mptj+UZuPmSpV1uOIWBAWtm/zzbWxW9RCLKOrO+bPIorWlXab4zP9fJHCPR
	0JlYu/jN1P4qfr2AREmntsI67HFgDYOjzcl88/zZ88xKrgSDyXZY3b9qH5V+1Qirmepo+KtNtQb
	9Bd9AwiNRqKuxwSa+0kLOmZlnlCfvDTapwogswSOPE6FI5Mf+pIZj0rQfbJh7LPq7jqK1zHllIJ
	0tr2
X-Received: by 2002:a05:693c:6016:b0:37f:6f1:bac4 with SMTP id 5a478bee46e88-37f06f1be1dmr2495232eec.12.1794808953848;
        Sun, 15 Nov 2026 22:02:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 20/30] liburi-perl: upgrade 5.35 -> 5.40
Date: Sun, 15 Nov 2026 22:01:58 -0800
Message-ID: <20261116060209.2916444-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132418
Content-Type: text/plain; charset="utf-8"

Fixes CVE-2026-19953. URI::_idna now loads Unicode::Normalize, add it to
RDEPENDS. Refresh the ptest patch which skips the TODO tests.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Skip-TODO-test-cases-that-fail.patch | 72 +++++++++++--------
 ...iburi-perl_5.35.bb => liburi-perl_5.40.bb} |  3 +-
 2 files changed, 44 insertions(+), 31 deletions(-)
 rename meta-perl/recipes-perl/liburi/{liburi-perl_5.35.bb => liburi-perl_5.40.bb} (92%)

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
diff --git a/meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb b/meta-perl/recipes-perl/liburi/liburi-perl_5.40.bb
similarity index 92%
rename from meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb
rename to meta-perl/recipes-perl/liburi/liburi-perl_5.40.bb
index a0e18de756..8a628ca7b0 100644
--- a/meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb
+++ b/meta-perl/recipes-perl/liburi/liburi-perl_5.40.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "89648964ce5ae006726951f42f718576fbefe9e98a41bd2212d57386163092d2"
+SRC_URI[sha256sum] = "ef5d2ef099a1a24a6e83ffe543de73337805d3d39c00b84fa205d725ad1a1b63"
 
 S = "${UNPACKDIR}/URI-${PV}"
 
@@ -34,6 +34,7 @@ do_install:prepend() {
 RDEPENDS:${PN} += "\
     perl-module-integer \
     perl-module-mime-base64 \
+    perl-module-unicode-normalize \
 "
 
 RDEPENDS:${PN}-ptest += " \

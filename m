Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202DEFD0068
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 13:32:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.137828.1772371939194632167
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Mar 2026 05:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+hePB/D;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48375f10628so23467605e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Mar 2026 05:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772371937; x=1772976737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=azFONeTehEIlrvYLxx4yFP6wFbM/EdMbbrajAa1KNjw=;
        b=k+hePB/DcgY6/WYjKHWM/TKumPGtReNK/m1x2jbQosU+UnoqIPsX4zXl/T/g/gSy/P
         PKdUS5+U/nh/Rqv+sU/+zDOaVjXeBkkSAjPS0WXkB0NtGv3Ziw3/tzjM+ObBEuPWmfRN
         +P94ccvAcDVKgf7teNauGFvfZzmPurv6kOZzvEJLLtK9WqQT1BY//U0scqKEVafUsHs/
         5AFw19pCPDhkVnPiHTzwYcNFsQ4448bQeEGy8VfPj9BSUB7mVxFzau6DgSgOGQ0L5BLd
         Kd5ZAdjQjs0hphX/E3z8DlrjeMkU1jFQPP8sce+l46NRH+xQl+no12Y/CmKmvqdi5cf8
         7jFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772371937; x=1772976737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azFONeTehEIlrvYLxx4yFP6wFbM/EdMbbrajAa1KNjw=;
        b=BiHJYTt8i5HuzZx/Wnzyva2ZyxstRwYKzHBZhYoAn6Tx7GTfDg3vyugengXkoxEJbh
         vOe+wMJ2dWSHfwceShlqXW7psUoVp5yQtbcknJqSR2LvZ26B+h9AWZfMt5LbB8tYOPex
         4lpXprBy6hB7cvp7CcQVoKA3y0nSKgFkVlmZ0OAs7wCoS+amfz51dkSDzaiat+jVCztc
         Rubmk63O+ftTPH5lY/Dw5Lm44aJo8ai30XEB5MmDWPwlX3N5crJh3FBM2x0J5OMXkrlh
         TzT0wqMz5zllsZskc6iOlbfT1uYh7qGqX3c+Ekbv4zZvgX1FtZkG699ucMMSMWAmfyMk
         njpw==
X-Gm-Message-State: AOJu0YzwwJ+ad7Jetpbss4pQc78BIIb73zEmGze2sGhrOUraabu4yJtj
	gCuGWop9cdHlLF/0TO0HuXDtdUfMN6Z+ghbZmhpBEIs6cZjYIfOrDcscFR+91g==
X-Gm-Gg: ATEYQzyfHQQLXQ8RzUw7O8h8PTfDtgWodWpgh7VJl/bIrUuI90zr0SriWX4sNZb0Usg
	N33zkgG8Ad/iN+R7F/0WMtm/oWss1agWz5Go9If0C1iHyYntcbw2h2A31tU5f4JQNo72Z9jy1c+
	5juGCz08BFlpn3G42uZdJkP2kVB897D/2zfL53NXlmRzqmxqwJ/PLbFxDztxr8Nrad9XUFHgTuM
	rzqm1ntnbKG0SDvLKezpB8Fn43tkM9BrAf96q8hqeWGt9BFUVjpLJc+04V+34X6LEWfoQSd90pi
	Mu4qHXfIvkibyjriFqCzQ3cFQJm8c8/kGYTTAmnnx1ws1CyAalfWTkFpQSayUdhzuiFDdxXljm9
	BUQLsJ56Y/jTFqDf+IB9hsTnmmJeYGfTykiKxt+NMOhNZigxEJMtT4/CkOi4bwjBtoJkmL5n38H
	/K9Sb1d1AYa5W0WDkudcFH
X-Received: by 2002:a05:600c:3e16:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-483c9ba38damr165927865e9.7.1772371936929;
        Sun, 01 Mar 2026 05:32:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf894sm108634085e9.16.2026.03.01.05.32.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 05:32:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH v2] exiv2: patch CVE-2021-37620
Date: Sun,  1 Mar 2026 14:32:15 +0100
Message-ID: <20260301133215.1107669-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Mar 2026 13:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124793

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-37620

Pick the patches from the PR that is referenced by the NVD advisory.

Two notes:
1. The regression test contains a binary patch, that couldn't be applied
in the do_patch task. Due to this the test was not backported. It was
however applied manually and executed successfully during the preparation
of this patch.
2. The commit changes some "unsigned" types to "size_t", which is not
included in this backport. They were already done by another patch (the
one for CVE-2021-34334).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: the change in xmp.ccp was backported incorrectly. This should be fixed
    in this version.

 .../exiv2/exiv2/CVE-2021-37620-1.patch        |  26 ++
 .../exiv2/exiv2/CVE-2021-37620-2.patch        | 306 ++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |   2 +
 3 files changed, 334 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-1.patch
new file mode 100644
index 0000000000..f072ea6ab0
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-1.patch
@@ -0,0 +1,26 @@
+From 672bb4c98a98911f91834617e8a7374acb903206 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Sat, 10 Jul 2021 10:42:24 +0100
+Subject: [PATCH] Check that `type` isn't an empty string.
+
+CVE: CVE-2021-37620
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/2e7bb581a234bfb0d0c9e16a1dbf037a8c30681e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/value.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/value.cpp b/src/value.cpp
+index 95eb05a..2536b84 100644
+--- a/src/value.cpp
++++ b/src/value.cpp
+@@ -714,6 +714,9 @@ namespace Exiv2 {
+         if (buf.length() > 5 && buf.substr(0, 5) == "type=") {
+             std::string::size_type pos = buf.find_first_of(' ');
+             type = buf.substr(5, pos-5);
++            if (type.empty()) {
++                throw Error(kerInvalidXmpText, type);
++            }
+             // Strip quotes (so you can also specify the type without quotes)
+             if (type[0] == '"') type = type.substr(1);
+             if (type[type.length()-1] == '"') type = type.substr(0, type.length()-1);
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-2.patch
new file mode 100644
index 0000000000..f4b6896c5e
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-2.patch
@@ -0,0 +1,306 @@
+From 13fb2c4f55a268f0ad864005428e93f80d813b8a Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Sun, 11 Jul 2021 12:04:53 +0100
+Subject: [PATCH] Safer std::vector indexing.
+
+CVE: CVE-2021-37620
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/76e313745e813f80e8910aceb2210af3ad8cf897]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ samples/addmoddel.cpp   |  2 +-
+ samples/exiv2json.cpp   |  6 +++---
+ src/actions.cpp         | 20 +++++++++++---------
+ src/basicio.cpp         |  6 +++---
+ src/exiv2.cpp           |  4 ++--
+ src/minoltamn_int.cpp   |  2 +-
+ src/properties.cpp      |  2 +-
+ src/sigmamn_int.cpp     |  6 +++---
+ src/tags_int.cpp        |  2 +-
+ src/tiffvisitor_int.cpp |  2 +-
+ src/utils.cpp           |  4 ++--
+ src/value.cpp           |  6 ++++--
+ src/xmp.cpp             |  3 +--
+ 13 files changed, 34 insertions(+), 31 deletions(-)
+
+diff --git a/samples/addmoddel.cpp b/samples/addmoddel.cpp
+index e171edd..215e432 100644
+--- a/samples/addmoddel.cpp
++++ b/samples/addmoddel.cpp
+@@ -77,7 +77,7 @@ try {
+     if (prv == 0) throw Exiv2::Error(Exiv2::kerErrorMessage, "Downcast failed");
+     rv = Exiv2::URationalValue::AutoPtr(prv);
+     // Modify the value directly through the interface of URationalValue
+-    rv->value_[2] = std::make_pair(88,77);
++    rv->value_.at(2) = std::make_pair(88,77);
+     // Copy the modified value back to the metadatum
+     pos->setValue(rv.get());
+     std::cout << "Modified key \"" << key
+diff --git a/samples/exiv2json.cpp b/samples/exiv2json.cpp
+index fe5a014..91dee73 100644
+--- a/samples/exiv2json.cpp
++++ b/samples/exiv2json.cpp
+@@ -57,7 +57,7 @@ bool getToken(std::string& in,Token& token,Exiv2::StringSet* pNS=NULL)
+ 
+     while ( !result && in.length() ) {
+         std::string c = in.substr(0,1);
+-        char        C = c[0];
++        char        C = c.at(0);
+         in            = in.substr(1,std::string::npos);
+         if ( in.length() == 0 && C != ']' ) token.n += c;
+         if ( C == '/' || C == '[' || C == ':' || C == '.' || C == ']' || in.length() == 0 ) {
+@@ -97,7 +97,7 @@ Jzon::Node& addToTree(Jzon::Node& r1,Token token)
+ 
+ Jzon::Node& recursivelyBuildTree(Jzon::Node& root,Tokens& tokens,size_t k)
+ {
+-    return addToTree( k==0 ? root : recursivelyBuildTree(root,tokens,k-1), tokens[k] );
++    return addToTree( k==0 ? root : recursivelyBuildTree(root,tokens,k-1), tokens.at(k) );
+ }
+ 
+ // build the json tree for this key.  return location and discover the name
+@@ -109,7 +109,7 @@ Jzon::Node& objectForKey(const std::string& Key,Jzon::Object& root,std::string&
+     std::string input  = Key ; // Example: "XMP.xmp.MP.RegionInfo/MPRI:Regions[1]/MPReg:Rectangle"
+     while ( getToken(input,token,pNS) ) tokens.push_back(token);
+     size_t      l      = tokens.size()-1; // leave leaf name to push()
+-    name               = tokens[l].n ;
++    name               = tokens.at(l).n ;
+ 
+     // The second token.  For example: XMP.dc is a namespace
+     if ( pNS && tokens.size() > 1 ) pNS->insert(tokens[1].n);
+diff --git a/src/actions.cpp b/src/actions.cpp
+index 97acac7..a771e21 100644
+--- a/src/actions.cpp
++++ b/src/actions.cpp
+@@ -1108,19 +1108,21 @@ namespace Action {
+ 
+         const Params::PreviewNumbers& numbers = Params::instance().previewNumbers_;
+         for (Params::PreviewNumbers::const_iterator n = numbers.begin(); n != numbers.end(); ++n) {
+-            if (*n == 0) {
++            size_t num = static_cast<size_t>(*n);
++            if (num == 0) {
+                 // Write all previews
+-                for (int num = 0; num < static_cast<int>(pvList.size()); ++num) {
+-                    writePreviewFile(pvMgr.getPreviewImage(pvList[num]), num + 1);
++                for (num = 0; num < pvList.size(); ++num) {
++                    writePreviewFile(pvMgr.getPreviewImage(pvList[num]), static_cast<int>(num + 1));
+                 }
+                 break;
+             }
+-            if (*n > static_cast<int>(pvList.size())) {
++            num--;
++            if (num >= pvList.size()) {
+                 std::cerr << path_ << ": " << _("Image does not have preview")
+-                          << " " << *n << "\n";
++                          << " " << num + 1 << "\n";
+                 continue;
+             }
+-            writePreviewFile(pvMgr.getPreviewImage(pvList[*n - 1]), *n);
++            writePreviewFile(pvMgr.getPreviewImage(pvList[num]), static_cast<int>(num + 1));
+         }
+         return 0;
+     } // Extract::writePreviews
+@@ -1680,7 +1682,7 @@ namespace Action {
+             return 0;
+         }
+         std::string timeStr = md->toString();
+-        if (timeStr == "" || timeStr[0] == ' ') {
++        if (timeStr.empty() || timeStr[0] == ' ') {
+             std::cerr << path << ": " << _("Timestamp of metadatum with key") << " `"
+                       << ek << "' " << _("not set\n");
+             return 1;
+@@ -2240,7 +2242,7 @@ namespace {
+                               << "' " << _("exists. [O]verwrite, [r]ename or [s]kip?")
+                               << " ";
+                     std::cin >> s;
+-                    switch (s[0]) {
++                    switch (s.at(0)) {
+                     case 'o':
+                     case 'O':
+                         go = false;
+@@ -2305,7 +2307,7 @@ namespace {
+                       << ": " << _("Overwrite") << " `" << path << "'? ";
+             std::string s;
+             std::cin >> s;
+-            if (s[0] != 'y' && s[0] != 'Y') return 1;
++            if (s.at(0) != 'y' && s.at(0) != 'Y') return 1;
+         }
+         return 0;
+     }
+diff --git a/src/basicio.cpp b/src/basicio.cpp
+index 7b707e1..ad24938 100644
+--- a/src/basicio.cpp
++++ b/src/basicio.cpp
+@@ -190,11 +190,11 @@ namespace Exiv2 {
+         case opRead:
+             // Flush if current mode allows reading, else reopen (in mode "r+b"
+             // as in this case we know that we can write to the file)
+-            if (openMode_[0] == 'r' || openMode_[1] == '+') reopen = false;
++            if (openMode_.at(0) == 'r' || openMode_.at(1) == '+') reopen = false;
+             break;
+         case opWrite:
+             // Flush if current mode allows writing, else reopen
+-            if (openMode_[0] != 'r' || openMode_[1] == '+') reopen = false;
++            if (openMode_.at(0) != 'r' || openMode_.at(1) == '+') reopen = false;
+             break;
+         case opSeek:
+             reopen = false;
+@@ -2131,7 +2131,7 @@ namespace Exiv2 {
+     void HttpIo::HttpImpl::writeRemote(const byte* data, size_t size, long from, long to)
+     {
+         std::string scriptPath(getEnv(envHTTPPOST));
+-        if (scriptPath == "") {
++        if (scriptPath.empty()) {
+             throw Error(kerErrorMessage, "Please set the path of the server script to handle http post data to EXIV2_HTTP_POST environmental variable.");
+         }
+ 
+diff --git a/src/exiv2.cpp b/src/exiv2.cpp
+index 3d9fa4f..69077c9 100644
+--- a/src/exiv2.cpp
++++ b/src/exiv2.cpp
+@@ -1460,8 +1460,8 @@ namespace {
+             if (valStart != std::string::npos) {
+                 value = parseEscapes(line.substr(valStart, valEnd+1-valStart));
+                 std::string::size_type last = value.length()-1;
+-                if (   (value[0] == '"' && value[last] == '"')
+-                       || (value[0] == '\'' && value[last] == '\'')) {
++                if (   (value.at(0) == '"' && value.at(last) == '"')
++                       || (value.at(0) == '\'' && value.at(last) == '\'')) {
+                     value = value.substr(1, value.length()-2);
+                 }
+             }
+diff --git a/src/minoltamn_int.cpp b/src/minoltamn_int.cpp
+index 77521fc..fc3a73c 100644
+--- a/src/minoltamn_int.cpp
++++ b/src/minoltamn_int.cpp
+@@ -2037,7 +2037,7 @@ namespace Exiv2 {
+     {
+         const TagDetails* td = find(minoltaSonyLensID, lensID);
+         std::vector<std::string> tokens = split(td[0].label_,"|");
+-        return os << exvGettext(trim(tokens[index-1]).c_str());
++        return os << exvGettext(trim(tokens.at(index-1)).c_str());
+     }
+ 
+     static std::ostream& resolveLens0x1c(std::ostream& os, const Value& value,
+diff --git a/src/properties.cpp b/src/properties.cpp
+index c6ebd34..af09f0f 100644
+--- a/src/properties.cpp
++++ b/src/properties.cpp
+@@ -2612,7 +2612,7 @@ namespace Exiv2 {
+         // If property is a path for a nested property, determines the innermost element
+         std::string::size_type i = property.find_last_of('/');
+         if (i != std::string::npos) {
+-            for (; i != std::string::npos && !isalpha(property[i]); ++i) {}
++            for (; i != std::string::npos && !isalpha(property.at(i)); ++i) {}
+             property = property.substr(i);
+             i = property.find_first_of(':');
+             if (i != std::string::npos) {
+diff --git a/src/sigmamn_int.cpp b/src/sigmamn_int.cpp
+index da1beaa..62077bb 100644
+--- a/src/sigmamn_int.cpp
++++ b/src/sigmamn_int.cpp
+@@ -134,7 +134,7 @@ namespace Exiv2 {
+         std::string v = value.toString();
+         std::string::size_type pos = v.find(':');
+         if (pos != std::string::npos) {
+-            if (v[pos + 1] == ' ') ++pos;
++            if (v.at(pos + 1) == ' ') ++pos;
+             v = v.substr(pos + 1);
+         }
+         return os << v;
+@@ -144,7 +144,7 @@ namespace Exiv2 {
+                                               const Value& value,
+                                               const ExifData*)
+     {
+-        switch (value.toString()[0]) {
++        switch (value.toString().at(0)) {
+         case 'P': os << _("Program"); break;
+         case 'A': os << _("Aperture priority"); break;
+         case 'S': os << _("Shutter priority"); break;
+@@ -158,7 +158,7 @@ namespace Exiv2 {
+                                               const Value& value,
+                                               const ExifData*)
+     {
+-        switch (value.toString()[0]) {
++        switch (value.toString().at(0)) {
+         case 'A': os << _("Average"); break;
+         case 'C': os << _("Center"); break;
+         case '8': os << _("8-Segment"); break;
+diff --git a/src/tags_int.cpp b/src/tags_int.cpp
+index df05522..4a4a555 100644
+--- a/src/tags_int.cpp
++++ b/src/tags_int.cpp
+@@ -2867,7 +2867,7 @@ namespace Exiv2 {
+         }
+ 
+         std::string stringValue = value.toString();
+-        if (stringValue[19] == 'Z') {
++        if (stringValue.at(19) == 'Z') {
+             stringValue = stringValue.substr(0, 19);
+         }
+         for (size_t i = 0; i < stringValue.length(); ++i) {
+diff --git a/src/tiffvisitor_int.cpp b/src/tiffvisitor_int.cpp
+index cca9679..5b9addf 100644
+--- a/src/tiffvisitor_int.cpp
++++ b/src/tiffvisitor_int.cpp
+@@ -482,7 +482,7 @@ namespace Exiv2 {
+             uint.push_back((uint16_t) object->pValue()->toLong(i));
+         }
+         // Check this is AFInfo2 (ints[0] = bytes in object)
+-        if ( ints[0] != object->pValue()->count()*2 ) return ;
++        if ( ints.at(0) != object->pValue()->count()*2 ) return ;
+ 
+         std::string familyGroup(std::string("Exif.") + groupName(object->group()) + ".");
+ 
+diff --git a/src/utils.cpp b/src/utils.cpp
+index 66e9898..6b06074 100644
+--- a/src/utils.cpp
++++ b/src/utils.cpp
+@@ -65,7 +65,7 @@ namespace Util {
+         if (p.length() == 2 && p[1] == ':') return p; // For Windows paths
+         std::string::size_type idx = p.find_last_of("\\/");
+         if (idx == std::string::npos) return ".";
+-        if (idx == 1 && p[0] == '\\' && p[1] == '\\') return p; // For Windows paths
++        if (idx == 1 && p.at(0) == '\\' && p.at(1) == '\\') return p; // For Windows paths
+         p = p.substr(0, idx == 0 ? 1 : idx);
+         while (   p.length() > 1
+                && (p[p.length()-1] == '\\' || p[p.length()-1] == '/')) {
+@@ -85,7 +85,7 @@ namespace Util {
+         }
+         if (p.length() == 2 && p[1] == ':') return ""; // For Windows paths
+         std::string::size_type idx = p.find_last_of("\\/");
+-        if (idx == 1 && p[0] == '\\' && p[1] == '\\') return ""; // For Windows paths
++        if (idx == 1 && p.at(0) == '\\' && p.at(1) == '\\') return ""; // For Windows paths
+         if (idx != std::string::npos) p = p.substr(idx+1);
+         if (delsuffix) p = p.substr(0, p.length() - suffix(p).length());
+         return p;
+diff --git a/src/value.cpp b/src/value.cpp
+index 2536b84..470b864 100644
+--- a/src/value.cpp
++++ b/src/value.cpp
+@@ -497,8 +497,10 @@ namespace Exiv2 {
+             std::string::size_type pos = comment.find_first_of(' ');
+             std::string name = comment.substr(8, pos-8);
+             // Strip quotes (so you can also specify the charset without quotes)
+-            if (name[0] == '"') name = name.substr(1);
+-            if (name[name.length()-1] == '"') name = name.substr(0, name.length()-1);
++            if (!name.empty()) {
++                if (name[0] == '"') name = name.substr(1);
++                if (name[name.length()-1] == '"') name = name.substr(0, name.length()-1);
++            }
+             charsetId = CharsetInfo::charsetIdByName(name);
+             if (charsetId == invalidCharsetId) {
+ #ifndef SUPPRESS_WARNINGS
+diff --git a/src/xmp.cpp b/src/xmp.cpp
+index 03ce7e0..40b8f8c 100644
+--- a/src/xmp.cpp
++++ b/src/xmp.cpp
+@@ -500,8 +500,8 @@ namespace Exiv2 {
+         bool bNS  = out.find(':') != std::string::npos && !bURI;
+ 
+         // pop trailing ':' on a namespace
+-        if ( bNS ) {
+-        std::size_t length = out.length();
++        if ( bNS && !out.empty() ) {
++             std::size_t length = out.length();
+             if ( out[length-1] == ':' ) out = out.substr(0,length-1);
+         }
+ 
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index e7eac337dc..4001f1b639 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -26,6 +26,8 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-37615-2.patch \
            file://CVE-2021-37618.patch \
            file://CVE-2021-37619.patch \
+           file://CVE-2021-37620-1.patch \
+           file://CVE-2021-37620-2.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 


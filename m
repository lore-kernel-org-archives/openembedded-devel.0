Return-Path: <ulfalizer@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id BA56575A31
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 12:38:18 +0000 (UTC)
Received: by ykba4 with SMTP id a4so127461737ykb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 04:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=WlogwwCMoNPY5/sWZhHgI2XgWd/RhzgVZGDpJseXhsM=;
	b=zyh5K30znZ5e0z3WdnqpbasYtQrdCTUq0WGaHv5Rr+vtIMKglUa1+5rsmm61SpUEey
	T6dWTXUl5TNNfz0KR49nFmrXO/2JFlWCHABQV8NwnkmhCpEGSVmQi92rZuPCTewVquSq
	D5C5gXOQ91hln3/zfuD6x0PbvleaPpxI3550zCCPo1QvfKz8X00sz02oZyXtG+CHKJ8J
	Ff5Kzzdguf+UhpalZh8F0+TMp14xbbjOkMLogTu+zZB2IJf52TMmb9dp31z6kXrF3U5V
	waB5/Cgi5YqboGizSGqeiujrAAhtMeaIIiE8VbqUOAvEFwt7CJctrgsCmsdnJyWy8QDr
	VlIA==
MIME-Version: 1.0
X-Received: by 10.31.169.9 with SMTP id s9mr6806232vke.103.1446727098446; Thu,
	05 Nov 2015 04:38:18 -0800 (PST)
Received: by 10.103.77.91 with HTTP; Thu, 5 Nov 2015 04:38:18 -0800 (PST)
Date: Thu, 5 Nov 2015 13:38:18 +0100
Message-ID: <CAFkk2KQhpgBHLo2AyxWAL9aB1AQRi4BM3DCOanbCKBY4wKb0Gg@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-devel@lists.openembedded.org, mark.asselstine@windriver.com, 
	jackie.huang@windriver.com, amy.fong@windriver.com, kergoth@gmail.com, 
	Martin.Jansa@gmail.com
Subject: meta-openembedded/meta-ruby: ruby-1.9.3-disable-versioned-paths.patch misses one path
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
X-List-Received-Date: Thu, 05 Nov 2015 12:38:19 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

ruby-1.9.3-disable-versioned-paths.patch adds the
--disable-versioned-paths option, which strips Ruby's version number
from some install paths. The patch misses a spot however, which causes
TOPDIR to get an incorrect value (nil) in rbconfig.rb. This in turn
causes problems e.g. when trying to cross-compile native extensions.

The following patch fixes this. It assumes
ruby-1.9.3-disable-versioned-paths.patch has already been applied.

---
 tool/mkconfig.rb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tool/mkconfig.rb b/tool/mkconfig.rb
index 10dbe65..aa54512 100755
--- a/tool/mkconfig.rb
+++ b/tool/mkconfig.rb
@@ -44,6 +44,7 @@ vars = {}
 continued_name = nil
 continued_line = nil
 path_version = "/$(ruby_version)"
+prefix_version = "/#{version}"
 File.foreach "config.status" do |line|
   next if /^#/ =~ line
   name = nil
@@ -149,7 +150,10 @@ File.foreach "config.status" do |line|
     when "ruby_version"
       version = val[/\A"(.*)"\z/, 1]
     when /^USE_VERSIONED_PATHS$/
-      path_version = nil if /NO/ =~ val
+      if /NO/ =~ val
+        path_version = nil
+        prefix_version = nil
+      end
     end
   end
 #  break if /^CEOF/
@@ -157,7 +161,7 @@ end

 drive = File::PATH_SEPARATOR == ';'

-prefix = "/#{v_runtime[:libdir] || 'lib'}/ruby/#{version}/#{arch}"
+prefix = "/#{v_runtime[:libdir] || 'lib'}/ruby#{prefix_version}/#{arch}"
 print "  TOPDIR = File.dirname(__FILE__).chomp!(#{prefix.dump})\n"
 print "  DESTDIR = ", (drive ? "TOPDIR && TOPDIR[/\\A[a-z]:/i] || " :
""), "'' unless defined? DESTDIR\n"
 print <<'ARCH' if universal
-- 
2.1.4


Another "bug" is that meta/recipes-devtools/ruby (i.e., the newer Ruby
recipe) uses --disable-versioned-paths too even though afaics no such
option exists in that version. Maybe I should report that separately.

Cheers,
Ulf


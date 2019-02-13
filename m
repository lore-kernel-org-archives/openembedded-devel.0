Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD0E6BCA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 17:31:26 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id k15so1487347pls.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 09:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6/Li278Bnvf94h+R2XUvZXibzGgIW28oxCAwAzpCu3Y=;
	b=Akwho43eZjZGcY2+5Ce3ut0byDNw48LGJuOl66AKDfJdM3ylT19IQnYacqiERv3/x/
	UzNv91VDwRQmwYPxvK7v/uVi0uInGOhJdzbgp/ICiffvNDlqyxW28WVpG0JBpL/i4Rj7
	aCoKks74jIjIKhcafM/8+TK0wEc1m0z9vRYKYJxetFrlvrf1azgx+dTyMN3kfFTuTRC0
	rQTr0YblwaeEiRTUDDxPk3wNuG874ctv571I8wgn7BFMtqhAf7H4vTI3Jr+fB9s4H4jH
	Qfwk29YBL/GRkF9IvsSOrWyq3fYqOI1zhw7uR2bw55xi4xpz9cLgtSrEPQEZvtZHGHii
	3YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6/Li278Bnvf94h+R2XUvZXibzGgIW28oxCAwAzpCu3Y=;
	b=hJTjKYHcHVdTRV7v7Q757KbTDo0BZo2fnNkNAMjZn0FFbS7dtAalQORXJYX3HrDUfl
	LMMET5GGr3NFnKIi2oDdsAqzbHxUJfRsek/7SkYLNYb1LDCT9Wt04AjQu2nVGzbKLyZ7
	JZUpx6jtJZ2pGJPxD2gZQ3O4nlJQ52MdcGPlHsUISwNir0vUrjqUfK1I4PUVfO4vCJcZ
	wQn7RoaPIx2JoLl0OrkZo6Jk2cMxhsSrawDEm2z8rOJR4Bg1WG7i2bXAklownxU2VCj9
	XPPn5vJAfFVEJb3wEstlH89bhM4fTMvJ7bn2/gCjJhjFIeCrAIK6nfMzDd1Lip5fzAmx
	HbNA==
X-Gm-Message-State: AHQUAuZQ6AO0uFTjepYro0Psom5XmEway57KL0wvwgLDmjbYvvSPH7fe
	/l+TUiq1tK3gRDRITmfcc8fPvzyw
X-Google-Smtp-Source: AHgI3IYthZcvaKY2VNrbW70y3yof23icg+R7t+Fxo0HRX+agnVSre2D6dHujrE6N+xNvogMmEUYKxQ==
X-Received: by 2002:a17:902:724c:: with SMTP id
	c12mr1556499pll.144.1550079087452; 
	Wed, 13 Feb 2019 09:31:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	h15sm21528945pgl.43.2019.02.13.09.31.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 09:31:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2019 09:31:15 -0800
Message-Id: <20190213173118.44597-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190213173118.44597-1-raj.khem@gmail.com>
References: <20190213173118.44597-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/6] oprofile: Fix build with clang
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
X-List-Received-Date: Wed, 13 Feb 2019 17:31:27 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile.inc  |   1 +
 ...ace-sym_iterator-0-with-sym_iterator.patch | 131 ++++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0001-replace-sym_iterator-0-with-sym_iterator.patch

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile.inc b/meta-oe/recipes-kernel/oprofile/oprofile.inc
index 349e2bf543..515ea8faf7 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile.inc
+++ b/meta-oe/recipes-kernel/oprofile/oprofile.inc
@@ -25,6 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            file://root-home-dir.patch \
            file://0001-Add-rmb-definition-for-NIOS2-architecture.patch \
+           file://0001-replace-sym_iterator-0-with-sym_iterator.patch \
 "
 UPSTREAM_CHECK_REGEX = "oprofile-(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/oprofile/files/oprofile/"
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-replace-sym_iterator-0-with-sym_iterator.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0001-replace-sym_iterator-0-with-sym_iterator.patch
new file mode 100644
index 0000000000..5fd23f809a
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0001-replace-sym_iterator-0-with-sym_iterator.patch
@@ -0,0 +1,131 @@
+From b7c1a2e2b0f4657fe291324ca409224f3321c9ff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Feb 2019 11:58:34 -0800
+Subject: [PATCH] replace (sym_iterator)0 with sym_iterator()
+
+clang/libc++ find this error
+
+libpp/xml_utils.cpp:409:43: error: calling a private constructor of class 'std::__1::__wrap_iter<const sym
+bol_entry *const *>'
+|                 { lo = hi = 0; name = ""; begin = end = (sym_iterator)0;}
+|                                                         ^
+|
+
+default constructed iterator isn't supposed to be used for anything
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libpp/xml_utils.cpp | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/libpp/xml_utils.cpp b/libpp/xml_utils.cpp
+index 3de41e5..f45d3ae 100644
+--- a/libpp/xml_utils.cpp
++++ b/libpp/xml_utils.cpp
+@@ -73,7 +73,7 @@ void dump_symbol(string const & prefix, sym_iterator it, bool want_nl = true)
+ 
+ void dump_symbols(string const & prefix, sym_iterator b, sym_iterator e)
+ {
+-	if (b == (sym_iterator)0)
++	if (b == sym_iterator())
+ 		return;
+ 
+ 	for (sym_iterator it = b; it != e; ++it)
+@@ -167,7 +167,7 @@ string xml_utils::get_profile_header(string cpu_name, double const speed)
+ 	}
+ 
+ 	str << init_attr(CPU_NAME, cpu_type) << endl;
+-	if (processor.size() > 0) 
++	if (processor.size() > 0)
+ 		str << init_attr(PROCESSOR, string(processor)) << endl;
+ 	if (nr_cpus > 1) str << init_attr(SEPARATED_CPUS, nr_cpus) << endl;
+ 	str << init_attr(MHZ, speed) << endl;
+@@ -320,11 +320,11 @@ void xml_utils::build_subclasses(ostream & out)
+ 			(*sc_ptr)[new_index].subclass_name = subclass_name;
+ 			out << open_element(CLASS, true);
+ 			out << init_attr(NAME, subclass_name);
+-			if (nr_cpus > 1) 
++			if (nr_cpus > 1)
+ 				out << init_attr(CPU_NUM, pclass.ptemplate.cpu);
+-			if (nr_events > 1) 
++			if (nr_events > 1)
+ 				out << init_attr(EVENT_NUM, event);
+-			if (has_nonzero_masks) 
++			if (has_nonzero_masks)
+ 				out << init_attr(EVENT_MASK, pclass.ptemplate.unitmask);
+ 			out << close_element();
+ 		}
+@@ -406,7 +406,7 @@ xml_utils::output_summary_data(ostream & out, count_array_t const & summary, siz
+ class module_info {
+ public:
+ 	module_info()
+-		{ lo = hi = 0; name = ""; begin = end = (sym_iterator)0;}
++		{ lo = hi = 0; name = ""; begin = end = sym_iterator();}
+ 	void dump();
+ 	void build_module(string const & n, sym_iterator it,
+ 	                  size_t l, size_t h);
+@@ -540,21 +540,21 @@ void module_info::add_to_summary(count_array_t const & counts)
+ 
+ void module_info::set_begin(sym_iterator b)
+ {
+-	if (begin == (sym_iterator)0)
++	if (begin == sym_iterator())
+ 		begin = b;
+ }
+ 
+ 
+ void module_info::set_end(sym_iterator e)
+ {
+-	if (end == (sym_iterator)0)
++	if (end == sym_iterator())
+ 		end = e;
+ }
+ 
+ 
+ bool module_info::is_closed(string const & n)
+ {
+-	return (name == n) && end != (sym_iterator)0;
++	return (name == n) && end != sym_iterator();
+ }
+ 
+ 
+@@ -585,7 +585,7 @@ void module_info::output_summary(ostream & out)
+ 
+ void module_info::output_symbols(ostream & out, bool is_module)
+ {
+-	if (begin == (sym_iterator)0)
++	if (begin == sym_iterator())
+ 		return;
+ 
+ 	for (sym_iterator it = begin; it != end; ++it)
+@@ -606,7 +606,7 @@ void binary_info::close_binary(sym_iterator it)
+ void binary_info::dump()
+ {
+ 	cverb << vxml << "app_name=" << name << endl;
+-	if (begin != (sym_iterator)0)
++	if (begin != sym_iterator())
+ 		dump_symbols("	", begin, end);
+ 
+ 	for (size_t i = 0; i < nr_modules; ++i)
+@@ -648,7 +648,7 @@ add_module_symbol(string const & module, string const & app,
+ 		// mark end of enclosing binary symbols if there have been any
+ 		// NOTE: it is possible for the binary's symbols to follow its
+ 		// module symbols
+-		if (begin != (sym_iterator)0 && end == (sym_iterator)0)
++		if (begin != sym_iterator() && end == sym_iterator())
+ 			set_end(it);
+ 
+ 		// build the new module
+@@ -718,7 +718,7 @@ summarize_processes(extra_images const & extra_found_images)
+ {
+ 	// add modules to the appropriate threads in the process hierarchy
+ 	for (sym_iterator it = symbols_begin ; it != symbols_end; ++it) {
+-		string binary = get_image_name((*it)->app_name, 
++		string binary = get_image_name((*it)->app_name,
+ 			image_name_storage::int_filename, extra_found_images);
+ 		string module = get_image_name((*it)->image_name,
+ 			image_name_storage::int_filename, extra_found_images);
+-- 
+2.20.1
+
-- 
2.20.1



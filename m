Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4D105607A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:56:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n3so6765458wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=soPqFrdPZxl3O1fnpuNuzSEiYLKu0ufBV30QtzK3wNI=;
	b=mxgzg7By0wgFccjjVTKrTpmEZbZ80HFamhgFLRCESXbqCP7bCKYJsMyFNeR4QRy56b
	kTi97vI5TKZpboEglOauHODzBJbWcxkc6EOiMoEXQVdg/r5BAdTTHgKKecFP7kMOD5lo
	rnUILY1OEEPQ4knZWlrNWYzORKttBUM8nhcXJUj8Knrnjcz34b6QZu1wK+Yo8BqAmGd5
	4fPk8/FiQN8x0cRCiH8MPt+THz2tA8BAWRbfgBDnEBqzrRRgqYTzHaHFt7tZMz6zgTkF
	ku6/FBDaZWzgymj+9jJpCpdJsd7lgSaB+aPL9q0CBRSnO5NDaC3WBIiI1FlXjudX8vMm
	gPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=soPqFrdPZxl3O1fnpuNuzSEiYLKu0ufBV30QtzK3wNI=;
	b=k4+878mDtWOYC3RLsNTwGIDXU2ucrUW+vIkCYqc+k07iGF6lQEGCnMY1jAP+3SssPX
	XveHKUzqR+s9YzhA9cIvSTAmX7De0O/NWdppxBOhDrEWOdfNn57ZxsuGcXeN3mCxu59X
	mkPvPqXymiRWjKyZJHSC0d0mY8p5uT58tt0/nAqARTbBwhF1/7S7BY5IQMsQJL21NhUe
	0glDOxx1Dny1WswyMf+395fzw5aZL56aArCpHRfYqp83yf2YcyHI+8CSp1HnSdBEEC/M
	QSKlE8WUmLPf/khr5fjwOMu1OfjXeOgEugcKEtPQ0LSq+T0xsn9DWc9wSht3ffhpay0G
	1F8A==
X-Gm-Message-State: AOPr4FVZzQB0srDtVmsII6yjfzLDmNtj3hHhwWLgq03BiNQfCETT309/DJiJCRFsGh+Pxw==
X-Received: by 10.194.2.210 with SMTP id 18mr4682749wjw.55.1461689814919;
	Tue, 26 Apr 2016 09:56:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id v64sm4092264wmv.1.2016.04.26.09.56.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Apr 2016 09:56:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2016 18:57:07 +0200
Message-Id: <1461689830-8750-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH][meta-qt5 1/4] qt5: upgrade to latest revisions in 5.7 branches
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
X-List-Received-Date: Tue, 26 Apr 2016 16:56:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* these revisions are after v5.7.0-beta1 tags where available
* it's highly recommended to read:
  http://blog.qt.io/blog/2016/01/13/new-agreement-with-the-kde-free-qt-foundation/
  to find out how you're affected check which files/tools are
  included in your builds, e.g. for qtwebengine:
  OE @ ~/projects/qt-project/qtwebengine $ git grep QT_BEGIN_LICENSE | sed 's/^[^:]*://g' | sort | uniq -c
     11 ## $QT_BEGIN_LICENSE:GPL-EXCEPT$
     67 ** $QT_BEGIN_LICENSE:BSD$
     17 ** $QT_BEGIN_LICENSE:FDL$
     61 ** $QT_BEGIN_LICENSE:GPL-EXCEPT$
    261 ** $QT_BEGIN_LICENSE:LGPL$
* change in chromium's LICENSE is only copyright year update

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 licenses/The-Qt-Company-GPL-Exception-1.0          | 704 +++++++++++++++++++++
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |   2 +-
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |   7 +-
 recipes-qt/qt5/qt3d_git.bb                         |   2 +-
 recipes-qt/qt5/qt5-git.inc                         |   6 +-
 recipes-qt/qt5/qtbase-native_git.bb                |   2 +-
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  65 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   6 +-
 .../0003-Add-external-hostbindir-option.patch      |  66 +-
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |   6 +-
 ...ump-path-length-from-256-to-512-character.patch |   6 +-
 .../0006-QOpenGLPaintDevice-sub-area-support.patch |  34 +-
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |   2 +-
 ...configure-paths-for-target-qmake-properly.patch |  12 +-
 recipes-qt/qt5/qtbase/0009-Always-build-uic.patch  |   4 +-
 ...external-hostbindir-option-for-native-sdk.patch |  28 +-
 recipes-qt/qt5/qtbase_git.bb                       |   2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |   2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |   2 +-
 .../0001-qmltestexample-fix-link.patch             |  31 +-
 ...omparison-fix-QCoreApplication-has-not-be.patch |   2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |   2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |   2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |   2 +-
 ...ats.pro-Make-the-dependencies-determinist.patch |   2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |   2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |   2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch |   2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |   2 +-
 ...etextinput-update-to-match-QWidgetLineCon.patch |  31 +
 recipes-qt/qt5/qtquick1_git.bb                     |   6 +-
 ...fix-invalid-use-of-incomplete-type-class-.patch |   6 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb             |   2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |   2 +-
 recipes-qt/qt5/qtscript_git.bb                     |   2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |   2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |   2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |   2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |   3 -
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |   2 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |   2 +-
 .../0003-add-noqtwebkit-configuration.patch        |   2 +-
 ...ols-cmake-allow-overriding-the-location-f.patch |   2 +-
 recipes-qt/qt5/qttools_git.bb                      |   2 +-
 recipes-qt/qt5/qttranslations_git.bb               |   2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |   2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |   2 +-
 ...yland-include-server-buffer-only-when-bui.patch |  19 +-
 recipes-qt/qt5/qtwayland_git.bb                    |   2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |   2 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch |   6 +-
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |   6 +-
 ...ange-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch |   2 +-
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |   6 +-
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |   4 +-
 ...quickwebengineview_p_p.h-add-include-QCol.patch |   6 +-
 ...-dependency-to-QCoreApplication-translate.patch |   6 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  19 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |   2 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |   2 +-
 .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |   2 +-
 ...ude-backtrace-API-for-non-glibc-libraries.patch |   2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |   2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |   2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |   2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |   2 +-
 66 files changed, 938 insertions(+), 237 deletions(-)
 create mode 100644 licenses/The-Qt-Company-GPL-Exception-1.0
 create mode 100644 recipes-qt/qt5/qtquick1/0001-qdeclarativetextinput-update-to-match-QWidgetLineCon.patch

diff --git a/licenses/The-Qt-Company-GPL-Exception-1.0 b/licenses/The-Qt-Company-GPL-Exception-1.0
new file mode 100644
index 0000000..b1cb1be
--- /dev/null
+++ b/licenses/The-Qt-Company-GPL-Exception-1.0
@@ -0,0 +1,704 @@
+This is the GNU General Public License version 3, annotated with The
+Qt Company GPL Exception 1.0:
+
+-------------------------------------------------------------------------
+
+The Qt Company GPL Exception 1.0
+
+Exception 1:
+
+As a special exception you may create a larger work which contains the
+output of this application and distribute that work under terms of your
+choice, so long as the work is not otherwise derived from or based on
+this application and so long as the work does not in itself generate
+output that contains the output from this application in its original
+or modified form.
+
+Exception 2:
+
+As a special exception, you have permission to combine this application
+with Plugins licensed under the terms of your choice, to produce an
+executable, and to copy and distribute the resulting executable under
+the terms of your choice. However, the executable must be accompanied
+by a prominent notice offering all users of the executable the entire
+source code to this application, excluding the source code of the
+independent modules, but including any changes you have made to this
+application, under the terms of this license.
+
+
+-------------------------------------------------------------------------
+
+                    GNU GENERAL PUBLIC LICENSE
+                       Version 3, 29 June 2007
+
+ Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+                            Preamble
+
+  The GNU General Public License is a free, copyleft license for
+software and other kinds of works.
+
+  The licenses for most software and other practical works are designed
+to take away your freedom to share and change the works.  By contrast,
+the GNU General Public License is intended to guarantee your freedom to
+share and change all versions of a program--to make sure it remains free
+software for all its users.  We, the Free Software Foundation, use the
+GNU General Public License for most of our software; it applies also to
+any other work released this way by its authors.  You can apply it to
+your programs, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+them if you wish), that you receive source code or can get it if you
+want it, that you can change the software or use pieces of it in new
+free programs, and that you know you can do these things.
+
+  To protect your rights, we need to prevent others from denying you
+these rights or asking you to surrender the rights.  Therefore, you have
+certain responsibilities if you distribute copies of the software, or if
+you modify it: responsibilities to respect the freedom of others.
+
+  For example, if you distribute copies of such a program, whether
+gratis or for a fee, you must pass on to the recipients the same
+freedoms that you received.  You must make sure that they, too, receive
+or can get the source code.  And you must show them these terms so they
+know their rights.
+
+  Developers that use the GNU GPL protect your rights with two steps:
+(1) assert copyright on the software, and (2) offer you this License
+giving you legal permission to copy, distribute and/or modify it.
+
+  For the developers' and authors' protection, the GPL clearly explains
+that there is no warranty for this free software.  For both users' and
+authors' sake, the GPL requires that modified versions be marked as
+changed, so that their problems will not be attributed erroneously to
+authors of previous versions.
+
+  Some devices are designed to deny users access to install or run
+modified versions of the software inside them, although the manufacturer
+can do so.  This is fundamentally incompatible with the aim of
+protecting users' freedom to change the software.  The systematic
+pattern of such abuse occurs in the area of products for individuals to
+use, which is precisely where it is most unacceptable.  Therefore, we
+have designed this version of the GPL to prohibit the practice for those
+products.  If such problems arise substantially in other domains, we
+stand ready to extend this provision to those domains in future versions
+of the GPL, as needed to protect the freedom of users.
+
+  Finally, every program is threatened constantly by software patents.
+States should not allow patents to restrict development and use of
+software on general-purpose computers, but in those that do, we wish to
+avoid the special danger that patents applied to a free program could
+make it effectively proprietary.  To prevent this, the GPL assures that
+patents cannot be used to render the program non-free.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.
+
+                       TERMS AND CONDITIONS
+
+  0. Definitions.
+
+  "This License" refers to version 3 of the GNU General Public License.
+
+  "Copyright" also means copyright-like laws that apply to other kinds of
+works, such as semiconductor masks.
+
+  "The Program" refers to any copyrightable work licensed under this
+License.  Each licensee is addressed as "you".  "Licensees" and
+"recipients" may be individuals or organizations.
+
+  To "modify" a work means to copy from or adapt all or part of the work
+in a fashion requiring copyright permission, other than the making of an
+exact copy.  The resulting work is called a "modified version" of the
+earlier work or a work "based on" the earlier work.
+
+  A "covered work" means either the unmodified Program or a work based
+on the Program.
+
+  To "propagate" a work means to do anything with it that, without
+permission, would make you directly or secondarily liable for
+infringement under applicable copyright law, except executing it on a
+computer or modifying a private copy.  Propagation includes copying,
+distribution (with or without modification), making available to the
+public, and in some countries other activities as well.
+
+  To "convey" a work means any kind of propagation that enables other
+parties to make or receive copies.  Mere interaction with a user through
+a computer network, with no transfer of a copy, is not conveying.
+
+  An interactive user interface displays "Appropriate Legal Notices"
+to the extent that it includes a convenient and prominently visible
+feature that (1) displays an appropriate copyright notice, and (2)
+tells the user that there is no warranty for the work (except to the
+extent that warranties are provided), that licensees may convey the
+work under this License, and how to view a copy of this License.  If
+the interface presents a list of user commands or options, such as a
+menu, a prominent item in the list meets this criterion.
+
+  1. Source Code.
+
+  The "source code" for a work means the preferred form of the work
+for making modifications to it.  "Object code" means any non-source
+form of a work.
+
+  A "Standard Interface" means an interface that either is an official
+standard defined by a recognized standards body, or, in the case of
+interfaces specified for a particular programming language, one that
+is widely used among developers working in that language.
+
+  The "System Libraries" of an executable work include anything, other
+than the work as a whole, that (a) is included in the normal form of
+packaging a Major Component, but which is not part of that Major
+Component, and (b) serves only to enable use of the work with that
+Major Component, or to implement a Standard Interface for which an
+implementation is available to the public in source code form.  A
+"Major Component", in this context, means a major essential component
+(kernel, window system, and so on) of the specific operating system
+(if any) on which the executable work runs, or a compiler used to
+produce the work, or an object code interpreter used to run it.
+
+  The "Corresponding Source" for a work in object code form means all
+the source code needed to generate, install, and (for an executable
+work) run the object code and to modify the work, including scripts to
+control those activities.  However, it does not include the work's
+System Libraries, or general-purpose tools or generally available free
+programs which are used unmodified in performing those activities but
+which are not part of the work.  For example, Corresponding Source
+includes interface definition files associated with source files for
+the work, and the source code for shared libraries and dynamically
+linked subprograms that the work is specifically designed to require,
+such as by intimate data communication or control flow between those
+subprograms and other parts of the work.
+
+  The Corresponding Source need not include anything that users
+can regenerate automatically from other parts of the Corresponding
+Source.
+
+  The Corresponding Source for a work in source code form is that
+same work.
+
+  2. Basic Permissions.
+
+  All rights granted under this License are granted for the term of
+copyright on the Program, and are irrevocable provided the stated
+conditions are met.  This License explicitly affirms your unlimited
+permission to run the unmodified Program.  The output from running a
+covered work is covered by this License only if the output, given its
+content, constitutes a covered work.  This License acknowledges your
+rights of fair use or other equivalent, as provided by copyright law.
+
+  You may make, run and propagate covered works that you do not
+convey, without conditions so long as your license otherwise remains
+in force.  You may convey covered works to others for the sole purpose
+of having them make modifications exclusively for you, or provide you
+with facilities for running those works, provided that you comply with
+the terms of this License in conveying all material for which you do
+not control copyright.  Those thus making or running the covered works
+for you must do so exclusively on your behalf, under your direction
+and control, on terms that prohibit them from making any copies of
+your copyrighted material outside their relationship with you.
+
+  Conveying under any other circumstances is permitted solely under
+the conditions stated below.  Sublicensing is not allowed; section 10
+makes it unnecessary.
+
+  3. Protecting Users' Legal Rights From Anti-Circumvention Law.
+
+  No covered work shall be deemed part of an effective technological
+measure under any applicable law fulfilling obligations under article
+11 of the WIPO copyright treaty adopted on 20 December 1996, or
+similar laws prohibiting or restricting circumvention of such
+measures.
+
+  When you convey a covered work, you waive any legal power to forbid
+circumvention of technological measures to the extent such circumvention
+is effected by exercising rights under this License with respect to
+the covered work, and you disclaim any intention to limit operation or
+modification of the work as a means of enforcing, against the work's
+users, your or third parties' legal rights to forbid circumvention of
+technological measures.
+
+  4. Conveying Verbatim Copies.
+
+  You may convey verbatim copies of the Program's source code as you
+receive it, in any medium, provided that you conspicuously and
+appropriately publish on each copy an appropriate copyright notice;
+keep intact all notices stating that this License and any
+non-permissive terms added in accord with section 7 apply to the code;
+keep intact all notices of the absence of any warranty; and give all
+recipients a copy of this License along with the Program.
+
+  You may charge any price or no price for each copy that you convey,
+and you may offer support or warranty protection for a fee.
+
+  5. Conveying Modified Source Versions.
+
+  You may convey a work based on the Program, or the modifications to
+produce it from the Program, in the form of source code under the
+terms of section 4, provided that you also meet all of these conditions:
+
+    a) The work must carry prominent notices stating that you modified
+    it, and giving a relevant date.
+
+    b) The work must carry prominent notices stating that it is
+    released under this License and any conditions added under section
+    7.  This requirement modifies the requirement in section 4 to
+    "keep intact all notices".
+
+    c) You must license the entire work, as a whole, under this
+    License to anyone who comes into possession of a copy.  This
+    License will therefore apply, along with any applicable section 7
+    additional terms, to the whole of the work, and all its parts,
+    regardless of how they are packaged.  This License gives no
+    permission to license the work in any other way, but it does not
+    invalidate such permission if you have separately received it.
+
+    d) If the work has interactive user interfaces, each must display
+    Appropriate Legal Notices; however, if the Program has interactive
+    interfaces that do not display Appropriate Legal Notices, your
+    work need not make them do so.
+
+  A compilation of a covered work with other separate and independent
+works, which are not by their nature extensions of the covered work,
+and which are not combined with it such as to form a larger program,
+in or on a volume of a storage or distribution medium, is called an
+"aggregate" if the compilation and its resulting copyright are not
+used to limit the access or legal rights of the compilation's users
+beyond what the individual works permit.  Inclusion of a covered work
+in an aggregate does not cause this License to apply to the other
+parts of the aggregate.
+
+  6. Conveying Non-Source Forms.
+
+  You may convey a covered work in object code form under the terms
+of sections 4 and 5, provided that you also convey the
+machine-readable Corresponding Source under the terms of this License,
+in one of these ways:
+
+    a) Convey the object code in, or embodied in, a physical product
+    (including a physical distribution medium), accompanied by the
+    Corresponding Source fixed on a durable physical medium
+    customarily used for software interchange.
+
+    b) Convey the object code in, or embodied in, a physical product
+    (including a physical distribution medium), accompanied by a
+    written offer, valid for at least three years and valid for as
+    long as you offer spare parts or customer support for that product
+    model, to give anyone who possesses the object code either (1) a
+    copy of the Corresponding Source for all the software in the
+    product that is covered by this License, on a durable physical
+    medium customarily used for software interchange, for a price no
+    more than your reasonable cost of physically performing this
+    conveying of source, or (2) access to copy the
+    Corresponding Source from a network server at no charge.
+
+    c) Convey individual copies of the object code with a copy of the
+    written offer to provide the Corresponding Source.  This
+    alternative is allowed only occasionally and noncommercially, and
+    only if you received the object code with such an offer, in accord
+    with subsection 6b.
+
+    d) Convey the object code by offering access from a designated
+    place (gratis or for a charge), and offer equivalent access to the
+    Corresponding Source in the same way through the same place at no
+    further charge.  You need not require recipients to copy the
+    Corresponding Source along with the object code.  If the place to
+    copy the object code is a network server, the Corresponding Source
+    may be on a different server (operated by you or a third party)
+    that supports equivalent copying facilities, provided you maintain
+    clear directions next to the object code saying where to find the
+    Corresponding Source.  Regardless of what server hosts the
+    Corresponding Source, you remain obligated to ensure that it is
+    available for as long as needed to satisfy these requirements.
+
+    e) Convey the object code using peer-to-peer transmission, provided
+    you inform other peers where the object code and Corresponding
+    Source of the work are being offered to the general public at no
+    charge under subsection 6d.
+
+  A separable portion of the object code, whose source code is excluded
+from the Corresponding Source as a System Library, need not be
+included in conveying the object code work.
+
+  A "User Product" is either (1) a "consumer product", which means any
+tangible personal property which is normally used for personal, family,
+or household purposes, or (2) anything designed or sold for incorporation
+into a dwelling.  In determining whether a product is a consumer product,
+doubtful cases shall be resolved in favor of coverage.  For a particular
+product received by a particular user, "normally used" refers to a
+typical or common use of that class of product, regardless of the status
+of the particular user or of the way in which the particular user
+actually uses, or expects or is expected to use, the product.  A product
+is a consumer product regardless of whether the product has substantial
+commercial, industrial or non-consumer uses, unless such uses represent
+the only significant mode of use of the product.
+
+  "Installation Information" for a User Product means any methods,
+procedures, authorization keys, or other information required to install
+and execute modified versions of a covered work in that User Product from
+a modified version of its Corresponding Source.  The information must
+suffice to ensure that the continued functioning of the modified object
+code is in no case prevented or interfered with solely because
+modification has been made.
+
+  If you convey an object code work under this section in, or with, or
+specifically for use in, a User Product, and the conveying occurs as
+part of a transaction in which the right of possession and use of the
+User Product is transferred to the recipient in perpetuity or for a
+fixed term (regardless of how the transaction is characterized), the
+Corresponding Source conveyed under this section must be accompanied
+by the Installation Information.  But this requirement does not apply
+if neither you nor any third party retains the ability to install
+modified object code on the User Product (for example, the work has
+been installed in ROM).
+
+  The requirement to provide Installation Information does not include a
+requirement to continue to provide support service, warranty, or updates
+for a work that has been modified or installed by the recipient, or for
+the User Product in which it has been modified or installed.  Access to a
+network may be denied when the modification itself materially and
+adversely affects the operation of the network or violates the rules and
+protocols for communication across the network.
+
+  Corresponding Source conveyed, and Installation Information provided,
+in accord with this section must be in a format that is publicly
+documented (and with an implementation available to the public in
+source code form), and must require no special password or key for
+unpacking, reading or copying.
+
+  7. Additional Terms.
+
+  "Additional permissions" are terms that supplement the terms of this
+License by making exceptions from one or more of its conditions.
+Additional permissions that are applicable to the entire Program shall
+be treated as though they were included in this License, to the extent
+that they are valid under applicable law.  If additional permissions
+apply only to part of the Program, that part may be used separately
+under those permissions, but the entire Program remains governed by
+this License without regard to the additional permissions.
+
+  When you convey a copy of a covered work, you may at your option
+remove any additional permissions from that copy, or from any part of
+it.  (Additional permissions may be written to require their own
+removal in certain cases when you modify the work.)  You may place
+additional permissions on material, added by you to a covered work,
+for which you have or can give appropriate copyright permission.
+
+  Notwithstanding any other provision of this License, for material you
+add to a covered work, you may (if authorized by the copyright holders of
+that material) supplement the terms of this License with terms:
+
+    a) Disclaiming warranty or limiting liability differently from the
+    terms of sections 15 and 16 of this License; or
+
+    b) Requiring preservation of specified reasonable legal notices or
+    author attributions in that material or in the Appropriate Legal
+    Notices displayed by works containing it; or
+
+    c) Prohibiting misrepresentation of the origin of that material, or
+    requiring that modified versions of such material be marked in
+    reasonable ways as different from the original version; or
+
+    d) Limiting the use for publicity purposes of names of licensors or
+    authors of the material; or
+
+    e) Declining to grant rights under trademark law for use of some
+    trade names, trademarks, or service marks; or
+
+    f) Requiring indemnification of licensors and authors of that
+    material by anyone who conveys the material (or modified versions of
+    it) with contractual assumptions of liability to the recipient, for
+    any liability that these contractual assumptions directly impose on
+    those licensors and authors.
+
+  All other non-permissive additional terms are considered "further
+restrictions" within the meaning of section 10.  If the Program as you
+received it, or any part of it, contains a notice stating that it is
+governed by this License along with a term that is a further
+restriction, you may remove that term.  If a license document contains
+a further restriction but permits relicensing or conveying under this
+License, you may add to a covered work material governed by the terms
+of that license document, provided that the further restriction does
+not survive such relicensing or conveying.
+
+  If you add terms to a covered work in accord with this section, you
+must place, in the relevant source files, a statement of the
+additional terms that apply to those files, or a notice indicating
+where to find the applicable terms.
+
+  Additional terms, permissive or non-permissive, may be stated in the
+form of a separately written license, or stated as exceptions;
+the above requirements apply either way.
+
+  8. Termination.
+
+  You may not propagate or modify a covered work except as expressly
+provided under this License.  Any attempt otherwise to propagate or
+modify it is void, and will automatically terminate your rights under
+this License (including any patent licenses granted under the third
+paragraph of section 11).
+
+  However, if you cease all violation of this License, then your
+license from a particular copyright holder is reinstated (a)
+provisionally, unless and until the copyright holder explicitly and
+finally terminates your license, and (b) permanently, if the copyright
+holder fails to notify you of the violation by some reasonable means
+prior to 60 days after the cessation.
+
+  Moreover, your license from a particular copyright holder is
+reinstated permanently if the copyright holder notifies you of the
+violation by some reasonable means, this is the first time you have
+received notice of violation of this License (for any work) from that
+copyright holder, and you cure the violation prior to 30 days after
+your receipt of the notice.
+
+  Termination of your rights under this section does not terminate the
+licenses of parties who have received copies or rights from you under
+this License.  If your rights have been terminated and not permanently
+reinstated, you do not qualify to receive new licenses for the same
+material under section 10.
+
+  9. Acceptance Not Required for Having Copies.
+
+  You are not required to accept this License in order to receive or
+run a copy of the Program.  Ancillary propagation of a covered work
+occurring solely as a consequence of using peer-to-peer transmission
+to receive a copy likewise does not require acceptance.  However,
+nothing other than this License grants you permission to propagate or
+modify any covered work.  These actions infringe copyright if you do
+not accept this License.  Therefore, by modifying or propagating a
+covered work, you indicate your acceptance of this License to do so.
+
+  10. Automatic Licensing of Downstream Recipients.
+
+  Each time you convey a covered work, the recipient automatically
+receives a license from the original licensors, to run, modify and
+propagate that work, subject to this License.  You are not responsible
+for enforcing compliance by third parties with this License.
+
+  An "entity transaction" is a transaction transferring control of an
+organization, or substantially all assets of one, or subdividing an
+organization, or merging organizations.  If propagation of a covered
+work results from an entity transaction, each party to that
+transaction who receives a copy of the work also receives whatever
+licenses to the work the party's predecessor in interest had or could
+give under the previous paragraph, plus a right to possession of the
+Corresponding Source of the work from the predecessor in interest, if
+the predecessor has it or can get it with reasonable efforts.
+
+  You may not impose any further restrictions on the exercise of the
+rights granted or affirmed under this License.  For example, you may
+not impose a license fee, royalty, or other charge for exercise of
+rights granted under this License, and you may not initiate litigation
+(including a cross-claim or counterclaim in a lawsuit) alleging that
+any patent claim is infringed by making, using, selling, offering for
+sale, or importing the Program or any portion of it.
+
+  11. Patents.
+
+  A "contributor" is a copyright holder who authorizes use under this
+License of the Program or a work on which the Program is based.  The
+work thus licensed is called the contributor's "contributor version".
+
+  A contributor's "essential patent claims" are all patent claims
+owned or controlled by the contributor, whether already acquired or
+hereafter acquired, that would be infringed by some manner, permitted
+by this License, of making, using, or selling its contributor version,
+but do not include claims that would be infringed only as a
+consequence of further modification of the contributor version.  For
+purposes of this definition, "control" includes the right to grant
+patent sublicenses in a manner consistent with the requirements of
+this License.
+
+  Each contributor grants you a non-exclusive, worldwide, royalty-free
+patent license under the contributor's essential patent claims, to
+make, use, sell, offer for sale, import and otherwise run, modify and
+propagate the contents of its contributor version.
+
+  In the following three paragraphs, a "patent license" is any express
+agreement or commitment, however denominated, not to enforce a patent
+(such as an express permission to practice a patent or covenant not to
+sue for patent infringement).  To "grant" such a patent license to a
+party means to make such an agreement or commitment not to enforce a
+patent against the party.
+
+  If you convey a covered work, knowingly relying on a patent license,
+and the Corresponding Source of the work is not available for anyone
+to copy, free of charge and under the terms of this License, through a
+publicly available network server or other readily accessible means,
+then you must either (1) cause the Corresponding Source to be so
+available, or (2) arrange to deprive yourself of the benefit of the
+patent license for this particular work, or (3) arrange, in a manner
+consistent with the requirements of this License, to extend the patent
+license to downstream recipients.  "Knowingly relying" means you have
+actual knowledge that, but for the patent license, your conveying the
+covered work in a country, or your recipient's use of the covered work
+in a country, would infringe one or more identifiable patents in that
+country that you have reason to believe are valid.
+
+  If, pursuant to or in connection with a single transaction or
+arrangement, you convey, or propagate by procuring conveyance of, a
+covered work, and grant a patent license to some of the parties
+receiving the covered work authorizing them to use, propagate, modify
+or convey a specific copy of the covered work, then the patent license
+you grant is automatically extended to all recipients of the covered
+work and works based on it.
+
+  A patent license is "discriminatory" if it does not include within
+the scope of its coverage, prohibits the exercise of, or is
+conditioned on the non-exercise of one or more of the rights that are
+specifically granted under this License.  You may not convey a covered
+work if you are a party to an arrangement with a third party that is
+in the business of distributing software, under which you make payment
+to the third party based on the extent of your activity of conveying
+the work, and under which the third party grants, to any of the
+parties who would receive the covered work from you, a discriminatory
+patent license (a) in connection with copies of the covered work
+conveyed by you (or copies made from those copies), or (b) primarily
+for and in connection with specific products or compilations that
+contain the covered work, unless you entered into that arrangement,
+or that patent license was granted, prior to 28 March 2007.
+
+  Nothing in this License shall be construed as excluding or limiting
+any implied license or other defenses to infringement that may
+otherwise be available to you under applicable patent law.
+
+  12. No Surrender of Others' Freedom.
+
+  If conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot convey a
+covered work so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you may
+not convey it at all.  For example, if you agree to terms that obligate you
+to collect a royalty for further conveying from those to whom you convey
+the Program, the only way you could satisfy both those terms and this
+License would be to refrain entirely from conveying the Program.
+
+  13. Use with the GNU Affero General Public License.
+
+  Notwithstanding any other provision of this License, you have
+permission to link or combine any covered work with a work licensed
+under version 3 of the GNU Affero General Public License into a single
+combined work, and to convey the resulting work.  The terms of this
+License will continue to apply to the part which is the covered work,
+but the special requirements of the GNU Affero General Public License,
+section 13, concerning interaction through a network will apply to the
+combination as such.
+
+  14. Revised Versions of this License.
+
+  The Free Software Foundation may publish revised and/or new versions of
+the GNU General Public License from time to time.  Such new versions will
+be similar in spirit to the present version, but may differ in detail to
+address new problems or concerns.
+
+  Each version is given a distinguishing version number.  If the
+Program specifies that a certain numbered version of the GNU General
+Public License "or any later version" applies to it, you have the
+option of following the terms and conditions either of that numbered
+version or of any later version published by the Free Software
+Foundation.  If the Program does not specify a version number of the
+GNU General Public License, you may choose any version ever published
+by the Free Software Foundation.
+
+  If the Program specifies that a proxy can decide which future
+versions of the GNU General Public License can be used, that proxy's
+public statement of acceptance of a version permanently authorizes you
+to choose that version for the Program.
+
+  Later license versions may give you additional or different
+permissions.  However, no additional obligations are imposed on any
+author or copyright holder as a result of your choosing to follow a
+later version.
+
+  15. Disclaimer of Warranty.
+
+  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
+APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
+HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
+OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
+THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
+IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
+ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+  16. Limitation of Liability.
+
+  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
+THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
+USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
+DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
+PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
+EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
+SUCH DAMAGES.
+
+  17. Interpretation of Sections 15 and 16.
+
+  If the disclaimer of warranty and limitation of liability provided
+above cannot be given local legal effect according to their terms,
+reviewing courts shall apply local law that most closely approximates
+an absolute waiver of all civil liability in connection with the
+Program, unless a warranty or assumption of liability accompanies a
+copy of the Program in return for a fee.
+
+                     END OF TERMS AND CONDITIONS
+
+            How to Apply These Terms to Your New Programs
+
+  If you develop a new program, and you want it to be of the greatest
+possible use to the public, the best way to achieve this is to make it
+free software which everyone can redistribute and change under these terms.
+
+  To do so, attach the following notices to the program.  It is safest
+to attach them to the start of each source file to most effectively
+state the exclusion of warranty; and each file should have at least
+the "copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the program's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This program is free software: you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation, either version 3 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
+Also add information on how to contact you by electronic and paper mail.
+
+  If the program does terminal interaction, make it output a short
+notice like this when it starts in an interactive mode:
+
+    <program>  Copyright (C) <year>  <name of author>
+    This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+    This is free software, and you are welcome to redistribute it
+    under certain conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License.  Of course, your program's commands
+might be different; for a GUI interface, you would use an "about box".
+
+  You should also get your employer (if you work as a programmer) or school,
+if any, to sign a "copyright disclaimer" for the program, if necessary.
+For more information on this, and how to apply and follow the GNU GPL, see
+<http://www.gnu.org/licenses/>.
+
+  The GNU General Public License does not permit incorporating your program
+into proprietary programs.  If your program is a subroutine library, you
+may consider it more useful to permit linking proprietary applications with
+the library.  If this is what you want to do, use the GNU Lesser General
+Public License instead of this License.  But first, please read
+<http://www.gnu.org/philosophy/why-not-lgpl.html>.
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 4e55141..b66c8a5 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -257,4 +257,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "84330007e12122bf1b690a4e68b5ef8e973c7882"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index c9d2223..8d69ca3 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 778d0c4515bae5bdeb650fb3e6b3e32a73722b51 Mon Sep 17 00:00:00 2001
+From 16a6bfc8f93f8d4e0d4a6e09cdfb0c4a8412e38f Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
@@ -8,7 +8,7 @@ Subject: [PATCH] Allow a tools-only build
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/qt3d.pro b/qt3d.pro
-index a26e76d..263e3c4 100644
+index a26e76d..016fb30 100644
 --- a/qt3d.pro
 +++ b/qt3d.pro
 @@ -1,4 +1,4 @@
@@ -26,6 +26,3 @@ index a26e76d..263e3c4 100644
 +    sub_tools.depends -= sub_src
 +    SUBDIRS = sub_tools
 +}
--- 
-1.9.1
-
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index a96b06c..c3a5bc5 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -27,6 +27,6 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "7a208d76ed96bb506899becfe680df06f95451c7"
+SRCREV = "be29a39ede4355a5aa18e93c27a75a1c3f81bde4"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 8a6d93e..8f88b6d 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -1,8 +1,8 @@
 # Copyright (C) 2012-2016 O.S. Systems Software LTDA.
-# Copyright (C) 2013-2014 Martin Jansa <martin.jansa@gmail.com>
+# Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
-QT_MODULE_BRANCH ?= "5.6"
+QT_MODULE_BRANCH ?= "5.7"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
@@ -11,4 +11,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.6.0+git${SRCPV}"
+PV = "5.6.99+5.7.0-beta+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 73900af..426e0ae 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -117,4 +117,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "84330007e12122bf1b690a4e68b5ef8e973c7882"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 522afcd..af85fe9 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From cabe9683b82493e2547e87ae0057f44f71efe519 Mon Sep 17 00:00:00 2001
+From 79f881eaa0a4a980963ce4ea1bc4c5e26c640c9a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
@@ -47,19 +47,19 @@ Upstream-Status: Inappropriate [embedded specific]
 Change-Id: I0591ed5da0d61d7cf1509d420e6b293582f1863c
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure                            |  71 ++++++++++++++++---------
+ configure                            |  55 ++++++++++++-------
  mkspecs/features/configure.prf       |   4 +-
  mkspecs/linux-oe-g++/qmake.conf      |  42 +++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 4 files changed, 189 insertions(+), 28 deletions(-)
+ 4 files changed, 181 insertions(+), 20 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 3e97c98..88a308d 100755
+index b65c564..ffe6931 100755
 --- a/configure
 +++ b/configure
-@@ -342,6 +342,16 @@ getQMakeConf()
+@@ -339,6 +339,16 @@ getQMakeConf()
      getSingleQMakeVariable "$1" "$specvals"
  }
  
@@ -76,7 +76,7 @@ index 3e97c98..88a308d 100755
  getXQMakeConf()
  {
      if [ -z "$xspecvals" ]; then
-@@ -351,6 +361,16 @@ getXQMakeConf()
+@@ -348,6 +358,16 @@ getXQMakeConf()
      getSingleQMakeVariable "$1" "$xspecvals"
  }
  
@@ -93,7 +93,7 @@ index 3e97c98..88a308d 100755
  compilerSupportsFlag()
  {
      cat >conftest.cpp <<EOF
-@@ -557,24 +577,14 @@ fi
+@@ -569,24 +589,14 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
@@ -124,8 +124,8 @@ index 3e97c98..88a308d 100755
  fi'`
      eval "$cmd"
  done
-@@ -3418,7 +3428,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
-     [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
+@@ -3428,7 +3438,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+     [ "$CFG_GTK" = "auto" ] && CFG_GTK=no
  fi
  
 -QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX`
@@ -133,16 +133,16 @@ index 3e97c98..88a308d 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3475,7 +3485,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
-         exit 1
+@@ -3479,7 +3489,7 @@ if [ "$XPLATFORM_ANDROID" = "yes" ] ; then
      fi
  fi
+ 
 -TEST_COMPILER_CXXFLAGS=`getXQMakeConf QMAKE_CXXFLAGS`
 +TEST_COMPILER_CXXFLAGS=`getXQEvalMakeConf QMAKE_CXXFLAGS`
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3976,6 +3986,14 @@ setBootstrapVariable()
+@@ -3878,6 +3888,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -157,42 +157,19 @@ index 3e97c98..88a308d 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -4014,14 +4032,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-         fi
- 
-         [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
--        setBootstrapVariable QMAKE_CC CC "$CC_TRANSFORM"
--        setBootstrapVariable QMAKE_CXX CXX "$CC_TRANSFORM"
--        setBootstrapVariable QMAKE_CFLAGS
--        setBootstrapVariable QMAKE_CFLAGS_SPLIT_SECTIONS
--        setBootstrapVariable QMAKE_CXXFLAGS
--        setBootstrapVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
--        setBootstrapVariable QMAKE_LFLAGS
--        setBootstrapVariable QMAKE_LFLAGS_GCSECTIONS
-+        setBootstrapEvalVariable QMAKE_CC CC "$CC_TRANSFORM"
-+        setBootstrapEvalVariable QMAKE_CXX CXX "$CC_TRANSFORM"
-+        setBootstrapEvalVariable QMAKE_CFLAGS
-+        setBootstrapEvalVariable QMAKE_CFLAGS_SPLIT_SECTIONS
-+        setBootstrapEvalVariable QMAKE_CXXFLAGS
-+        setBootstrapEvalVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
-+        setBootstrapEvalVariable QMAKE_LFLAGS
-+        setBootstrapEvalVariable QMAKE_LFLAGS_GCSECTIONS
- 
-         if [ "$CFG_RELEASE_TOOLS" = "yes" ]; then
-             setBootstrapVariable QMAKE_CFLAGS_RELEASE
-@@ -4070,6 +4088,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-                         \"\$(SOURCE_PATH)/src/corelib/io/qfsfileengine_unix.cpp\" \
-                         \"\$(SOURCE_PATH)/src/corelib/tools/qlocale_unix.cpp\""
+@@ -3977,6 +3995,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
              EXEEXT=
-+            [ "$QT_CROSS_COMPILE" = "yes" ] && EXEEXT=-target
-         fi
+             ;;
+         esac
++        [ "$QT_CROSS_COMPILE" = "yes" ] && EXEEXT=-target
          if [ "$BUILD_ON_MAC" = "yes" ]; then
              echo "COCOA_LFLAGS =-framework Foundation -framework CoreServices" >>"$mkfile"
+             echo "CARBON_LFLAGS =-framework ApplicationServices" >>"$mkfile"
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index 6b37a04..dcf6025 100644
+index 92c288c..f3019e0 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
-@@ -63,12 +63,12 @@ defineTest(qtCompileTest) {
+@@ -63,14 +63,14 @@ defineTest(qtCompileTest) {
      }
  
      # Clean up after previous run
@@ -201,7 +178,9 @@ index 6b37a04..dcf6025 100644
  
      mkpath($$test_out_dir)|error("Aborting.")
  
-     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) -spec $$QMAKESPEC $$qmake_configs $$shell_quote($$test_dir)") {
+     !isEmpty (QMAKE_QTCONF): qtconfarg = -qtconf $$QMAKE_QTCONF
+ 
+     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) $$qtconfarg -spec $$QMAKESPEC $$qmake_configs $$shell_quote($$test_dir)") {
 -        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE") {
 +        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS)") {
              log("yes$$escape_expand(\\n)")
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 0b0650d..54895df 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From 1edd17d452a7e9eeb2931b3c5697a4fc0ec4e6bc Mon Sep 17 00:00:00 2001
+From aaa1675d3c9f0d100f596ca4e2ddf3bd25fae5b6 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 8bcacca..e1c87b5 100644
+index 4582001..ff65ef9 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -157,7 +157,10 @@ void QLibrarySettings::load()
+@@ -163,7 +163,10 @@ void QLibrarySettings::load()
  
  QSettings *QLibraryInfoPrivate::findConfiguration()
  {
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index ca271e6..11cd97b 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From 3ecdcb6a10d125f1440c42ad9c79f04d43c257e0 Mon Sep 17 00:00:00 2001
+From 502b95b840a5f79e5a68e9bd5b10dbdc92485f1f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] Add -external-hostbindir option
@@ -26,21 +26,23 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
 
 Conflicts:
         configure
+
+Change-Id: Iacaa1c5531cd6dcc094891610c351673db55d7b2
 ---
  configure                                   | 14 ++++++++++++++
  mkspecs/features/qt_functions.prf           |  6 +++++-
- mkspecs/features/qt_tool.prf                |  5 +++--
- qtbase.pro                                  | 13 ++++++++++---
+ mkspecs/features/qt_tool.prf                |  4 +++-
+ qtbase.pro                                  | 16 ++++++++++++++++
  src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
  src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
  src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
- 7 files changed, 38 insertions(+), 12 deletions(-)
+ 7 files changed, 44 insertions(+), 8 deletions(-)
 
 diff --git a/configure b/configure
-index 88a308d..f2611ed 100755
+index ffe6931..5aa87b4 100755
 --- a/configure
 +++ b/configure
-@@ -810,6 +810,7 @@ QT_HOST_BINS=
+@@ -825,6 +825,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -48,7 +50,7 @@ index 88a308d..f2611ed 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -929,6 +930,7 @@ while [ "$#" -gt 0 ]; do
+@@ -944,6 +945,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -56,7 +58,7 @@ index 88a308d..f2611ed 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1159,6 +1161,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1176,6 +1178,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -66,7 +68,7 @@ index 88a308d..f2611ed 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2428,6 +2433,10 @@ Installation options:
+@@ -2438,6 +2443,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -77,7 +79,7 @@ index 88a308d..f2611ed 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -3172,6 +3181,11 @@ fi
+@@ -3196,6 +3205,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -90,10 +92,10 @@ index 88a308d..f2611ed 100755
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 8639695..d89d948 100644
+index cfac583..41ca7f1 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -70,7 +70,11 @@ defineTest(qtHaveModule) {
+@@ -71,7 +71,11 @@ defineTest(qtHaveModule) {
  defineTest(qtPrepareTool) {
      cmd = $$eval(QT_TOOL.$${2}.binary)
      isEmpty(cmd) {
@@ -104,13 +106,13 @@ index 8639695..d89d948 100644
 +        else: \
 +            cmd = $$[QT_EXTERNAL_HOST_BINS]/$$2
          exists($${cmd}.pl) {
+             $${1}_EXE = $${cmd}.pl
              cmd = perl -w $$system_path($${cmd}.pl)
-         } else: contains(QMAKE_HOST.os, Windows) {
 diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index 839c3d6..45934a0 100644
+index bdeb59c..b8c539f 100644
 --- a/mkspecs/features/qt_tool.prf
 +++ b/mkspecs/features/qt_tool.prf
-@@ -14,10 +14,11 @@ load(qt_app)
+@@ -14,10 +14,12 @@ load(qt_app)
  CONFIG += console
  DEFINES *= QT_USE_QSTRINGBUILDER
  
@@ -118,37 +120,37 @@ index 839c3d6..45934a0 100644
 +
  # If we are doing a prefix build, create a "module" pri which enables
  # qtPrepareTool() to work with the non-installed build.
--# Non-bootstrapped tools always need this because of the environment setup.
--!build_pass:if(!host_build|!force_bootstrap|force_independent) {
-+!build_pass:if(!host_build|!force_bootstrap|force_independent):isEmpty(QT_EXTERNAL_HOST_BINS) {
+ # Non-bootstrapped tools always need this because of the environment setup.
+-!build_pass:if(!host_build|!force_bootstrap|force_independent|!isEmpty(HOST_QT_TOOLS)) {
++!build_pass:if(!host_build|!force_bootstrap|force_independent|!isEmpty(HOST_QT_TOOLS)):isEmpty(QT_EXTERNAL_HOST_BINS) {
      isEmpty(MODULE):MODULE = $$TARGET
  
-     !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, _private)
+     load(qt_build_paths)
 diff --git a/qtbase.pro b/qtbase.pro
-index 98ca86a..0eed475 100644
+index 11cff9e..ec03669 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
-@@ -37,12 +37,16 @@ CONFIG -= qt
+@@ -38,6 +38,19 @@ CONFIG -= qt
  
  ### installations ####
  
 +QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
 +
- #qmake
- qmake.path = $$[QT_HOST_BINS]
++#qmake
++qmake.path = $$[QT_HOST_BINS]
 +qmake.files = $$OUT_PWD/bin/qmake
 +!isEmpty(QT_EXTERNAL_HOST_BINS) {
 +   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/qmake
 +}
- equals(QMAKE_HOST.os, Windows) {
--   qmake.files = $$OUT_PWD/bin/qmake.exe
--} else {
--   qmake.files = $$OUT_PWD/bin/qmake
++equals(QMAKE_HOST.os, Windows) {
 +   qmake.files = $${qmake.files}.exe
- }
- INSTALLS += qmake
- 
-@@ -59,6 +63,9 @@ INSTALLS += fixqt4headers
++}
++INSTALLS += qmake
++
+ #licheck
+ licheck.path = $$[QT_HOST_BINS]
+ licheck.files = $$PWD/bin/$$QT_LICHECK
+@@ -51,6 +64,9 @@ INSTALLS += fixqt4headers
  #syncqt
  syncqt.path = $$[QT_HOST_BINS]
  syncqt.files = $$PWD/bin/syncqt.pl
@@ -159,7 +161,7 @@ index 98ca86a..0eed475 100644
  
  # If we are doing a prefix build, create a "module" pri which enables
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index 91a4eb6..25df27c 100644
+index a5ed8b2..0e11a1e 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
 +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index a35b6a2..b3677eb 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From 7e5713e7f4807e204cd4a9f874cb1ca2985fc630 Mon Sep 17 00:00:00 2001
+From ac2f94a42878c1500e1ab6bbbec7834d9e5edfbb Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH] qt_module: Fix pkgconfig and libtool replacements
@@ -68,7 +68,7 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
-index 75b84ff..ab36fa6 100644
+index 03ec36a..2ab192b 100644
 --- a/mkspecs/features/qt.prf
 +++ b/mkspecs/features/qt.prf
 @@ -317,6 +317,19 @@ contains(TEMPLATE, .*app) {
@@ -92,7 +92,7 @@ index 75b84ff..ab36fa6 100644
  contains(QT_CONFIG, static) {
      QT_PLUGIN_VERIFY += QTPLUGIN
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index cc8ed87..b7d4be2 100644
+index c1c668a..67d916d 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
 @@ -38,7 +38,7 @@ contains(TEMPLATE, .*lib) {
diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
index e21b36d..404c068 100644
--- a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From e6ed023b0210375e594b7b61dfb620deb486ee8c Mon Sep 17 00:00:00 2001
+From d108da324156b9d709c106c1698bd7466cb26f69 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
@@ -14,10 +14,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index f2611ed..24a61db 100755
+index 5aa87b4..17bca95 100755
 --- a/configure
 +++ b/configure
-@@ -3930,10 +3930,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3832,10 +3832,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
  
  /* Installation Info */
diff --git a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
index b675805..92ecb13 100644
--- a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From 05a3901af7a467f9ea5fa9e6f63a574d8d2a9f77 Mon Sep 17 00:00:00 2001
+From 17450df40d6c163c85b66c1cc485317fd6f9a9c9 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH] QOpenGLPaintDevice sub-area support
@@ -21,10 +21,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  6 files changed, 23 insertions(+), 3 deletions(-)
 
 diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qopenglpaintdevice.cpp
-index 17a3277..85425da 100644
+index 75f09d6..17d7155 100644
 --- a/src/gui/opengl/qopenglpaintdevice.cpp
 +++ b/src/gui/opengl/qopenglpaintdevice.cpp
-@@ -135,6 +135,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
+@@ -141,6 +141,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
  {
  }
  
@@ -37,7 +37,7 @@ index 17a3277..85425da 100644
  /*!
      \internal
   */
-@@ -216,6 +222,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
+@@ -222,6 +228,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
      return d_ptr->ctx;
  }
  
@@ -50,10 +50,10 @@ index 17a3277..85425da 100644
      Returns the pixel size of the paint device.
  
 diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopenglpaintdevice.h
-index 804e485..88b481a 100644
+index dffa68c..66a1e3d 100644
 --- a/src/gui/opengl/qopenglpaintdevice.h
 +++ b/src/gui/opengl/qopenglpaintdevice.h
-@@ -53,12 +53,14 @@ public:
+@@ -59,12 +59,14 @@ public:
      QOpenGLPaintDevice();
      explicit QOpenGLPaintDevice(const QSize &size);
      QOpenGLPaintDevice(int width, int height);
@@ -69,10 +69,10 @@ index 804e485..88b481a 100644
      void setSize(const QSize &size);
      void setDevicePixelRatio(qreal devicePixelRatio);
 diff --git a/src/gui/opengl/qopenglpaintdevice_p.h b/src/gui/opengl/qopenglpaintdevice_p.h
-index 54ea092..f660143 100644
+index 78e6b7a..6630461 100644
 --- a/src/gui/opengl/qopenglpaintdevice_p.h
 +++ b/src/gui/opengl/qopenglpaintdevice_p.h
-@@ -65,6 +65,7 @@ public:
+@@ -71,6 +71,7 @@ public:
  
  public:
      QSize size;
@@ -81,10 +81,10 @@ index 54ea092..f660143 100644
  
      qreal dpmx;
 diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index 0b92bf4..f41e059 100644
+index d93871c..be2bee9 100644
 --- a/src/gui/opengl/qopenglpaintengine.cpp
 +++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -2078,7 +2078,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
+@@ -2084,7 +2084,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
      for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
          d->vertexAttributeArraysEnabledState[i] = false;
  
@@ -95,7 +95,7 @@ index 0b92bf4..f41e059 100644
      d->width = sz.width();
      d->height = sz.height();
      d->mode = BrushDrawingMode;
-@@ -2165,7 +2168,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+@@ -2171,7 +2174,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
          d->device->ensureActiveTarget();
  
          d->transferMode(BrushDrawingMode);
@@ -104,7 +104,7 @@ index 0b92bf4..f41e059 100644
          d->needsSync = false;
          d->shaderManager->setDirty();
          d->syncGlState();
-@@ -2207,6 +2210,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2213,6 +2216,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
      if (bounds == QRect(0, 0, width, height)) {
          funcs.glDisable(GL_SCISSOR_TEST);
      } else {
@@ -112,7 +112,7 @@ index 0b92bf4..f41e059 100644
          funcs.glEnable(GL_SCISSOR_TEST);
          setScissor(bounds);
      }
-@@ -2215,12 +2219,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2221,12 +2225,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
  
  void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
  {
@@ -128,10 +128,10 @@ index 0b92bf4..f41e059 100644
  
      funcs.glScissor(left, bottom, width, height);
 diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qopenglpaintengine_p.h
-index f1ec669..6d302b8 100644
+index c9f3282..7c0616b 100644
 --- a/src/gui/opengl/qopenglpaintengine_p.h
 +++ b/src/gui/opengl/qopenglpaintengine_p.h
-@@ -264,6 +264,7 @@ public:
+@@ -270,6 +270,7 @@ public:
      QOpenGL2PaintEngineEx* q;
      QOpenGLEngineShaderManager* shaderManager;
      QOpenGLPaintDevice* device;
@@ -140,10 +140,10 @@ index f1ec669..6d302b8 100644
      QOpenGLContext *ctx;
      EngineMode mode;
 diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index c179143..fad68d5 100644
+index 8f69095..cf82ee7 100644
 --- a/src/gui/opengl/qopengltextureglyphcache.cpp
 +++ b/src/gui/opengl/qopengltextureglyphcache.cpp
-@@ -310,7 +310,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
+@@ -316,7 +316,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
      funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
  
      if (pex != 0) {
diff --git a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
index 2fab888..4cc8ce6 100644
--- a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -1,4 +1,4 @@
-From 6a0d4af2083dbacddb98245c0b4b83c6e014a1ae Mon Sep 17 00:00:00 2001
+From edb00662de57d0b6ddb39f80800cf3d20c6c07fd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Jun 2015 13:59:25 -0700
 Subject: [PATCH] linux-oe-g++: Invert conditional for defining QT_SOCKLEN_T
diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
index 7ca1913..106486f 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
@@ -1,4 +1,4 @@
-From b5c826a39760519010884547d6981c3af031d9c8 Mon Sep 17 00:00:00 2001
+From e1bc7a14ae9e433112006b1b6944f8b0e3f619ab Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 13 Nov 2015 12:36:11 +0100
 Subject: [PATCH] configure paths for target qmake properly
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 19 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 24a61db..2e99d39 100755
+index 17bca95..6abdd6b 100755
 --- a/configure
 +++ b/configure
-@@ -3875,8 +3875,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
+@@ -3777,8 +3777,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
      QMAKE_CONFIG="$QMAKE_CONFIG compile_examples"
  fi
  
@@ -38,7 +38,7 @@ index 24a61db..2e99d39 100755
  
  QT_CONFIGURE_STR_OFF=0
  
-@@ -3909,7 +3914,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
+@@ -3811,7 +3816,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
  
  QT_CONFIGURE_STR_OFFSETS=
  QT_CONFIGURE_STRS=
@@ -51,7 +51,7 @@ index 24a61db..2e99d39 100755
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
-@@ -3921,6 +3930,12 @@ addConfStr "$shortspec"
+@@ -3823,6 +3832,12 @@ addConfStr "$shortspec"
  #-------------------------------------------------------------------------------
  [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/global"
  
@@ -64,7 +64,7 @@ index 24a61db..2e99d39 100755
  cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
  /* License Info */
  static const char qt_configure_licensee_str          [256 + 12] = "qt_lcnsuser=$Licensee";
-@@ -3933,7 +3948,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
+@@ -3835,7 +3850,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
  static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
  #ifdef QT_BUILD_QMAKE
  static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
diff --git a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
index 230c966..bee10d5 100644
--- a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 49b2100ff86ab5b4977608903b30cb71075592c6 Mon Sep 17 00:00:00 2001
+From 14b037afc3fa6992733891205a46b44991402afb Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH] Always build uic
@@ -14,7 +14,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 1671338..83de483 100644
+index 4a165a2..0f84791 100644
 --- a/src/src.pro
 +++ b/src/src.pro
 @@ -180,7 +180,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
diff --git a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
index 5bb73e7..949b323 100644
--- a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,4 +1,4 @@
-From 5b4ae15a19a9135d3dc8a35aa2d109ba8d29868a Mon Sep 17 00:00:00 2001
+From 6df8d620081bd78319fc97846e52b1a83042401a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] Add -external-hostbindir option for native(sdk)
@@ -37,10 +37,10 @@ Conflicts:
  5 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 2e99d39..a0641d2 100755
+index 6abdd6b..7c5a066 100755
 --- a/configure
 +++ b/configure
-@@ -3922,6 +3922,7 @@ fi
+@@ -3824,6 +3824,7 @@ fi
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
@@ -49,10 +49,10 @@ index 2e99d39..a0641d2 100755
  addConfStr "$shortspec"
  
 diff --git a/qmake/property.cpp b/qmake/property.cpp
-index 817ae95..c69539f 100644
+index 9ee08f4..e6ecf92 100644
 --- a/qmake/property.cpp
 +++ b/qmake/property.cpp
-@@ -68,6 +68,7 @@ static const struct {
+@@ -63,6 +63,7 @@ static const struct {
      { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
      { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
      { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
@@ -61,10 +61,10 @@ index 817ae95..c69539f 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index e1c87b5..d6e03ba 100644
+index ff65ef9..3726831 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -373,7 +373,7 @@ QLibraryInfo::isDebugBuild()
+@@ -381,7 +381,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -73,7 +73,7 @@ index e1c87b5..d6e03ba 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -398,6 +398,7 @@ static const struct {
+@@ -406,6 +406,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
@@ -82,10 +82,10 @@ index e1c87b5..d6e03ba 100644
      { "HostSpec", "" },
      { "HostPrefix", "" },
 diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index 1ad7637..5a8b127 100644
+index 362d47d..a2326e2 100644
 --- a/src/corelib/global/qlibraryinfo.h
 +++ b/src/corelib/global/qlibraryinfo.h
-@@ -81,6 +81,7 @@ public:
+@@ -87,6 +87,7 @@ public:
          HostBinariesPath,
          HostLibrariesPath,
          HostDataPath,
@@ -94,10 +94,10 @@ index 1ad7637..5a8b127 100644
          HostSpecPath,
          HostPrefixPath,
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 6f1e2b7..ae03143 100644
+index 7fd0b98..47fa6c3 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1256,6 +1256,13 @@ void Configure::parseCmdLine()
+@@ -1202,6 +1202,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -111,7 +111,7 @@ index 6f1e2b7..ae03143 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -4232,6 +4239,9 @@ void Configure::generateQConfigCpp()
+@@ -4121,6 +4128,9 @@ void Configure::generateQConfigCpp()
  
      if (dictionary["QT_REL_HOST_DATA"].isEmpty())
          dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
@@ -121,7 +121,7 @@ index 6f1e2b7..ae03143 100644
  
      confStringOff = 0;
      addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
-@@ -4251,6 +4261,7 @@ void Configure::generateQConfigCpp()
+@@ -4140,6 +4150,7 @@ void Configure::generateQConfigCpp()
      addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
      addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
      addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 09f8ebd..9b61746 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -261,4 +261,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "84330007e12122bf1b690a4e68b5ef8e973c7882"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 5b12d1a..a1c8f7f 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "791ddce7d41b126ba4744a6701597f49dbf99f3b"
+SRCREV = "32404e27101c5ec81b4ab965faf38263429bbc5a"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 03990d8..b84ad04 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "dedff12a896d51c469d2af82664b86a10f8fa7fe"
+SRCREV = "f8759f683cfc433c432059e1160d2ab657baaec6"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index ee56820..1a8a5f0 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From d26a676827ef2d64b4627090690d3240e62f6565 Mon Sep 17 00:00:00 2001
+From c978b2ed0e1ce48b2d4a4a6eb660927bc88aed57 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -15,12 +15,11 @@ Change-Id: I63088ff73bec6a8559dfae132f8bd40b62487450
 Signed-off-by: Eric Bénard <eric@eukrea.com>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- examples/qmltest/qmltest/qmltest.pro         | 2 +-
- tests/auto/qml/qjsengine/qjsengine.pro       | 2 +-
- tests/auto/qml/qtqmlmodules/qtqmlmodules.pro | 2 +-
- tests/auto/qmltest/qmltest.pro               | 1 +
- tools/qmltestrunner/qmltestrunner.pro        | 2 +-
- 5 files changed, 5 insertions(+), 4 deletions(-)
+ examples/qmltest/qmltest/qmltest.pro   | 2 +-
+ tests/auto/qml/qjsengine/qjsengine.pro | 2 +-
+ tests/auto/qmltest/qmltest.pro         | 1 +
+ tools/qmltestrunner/qmltestrunner.pro  | 2 +-
+ 4 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/examples/qmltest/qmltest/qmltest.pro b/examples/qmltest/qmltest/qmltest.pro
 index b5893c5..1b00e6c 100644
@@ -36,31 +35,19 @@ index b5893c5..1b00e6c 100644
  macx: CONFIG -= app_bundle
  
 diff --git a/tests/auto/qml/qjsengine/qjsengine.pro b/tests/auto/qml/qjsengine/qjsengine.pro
-index fc2452c..919710f 100644
+index c9d78e2..5861613 100644
 --- a/tests/auto/qml/qjsengine/qjsengine.pro
 +++ b/tests/auto/qml/qjsengine/qjsengine.pro
-@@ -1,7 +1,7 @@
+@@ -1,6 +1,6 @@
  CONFIG += testcase
- CONFIG += parallel_test
  TARGET = tst_qjsengine
 -QT +=  qml qml-private widgets testlib gui-private
 +QT +=  qml qml-private widgets testlib gui-private quick
  macx:CONFIG -= app_bundle
  SOURCES += tst_qjsengine.cpp
  RESOURCES += qjsengine.qrc
-diff --git a/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro b/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
-index c6d442e..3181dcd 100644
---- a/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
-+++ b/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
-@@ -8,5 +8,5 @@ macx:CONFIG -= app_bundle
- 
- TESTDATA = data/*
- 
--QT += core-private  qml-private testlib gui gui-private
-+QT += core-private  qml-private testlib gui gui-private quick
- DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
 diff --git a/tests/auto/qmltest/qmltest.pro b/tests/auto/qmltest/qmltest.pro
-index 7662cb1..a8f8ae2 100644
+index 54db7a7..8c6986c 100644
 --- a/tests/auto/qmltest/qmltest.pro
 +++ b/tests/auto/qmltest/qmltest.pro
 @@ -4,6 +4,7 @@ CONFIG += qmltestcase
diff --git a/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch b/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
index 60c9685..dc707ab 100644
--- a/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
+++ b/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
@@ -1,4 +1,4 @@
-From 9d39293e354120a9ec5e92c87b4cd695acdeb3f5 Mon Sep 17 00:00:00 2001
+From 493e91c9c3527d577f7051de9a582a178ca43fcf Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Thu, 31 Mar 2016 19:38:58 -0400
 Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has not been
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index bf3a108..762454a 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -34,6 +34,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "26ff8f9029107877bfbfdc2f099f9b11861183ed"
+SRCREV = "31ef2e858c2a0835c040b3199c9557f0f6c66808"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 04f5a79..d5e8dfa 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "cf717b99fdb1b7221dd556bf3be32feba0ed8afe"
+SRCREV = "0f6e294fb8534f677a5ec75113679cfe24f559c1"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 606b873..1ecc4f7 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "6523d7c4843e1d4176035c46e1514c39bdcfc3bf"
+SRCREV = "d85fd81f338f9c6f2e95b92b2cb9ccd4f9889c6b"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index 1211898..11a9726 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From c4c008c46291be290312b5674af1c1b9c446fa8e Mon Sep 17 00:00:00 2001
+From 6f01ba8602a4efdb31bf01bf58aa4cb23552e9ac Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 4c4431d..298e5a3 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "bf5b49878d75d316f31225f76152e8381a3d5f0f"
+SRCREV = "42b07b2ddf443d3eafd18e169f2e5ab5e36604a5"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index d573b6b..a01d1d2 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "d1f66746ab0b77b4f3300cbeeaafe61d25d78e98"
+SRCREV = "e41c3a9b345536ccee0840ac6f049173aa6a0785"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index 05f5473..81fcd39 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From 98455d75df7b040817e323417b6042118c093d56 Mon Sep 17 00:00:00 2001
+From df587e2a3bb2aa297088bd3ada4309c4b9a85195 Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH] Initial porting effort to GStreamer 1.0.
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 328fdd7..5c72337 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "2170a3b0fcda613daf76a337fa45cb97e0714cdf"
+SRCREV = "c85fd6df07935b9c0fa08f881271cd94ad100003"
diff --git a/recipes-qt/qt5/qtquick1/0001-qdeclarativetextinput-update-to-match-QWidgetLineCon.patch b/recipes-qt/qt5/qtquick1/0001-qdeclarativetextinput-update-to-match-QWidgetLineCon.patch
new file mode 100644
index 0000000..27a2140
--- /dev/null
+++ b/recipes-qt/qt5/qtquick1/0001-qdeclarativetextinput-update-to-match-QWidgetLineCon.patch
@@ -0,0 +1,31 @@
+From 450d5dee6cc4f35a7475af507b90ba67327ad724 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 26 Apr 2016 17:48:18 +0200
+Subject: [PATCH] qdeclarativetextinput: update to match QWidgetLineControl API
+ change
+
+* setCursorBlinkPeriod was replaced with setBlinkingCursorEnabled &
+  updateCursorBlinking in qtbase commit:
+  commit 1b5bc9723c0b23ca5197097c3087df6bbe024a2a
+  Author: Richard Moe Gustavsen <richard.gustavsen@theqtcompany.com>
+  Date:   Tue Apr 19 10:15:54 2016 +0200
+  Subject: QWidgetLineControl: respect run-time changes to cursorFlashTime
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/declarative/graphicsitems/qdeclarativetextinput.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/declarative/graphicsitems/qdeclarativetextinput.cpp b/src/declarative/graphicsitems/qdeclarativetextinput.cpp
+index 3ff75fd..e39d1af 100644
+--- a/src/declarative/graphicsitems/qdeclarativetextinput.cpp
++++ b/src/declarative/graphicsitems/qdeclarativetextinput.cpp
+@@ -514,7 +514,7 @@ void QDeclarativeTextInput::setCursorVisible(bool on)
+     if (d->cursorVisible == on)
+         return;
+     d->cursorVisible = on;
+-    d->control->setCursorBlinkPeriod(on?QApplication::cursorFlashTime():0);
++    d->control->setBlinkingCursorEnabled(on);
+     QRect r = d->control->cursorRect();
+     if (d->control->inputMask().isEmpty())
+         updateRect(r);
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 61b02a1..e34cc22 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -7,7 +7,7 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -16,6 +16,8 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtscript qtsvg qtxmlpatterns"
 # qttools
 
+SRC_URI += "file://0001-qdeclarativetextinput-update-to-match-QWidgetLineCon.patch"
+
 PACKAGECONFIG ??= "webkit"
 PACKAGECONFIG[webkit] = "CONFIG+=enable-webkit,CONFIG-=enable-webkit,qtwebkit"
 
@@ -23,4 +25,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "563ce3888f3c04abcc96ba236b20c7a822bc88e2"
+SRCREV = "5e3bd5cb28e7af95b289a617ca2f7a8892498225"
diff --git a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
index c57943d..ad2b489 100644
--- a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
+++ b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
@@ -1,4 +1,4 @@
-From d5faf29f8a41b0e28132fb23828cff8043174cb8 Mon Sep 17 00:00:00 2001
+From 00bb7694b9287f23d4d059ae134e9409db69673e Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Thu, 31 Mar 2016 19:57:01 -0400
 Subject: [PATCH] texteditor: fix invalid use of incomplete type 'class QDebug'
@@ -11,10 +11,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/examples/quick/controls/texteditor/src/documenthandler.cpp b/examples/quick/controls/texteditor/src/documenthandler.cpp
-index 2e03f74..3d1b3c8 100644
+index bdecf5b..811a761 100644
 --- a/examples/quick/controls/texteditor/src/documenthandler.cpp
 +++ b/examples/quick/controls/texteditor/src/documenthandler.cpp
-@@ -44,6 +44,7 @@
+@@ -54,6 +54,7 @@
  #include <QtGui/QTextCursor>
  #include <QtGui/QFontDatabase>
  #include <QtCore/QFileInfo>
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 0ebf4fd..00fe4fc 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "ac152bfcd37f94453e9705b57ca6520ad30bade0"
+SRCREV = "2a5c64a1ddf5b6fdb9104faf99260925a327b2f4"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 7a5ca23..9231a79 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,4 +17,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "01e52200e2a76ec51c3bb9710617ac0c249a78bc"
+SRCREV = "3411c3579fb9e767c819c0c8d9f35c52c9964b06"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 565ca84..7859ec5 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "b16873afea798d08799d7a0b255b8d200337f35b"
+SRCREV = "b49bfdaad11be1de632f907d43485a7ac701ddc5"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 16c2095..1098f25 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "0b00ee6f6c311a7f5c0b4f2441dad97a454d172e"
+SRCREV = "33d15b76dfdb95da5970b8e0294bbb87ea1eb9a8"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 4139db1..b16978b 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "9a70ee2389d3302f6a4262325f8a76e4d867b478"
+SRCREV = "84feab670cce8414ad54f4d19b46291c7fdb14cf"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 6c300e5..09fef6c 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "e02df9c098b4d304b34c0ff65806a0576e45ed1a"
+SRCREV = "612c3041475550837dee7149b9f5e9e4f55c17a0"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 8cbe0e0..a467f99 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -30,7 +30,4 @@ do_install_append() {
 
 QT_MODULE_BRANCH = "dev"
 
-# qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
-# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.6
-
 SRCREV = "236b6b544fd2049eb46e8f79d13bb7aa35ba002f"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index dbb9438..8cf6ada 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From c6d62fcf2e02b5a86c36b4afd78dfb7a3f29ad91 Mon Sep 17 00:00:00 2001
+From e80743f15443212823e95d2be82073980a4700bc Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH] Allow to build only lrelease + lupdate + lconvert
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index b5e9293..fe8fe3d 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From 34f23c43f1c656ccd424528821a9ac65a98c5fec Mon Sep 17 00:00:00 2001
+From d7943b08bdb858bd2501c93a428ebc13bc9f3cfc Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH] assistant/help: fix linking of dependent libraries
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index f0f40b7..aca2fbc 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From b77f225e25360832074692681c5ff7c13862102d Mon Sep 17 00:00:00 2001
+From 6c5bbd423c3c8f87d00c18384460ab418dccea95 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH] add noqtwebkit configuration
diff --git a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 16ff71e..4f59980 100644
--- a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From e65c5ea9f7ce6fade201ed15b44dcb4d82219b3f Mon Sep 17 00:00:00 2001
+From 3dfe38ac9b83ee94c8abfe1bb78b14050b0c9a6f Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH] linguist-tools cmake: allow overriding the location for
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 3a27bbd..b507cad 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "e33532e048fa12ee32429ca83ee31aa8f065147d"
+SRCREV = "d36d2c3026cae67c119384f47cb2680552c81aaf"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 93b147d..70f57bf 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "13f1f2f12ddfc9b84535361d77a5f0f0ec8c3e0f"
+SRCREV = "745f8d5329d0d6d98a8577a254d2ee3e7174634e"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index ca47da8..505f19b 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
+SRCREV = "bfa66ccb29f747e2cb07a4f2e561b165be9f211d"
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index 45493cf..c199f71 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From cadcacf58301251629a63ecd2682d58e6bf24cb8 Mon Sep 17 00:00:00 2001
+From 4334643f02fc333fa8b633ff614fa4ceecf4a8e6 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index f39707c..72f2953 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From 52971db84e3b2c429e8777953c0532dcb88b8e6b Mon Sep 17 00:00:00 2001
+From 3c5c13f2f991cc79363969fb3873d553dd985e7b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
@@ -14,15 +14,14 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/examples/wayland/wayland.pro b/examples/wayland/wayland.pro
-index d633fb9..643c7cd 100644
+index b67d12e..c5daad0 100644
 --- a/examples/wayland/wayland.pro
 +++ b/examples/wayland/wayland.pro
-@@ -9,5 +9,7 @@ contains(CONFIG, wayland-compositor) {
-         SUBDIRS += qml-compositor
-     }
- 
--    SUBDIRS += server-buffer
-+    contains(QT_CONFIG, opengles2) {
-+        SUBDIRS += server-buffer
-+    }
+@@ -9,4 +9,6 @@ qtHaveModule(quick) {
+     SUBDIRS += custom-extension
  }
+ 
+-SUBDIRS += server-buffer
++contains(QT_CONFIG, opengles2) {
++    SUBDIRS += server-buffer
++}
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index a1cee86..8f01658 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -36,4 +36,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
+SRCREV = "bfa66ccb29f747e2cb07a4f2e561b165be9f211d"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 79c6b23..869851b 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "64a106da72796377bbff5cce0ecc5a379b105498"
+SRCREV = "a2c3b32d08ed24279609a8c01b09c1147a9ff6b9"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index 75350c1..5fd3f06 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,4 +1,4 @@
-From 04be78d20ecc23e289e171e907bb5daf9393619d Mon Sep 17 00:00:00 2001
+From 66af547c2b3ed473b81421aa239d931d364f644d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
 Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
-index b860735..0ed5de3 100644
+index 63c3f76..331c975 100644
 --- a/src/3rdparty/chromium/base/base.gypi
 +++ b/src/3rdparty/chromium/base/base.gypi
-@@ -785,7 +785,7 @@
+@@ -801,7 +801,7 @@
                  ['include', '^nix/'],
                ],
            }],
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index c95fad0..287bf2b 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,4 +1,4 @@
-From dde0edc1681bb49580584028c2d7b5757e177cd1 Mon Sep 17 00:00:00 2001
+From d28e6ef9c684a7f8f59995995b5cb5a0b1791ee1 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
 Subject: [PATCH] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 2df689b..8d984c7 100644
+index 26db26f..277bf98 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -131,9 +131,9 @@ defineReplace(mocOutput) {
+@@ -168,9 +168,9 @@ defineReplace(mocOutput) {
    out = $$1
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
    for(ext, $$list($${QMAKE_EXT_CPP})): \
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index 00432bc..d5ed1ab 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,4 +1,4 @@
-From 3ae00f0217e4a0039f0855ea6cd945209b1734ee Mon Sep 17 00:00:00 2001
+From e40a18da9631fa21202836caf69b3343e8bae973 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 12:46:58 -0200
 Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index 18f268c..38e97d1 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,4 +1,4 @@
-From 6576e3135b839b53c422befac0a233f6dd1966bf Mon Sep 17 00:00:00 2001
+From 9f314e95248795bcce787f88bce77ba6058b34c7 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
 Subject: [PATCH] functions.prf: Make sure we only use the file name to
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 8d984c7..055e960 100644
+index 277bf98..d263be4 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -128,7 +128,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -165,7 +165,8 @@ defineReplace(findIncludedMocFiles) {
  }
  
  defineReplace(mocOutput) {
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index 78cb3fc..e041063 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From f4c64fbabdcc30d46d9181401aa1c9d78fcb0b2f Mon Sep 17 00:00:00 2001
+From 617028757a9afd334a0938e617429cca78363d69 Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
@@ -12,7 +12,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 055e960..379c9b5 100644
+index d263be4..879287a 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
 @@ -5,6 +5,12 @@ defineTest(isPlatformSupported) {
diff --git a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 901462c..0a708af 100644
--- a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From a2670f5ad67822b399e9dd7b3b87589be1da9749 Mon Sep 17 00:00:00 2001
+From d084661f50dbdc6a4014f9a2181462bba770437f Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
@@ -9,10 +9,10 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index 65bf25e..0447d07 100644
+index 892e99c..a4429d5 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
-@@ -56,6 +56,8 @@
+@@ -60,6 +60,8 @@
  #include <QString>
  #include <QtCore/qcompilerdetection.h>
  #include <QtGui/qaccessibleobject.h>
diff --git a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
index fa3faf4..3a97a4a 100644
--- a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From b523c4dd76f6205389d8f5771124f0451ec7183f Mon Sep 17 00:00:00 2001
+From 0999fbfe32480e737f23ed8fce8f35897b97c20a Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
@@ -9,10 +9,10 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/media_capture_devices_dispatcher.h
-index 500fe76..eda2824 100644
+index b13a9da..8a54cce 100644
 --- a/src/core/media_capture_devices_dispatcher.h
 +++ b/src/core/media_capture_devices_dispatcher.h
-@@ -43,6 +43,8 @@
+@@ -46,6 +46,8 @@
  #include <map>
  #include <QtCore/qcompilerdetection.h>
  
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 98b4bab..6d33219 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -1,12 +1,15 @@
 SUMMARY = "QtWebEngine combines the power of Chromium and Qt"
 
-LICENSE = "LGPL-3.0 & BSD"
+# Read http://blog.qt.io/blog/2016/01/13/new-agreement-with-the-kde-free-qt-foundation/
+LICENSE = "LGPL-3.0 & BSD & GPL-3.0 & The-Qt-Company-GPL-Exception-1.0"
 LIC_FILES_CHKSUM = " \
-    file://src/core/browser_context_qt.cpp;md5=5fe719c44250955a5d5f8fb15fc8b1da;beginline=1;endline=35 \
-    file://src/3rdparty/chromium/LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5 \
-    file://LICENSE.LGPLv3;md5=3dcffeed712d3c916f9a2d9135703aff \
+    file://src/core/browser_context_qt.cpp;md5=b5193b7d68699260f3b40b201365c8d2;beginline=1;endline=38 \
+    file://src/3rdparty/chromium/LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d \
+    file://LICENSE.LGPL3;md5=3dcffeed712d3c916f9a2d9135703aff \
     file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
+    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 "
 
 DEPENDS += " \
@@ -106,7 +109,7 @@ RDEPENDS_${PN}-examples += " \
     qtdeclarative-qmlplugins \
 "
 
-QT_MODULE_BRANCH_CHROMIUM = "45-based"
+QT_MODULE_BRANCH_CHROMIUM = "49-based"
 
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
@@ -119,8 +122,8 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "643aa579fc94933eefa8eb20af6729e2140cf480"
-SRCREV_chromium = "8252b18aa3efa52138e91f9756945afb142a1c8c"
+SRCREV_qtwebengine = "63cf26268996ae5580c77095a252696fa549b593"
+SRCREV_chromium = "ba40ed24a6d23e606397b650a7982b0998dbeaf4"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 63d02fa..2bc5e9d 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -19,4 +19,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "1b9a0fc9d1ded4f4f11b04eb0bb7d1de82d6eb34"
+SRCREV = "f3f9e2a1b772b718335331a603a6bee748928e49"
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 1f3dd2a..d96636e 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,4 +1,4 @@
-From 3e321803386278c52508d114f5096883e974a4bb Mon Sep 17 00:00:00 2001
+From 86bdd059606252b16c24432fbe4bba461406c1e4 Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
 Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
index 2114b42..d7627ec 100644
--- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
+++ b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -1,4 +1,4 @@
-From f1eb41ada1a9bb5f4073c8a48010555cbefeec34 Mon Sep 17 00:00:00 2001
+From f6989fec34f0bafdeda549d71751f236ef1f3b96 Mon Sep 17 00:00:00 2001
 From: Magnus Granberg <zorry@gentoo.org>
 Date: Fri, 27 Feb 2015 11:55:09 +0100
 Subject: [PATCH] Remove TEXTREL tag in x86
diff --git a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
index 5edc939..a16801b 100644
--- a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
@@ -1,4 +1,4 @@
-From 5e5545f49d91e1c40d85d2497e16495ee9e53c11 Mon Sep 17 00:00:00 2001
+From ed626df67e8287fadbfe2801c241c9717472dcf4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 5 Jun 2015 19:55:05 -0700
 Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index eb05ce2..22efe82 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -71,4 +71,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "71136c9621103522e85654c8e144d5f1c961de1c"
+SRCREV = "2e8517924b70a778463e463873eb3d8d0b623eed"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 66d9d74..282ae98 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "ba9306ec5a1271275d79b2f48ceb227f79352f33"
+SRCREV = "00156d63eea2fb7681a8a00a3144392d6325e5cb"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index d8beb50..e422817 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "f27489d66cc6d8263130451c26c7e4ae40acc6b4"
+SRCREV = "b414120c60ef8c3cc2aad7dca41092647d741a36"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index d78df14..33cedd6 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "5e6acdb2ea92add793835561e7a2d6b0ed8890f8"
+SRCREV = "fb1dc19bf195c530b7f44d18cc927472b9866a46"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.8.1



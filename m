Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2F1C25B70
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:55 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.63857.1699041164726183513
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dP3sGICU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CVab/D+r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96bee23b-a38d5082-d87a-43ef-ba5b-beea96bcda9f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041174;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qf3790286Mhqa6FNBcVu4sxpIlBa/+QoBYvZcUUUXBc=;
	b=dP3sGICUNwYYwTeeoRw96Hdgjv71DZt7hS9qaaDASPe+f4d0Nl1RdyXDrBbLqNgb
	RH4oU8HennDFh3g4SJDshtXx+IrnNZywzJ7rqGmP3NLaMo4mnIMZeN3zqoZ0/Q7IpCr
	j7Er1CihBtRxdCVRCjPOsS3G9dEA9rL1FeZSbHuk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041174;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qf3790286Mhqa6FNBcVu4sxpIlBa/+QoBYvZcUUUXBc=;
	b=CVab/D+rxIsslXFPhsELs4Hmdtv4nBOtyJE0e7M7SMLcE/s69o0qCupTO9UVYPZa
	sFtlMOPz0v7flB9rsMjxTQZnKWBW7/bPnjgd+n6EQjZbJxngxqNqOAEVP4n1FXD0i1v
	W5sJiq5BxbjJsJU/dhVObQgZaLVVft5JMRbdNfII=
Content-Type: multipart/mixed; boundary="===============8686382910930291769=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] sqlite-orm: upgrading to 1.8.2 FAILED
Message-ID: <0101018b96bee23b-a38d5082-d87a-43ef-ba5b-beea96bcda9f-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106016

--===============8686382910930291769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sqlite-orm* to *1.8.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-sqlite-orm-upgrade-1.5-1.8.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 6f41b4705c12decd050490dae85600aaf4603fd4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 18:31:51 +0000
Subject: [PATCH] sqlite-orm: upgrade 1.5 -> 1.8.2

---
 .../sqlite-orm/sqlite-orm_1.5.bb              |  24 -
 .../sqlite-orm/sqlite-orm_1.8.2.bb            | 728 ++++++++++++++++++
 2 files changed, 728 insertions(+), 24 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
 create mode 100644 meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb

diff --git a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
deleted file mode 100644
index db90bc589..000000000
--- a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "SQLite ORM light header only library for modern C++"
-HOMEPAGE = "https://github.com/fnc12/sqlite_orm"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b5bf5ee8bb16d8e19359efe11bdc3f2"
-
-inherit cmake
-
-DEPENDS += "sqlite3"
-
-SRCREV = "e8a9e9416f421303f4b8970caab26dadf8bae98b"
-SRC_URI = "git://github.com/fnc12/sqlite_orm;protocol=https;branch=master"
-S = "${WORKDIR}/git"
-
-EXTRA_OECMAKE += "-DSqliteOrm_BuildTests=OFF -DLIB_INSTALL_DIR=${libdir} \
-                  -DCMAKE_INSTALL_DIR=${libdir}/cmake \
-                  -DPKGCONFIG_INSTALL_DIR=${libdir}/pkgconfig"
-
-BBCLASSEXTEND = "native nativesdk"
-
-FILES:${PN}-dev += "${libdir}/cmake/${BPN}"
-
-# Header-only library
-RDEPENDS:${PN}-dev = ""
-RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
diff --git a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb
new file mode 100644
index 000000000..b8a539f20
--- /dev/null
+++ b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb
@@ -0,0 +1,728 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,29 +1,661 @@
+# -BSD 3-Clause License
+# -
+# -Copyright (c) 2017, Yevgeniy Zakharov
+# -All rights reserved.
+# -
+# -Redistribution and use in source and binary forms, with or without
+# -modification, are permitted provided that the following conditions are met:
+# -
+# -* Redistributions of source code must retain the above copyright notice, this
+# -  list of conditions and the following disclaimer.
+# -
+# -* Redistributions in binary form must reproduce the above copyright notice,
+# -  this list of conditions and the following disclaimer in the documentation
+# -  and/or other materials provided with the distribution.
+# -
+# -* Neither the name of the copyright holder nor the names of its
+# -  contributors may be used to endorse or promote products derived from
+# -  this software without specific prior written permission.
+# -
+# -THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# -AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# -IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# -DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
+# -FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+# -DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+# -SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+# -CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+# -OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+# -OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +                    GNU AFFERO GENERAL PUBLIC LICENSE
+# +                       Version 3, 19 November 2007
+# +
+# + Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+# + Everyone is permitted to copy and distribute verbatim copies
+# + of this license document, but changing it is not allowed.
+# +
+# +                            Preamble
+# +
+# +  The GNU Affero General Public License is a free, copyleft license for
+# +software and other kinds of works, specifically designed to ensure
+# +cooperation with the community in the case of network server software.
+# +
+# +  The licenses for most software and other practical works are designed
+# +to take away your freedom to share and change the works.  By contrast,
+# +our General Public Licenses are intended to guarantee your freedom to
+# +share and change all versions of a program--to make sure it remains free
+# +software for all its users.
+# +
+# +  When we speak of free software, we are referring to freedom, not
+# +price.  Our General Public Licenses are designed to make sure that you
+# +have the freedom to distribute copies of free software (and charge for
+# +them if you wish), that you receive source code or can get it if you
+# +want it, that you can change the software or use pieces of it in new
+# +free programs, and that you know you can do these things.
+# +
+# +  Developers that use our General Public Licenses protect your rights
+# +with two steps: (1) assert copyright on the software, and (2) offer
+# +you this License which gives you legal permission to copy, distribute
+# +and/or modify the software.
+# +
+# +  A secondary benefit of defending all users' freedom is that
+# +improvements made in alternate versions of the program, if they
+# +receive widespread use, become available for other developers to
+# +incorporate.  Many developers of free software are heartened and
+# +encouraged by the resulting cooperation.  However, in the case of
+# +software used on network servers, this result may fail to come about.
+# +The GNU General Public License permits making a modified version and
+# +letting the public access it on a server without ever releasing its
+# +source code to the public.
+# +
+# +  The GNU Affero General Public License is designed specifically to
+# +ensure that, in such cases, the modified source code becomes available
+# +to the community.  It requires the operator of a network server to
+# +provide the source code of the modified version running there to the
+# +users of that server.  Therefore, public use of a modified version, on
+# +a publicly accessible server, gives the public access to the source
+# +code of the modified version.
+# +
+# +  An older license, called the Affero General Public License and
+# +published by Affero, was designed to accomplish similar goals.  This is
+# +a different license, not a version of the Affero GPL, but Affero has
+# +released a new version of the Affero GPL which permits relicensing under
+# +this license.
+# +
+# +  The precise terms and conditions for copying, distribution and
+# +modification follow.
+# +
+# +                       TERMS AND CONDITIONS
+# +
+# +  0. Definitions.
+# +
+# +  "This License" refers to version 3 of the GNU Affero General Public License.
+# +
+# +  "Copyright" also means copyright-like laws that apply to other kinds of
+# +works, such as semiconductor masks.
+# +
+# +  "The Program" refers to any copyrightable work licensed under this
+# +License.  Each licensee is addressed as "you".  "Licensees" and
+# +"recipients" may be individuals or organizations.
+# +
+# +  To "modify" a work means to copy from or adapt all or part of the work
+# +in a fashion requiring copyright permission, other than the making of an
+# +exact copy.  The resulting work is called a "modified version" of the
+# +earlier work or a work "based on" the earlier work.
+# +
+# +  A "covered work" means either the unmodified Program or a work based
+# +on the Program.
+# +
+# +  To "propagate" a work means to do anything with it that, without
+# +permission, would make you directly or secondarily liable for
+# +infringement under applicable copyright law, except executing it on a
+# +computer or modifying a private copy.  Propagation includes copying,
+# +distribution (with or without modification), making available to the
+# +public, and in some countries other activities as well.
+# +
+# +  To "convey" a work means any kind of propagation that enables other
+# +parties to make or receive copies.  Mere interaction with a user through
+# +a computer network, with no transfer of a copy, is not conveying.
+# +
+# +  An interactive user interface displays "Appropriate Legal Notices"
+# +to the extent that it includes a convenient and prominently visible
+# +feature that (1) displays an appropriate copyright notice, and (2)
+# +tells the user that there is no warranty for the work (except to the
+# +extent that warranties are provided), that licensees may convey the
+# +work under this License, and how to view a copy of this License.  If
+# +the interface presents a list of user commands or options, such as a
+# +menu, a prominent item in the list meets this criterion.
+# +
+# +  1. Source Code.
+# +
+# +  The "source code" for a work means the preferred form of the work
+# +for making modifications to it.  "Object code" means any non-source
+# +form of a work.
+# +
+# +  A "Standard Interface" means an interface that either is an official
+# +standard defined by a recognized standards body, or, in the case of
+# +interfaces specified for a particular programming language, one that
+# +is widely used among developers working in that language.
+# +
+# +  The "System Libraries" of an executable work include anything, other
+# +than the work as a whole, that (a) is included in the normal form of
+# +packaging a Major Component, but which is not part of that Major
+# +Component, and (b) serves only to enable use of the work with that
+# +Major Component, or to implement a Standard Interface for which an
+# +implementation is available to the public in source code form.  A
+# +"Major Component", in this context, means a major essential component
+# +(kernel, window system, and so on) of the specific operating system
+# +(if any) on which the executable work runs, or a compiler used to
+# +produce the work, or an object code interpreter used to run it.
+# +
+# +  The "Corresponding Source" for a work in object code form means all
+# +the source code needed to generate, install, and (for an executable
+# +work) run the object code and to modify the work, including scripts to
+# +control those activities.  However, it does not include the work's
+# +System Libraries, or general-purpose tools or generally available free
+# +programs which are used unmodified in performing those activities but
+# +which are not part of the work.  For example, Corresponding Source
+# +includes interface definition files associated with source files for
+# +the work, and the source code for shared libraries and dynamically
+# +linked subprograms that the work is specifically designed to require,
+# +such as by intimate data communication or control flow between those
+# +subprograms and other parts of the work.
+# +
+# +  The Corresponding Source need not include anything that users
+# +can regenerate automatically from other parts of the Corresponding
+# +Source.
+# +
+# +  The Corresponding Source for a work in source code form is that
+# +same work.
+# +
+# +  2. Basic Permissions.
+# +
+# +  All rights granted under this License are granted for the term of
+# +copyright on the Program, and are irrevocable provided the stated
+# +conditions are met.  This License explicitly affirms your unlimited
+# +permission to run the unmodified Program.  The output from running a
+# +covered work is covered by this License only if the output, given its
+# +content, constitutes a covered work.  This License acknowledges your
+# +rights of fair use or other equivalent, as provided by copyright law.
+# +
+# +  You may make, run and propagate covered works that you do not
+# +convey, without conditions so long as your license otherwise remains
+# +in force.  You may convey covered works to others for the sole purpose
+# +of having them make modifications exclusively for you, or provide you
+# +with facilities for running those works, provided that you comply with
+# +the terms of this License in conveying all material for which you do
+# +not control copyright.  Those thus making or running the covered works
+# +for you must do so exclusively on your behalf, under your direction
+# +and control, on terms that prohibit them from making any copies of
+# +your copyrighted material outside their relationship with you.
+# +
+# +  Conveying under any other circumstances is permitted solely under
+# +the conditions stated below.  Sublicensing is not allowed; section 10
+# +makes it unnecessary.
+# +
+# +  3. Protecting Users' Legal Rights From Anti-Circumvention Law.
+# +
+# +  No covered work shall be deemed part of an effective technological
+# +measure under any applicable law fulfilling obligations under article
+# +11 of the WIPO copyright treaty adopted on 20 December 1996, or
+# +similar laws prohibiting or restricting circumvention of such
+# +measures.
+# +
+# +  When you convey a covered work, you waive any legal power to forbid
+# +circumvention of technological measures to the extent such circumvention
+# +is effected by exercising rights under this License with respect to
+# +the covered work, and you disclaim any intention to limit operation or
+# +modification of the work as a means of enforcing, against the work's
+# +users, your or third parties' legal rights to forbid circumvention of
+# +technological measures.
+# +
+# +  4. Conveying Verbatim Copies.
+# +
+# +  You may convey verbatim copies of the Program's source code as you
+# +receive it, in any medium, provided that you conspicuously and
+# +appropriately publish on each copy an appropriate copyright notice;
+# +keep intact all notices stating that this License and any
+# +non-permissive terms added in accord with section 7 apply to the code;
+# +keep intact all notices of the absence of any warranty; and give all
+# +recipients a copy of this License along with the Program.
+# +
+# +  You may charge any price or no price for each copy that you convey,
+# +and you may offer support or warranty protection for a fee.
+# +
+# +  5. Conveying Modified Source Versions.
+# +
+# +  You may convey a work based on the Program, or the modifications to
+# +produce it from the Program, in the form of source code under the
+# +terms of section 4, provided that you also meet all of these conditions:
+# +
+# +    a) The work must carry prominent notices stating that you modified
+# +    it, and giving a relevant date.
+# +
+# +    b) The work must carry prominent notices stating that it is
+# +    released under this License and any conditions added under section
+# +    7.  This requirement modifies the requirement in section 4 to
+# +    "keep intact all notices".
+# +
+# +    c) You must license the entire work, as a whole, under this
+# +    License to anyone who comes into possession of a copy.  This
+# +    License will therefore apply, along with any applicable section 7
+# +    additional terms, to the whole of the work, and all its parts,
+# +    regardless of how they are packaged.  This License gives no
+# +    permission to license the work in any other way, but it does not
+# +    invalidate such permission if you have separately received it.
+# +
+# +    d) If the work has interactive user interfaces, each must display
+# +    Appropriate Legal Notices; however, if the Program has interactive
+# +    interfaces that do not display Appropriate Legal Notices, your
+# +    work need not make them do so.
+# +
+# +  A compilation of a covered work with other separate and independent
+# +works, which are not by their nature extensions of the covered work,
+# +and which are not combined with it such as to form a larger program,
+# +in or on a volume of a storage or distribution medium, is called an
+# +"aggregate" if the compilation and its resulting copyright are not
+# +used to limit the access or legal rights of the compilation's users
+# +beyond what the individual works permit.  Inclusion of a covered work
+# +in an aggregate does not cause this License to apply to the other
+# +parts of the aggregate.
+# +
+# +  6. Conveying Non-Source Forms.
+# +
+# +  You may convey a covered work in object code form under the terms
+# +of sections 4 and 5, provided that you also convey the
+# +machine-readable Corresponding Source under the terms of this License,
+# +in one of these ways:
+# +
+# +    a) Convey the object code in, or embodied in, a physical product
+# +    (including a physical distribution medium), accompanied by the
+# +    Corresponding Source fixed on a durable physical medium
+# +    customarily used for software interchange.
+# +
+# +    b) Convey the object code in, or embodied in, a physical product
+# +    (including a physical distribution medium), accompanied by a
+# +    written offer, valid for at least three years and valid for as
+# +    long as you offer spare parts or customer support for that product
+# +    model, to give anyone who possesses the object code either (1) a
+# +    copy of the Corresponding Source for all the software in the
+# +    product that is covered by this License, on a durable physical
+# +    medium customarily used for software interchange, for a price no
+# +    more than your reasonable cost of physically performing this
+# +    conveying of source, or (2) access to copy the
+# +    Corresponding Source from a network server at no charge.
+# +
+# +    c) Convey individual copies of the object code with a copy of the
+# +    written offer to provide the Corresponding Source.  This
+# +    alternative is allowed only occasionally and noncommercially, and
+# +    only if you received the object code with such an offer, in accord
+# +    with subsection 6b.
+# +
+# +    d) Convey the object code by offering access from a designated
+# +    place (gratis or for a charge), and offer equivalent access to the
+# +    Corresponding Source in the same way through the same place at no
+# +    further charge.  You need not require recipients to copy the
+# +    Corresponding Source along with the object code.  If the place to
+# +    copy the object code is a network server, the Corresponding Source
+# +    may be on a different server (operated by you or a third party)
+# +    that supports equivalent copying facilities, provided you maintain
+# +    clear directions next to the object code saying where to find the
+# +    Corresponding Source.  Regardless of what server hosts the
+# +    Corresponding Source, you remain obligated to ensure that it is
+# +    available for as long as needed to satisfy these requirements.
+# +
+# +    e) Convey the object code using peer-to-peer transmission, provided
+# +    you inform other peers where the object code and Corresponding
+# +    Source of the work are being offered to the general public at no
+# +    charge under subsection 6d.
+# +
+# +  A separable portion of the object code, whose source code is excluded
+# +from the Corresponding Source as a System Library, need not be
+# +included in conveying the object code work.
+# +
+# +  A "User Product" is either (1) a "consumer product", which means any
+# +tangible personal property which is normally used for personal, family,
+# +or household purposes, or (2) anything designed or sold for incorporation
+# +into a dwelling.  In determining whether a product is a consumer product,
+# +doubtful cases shall be resolved in favor of coverage.  For a particular
+# +product received by a particular user, "normally used" refers to a
+# +typical or common use of that class of product, regardless of the status
+# +of the particular user or of the way in which the particular user
+# +actually uses, or expects or is expected to use, the product.  A product
+# +is a consumer product regardless of whether the product has substantial
+# +commercial, industrial or non-consumer uses, unless such uses represent
+# +the only significant mode of use of the product.
+# +
+# +  "Installation Information" for a User Product means any methods,
+# +procedures, authorization keys, or other information required to install
+# +and execute modified versions of a covered work in that User Product from
+# +a modified version of its Corresponding Source.  The information must
+# +suffice to ensure that the continued functioning of the modified object
+# +code is in no case prevented or interfered with solely because
+# +modification has been made.
+# +
+# +  If you convey an object code work under this section in, or with, or
+# +specifically for use in, a User Product, and the conveying occurs as
+# +part of a transaction in which the right of possession and use of the
+# +User Product is transferred to the recipient in perpetuity or for a
+# +fixed term (regardless of how the transaction is characterized), the
+# +Corresponding Source conveyed under this section must be accompanied
+# +by the Installation Information.  But this requirement does not apply
+# +if neither you nor any third party retains the ability to install
+# +modified object code on the User Product (for example, the work has
+# +been installed in ROM).
+# +
+# +  The requirement to provide Installation Information does not include a
+# +requirement to continue to provide support service, warranty, or updates
+# +for a work that has been modified or installed by the recipient, or for
+# +the User Product in which it has been modified or installed.  Access to a
+# +network may be denied when the modification itself materially and
+# +adversely affects the operation of the network or violates the rules and
+# +protocols for communication across the network.
+# +
+# +  Corresponding Source conveyed, and Installation Information provided,
+# +in accord with this section must be in a format that is publicly
+# +documented (and with an implementation available to the public in
+# +source code form), and must require no special password or key for
+# +unpacking, reading or copying.
+# +
+# +  7. Additional Terms.
+# +
+# +  "Additional permissions" are terms that supplement the terms of this
+# +License by making exceptions from one or more of its conditions.
+# +Additional permissions that are applicable to the entire Program shall
+# +be treated as though they were included in this License, to the extent
+# +that they are valid under applicable law.  If additional permissions
+# +apply only to part of the Program, that part may be used separately
+# +under those permissions, but the entire Program remains governed by
+# +this License without regard to the additional permissions.
+# +
+# +  When you convey a copy of a covered work, you may at your option
+# +remove any additional permissions from that copy, or from any part of
+# +it.  (Additional permissions may be written to require their own
+# +removal in certain cases when you modify the work.)  You may place
+# +additional permissions on material, added by you to a covered work,
+# +for which you have or can give appropriate copyright permission.
+# +
+# +  Notwithstanding any other provision of this License, for material you
+# +add to a covered work, you may (if authorized by the copyright holders of
+# +that material) supplement the terms of this License with terms:
+# +
+# +    a) Disclaiming warranty or limiting liability differently from the
+# +    terms of sections 15 and 16 of this License; or
+# +
+# +    b) Requiring preservation of specified reasonable legal notices or
+# +    author attributions in that material or in the Appropriate Legal
+# +    Notices displayed by works containing it; or
+# +
+# +    c) Prohibiting misrepresentation of the origin of that material, or
+# +    requiring that modified versions of such material be marked in
+# +    reasonable ways as different from the original version; or
+# +
+# +    d) Limiting the use for publicity purposes of names of licensors or
+# +    authors of the material; or
+# +
+# +    e) Declining to grant rights under trademark law for use of some
+# +    trade names, trademarks, or service marks; or
+# +
+# +    f) Requiring indemnification of licensors and authors of that
+# +    material by anyone who conveys the material (or modified versions of
+# +    it) with contractual assumptions of liability to the recipient, for
+# +    any liability that these contractual assumptions directly impose on
+# +    those licensors and authors.
+# +
+# +  All other non-permissive additional terms are considered "further
+# +restrictions" within the meaning of section 10.  If the Program as you
+# +received it, or any part of it, contains a notice stating that it is
+# +governed by this License along with a term that is a further
+# +restriction, you may remove that term.  If a license document contains
+# +a further restriction but permits relicensing or conveying under this
+# +License, you may add to a covered work material governed by the terms
+# +of that license document, provided that the further restriction does
+# +not survive such relicensing or conveying.
+# +
+# +  If you add terms to a covered work in accord with this section, you
+# +must place, in the relevant source files, a statement of the
+# +additional terms that apply to those files, or a notice indicating
+# +where to find the applicable terms.
+# +
+# +  Additional terms, permissive or non-permissive, may be stated in the
+# +form of a separately written license, or stated as exceptions;
+# +the above requirements apply either way.
+# +
+# +  8. Termination.
+# +
+# +  You may not propagate or modify a covered work except as expressly
+# +provided under this License.  Any attempt otherwise to propagate or
+# +modify it is void, and will automatically terminate your rights under
+# +this License (including any patent licenses granted under the third
+# +paragraph of section 11).
+# +
+# +  However, if you cease all violation of this License, then your
+# +license from a particular copyright holder is reinstated (a)
+# +provisionally, unless and until the copyright holder explicitly and
+# +finally terminates your license, and (b) permanently, if the copyright
+# +holder fails to notify you of the violation by some reasonable means
+# +prior to 60 days after the cessation.
+# +
+# +  Moreover, your license from a particular copyright holder is
+# +reinstated permanently if the copyright holder notifies you of the
+# +violation by some reasonable means, this is the first time you have
+# +received notice of violation of this License (for any work) from that
+# +copyright holder, and you cure the violation prior to 30 days after
+# +your receipt of the notice.
+# +
+# +  Termination of your rights under this section does not terminate the
+# +licenses of parties who have received copies or rights from you under
+# +this License.  If your rights have been terminated and not permanently
+# +reinstated, you do not qualify to receive new licenses for the same
+# +material under section 10.
+# +
+# +  9. Acceptance Not Required for Having Copies.
+# +
+# +  You are not required to accept this License in order to receive or
+# +run a copy of the Program.  Ancillary propagation of a covered work
+# +occurring solely as a consequence of using peer-to-peer transmission
+# +to receive a copy likewise does not require acceptance.  However,
+# +nothing other than this License grants you permission to propagate or
+# +modify any covered work.  These actions infringe copyright if you do
+# +not accept this License.  Therefore, by modifying or propagating a
+# +covered work, you indicate your acceptance of this License to do so.
+# +
+# +  10. Automatic Licensing of Downstream Recipients.
+# +
+# +  Each time you convey a covered work, the recipient automatically
+# +receives a license from the original licensors, to run, modify and
+# +propagate that work, subject to this License.  You are not responsible
+# +for enforcing compliance by third parties with this License.
+# +
+# +  An "entity transaction" is a transaction transferring control of an
+# +organization, or substantially all assets of one, or subdividing an
+# +organization, or merging organizations.  If propagation of a covered
+# +work results from an entity transaction, each party to that
+# +transaction who receives a copy of the work also receives whatever
+# +licenses to the work the party's predecessor in interest had or could
+# +give under the previous paragraph, plus a right to possession of the
+# +Corresponding Source of the work from the predecessor in interest, if
+# +the predecessor has it or can get it with reasonable efforts.
+# +
+# +  You may not impose any further restrictions on the exercise of the
+# +rights granted or affirmed under this License.  For example, you may
+# +not impose a license fee, royalty, or other charge for exercise of
+# +rights granted under this License, and you may not initiate litigation
+# +(including a cross-claim or counterclaim in a lawsuit) alleging that
+# +any patent claim is infringed by making, using, selling, offering for
+# +sale, or importing the Program or any portion of it.
+# +
+# +  11. Patents.
+# +
+# +  A "contributor" is a copyright holder who authorizes use under this
+# +License of the Program or a work on which the Program is based.  The
+# +work thus licensed is called the contributor's "contributor version".
+# +
+# +  A contributor's "essential patent claims" are all patent claims
+# +owned or controlled by the contributor, whether already acquired or
+# +hereafter acquired, that would be infringed by some manner, permitted
+# +by this License, of making, using, or selling its contributor version,
+# +but do not include claims that would be infringed only as a
+# +consequence of further modification of the contributor version.  For
+# +purposes of this definition, "control" includes the right to grant
+# +patent sublicenses in a manner consistent with the requirements of
+# +this License.
+# +
+# +  Each contributor grants you a non-exclusive, worldwide, royalty-free
+# +patent license under the contributor's essential patent claims, to
+# +make, use, sell, offer for sale, import and otherwise run, modify and
+# +propagate the contents of its contributor version.
+# +
+# +  In the following three paragraphs, a "patent license" is any express
+# +agreement or commitment, however denominated, not to enforce a patent
+# +(such as an express permission to practice a patent or covenant not to
+# +sue for patent infringement).  To "grant" such a patent license to a
+# +party means to make such an agreement or commitment not to enforce a
+# +patent against the party.
+# +
+# +  If you convey a covered work, knowingly relying on a patent license,
+# +and the Corresponding Source of the work is not available for anyone
+# +to copy, free of charge and under the terms of this License, through a
+# +publicly available network server or other readily accessible means,
+# +then you must either (1) cause the Corresponding Source to be so
+# +available, or (2) arrange to deprive yourself of the benefit of the
+# +patent license for this particular work, or (3) arrange, in a manner
+# +consistent with the requirements of this License, to extend the patent
+# +license to downstream recipients.  "Knowingly relying" means you have
+# +actual knowledge that, but for the patent license, your conveying the
+# +covered work in a country, or your recipient's use of the covered work
+# +in a country, would infringe one or more identifiable patents in that
+# +country that you have reason to believe are valid.
+# +
+# +  If, pursuant to or in connection with a single transaction or
+# +arrangement, you convey, or propagate by procuring conveyance of, a
+# +covered work, and grant a patent license to some of the parties
+# +receiving the covered work authorizing them to use, propagate, modify
+# +or convey a specific copy of the covered work, then the patent license
+# +you grant is automatically extended to all recipients of the covered
+# +work and works based on it.
+# +
+# +  A patent license is "discriminatory" if it does not include within
+# +the scope of its coverage, prohibits the exercise of, or is
+# +conditioned on the non-exercise of one or more of the rights that are
+# +specifically granted under this License.  You may not convey a covered
+# +work if you are a party to an arrangement with a third party that is
+# +in the business of distributing software, under which you make payment
+# +to the third party based on the extent of your activity of conveying
+# +the work, and under which the third party grants, to any of the
+# +parties who would receive the covered work from you, a discriminatory
+# +patent license (a) in connection with copies of the covered work
+# +conveyed by you (or copies made from those copies), or (b) primarily
+# +for and in connection with specific products or compilations that
+# +contain the covered work, unless you entered into that arrangement,
+# +or that patent license was granted, prior to 28 March 2007.
+# +
+# +  Nothing in this License shall be construed as excluding or limiting
+# +any implied license or other defenses to infringement that may
+# +otherwise be available to you under applicable patent law.
+# +
+# +  12. No Surrender of Others' Freedom.
+# +
+# +  If conditions are imposed on you (whether by court order, agreement or
+# +otherwise) that contradict the conditions of this License, they do not
+# +excuse you from the conditions of this License.  If you cannot convey a
+# +covered work so as to satisfy simultaneously your obligations under this
+# +License and any other pertinent obligations, then as a consequence you may
+# +not convey it at all.  For example, if you agree to terms that obligate you
+# +to collect a royalty for further conveying from those to whom you convey
+# +the Program, the only way you could satisfy both those terms and this
+# +License would be to refrain entirely from conveying the Program.
+# +
+# +  13. Remote Network Interaction; Use with the GNU General Public License.
+# +
+# +  Notwithstanding any other provision of this License, if you modify the
+# +Program, your modified version must prominently offer all users
+# +interacting with it remotely through a computer network (if your version
+# +supports such interaction) an opportunity to receive the Corresponding
+# +Source of your version by providing access to the Corresponding Source
+# +from a network server at no charge, through some standard or customary
+# +means of facilitating copying of software.  This Corresponding Source
+# +shall include the Corresponding Source for any work covered by version 3
+# +of the GNU General Public License that is incorporated pursuant to the
+# +following paragraph.
+# +
+# +  Notwithstanding any other provision of this License, you have
+# +permission to link or combine any covered work with a work licensed
+# +under version 3 of the GNU General Public License into a single
+# +combined work, and to convey the resulting work.  The terms of this
+# +License will continue to apply to the part which is the covered work,
+# +but the work with which it is combined will remain governed by version
+# +3 of the GNU General Public License.
+# +
+# +  14. Revised Versions of this License.
+# +
+# +  The Free Software Foundation may publish revised and/or new versions of
+# +the GNU Affero General Public License from time to time.  Such new versions
+# +will be similar in spirit to the present version, but may differ in detail to
+# +address new problems or concerns.
+# +
+# +  Each version is given a distinguishing version number.  If the
+# +Program specifies that a certain numbered version of the GNU Affero General
+# +Public License "or any later version" applies to it, you have the
+# +option of following the terms and conditions either of that numbered
+# +version or of any later version published by the Free Software
+# +Foundation.  If the Program does not specify a version number of the
+# +GNU Affero General Public License, you may choose any version ever published
+# +by the Free Software Foundation.
+# +
+# +  If the Program specifies that a proxy can decide which future
+# +versions of the GNU Affero General Public License can be used, that proxy's
+# +public statement of acceptance of a version permanently authorizes you
+# +to choose that version for the Program.
+# +
+# +  Later license versions may give you additional or different
+# +permissions.  However, no additional obligations are imposed on any
+# +author or copyright holder as a result of your choosing to follow a
+# +later version.
+# +
+# +  15. Disclaimer of Warranty.
+# +
+# +  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
+# +APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
+# +HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
+# +OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
+# +THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+# +PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
+# +IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
+# +ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+# +
+# +  16. Limitation of Liability.
+# +
+# +  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+# +WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
+# +THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+# +GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
+# +USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
+# +DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
+# +PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
+# +EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
+# +SUCH DAMAGES.
+# +
+# +  17. Interpretation of Sections 15 and 16.
+# +
+# +  If the disclaimer of warranty and limitation of liability provided
+# +above cannot be given local legal effect according to their terms,
+# +reviewing courts shall apply local law that most closely approximates
+# +an absolute waiver of all civil liability in connection with the
+# +Program, unless a warranty or assumption of liability accompanies a
+# +copy of the Program in return for a fee.
+# +
+# +                     END OF TERMS AND CONDITIONS
+# +
+# +            How to Apply These Terms to Your New Programs
+# +
+# +  If you develop a new program, and you want it to be of the greatest
+# +possible use to the public, the best way to achieve this is to make it
+# +free software which everyone can redistribute and change under these terms.
+# +
+# +  To do so, attach the following notices to the program.  It is safest
+# +to attach them to the start of each source file to most effectively
+# +state the exclusion of warranty; and each file should have at least
+# +the "copyright" line and a pointer to where the full notice is found.
+# +
+# +    <one line to give the program's name and a brief idea of what it does.>
+# +    Copyright (C) <year>  <name of author>
+# +
+# +    This program is free software: you can redistribute it and/or modify
+# +    it under the terms of the GNU Affero General Public License as published
+# +    by the Free Software Foundation, either version 3 of the License, or
+# +    (at your option) any later version.
+# +
+# +    This program is distributed in the hope that it will be useful,
+# +    but WITHOUT ANY WARRANTY; without even the implied warranty of
+# +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# +    GNU Affero General Public License for more details.
+# +
+# +    You should have received a copy of the GNU Affero General Public License
+# +    along with this program.  If not, see <https://www.gnu.org/licenses/>.
+# +
+# +Also add information on how to contact you by electronic and paper mail.
+# +
+# +  If your software can interact with users remotely through a computer
+# +network, you should also make sure that it provides a way for users to
+# +get its source.  For example, if your program is a web application, its
+# +interface could display a "Source" link that leads users to an archive
+# +of the code.  There are many ways you could offer source, and different
+# +solutions will be better for different programs; see section 13 for the
+# +specific requirements.
+# +
+# +  You should also get your employer (if you work as a programmer) or school,
+# +if any, to sign a "copyright disclaimer" for the program, if necessary.
+# +For more information on this, and how to apply and follow the GNU AGPL, see
+# +<https://www.gnu.org/licenses/>.
+# 
+#
+
+SUMMARY = "SQLite ORM light header only library for modern C++"
+HOMEPAGE = "https://github.com/fnc12/sqlite_orm"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ae09d45eac4aa08d013b5f2e01c67f6"
+
+inherit cmake
+
+DEPENDS += "sqlite3"
+
+SRCREV = "ff7c878af872f7987b62d825284fb25d6043af10"
+SRC_URI = "git://github.com/fnc12/sqlite_orm;protocol=https;branch=master"
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE += "-DSqliteOrm_BuildTests=OFF -DLIB_INSTALL_DIR=${libdir} \
+                  -DCMAKE_INSTALL_DIR=${libdir}/cmake \
+                  -DPKGCONFIG_INSTALL_DIR=${libdir}/pkgconfig"
+
+BBCLASSEXTEND = "native nativesdk"
+
+FILES:${PN}-dev += "${libdir}/cmake/${BPN}"
+
+# Header-only library
+RDEPENDS:${PN}-dev = ""
+RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
2.39.2


--===============8686382910930291769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5044 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:971cac256facef2a29de1658bed6042f18b6fa15"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 156 Local 147 Mirrors 0 Missed 9 Current 153 (94% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 162 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 164 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 173 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_create_spdx_setscene)
NOTE: recipe sqlite-orm-1.8.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite-orm-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite-orm-1.8.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 248 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe sqlite-orm-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 254 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite-orm-1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite-orm-1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 289 of 923 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_fetch)
NOTE: recipe sqlite-orm-1.8.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 258 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite-orm-1.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 292 of 923 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 265 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 267 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite-orm-1.8.2-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite-orm-1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 768 of 923 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_patch)
NOTE: recipe sqlite-orm-1.8.2-r0: task do_patch: Started
NOTE: recipe sqlite-orm-1.8.2-r0: task do_patch: Succeeded
NOTE: Running task 770 of 923 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_generate_toolchain_file)
NOTE: recipe sqlite-orm-1.8.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe sqlite-orm-1.8.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 901 of 923 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 910 of 923 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe sqlite-orm-1.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite-orm-1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite-orm-1.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite-orm-1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 911 of 923 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_configure)
NOTE: recipe sqlite-orm-1.8.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:nativ
 e:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'quilt-native', 'sqlite3', 'ninja-native', 'patch-native', 'pseudo-native', 're2c-native', 'libtool-native', 'attr-native', 'libmpc-native', 'gmp-native', 'gnu-config-native', 'mpfr-native', 'linux-libc-headers', 'zstd-native', 'binutils-cross-x86_64', 'zlib-native', 'texinfo-dummy-native', 'flex-native', 'xz-native', 'libgcc', 'ncurses-native', 'bzip2-native', 'openssl-native', 'gettext-minimal-native', 'm4-native', 'perl-native', 'gdbm-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 13.2.0
| -- The CXX compiler identification is GNU 13.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- SQLITE_ORM: Build with C++14 features
| -- Configuring sqlite_orm 1.8.0
| -- Found SQLite3: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot/usr/include (found version "3.43.2")
| -- CMAKE_BUILD_TYPE:
| 
| CMAKE_C_FLAGS:  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/git=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/git=/usr/src/debug/sqlite-orm/1.8.2-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/build=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/build=/usr/src/debug/sqlite-orm/1.8.2-r0  -f
 debug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot-native=
| CMAKE_CXX_FLAGS:  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/git=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/git=/usr/src/debug/sqlite-orm/1.8.2-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/build=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/build=/usr/src/debug/sqlite-orm/1.8.2-r0  
 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot-native=  -fvisibility-inlines-hidden
| CMAKE_EXE_LINKER_FLAGS: -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/git=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/git=/usr/src/debug/sqlite-orm/1.8.2-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/build=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/build=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot=  -
 fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now
| CMAKE_MODULE_LINKER_FLAGS: -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/git=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/git=/usr/src/debug/sqlite-orm/1.8.2-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/build=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/build=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot=
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now
| CMAKE_SHARED_LINKER_FLAGS: -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/git=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/git=/usr/src/debug/sqlite-orm/1.8.2-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/build=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/build=/usr/src/debug/sqlite-orm/1.8.2-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot=
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/recipe-sysroot-native=  -Wl,-z,relro,-z,now
| CMAKE_STATIC_LINKER_FLAGS:
| 
| -- Configuring done (1.7s)
| CMake Error at tests/CMakeLists.txt:172 (target_link_libraries):
|   Target "unit_tests" links to:
| 
|     Catch2::Catch2WithMain
| 
|   but the target was not found.  Possible reasons include:
| 
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
| 
| 
| 
| -- Generating done (0.0s)
| CMake Warning:
|   Manually-specified variables were not used by the project:
| 
|     CMAKE_EXPORT_NO_PACKAGE_REGISTRY
|     CMAKE_INSTALL_DIR
|     LIB_INSTALL_DIR
|     LIB_SUFFIX
|     PKGCONFIG_INSTALL_DIR
|     PYTHON_EXECUTABLE
|     Python3_EXECUTABLE
|     Python_EXECUTABLE
|     SqliteOrm_BuildTests
| 
| 
| CMake Generate step failed.  Build files cannot be regenerated correctly.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/temp/run.do_configure.2268694:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-
 worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DSqliteOrm_BuildTests=OFF -DLIB_INSTALL_DIR=/usr/lib -DCMAKE_INSTALL_DIR=/usr/lib/cmake -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/temp/run.do_configure.2268694, line 162
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/temp/run.do_configure.2268694, line 141
| 	#3: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/temp/run.do_configure.2268694, line 180
NOTE: recipe sqlite-orm-1.8.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 911 tasks of which 904 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103183110.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103183110.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: sqlite-orm-1.8.2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/temp/run.do_configure.2268694', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sqlite-orm/1.8.2/temp/log.do_configure.2268694
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.8.2.bb:do_configure) failed with exit code '1'

--===============8686382910930291769==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite-orm-upgrade-1.5-1.8.2.patch"

RnJvbSA2ZjQxYjQ3MDVjMTJkZWNkMDUwNDkwZGFlODU2MDBhYWY0NjAzZmQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxODozMTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNx
bGl0ZS1vcm06IHVwZ3JhZGUgMS41IC0+IDEuOC4yCgotLS0KIC4uLi9zcWxpdGUtb3JtL3NxbGl0
ZS1vcm1fMS41LmJiICAgICAgICAgICAgICB8ICAyNCAtCiAuLi4vc3FsaXRlLW9ybS9zcWxpdGUt
b3JtXzEuOC4yLmJiICAgICAgICAgICAgfCA3MjggKysrKysrKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDcyOCBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvc3FsaXRlLW9ybS9zcWxpdGUtb3JtXzEu
NS5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9zcWxpdGUt
b3JtL3NxbGl0ZS1vcm1fMS44LjIuYmIKCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZGV2
dG9vbHMvc3FsaXRlLW9ybS9zcWxpdGUtb3JtXzEuNS5iYiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9zcWxpdGUtb3JtL3NxbGl0ZS1vcm1fMS41LmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCBkYjkwYmM1ODkuLjAwMDAwMDAwMAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9v
bHMvc3FsaXRlLW9ybS9zcWxpdGUtb3JtXzEuNS5iYgorKysgL2Rldi9udWxsCkBAIC0xLDI0ICsw
LDAgQEAKLVNVTU1BUlkgPSAiU1FMaXRlIE9STSBsaWdodCBoZWFkZXIgb25seSBsaWJyYXJ5IGZv
ciBtb2Rlcm4gQysrIgotSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2ZuYzEyL3NxbGl0
ZV9vcm0iCi1MSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTNiNWJmNWVlOGJiMTZkOGUxOTM1OWVmZTExYmRjM2YyIgotCi1pbmhl
cml0IGNtYWtlCi0KLURFUEVORFMgKz0gInNxbGl0ZTMiCi0KLVNSQ1JFViA9ICJlOGE5ZTk0MTZm
NDIxMzAzZjRiODk3MGNhYWIyNmRhZGY4YmFlOThiIgotU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL2ZuYzEyL3NxbGl0ZV9vcm07cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVMgPSAi
JHtXT1JLRElSfS9naXQiCi0KLUVYVFJBX09FQ01BS0UgKz0gIi1EU3FsaXRlT3JtX0J1aWxkVGVz
dHM9T0ZGIC1ETElCX0lOU1RBTExfRElSPSR7bGliZGlyfSBcCi0gICAgICAgICAgICAgICAgICAt
RENNQUtFX0lOU1RBTExfRElSPSR7bGliZGlyfS9jbWFrZSBcCi0gICAgICAgICAgICAgICAgICAt
RFBLR0NPTkZJR19JTlNUQUxMX0RJUj0ke2xpYmRpcn0vcGtnY29uZmlnIgotCi1CQkNMQVNTRVhU
RU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0KLUZJTEVTOiR7UE59LWRldiArPSAiJHtsaWJkaXJ9
L2NtYWtlLyR7QlBOfSIKLQotIyBIZWFkZXItb25seSBsaWJyYXJ5Ci1SREVQRU5EUzoke1BOfS1k
ZXYgPSAiIgotUlJFQ09NTUVORFM6JHtQTn0tZGJnID0gIiR7UE59LWRldiAoPSAke0VYVEVORFBL
R1Z9KSIKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9zcWxpdGUtb3JtL3Nx
bGl0ZS1vcm1fMS44LjIuYmIgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvc3FsaXRlLW9ybS9z
cWxpdGUtb3JtXzEuOC4yLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4u
YjhhNTM5ZjIwCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Nx
bGl0ZS1vcm0vc3FsaXRlLW9ybV8xLjguMi5iYgpAQCAtMCwwICsxLDcyOCBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsMjkgKzEsNjYxIEBA
CisjIC1CU0QgMy1DbGF1c2UgTGljZW5zZQorIyAtCisjIC1Db3B5cmlnaHQgKGMpIDIwMTcsIFll
dmdlbml5IFpha2hhcm92CisjIC1BbGwgcmlnaHRzIHJlc2VydmVkLgorIyAtCisjIC1SZWRpc3Ry
aWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhv
dXQKKyMgLW1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xs
b3dpbmcgY29uZGl0aW9ucyBhcmUgbWV0OgorIyAtCisjIC0qIFJlZGlzdHJpYnV0aW9ucyBvZiBz
b3VyY2UgY29kZSBtdXN0IHJldGFpbiB0aGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSwgdGhpcwor
IyAtICBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lci4KKyMg
LQorIyAtKiBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhl
IGFib3ZlIGNvcHlyaWdodCBub3RpY2UsCisjIC0gIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFu
ZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIgaW4gdGhlIGRvY3VtZW50YXRpb24KKyMgLSAgYW5k
L29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCisjIC0K
KyMgLSogTmVpdGhlciB0aGUgbmFtZSBvZiB0aGUgY29weXJpZ2h0IGhvbGRlciBub3IgdGhlIG5h
bWVzIG9mIGl0cworIyAtICBjb250cmlidXRvcnMgbWF5IGJlIHVzZWQgdG8gZW5kb3JzZSBvciBw
cm9tb3RlIHByb2R1Y3RzIGRlcml2ZWQgZnJvbQorIyAtICB0aGlzIHNvZnR3YXJlIHdpdGhvdXQg
c3BlY2lmaWMgcHJpb3Igd3JpdHRlbiBwZXJtaXNzaW9uLgorIyAtCisjIC1USElTIFNPRlRXQVJF
IElTIFBST1ZJREVEIEJZIFRIRSBDT1BZUklHSFQgSE9MREVSUyBBTkQgQ09OVFJJQlVUT1JTICJB
UyBJUyIKKyMgLUFORCBBTlkgRVhQUkVTUyBPUiBJTVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xVRElO
RywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUKKyMgLUlNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJD
SEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFSRQorIyAt
RElTQ0xBSU1FRC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFIENPUFlSSUdIVCBIT0xERVIgT1IgQ09O
VFJJQlVUT1JTIEJFIExJQUJMRQorIyAtRk9SIEFOWSBESVJFQ1QsIElORElSRUNULCBJTkNJREVO
VEFMLCBTUEVDSUFMLCBFWEVNUExBUlksIE9SIENPTlNFUVVFTlRJQUwKKyMgLURBTUFHRVMgKElO
Q0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBQUk9DVVJFTUVOVCBPRiBTVUJTVElUVVRFIEdP
T0RTIE9SCisjIC1TRVJWSUNFUzsgTE9TUyBPRiBVU0UsIERBVEEsIE9SIFBST0ZJVFM7IE9SIEJV
U0lORVNTIElOVEVSUlVQVElPTikgSE9XRVZFUgorIyAtQ0FVU0VEIEFORCBPTiBBTlkgVEhFT1JZ
IE9GIExJQUJJTElUWSwgV0hFVEhFUiBJTiBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwKKyMg
LU9SIFRPUlQgKElOQ0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkgQVJJU0lORyBJTiBB
TlkgV0FZIE9VVCBPRiBUSEUgVVNFCisjIC1PRiBUSElTIFNPRlRXQVJFLCBFVkVOIElGIEFEVklT
RUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyArICAgICAgICAgICAgICAg
ICAgICBHTlUgQUZGRVJPIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgKyAgICAgICAgICAgICAg
ICAgICAgICAgVmVyc2lvbiAzLCAxOSBOb3ZlbWJlciAyMDA3CisjICsKKyMgKyBDb3B5cmlnaHQg
KEMpIDIwMDcgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuIDxodHRwczovL2ZzZi5vcmcv
PgorIyArIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJh
dGltIGNvcGllcworIyArIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0
IGlzIG5vdCBhbGxvd2VkLgorIyArCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgUHJl
YW1ibGUKKyMgKworIyArICBUaGUgR05VIEFmZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGlz
IGEgZnJlZSwgY29weWxlZnQgbGljZW5zZSBmb3IKKyMgK3NvZnR3YXJlIGFuZCBvdGhlciBraW5k
cyBvZiB3b3Jrcywgc3BlY2lmaWNhbGx5IGRlc2lnbmVkIHRvIGVuc3VyZQorIyArY29vcGVyYXRp
b24gd2l0aCB0aGUgY29tbXVuaXR5IGluIHRoZSBjYXNlIG9mIG5ldHdvcmsgc2VydmVyIHNvZnR3
YXJlLgorIyArCisjICsgIFRoZSBsaWNlbnNlcyBmb3IgbW9zdCBzb2Z0d2FyZSBhbmQgb3RoZXIg
cHJhY3RpY2FsIHdvcmtzIGFyZSBkZXNpZ25lZAorIyArdG8gdGFrZSBhd2F5IHlvdXIgZnJlZWRv
bSB0byBzaGFyZSBhbmQgY2hhbmdlIHRoZSB3b3Jrcy4gIEJ5IGNvbnRyYXN0LAorIyArb3VyIEdl
bmVyYWwgUHVibGljIExpY2Vuc2VzIGFyZSBpbnRlbmRlZCB0byBndWFyYW50ZWUgeW91ciBmcmVl
ZG9tIHRvCisjICtzaGFyZSBhbmQgY2hhbmdlIGFsbCB2ZXJzaW9ucyBvZiBhIHByb2dyYW0tLXRv
IG1ha2Ugc3VyZSBpdCByZW1haW5zIGZyZWUKKyMgK3NvZnR3YXJlIGZvciBhbGwgaXRzIHVzZXJz
LgorIyArCisjICsgIFdoZW4gd2Ugc3BlYWsgb2YgZnJlZSBzb2Z0d2FyZSwgd2UgYXJlIHJlZmVy
cmluZyB0byBmcmVlZG9tLCBub3QKKyMgK3ByaWNlLiAgT3VyIEdlbmVyYWwgUHVibGljIExpY2Vu
c2VzIGFyZSBkZXNpZ25lZCB0byBtYWtlIHN1cmUgdGhhdCB5b3UKKyMgK2hhdmUgdGhlIGZyZWVk
b20gdG8gZGlzdHJpYnV0ZSBjb3BpZXMgb2YgZnJlZSBzb2Z0d2FyZSAoYW5kIGNoYXJnZSBmb3IK
KyMgK3RoZW0gaWYgeW91IHdpc2gpLCB0aGF0IHlvdSByZWNlaXZlIHNvdXJjZSBjb2RlIG9yIGNh
biBnZXQgaXQgaWYgeW91CisjICt3YW50IGl0LCB0aGF0IHlvdSBjYW4gY2hhbmdlIHRoZSBzb2Z0
d2FyZSBvciB1c2UgcGllY2VzIG9mIGl0IGluIG5ldworIyArZnJlZSBwcm9ncmFtcywgYW5kIHRo
YXQgeW91IGtub3cgeW91IGNhbiBkbyB0aGVzZSB0aGluZ3MuCisjICsKKyMgKyAgRGV2ZWxvcGVy
cyB0aGF0IHVzZSBvdXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZXMgcHJvdGVjdCB5b3VyIHJpZ2h0
cworIyArd2l0aCB0d28gc3RlcHM6ICgxKSBhc3NlcnQgY29weXJpZ2h0IG9uIHRoZSBzb2Z0d2Fy
ZSwgYW5kICgyKSBvZmZlcgorIyAreW91IHRoaXMgTGljZW5zZSB3aGljaCBnaXZlcyB5b3UgbGVn
YWwgcGVybWlzc2lvbiB0byBjb3B5LCBkaXN0cmlidXRlCisjICthbmQvb3IgbW9kaWZ5IHRoZSBz
b2Z0d2FyZS4KKyMgKworIyArICBBIHNlY29uZGFyeSBiZW5lZml0IG9mIGRlZmVuZGluZyBhbGwg
dXNlcnMnIGZyZWVkb20gaXMgdGhhdAorIyAraW1wcm92ZW1lbnRzIG1hZGUgaW4gYWx0ZXJuYXRl
IHZlcnNpb25zIG9mIHRoZSBwcm9ncmFtLCBpZiB0aGV5CisjICtyZWNlaXZlIHdpZGVzcHJlYWQg
dXNlLCBiZWNvbWUgYXZhaWxhYmxlIGZvciBvdGhlciBkZXZlbG9wZXJzIHRvCisjICtpbmNvcnBv
cmF0ZS4gIE1hbnkgZGV2ZWxvcGVycyBvZiBmcmVlIHNvZnR3YXJlIGFyZSBoZWFydGVuZWQgYW5k
CisjICtlbmNvdXJhZ2VkIGJ5IHRoZSByZXN1bHRpbmcgY29vcGVyYXRpb24uICBIb3dldmVyLCBp
biB0aGUgY2FzZSBvZgorIyArc29mdHdhcmUgdXNlZCBvbiBuZXR3b3JrIHNlcnZlcnMsIHRoaXMg
cmVzdWx0IG1heSBmYWlsIHRvIGNvbWUgYWJvdXQuCisjICtUaGUgR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgcGVybWl0cyBtYWtpbmcgYSBtb2RpZmllZCB2ZXJzaW9uIGFuZAorIyArbGV0dGlu
ZyB0aGUgcHVibGljIGFjY2VzcyBpdCBvbiBhIHNlcnZlciB3aXRob3V0IGV2ZXIgcmVsZWFzaW5n
IGl0cworIyArc291cmNlIGNvZGUgdG8gdGhlIHB1YmxpYy4KKyMgKworIyArICBUaGUgR05VIEFm
ZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGlzIGRlc2lnbmVkIHNwZWNpZmljYWxseSB0bwor
IyArZW5zdXJlIHRoYXQsIGluIHN1Y2ggY2FzZXMsIHRoZSBtb2RpZmllZCBzb3VyY2UgY29kZSBi
ZWNvbWVzIGF2YWlsYWJsZQorIyArdG8gdGhlIGNvbW11bml0eS4gIEl0IHJlcXVpcmVzIHRoZSBv
cGVyYXRvciBvZiBhIG5ldHdvcmsgc2VydmVyIHRvCisjICtwcm92aWRlIHRoZSBzb3VyY2UgY29k
ZSBvZiB0aGUgbW9kaWZpZWQgdmVyc2lvbiBydW5uaW5nIHRoZXJlIHRvIHRoZQorIyArdXNlcnMg
b2YgdGhhdCBzZXJ2ZXIuICBUaGVyZWZvcmUsIHB1YmxpYyB1c2Ugb2YgYSBtb2RpZmllZCB2ZXJz
aW9uLCBvbgorIyArYSBwdWJsaWNseSBhY2Nlc3NpYmxlIHNlcnZlciwgZ2l2ZXMgdGhlIHB1Ymxp
YyBhY2Nlc3MgdG8gdGhlIHNvdXJjZQorIyArY29kZSBvZiB0aGUgbW9kaWZpZWQgdmVyc2lvbi4K
KyMgKworIyArICBBbiBvbGRlciBsaWNlbnNlLCBjYWxsZWQgdGhlIEFmZmVybyBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFuZAorIyArcHVibGlzaGVkIGJ5IEFmZmVybywgd2FzIGRlc2lnbmVkIHRv
IGFjY29tcGxpc2ggc2ltaWxhciBnb2Fscy4gIFRoaXMgaXMKKyMgK2EgZGlmZmVyZW50IGxpY2Vu
c2UsIG5vdCBhIHZlcnNpb24gb2YgdGhlIEFmZmVybyBHUEwsIGJ1dCBBZmZlcm8gaGFzCisjICty
ZWxlYXNlZCBhIG5ldyB2ZXJzaW9uIG9mIHRoZSBBZmZlcm8gR1BMIHdoaWNoIHBlcm1pdHMgcmVs
aWNlbnNpbmcgdW5kZXIKKyMgK3RoaXMgbGljZW5zZS4KKyMgKworIyArICBUaGUgcHJlY2lzZSB0
ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3IgY29weWluZywgZGlzdHJpYnV0aW9uIGFuZAorIyArbW9k
aWZpY2F0aW9uIGZvbGxvdy4KKyMgKworIyArICAgICAgICAgICAgICAgICAgICAgICBURVJNUyBB
TkQgQ09ORElUSU9OUworIyArCisjICsgIDAuIERlZmluaXRpb25zLgorIyArCisjICsgICJUaGlz
IExpY2Vuc2UiIHJlZmVycyB0byB2ZXJzaW9uIDMgb2YgdGhlIEdOVSBBZmZlcm8gR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZS4KKyMgKworIyArICAiQ29weXJpZ2h0IiBhbHNvIG1lYW5zIGNvcHlyaWdo
dC1saWtlIGxhd3MgdGhhdCBhcHBseSB0byBvdGhlciBraW5kcyBvZgorIyArd29ya3MsIHN1Y2gg
YXMgc2VtaWNvbmR1Y3RvciBtYXNrcy4KKyMgKworIyArICAiVGhlIFByb2dyYW0iIHJlZmVycyB0
byBhbnkgY29weXJpZ2h0YWJsZSB3b3JrIGxpY2Vuc2VkIHVuZGVyIHRoaXMKKyMgK0xpY2Vuc2Uu
ICBFYWNoIGxpY2Vuc2VlIGlzIGFkZHJlc3NlZCBhcyAieW91Ii4gICJMaWNlbnNlZXMiIGFuZAor
IyArInJlY2lwaWVudHMiIG1heSBiZSBpbmRpdmlkdWFscyBvciBvcmdhbml6YXRpb25zLgorIyAr
CisjICsgIFRvICJtb2RpZnkiIGEgd29yayBtZWFucyB0byBjb3B5IGZyb20gb3IgYWRhcHQgYWxs
IG9yIHBhcnQgb2YgdGhlIHdvcmsKKyMgK2luIGEgZmFzaGlvbiByZXF1aXJpbmcgY29weXJpZ2h0
IHBlcm1pc3Npb24sIG90aGVyIHRoYW4gdGhlIG1ha2luZyBvZiBhbgorIyArZXhhY3QgY29weS4g
IFRoZSByZXN1bHRpbmcgd29yayBpcyBjYWxsZWQgYSAibW9kaWZpZWQgdmVyc2lvbiIgb2YgdGhl
CisjICtlYXJsaWVyIHdvcmsgb3IgYSB3b3JrICJiYXNlZCBvbiIgdGhlIGVhcmxpZXIgd29yay4K
KyMgKworIyArICBBICJjb3ZlcmVkIHdvcmsiIG1lYW5zIGVpdGhlciB0aGUgdW5tb2RpZmllZCBQ
cm9ncmFtIG9yIGEgd29yayBiYXNlZAorIyArb24gdGhlIFByb2dyYW0uCisjICsKKyMgKyAgVG8g
InByb3BhZ2F0ZSIgYSB3b3JrIG1lYW5zIHRvIGRvIGFueXRoaW5nIHdpdGggaXQgdGhhdCwgd2l0
aG91dAorIyArcGVybWlzc2lvbiwgd291bGQgbWFrZSB5b3UgZGlyZWN0bHkgb3Igc2Vjb25kYXJp
bHkgbGlhYmxlIGZvcgorIyAraW5mcmluZ2VtZW50IHVuZGVyIGFwcGxpY2FibGUgY29weXJpZ2h0
IGxhdywgZXhjZXB0IGV4ZWN1dGluZyBpdCBvbiBhCisjICtjb21wdXRlciBvciBtb2RpZnlpbmcg
YSBwcml2YXRlIGNvcHkuICBQcm9wYWdhdGlvbiBpbmNsdWRlcyBjb3B5aW5nLAorIyArZGlzdHJp
YnV0aW9uICh3aXRoIG9yIHdpdGhvdXQgbW9kaWZpY2F0aW9uKSwgbWFraW5nIGF2YWlsYWJsZSB0
byB0aGUKKyMgK3B1YmxpYywgYW5kIGluIHNvbWUgY291bnRyaWVzIG90aGVyIGFjdGl2aXRpZXMg
YXMgd2VsbC4KKyMgKworIyArICBUbyAiY29udmV5IiBhIHdvcmsgbWVhbnMgYW55IGtpbmQgb2Yg
cHJvcGFnYXRpb24gdGhhdCBlbmFibGVzIG90aGVyCisjICtwYXJ0aWVzIHRvIG1ha2Ugb3IgcmVj
ZWl2ZSBjb3BpZXMuICBNZXJlIGludGVyYWN0aW9uIHdpdGggYSB1c2VyIHRocm91Z2gKKyMgK2Eg
Y29tcHV0ZXIgbmV0d29yaywgd2l0aCBubyB0cmFuc2ZlciBvZiBhIGNvcHksIGlzIG5vdCBjb252
ZXlpbmcuCisjICsKKyMgKyAgQW4gaW50ZXJhY3RpdmUgdXNlciBpbnRlcmZhY2UgZGlzcGxheXMg
IkFwcHJvcHJpYXRlIExlZ2FsIE5vdGljZXMiCisjICt0byB0aGUgZXh0ZW50IHRoYXQgaXQgaW5j
bHVkZXMgYSBjb252ZW5pZW50IGFuZCBwcm9taW5lbnRseSB2aXNpYmxlCisjICtmZWF0dXJlIHRo
YXQgKDEpIGRpc3BsYXlzIGFuIGFwcHJvcHJpYXRlIGNvcHlyaWdodCBub3RpY2UsIGFuZCAoMikK
KyMgK3RlbGxzIHRoZSB1c2VyIHRoYXQgdGhlcmUgaXMgbm8gd2FycmFudHkgZm9yIHRoZSB3b3Jr
IChleGNlcHQgdG8gdGhlCisjICtleHRlbnQgdGhhdCB3YXJyYW50aWVzIGFyZSBwcm92aWRlZCks
IHRoYXQgbGljZW5zZWVzIG1heSBjb252ZXkgdGhlCisjICt3b3JrIHVuZGVyIHRoaXMgTGljZW5z
ZSwgYW5kIGhvdyB0byB2aWV3IGEgY29weSBvZiB0aGlzIExpY2Vuc2UuICBJZgorIyArdGhlIGlu
dGVyZmFjZSBwcmVzZW50cyBhIGxpc3Qgb2YgdXNlciBjb21tYW5kcyBvciBvcHRpb25zLCBzdWNo
IGFzIGEKKyMgK21lbnUsIGEgcHJvbWluZW50IGl0ZW0gaW4gdGhlIGxpc3QgbWVldHMgdGhpcyBj
cml0ZXJpb24uCisjICsKKyMgKyAgMS4gU291cmNlIENvZGUuCisjICsKKyMgKyAgVGhlICJzb3Vy
Y2UgY29kZSIgZm9yIGEgd29yayBtZWFucyB0aGUgcHJlZmVycmVkIGZvcm0gb2YgdGhlIHdvcmsK
KyMgK2ZvciBtYWtpbmcgbW9kaWZpY2F0aW9ucyB0byBpdC4gICJPYmplY3QgY29kZSIgbWVhbnMg
YW55IG5vbi1zb3VyY2UKKyMgK2Zvcm0gb2YgYSB3b3JrLgorIyArCisjICsgIEEgIlN0YW5kYXJk
IEludGVyZmFjZSIgbWVhbnMgYW4gaW50ZXJmYWNlIHRoYXQgZWl0aGVyIGlzIGFuIG9mZmljaWFs
CisjICtzdGFuZGFyZCBkZWZpbmVkIGJ5IGEgcmVjb2duaXplZCBzdGFuZGFyZHMgYm9keSwgb3Is
IGluIHRoZSBjYXNlIG9mCisjICtpbnRlcmZhY2VzIHNwZWNpZmllZCBmb3IgYSBwYXJ0aWN1bGFy
IHByb2dyYW1taW5nIGxhbmd1YWdlLCBvbmUgdGhhdAorIyAraXMgd2lkZWx5IHVzZWQgYW1vbmcg
ZGV2ZWxvcGVycyB3b3JraW5nIGluIHRoYXQgbGFuZ3VhZ2UuCisjICsKKyMgKyAgVGhlICJTeXN0
ZW0gTGlicmFyaWVzIiBvZiBhbiBleGVjdXRhYmxlIHdvcmsgaW5jbHVkZSBhbnl0aGluZywgb3Ro
ZXIKKyMgK3RoYW4gdGhlIHdvcmsgYXMgYSB3aG9sZSwgdGhhdCAoYSkgaXMgaW5jbHVkZWQgaW4g
dGhlIG5vcm1hbCBmb3JtIG9mCisjICtwYWNrYWdpbmcgYSBNYWpvciBDb21wb25lbnQsIGJ1dCB3
aGljaCBpcyBub3QgcGFydCBvZiB0aGF0IE1ham9yCisjICtDb21wb25lbnQsIGFuZCAoYikgc2Vy
dmVzIG9ubHkgdG8gZW5hYmxlIHVzZSBvZiB0aGUgd29yayB3aXRoIHRoYXQKKyMgK01ham9yIENv
bXBvbmVudCwgb3IgdG8gaW1wbGVtZW50IGEgU3RhbmRhcmQgSW50ZXJmYWNlIGZvciB3aGljaCBh
bgorIyAraW1wbGVtZW50YXRpb24gaXMgYXZhaWxhYmxlIHRvIHRoZSBwdWJsaWMgaW4gc291cmNl
IGNvZGUgZm9ybS4gIEEKKyMgKyJNYWpvciBDb21wb25lbnQiLCBpbiB0aGlzIGNvbnRleHQsIG1l
YW5zIGEgbWFqb3IgZXNzZW50aWFsIGNvbXBvbmVudAorIyArKGtlcm5lbCwgd2luZG93IHN5c3Rl
bSwgYW5kIHNvIG9uKSBvZiB0aGUgc3BlY2lmaWMgb3BlcmF0aW5nIHN5c3RlbQorIyArKGlmIGFu
eSkgb24gd2hpY2ggdGhlIGV4ZWN1dGFibGUgd29yayBydW5zLCBvciBhIGNvbXBpbGVyIHVzZWQg
dG8KKyMgK3Byb2R1Y2UgdGhlIHdvcmssIG9yIGFuIG9iamVjdCBjb2RlIGludGVycHJldGVyIHVz
ZWQgdG8gcnVuIGl0LgorIyArCisjICsgIFRoZSAiQ29ycmVzcG9uZGluZyBTb3VyY2UiIGZvciBh
IHdvcmsgaW4gb2JqZWN0IGNvZGUgZm9ybSBtZWFucyBhbGwKKyMgK3RoZSBzb3VyY2UgY29kZSBu
ZWVkZWQgdG8gZ2VuZXJhdGUsIGluc3RhbGwsIGFuZCAoZm9yIGFuIGV4ZWN1dGFibGUKKyMgK3dv
cmspIHJ1biB0aGUgb2JqZWN0IGNvZGUgYW5kIHRvIG1vZGlmeSB0aGUgd29yaywgaW5jbHVkaW5n
IHNjcmlwdHMgdG8KKyMgK2NvbnRyb2wgdGhvc2UgYWN0aXZpdGllcy4gIEhvd2V2ZXIsIGl0IGRv
ZXMgbm90IGluY2x1ZGUgdGhlIHdvcmsncworIyArU3lzdGVtIExpYnJhcmllcywgb3IgZ2VuZXJh
bC1wdXJwb3NlIHRvb2xzIG9yIGdlbmVyYWxseSBhdmFpbGFibGUgZnJlZQorIyArcHJvZ3JhbXMg
d2hpY2ggYXJlIHVzZWQgdW5tb2RpZmllZCBpbiBwZXJmb3JtaW5nIHRob3NlIGFjdGl2aXRpZXMg
YnV0CisjICt3aGljaCBhcmUgbm90IHBhcnQgb2YgdGhlIHdvcmsuICBGb3IgZXhhbXBsZSwgQ29y
cmVzcG9uZGluZyBTb3VyY2UKKyMgK2luY2x1ZGVzIGludGVyZmFjZSBkZWZpbml0aW9uIGZpbGVz
IGFzc29jaWF0ZWQgd2l0aCBzb3VyY2UgZmlsZXMgZm9yCisjICt0aGUgd29yaywgYW5kIHRoZSBz
b3VyY2UgY29kZSBmb3Igc2hhcmVkIGxpYnJhcmllcyBhbmQgZHluYW1pY2FsbHkKKyMgK2xpbmtl
ZCBzdWJwcm9ncmFtcyB0aGF0IHRoZSB3b3JrIGlzIHNwZWNpZmljYWxseSBkZXNpZ25lZCB0byBy
ZXF1aXJlLAorIyArc3VjaCBhcyBieSBpbnRpbWF0ZSBkYXRhIGNvbW11bmljYXRpb24gb3IgY29u
dHJvbCBmbG93IGJldHdlZW4gdGhvc2UKKyMgK3N1YnByb2dyYW1zIGFuZCBvdGhlciBwYXJ0cyBv
ZiB0aGUgd29yay4KKyMgKworIyArICBUaGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgbmVlZCBub3Qg
aW5jbHVkZSBhbnl0aGluZyB0aGF0IHVzZXJzCisjICtjYW4gcmVnZW5lcmF0ZSBhdXRvbWF0aWNh
bGx5IGZyb20gb3RoZXIgcGFydHMgb2YgdGhlIENvcnJlc3BvbmRpbmcKKyMgK1NvdXJjZS4KKyMg
KworIyArICBUaGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgZm9yIGEgd29yayBpbiBzb3VyY2UgY29k
ZSBmb3JtIGlzIHRoYXQKKyMgK3NhbWUgd29yay4KKyMgKworIyArICAyLiBCYXNpYyBQZXJtaXNz
aW9ucy4KKyMgKworIyArICBBbGwgcmlnaHRzIGdyYW50ZWQgdW5kZXIgdGhpcyBMaWNlbnNlIGFy
ZSBncmFudGVkIGZvciB0aGUgdGVybSBvZgorIyArY29weXJpZ2h0IG9uIHRoZSBQcm9ncmFtLCBh
bmQgYXJlIGlycmV2b2NhYmxlIHByb3ZpZGVkIHRoZSBzdGF0ZWQKKyMgK2NvbmRpdGlvbnMgYXJl
IG1ldC4gIFRoaXMgTGljZW5zZSBleHBsaWNpdGx5IGFmZmlybXMgeW91ciB1bmxpbWl0ZWQKKyMg
K3Blcm1pc3Npb24gdG8gcnVuIHRoZSB1bm1vZGlmaWVkIFByb2dyYW0uICBUaGUgb3V0cHV0IGZy
b20gcnVubmluZyBhCisjICtjb3ZlcmVkIHdvcmsgaXMgY292ZXJlZCBieSB0aGlzIExpY2Vuc2Ug
b25seSBpZiB0aGUgb3V0cHV0LCBnaXZlbiBpdHMKKyMgK2NvbnRlbnQsIGNvbnN0aXR1dGVzIGEg
Y292ZXJlZCB3b3JrLiAgVGhpcyBMaWNlbnNlIGFja25vd2xlZGdlcyB5b3VyCisjICtyaWdodHMg
b2YgZmFpciB1c2Ugb3Igb3RoZXIgZXF1aXZhbGVudCwgYXMgcHJvdmlkZWQgYnkgY29weXJpZ2h0
IGxhdy4KKyMgKworIyArICBZb3UgbWF5IG1ha2UsIHJ1biBhbmQgcHJvcGFnYXRlIGNvdmVyZWQg
d29ya3MgdGhhdCB5b3UgZG8gbm90CisjICtjb252ZXksIHdpdGhvdXQgY29uZGl0aW9ucyBzbyBs
b25nIGFzIHlvdXIgbGljZW5zZSBvdGhlcndpc2UgcmVtYWlucworIyAraW4gZm9yY2UuICBZb3Ug
bWF5IGNvbnZleSBjb3ZlcmVkIHdvcmtzIHRvIG90aGVycyBmb3IgdGhlIHNvbGUgcHVycG9zZQor
IyArb2YgaGF2aW5nIHRoZW0gbWFrZSBtb2RpZmljYXRpb25zIGV4Y2x1c2l2ZWx5IGZvciB5b3Us
IG9yIHByb3ZpZGUgeW91CisjICt3aXRoIGZhY2lsaXRpZXMgZm9yIHJ1bm5pbmcgdGhvc2Ugd29y
a3MsIHByb3ZpZGVkIHRoYXQgeW91IGNvbXBseSB3aXRoCisjICt0aGUgdGVybXMgb2YgdGhpcyBM
aWNlbnNlIGluIGNvbnZleWluZyBhbGwgbWF0ZXJpYWwgZm9yIHdoaWNoIHlvdSBkbworIyArbm90
IGNvbnRyb2wgY29weXJpZ2h0LiAgVGhvc2UgdGh1cyBtYWtpbmcgb3IgcnVubmluZyB0aGUgY292
ZXJlZCB3b3JrcworIyArZm9yIHlvdSBtdXN0IGRvIHNvIGV4Y2x1c2l2ZWx5IG9uIHlvdXIgYmVo
YWxmLCB1bmRlciB5b3VyIGRpcmVjdGlvbgorIyArYW5kIGNvbnRyb2wsIG9uIHRlcm1zIHRoYXQg
cHJvaGliaXQgdGhlbSBmcm9tIG1ha2luZyBhbnkgY29waWVzIG9mCisjICt5b3VyIGNvcHlyaWdo
dGVkIG1hdGVyaWFsIG91dHNpZGUgdGhlaXIgcmVsYXRpb25zaGlwIHdpdGggeW91LgorIyArCisj
ICsgIENvbnZleWluZyB1bmRlciBhbnkgb3RoZXIgY2lyY3Vtc3RhbmNlcyBpcyBwZXJtaXR0ZWQg
c29sZWx5IHVuZGVyCisjICt0aGUgY29uZGl0aW9ucyBzdGF0ZWQgYmVsb3cuICBTdWJsaWNlbnNp
bmcgaXMgbm90IGFsbG93ZWQ7IHNlY3Rpb24gMTAKKyMgK21ha2VzIGl0IHVubmVjZXNzYXJ5Lgor
IyArCisjICsgIDMuIFByb3RlY3RpbmcgVXNlcnMnIExlZ2FsIFJpZ2h0cyBGcm9tIEFudGktQ2ly
Y3VtdmVudGlvbiBMYXcuCisjICsKKyMgKyAgTm8gY292ZXJlZCB3b3JrIHNoYWxsIGJlIGRlZW1l
ZCBwYXJ0IG9mIGFuIGVmZmVjdGl2ZSB0ZWNobm9sb2dpY2FsCisjICttZWFzdXJlIHVuZGVyIGFu
eSBhcHBsaWNhYmxlIGxhdyBmdWxmaWxsaW5nIG9ibGlnYXRpb25zIHVuZGVyIGFydGljbGUKKyMg
KzExIG9mIHRoZSBXSVBPIGNvcHlyaWdodCB0cmVhdHkgYWRvcHRlZCBvbiAyMCBEZWNlbWJlciAx
OTk2LCBvcgorIyArc2ltaWxhciBsYXdzIHByb2hpYml0aW5nIG9yIHJlc3RyaWN0aW5nIGNpcmN1
bXZlbnRpb24gb2Ygc3VjaAorIyArbWVhc3VyZXMuCisjICsKKyMgKyAgV2hlbiB5b3UgY29udmV5
IGEgY292ZXJlZCB3b3JrLCB5b3Ugd2FpdmUgYW55IGxlZ2FsIHBvd2VyIHRvIGZvcmJpZAorIyAr
Y2lyY3VtdmVudGlvbiBvZiB0ZWNobm9sb2dpY2FsIG1lYXN1cmVzIHRvIHRoZSBleHRlbnQgc3Vj
aCBjaXJjdW12ZW50aW9uCisjICtpcyBlZmZlY3RlZCBieSBleGVyY2lzaW5nIHJpZ2h0cyB1bmRl
ciB0aGlzIExpY2Vuc2Ugd2l0aCByZXNwZWN0IHRvCisjICt0aGUgY292ZXJlZCB3b3JrLCBhbmQg
eW91IGRpc2NsYWltIGFueSBpbnRlbnRpb24gdG8gbGltaXQgb3BlcmF0aW9uIG9yCisjICttb2Rp
ZmljYXRpb24gb2YgdGhlIHdvcmsgYXMgYSBtZWFucyBvZiBlbmZvcmNpbmcsIGFnYWluc3QgdGhl
IHdvcmsncworIyArdXNlcnMsIHlvdXIgb3IgdGhpcmQgcGFydGllcycgbGVnYWwgcmlnaHRzIHRv
IGZvcmJpZCBjaXJjdW12ZW50aW9uIG9mCisjICt0ZWNobm9sb2dpY2FsIG1lYXN1cmVzLgorIyAr
CisjICsgIDQuIENvbnZleWluZyBWZXJiYXRpbSBDb3BpZXMuCisjICsKKyMgKyAgWW91IG1heSBj
b252ZXkgdmVyYmF0aW0gY29waWVzIG9mIHRoZSBQcm9ncmFtJ3Mgc291cmNlIGNvZGUgYXMgeW91
CisjICtyZWNlaXZlIGl0LCBpbiBhbnkgbWVkaXVtLCBwcm92aWRlZCB0aGF0IHlvdSBjb25zcGlj
dW91c2x5IGFuZAorIyArYXBwcm9wcmlhdGVseSBwdWJsaXNoIG9uIGVhY2ggY29weSBhbiBhcHBy
b3ByaWF0ZSBjb3B5cmlnaHQgbm90aWNlOworIyAra2VlcCBpbnRhY3QgYWxsIG5vdGljZXMgc3Rh
dGluZyB0aGF0IHRoaXMgTGljZW5zZSBhbmQgYW55CisjICtub24tcGVybWlzc2l2ZSB0ZXJtcyBh
ZGRlZCBpbiBhY2NvcmQgd2l0aCBzZWN0aW9uIDcgYXBwbHkgdG8gdGhlIGNvZGU7CisjICtrZWVw
IGludGFjdCBhbGwgbm90aWNlcyBvZiB0aGUgYWJzZW5jZSBvZiBhbnkgd2FycmFudHk7IGFuZCBn
aXZlIGFsbAorIyArcmVjaXBpZW50cyBhIGNvcHkgb2YgdGhpcyBMaWNlbnNlIGFsb25nIHdpdGgg
dGhlIFByb2dyYW0uCisjICsKKyMgKyAgWW91IG1heSBjaGFyZ2UgYW55IHByaWNlIG9yIG5vIHBy
aWNlIGZvciBlYWNoIGNvcHkgdGhhdCB5b3UgY29udmV5LAorIyArYW5kIHlvdSBtYXkgb2ZmZXIg
c3VwcG9ydCBvciB3YXJyYW50eSBwcm90ZWN0aW9uIGZvciBhIGZlZS4KKyMgKworIyArICA1LiBD
b252ZXlpbmcgTW9kaWZpZWQgU291cmNlIFZlcnNpb25zLgorIyArCisjICsgIFlvdSBtYXkgY29u
dmV5IGEgd29yayBiYXNlZCBvbiB0aGUgUHJvZ3JhbSwgb3IgdGhlIG1vZGlmaWNhdGlvbnMgdG8K
KyMgK3Byb2R1Y2UgaXQgZnJvbSB0aGUgUHJvZ3JhbSwgaW4gdGhlIGZvcm0gb2Ygc291cmNlIGNv
ZGUgdW5kZXIgdGhlCisjICt0ZXJtcyBvZiBzZWN0aW9uIDQsIHByb3ZpZGVkIHRoYXQgeW91IGFs
c28gbWVldCBhbGwgb2YgdGhlc2UgY29uZGl0aW9uczoKKyMgKworIyArICAgIGEpIFRoZSB3b3Jr
IG11c3QgY2FycnkgcHJvbWluZW50IG5vdGljZXMgc3RhdGluZyB0aGF0IHlvdSBtb2RpZmllZAor
IyArICAgIGl0LCBhbmQgZ2l2aW5nIGEgcmVsZXZhbnQgZGF0ZS4KKyMgKworIyArICAgIGIpIFRo
ZSB3b3JrIG11c3QgY2FycnkgcHJvbWluZW50IG5vdGljZXMgc3RhdGluZyB0aGF0IGl0IGlzCisj
ICsgICAgcmVsZWFzZWQgdW5kZXIgdGhpcyBMaWNlbnNlIGFuZCBhbnkgY29uZGl0aW9ucyBhZGRl
ZCB1bmRlciBzZWN0aW9uCisjICsgICAgNy4gIFRoaXMgcmVxdWlyZW1lbnQgbW9kaWZpZXMgdGhl
IHJlcXVpcmVtZW50IGluIHNlY3Rpb24gNCB0bworIyArICAgICJrZWVwIGludGFjdCBhbGwgbm90
aWNlcyIuCisjICsKKyMgKyAgICBjKSBZb3UgbXVzdCBsaWNlbnNlIHRoZSBlbnRpcmUgd29yaywg
YXMgYSB3aG9sZSwgdW5kZXIgdGhpcworIyArICAgIExpY2Vuc2UgdG8gYW55b25lIHdobyBjb21l
cyBpbnRvIHBvc3Nlc3Npb24gb2YgYSBjb3B5LiAgVGhpcworIyArICAgIExpY2Vuc2Ugd2lsbCB0
aGVyZWZvcmUgYXBwbHksIGFsb25nIHdpdGggYW55IGFwcGxpY2FibGUgc2VjdGlvbiA3CisjICsg
ICAgYWRkaXRpb25hbCB0ZXJtcywgdG8gdGhlIHdob2xlIG9mIHRoZSB3b3JrLCBhbmQgYWxsIGl0
cyBwYXJ0cywKKyMgKyAgICByZWdhcmRsZXNzIG9mIGhvdyB0aGV5IGFyZSBwYWNrYWdlZC4gIFRo
aXMgTGljZW5zZSBnaXZlcyBubworIyArICAgIHBlcm1pc3Npb24gdG8gbGljZW5zZSB0aGUgd29y
ayBpbiBhbnkgb3RoZXIgd2F5LCBidXQgaXQgZG9lcyBub3QKKyMgKyAgICBpbnZhbGlkYXRlIHN1
Y2ggcGVybWlzc2lvbiBpZiB5b3UgaGF2ZSBzZXBhcmF0ZWx5IHJlY2VpdmVkIGl0LgorIyArCisj
ICsgICAgZCkgSWYgdGhlIHdvcmsgaGFzIGludGVyYWN0aXZlIHVzZXIgaW50ZXJmYWNlcywgZWFj
aCBtdXN0IGRpc3BsYXkKKyMgKyAgICBBcHByb3ByaWF0ZSBMZWdhbCBOb3RpY2VzOyBob3dldmVy
LCBpZiB0aGUgUHJvZ3JhbSBoYXMgaW50ZXJhY3RpdmUKKyMgKyAgICBpbnRlcmZhY2VzIHRoYXQg
ZG8gbm90IGRpc3BsYXkgQXBwcm9wcmlhdGUgTGVnYWwgTm90aWNlcywgeW91cgorIyArICAgIHdv
cmsgbmVlZCBub3QgbWFrZSB0aGVtIGRvIHNvLgorIyArCisjICsgIEEgY29tcGlsYXRpb24gb2Yg
YSBjb3ZlcmVkIHdvcmsgd2l0aCBvdGhlciBzZXBhcmF0ZSBhbmQgaW5kZXBlbmRlbnQKKyMgK3dv
cmtzLCB3aGljaCBhcmUgbm90IGJ5IHRoZWlyIG5hdHVyZSBleHRlbnNpb25zIG9mIHRoZSBjb3Zl
cmVkIHdvcmssCisjICthbmQgd2hpY2ggYXJlIG5vdCBjb21iaW5lZCB3aXRoIGl0IHN1Y2ggYXMg
dG8gZm9ybSBhIGxhcmdlciBwcm9ncmFtLAorIyAraW4gb3Igb24gYSB2b2x1bWUgb2YgYSBzdG9y
YWdlIG9yIGRpc3RyaWJ1dGlvbiBtZWRpdW0sIGlzIGNhbGxlZCBhbgorIyArImFnZ3JlZ2F0ZSIg
aWYgdGhlIGNvbXBpbGF0aW9uIGFuZCBpdHMgcmVzdWx0aW5nIGNvcHlyaWdodCBhcmUgbm90Cisj
ICt1c2VkIHRvIGxpbWl0IHRoZSBhY2Nlc3Mgb3IgbGVnYWwgcmlnaHRzIG9mIHRoZSBjb21waWxh
dGlvbidzIHVzZXJzCisjICtiZXlvbmQgd2hhdCB0aGUgaW5kaXZpZHVhbCB3b3JrcyBwZXJtaXQu
ICBJbmNsdXNpb24gb2YgYSBjb3ZlcmVkIHdvcmsKKyMgK2luIGFuIGFnZ3JlZ2F0ZSBkb2VzIG5v
dCBjYXVzZSB0aGlzIExpY2Vuc2UgdG8gYXBwbHkgdG8gdGhlIG90aGVyCisjICtwYXJ0cyBvZiB0
aGUgYWdncmVnYXRlLgorIyArCisjICsgIDYuIENvbnZleWluZyBOb24tU291cmNlIEZvcm1zLgor
IyArCisjICsgIFlvdSBtYXkgY29udmV5IGEgY292ZXJlZCB3b3JrIGluIG9iamVjdCBjb2RlIGZv
cm0gdW5kZXIgdGhlIHRlcm1zCisjICtvZiBzZWN0aW9ucyA0IGFuZCA1LCBwcm92aWRlZCB0aGF0
IHlvdSBhbHNvIGNvbnZleSB0aGUKKyMgK21hY2hpbmUtcmVhZGFibGUgQ29ycmVzcG9uZGluZyBT
b3VyY2UgdW5kZXIgdGhlIHRlcm1zIG9mIHRoaXMgTGljZW5zZSwKKyMgK2luIG9uZSBvZiB0aGVz
ZSB3YXlzOgorIyArCisjICsgICAgYSkgQ29udmV5IHRoZSBvYmplY3QgY29kZSBpbiwgb3IgZW1i
b2RpZWQgaW4sIGEgcGh5c2ljYWwgcHJvZHVjdAorIyArICAgIChpbmNsdWRpbmcgYSBwaHlzaWNh
bCBkaXN0cmlidXRpb24gbWVkaXVtKSwgYWNjb21wYW5pZWQgYnkgdGhlCisjICsgICAgQ29ycmVz
cG9uZGluZyBTb3VyY2UgZml4ZWQgb24gYSBkdXJhYmxlIHBoeXNpY2FsIG1lZGl1bQorIyArICAg
IGN1c3RvbWFyaWx5IHVzZWQgZm9yIHNvZnR3YXJlIGludGVyY2hhbmdlLgorIyArCisjICsgICAg
YikgQ29udmV5IHRoZSBvYmplY3QgY29kZSBpbiwgb3IgZW1ib2RpZWQgaW4sIGEgcGh5c2ljYWwg
cHJvZHVjdAorIyArICAgIChpbmNsdWRpbmcgYSBwaHlzaWNhbCBkaXN0cmlidXRpb24gbWVkaXVt
KSwgYWNjb21wYW5pZWQgYnkgYQorIyArICAgIHdyaXR0ZW4gb2ZmZXIsIHZhbGlkIGZvciBhdCBs
ZWFzdCB0aHJlZSB5ZWFycyBhbmQgdmFsaWQgZm9yIGFzCisjICsgICAgbG9uZyBhcyB5b3Ugb2Zm
ZXIgc3BhcmUgcGFydHMgb3IgY3VzdG9tZXIgc3VwcG9ydCBmb3IgdGhhdCBwcm9kdWN0CisjICsg
ICAgbW9kZWwsIHRvIGdpdmUgYW55b25lIHdobyBwb3NzZXNzZXMgdGhlIG9iamVjdCBjb2RlIGVp
dGhlciAoMSkgYQorIyArICAgIGNvcHkgb2YgdGhlIENvcnJlc3BvbmRpbmcgU291cmNlIGZvciBh
bGwgdGhlIHNvZnR3YXJlIGluIHRoZQorIyArICAgIHByb2R1Y3QgdGhhdCBpcyBjb3ZlcmVkIGJ5
IHRoaXMgTGljZW5zZSwgb24gYSBkdXJhYmxlIHBoeXNpY2FsCisjICsgICAgbWVkaXVtIGN1c3Rv
bWFyaWx5IHVzZWQgZm9yIHNvZnR3YXJlIGludGVyY2hhbmdlLCBmb3IgYSBwcmljZSBubworIyAr
ICAgIG1vcmUgdGhhbiB5b3VyIHJlYXNvbmFibGUgY29zdCBvZiBwaHlzaWNhbGx5IHBlcmZvcm1p
bmcgdGhpcworIyArICAgIGNvbnZleWluZyBvZiBzb3VyY2UsIG9yICgyKSBhY2Nlc3MgdG8gY29w
eSB0aGUKKyMgKyAgICBDb3JyZXNwb25kaW5nIFNvdXJjZSBmcm9tIGEgbmV0d29yayBzZXJ2ZXIg
YXQgbm8gY2hhcmdlLgorIyArCisjICsgICAgYykgQ29udmV5IGluZGl2aWR1YWwgY29waWVzIG9m
IHRoZSBvYmplY3QgY29kZSB3aXRoIGEgY29weSBvZiB0aGUKKyMgKyAgICB3cml0dGVuIG9mZmVy
IHRvIHByb3ZpZGUgdGhlIENvcnJlc3BvbmRpbmcgU291cmNlLiAgVGhpcworIyArICAgIGFsdGVy
bmF0aXZlIGlzIGFsbG93ZWQgb25seSBvY2Nhc2lvbmFsbHkgYW5kIG5vbmNvbW1lcmNpYWxseSwg
YW5kCisjICsgICAgb25seSBpZiB5b3UgcmVjZWl2ZWQgdGhlIG9iamVjdCBjb2RlIHdpdGggc3Vj
aCBhbiBvZmZlciwgaW4gYWNjb3JkCisjICsgICAgd2l0aCBzdWJzZWN0aW9uIDZiLgorIyArCisj
ICsgICAgZCkgQ29udmV5IHRoZSBvYmplY3QgY29kZSBieSBvZmZlcmluZyBhY2Nlc3MgZnJvbSBh
IGRlc2lnbmF0ZWQKKyMgKyAgICBwbGFjZSAoZ3JhdGlzIG9yIGZvciBhIGNoYXJnZSksIGFuZCBv
ZmZlciBlcXVpdmFsZW50IGFjY2VzcyB0byB0aGUKKyMgKyAgICBDb3JyZXNwb25kaW5nIFNvdXJj
ZSBpbiB0aGUgc2FtZSB3YXkgdGhyb3VnaCB0aGUgc2FtZSBwbGFjZSBhdCBubworIyArICAgIGZ1
cnRoZXIgY2hhcmdlLiAgWW91IG5lZWQgbm90IHJlcXVpcmUgcmVjaXBpZW50cyB0byBjb3B5IHRo
ZQorIyArICAgIENvcnJlc3BvbmRpbmcgU291cmNlIGFsb25nIHdpdGggdGhlIG9iamVjdCBjb2Rl
LiAgSWYgdGhlIHBsYWNlIHRvCisjICsgICAgY29weSB0aGUgb2JqZWN0IGNvZGUgaXMgYSBuZXR3
b3JrIHNlcnZlciwgdGhlIENvcnJlc3BvbmRpbmcgU291cmNlCisjICsgICAgbWF5IGJlIG9uIGEg
ZGlmZmVyZW50IHNlcnZlciAob3BlcmF0ZWQgYnkgeW91IG9yIGEgdGhpcmQgcGFydHkpCisjICsg
ICAgdGhhdCBzdXBwb3J0cyBlcXVpdmFsZW50IGNvcHlpbmcgZmFjaWxpdGllcywgcHJvdmlkZWQg
eW91IG1haW50YWluCisjICsgICAgY2xlYXIgZGlyZWN0aW9ucyBuZXh0IHRvIHRoZSBvYmplY3Qg
Y29kZSBzYXlpbmcgd2hlcmUgdG8gZmluZCB0aGUKKyMgKyAgICBDb3JyZXNwb25kaW5nIFNvdXJj
ZS4gIFJlZ2FyZGxlc3Mgb2Ygd2hhdCBzZXJ2ZXIgaG9zdHMgdGhlCisjICsgICAgQ29ycmVzcG9u
ZGluZyBTb3VyY2UsIHlvdSByZW1haW4gb2JsaWdhdGVkIHRvIGVuc3VyZSB0aGF0IGl0IGlzCisj
ICsgICAgYXZhaWxhYmxlIGZvciBhcyBsb25nIGFzIG5lZWRlZCB0byBzYXRpc2Z5IHRoZXNlIHJl
cXVpcmVtZW50cy4KKyMgKworIyArICAgIGUpIENvbnZleSB0aGUgb2JqZWN0IGNvZGUgdXNpbmcg
cGVlci10by1wZWVyIHRyYW5zbWlzc2lvbiwgcHJvdmlkZWQKKyMgKyAgICB5b3UgaW5mb3JtIG90
aGVyIHBlZXJzIHdoZXJlIHRoZSBvYmplY3QgY29kZSBhbmQgQ29ycmVzcG9uZGluZworIyArICAg
IFNvdXJjZSBvZiB0aGUgd29yayBhcmUgYmVpbmcgb2ZmZXJlZCB0byB0aGUgZ2VuZXJhbCBwdWJs
aWMgYXQgbm8KKyMgKyAgICBjaGFyZ2UgdW5kZXIgc3Vic2VjdGlvbiA2ZC4KKyMgKworIyArICBB
IHNlcGFyYWJsZSBwb3J0aW9uIG9mIHRoZSBvYmplY3QgY29kZSwgd2hvc2Ugc291cmNlIGNvZGUg
aXMgZXhjbHVkZWQKKyMgK2Zyb20gdGhlIENvcnJlc3BvbmRpbmcgU291cmNlIGFzIGEgU3lzdGVt
IExpYnJhcnksIG5lZWQgbm90IGJlCisjICtpbmNsdWRlZCBpbiBjb252ZXlpbmcgdGhlIG9iamVj
dCBjb2RlIHdvcmsuCisjICsKKyMgKyAgQSAiVXNlciBQcm9kdWN0IiBpcyBlaXRoZXIgKDEpIGEg
ImNvbnN1bWVyIHByb2R1Y3QiLCB3aGljaCBtZWFucyBhbnkKKyMgK3RhbmdpYmxlIHBlcnNvbmFs
IHByb3BlcnR5IHdoaWNoIGlzIG5vcm1hbGx5IHVzZWQgZm9yIHBlcnNvbmFsLCBmYW1pbHksCisj
ICtvciBob3VzZWhvbGQgcHVycG9zZXMsIG9yICgyKSBhbnl0aGluZyBkZXNpZ25lZCBvciBzb2xk
IGZvciBpbmNvcnBvcmF0aW9uCisjICtpbnRvIGEgZHdlbGxpbmcuICBJbiBkZXRlcm1pbmluZyB3
aGV0aGVyIGEgcHJvZHVjdCBpcyBhIGNvbnN1bWVyIHByb2R1Y3QsCisjICtkb3VidGZ1bCBjYXNl
cyBzaGFsbCBiZSByZXNvbHZlZCBpbiBmYXZvciBvZiBjb3ZlcmFnZS4gIEZvciBhIHBhcnRpY3Vs
YXIKKyMgK3Byb2R1Y3QgcmVjZWl2ZWQgYnkgYSBwYXJ0aWN1bGFyIHVzZXIsICJub3JtYWxseSB1
c2VkIiByZWZlcnMgdG8gYQorIyArdHlwaWNhbCBvciBjb21tb24gdXNlIG9mIHRoYXQgY2xhc3Mg
b2YgcHJvZHVjdCwgcmVnYXJkbGVzcyBvZiB0aGUgc3RhdHVzCisjICtvZiB0aGUgcGFydGljdWxh
ciB1c2VyIG9yIG9mIHRoZSB3YXkgaW4gd2hpY2ggdGhlIHBhcnRpY3VsYXIgdXNlcgorIyArYWN0
dWFsbHkgdXNlcywgb3IgZXhwZWN0cyBvciBpcyBleHBlY3RlZCB0byB1c2UsIHRoZSBwcm9kdWN0
LiAgQSBwcm9kdWN0CisjICtpcyBhIGNvbnN1bWVyIHByb2R1Y3QgcmVnYXJkbGVzcyBvZiB3aGV0
aGVyIHRoZSBwcm9kdWN0IGhhcyBzdWJzdGFudGlhbAorIyArY29tbWVyY2lhbCwgaW5kdXN0cmlh
bCBvciBub24tY29uc3VtZXIgdXNlcywgdW5sZXNzIHN1Y2ggdXNlcyByZXByZXNlbnQKKyMgK3Ro
ZSBvbmx5IHNpZ25pZmljYW50IG1vZGUgb2YgdXNlIG9mIHRoZSBwcm9kdWN0LgorIyArCisjICsg
ICJJbnN0YWxsYXRpb24gSW5mb3JtYXRpb24iIGZvciBhIFVzZXIgUHJvZHVjdCBtZWFucyBhbnkg
bWV0aG9kcywKKyMgK3Byb2NlZHVyZXMsIGF1dGhvcml6YXRpb24ga2V5cywgb3Igb3RoZXIgaW5m
b3JtYXRpb24gcmVxdWlyZWQgdG8gaW5zdGFsbAorIyArYW5kIGV4ZWN1dGUgbW9kaWZpZWQgdmVy
c2lvbnMgb2YgYSBjb3ZlcmVkIHdvcmsgaW4gdGhhdCBVc2VyIFByb2R1Y3QgZnJvbQorIyArYSBt
b2RpZmllZCB2ZXJzaW9uIG9mIGl0cyBDb3JyZXNwb25kaW5nIFNvdXJjZS4gIFRoZSBpbmZvcm1h
dGlvbiBtdXN0CisjICtzdWZmaWNlIHRvIGVuc3VyZSB0aGF0IHRoZSBjb250aW51ZWQgZnVuY3Rp
b25pbmcgb2YgdGhlIG1vZGlmaWVkIG9iamVjdAorIyArY29kZSBpcyBpbiBubyBjYXNlIHByZXZl
bnRlZCBvciBpbnRlcmZlcmVkIHdpdGggc29sZWx5IGJlY2F1c2UKKyMgK21vZGlmaWNhdGlvbiBo
YXMgYmVlbiBtYWRlLgorIyArCisjICsgIElmIHlvdSBjb252ZXkgYW4gb2JqZWN0IGNvZGUgd29y
ayB1bmRlciB0aGlzIHNlY3Rpb24gaW4sIG9yIHdpdGgsIG9yCisjICtzcGVjaWZpY2FsbHkgZm9y
IHVzZSBpbiwgYSBVc2VyIFByb2R1Y3QsIGFuZCB0aGUgY29udmV5aW5nIG9jY3VycyBhcworIyAr
cGFydCBvZiBhIHRyYW5zYWN0aW9uIGluIHdoaWNoIHRoZSByaWdodCBvZiBwb3NzZXNzaW9uIGFu
ZCB1c2Ugb2YgdGhlCisjICtVc2VyIFByb2R1Y3QgaXMgdHJhbnNmZXJyZWQgdG8gdGhlIHJlY2lw
aWVudCBpbiBwZXJwZXR1aXR5IG9yIGZvciBhCisjICtmaXhlZCB0ZXJtIChyZWdhcmRsZXNzIG9m
IGhvdyB0aGUgdHJhbnNhY3Rpb24gaXMgY2hhcmFjdGVyaXplZCksIHRoZQorIyArQ29ycmVzcG9u
ZGluZyBTb3VyY2UgY29udmV5ZWQgdW5kZXIgdGhpcyBzZWN0aW9uIG11c3QgYmUgYWNjb21wYW5p
ZWQKKyMgK2J5IHRoZSBJbnN0YWxsYXRpb24gSW5mb3JtYXRpb24uICBCdXQgdGhpcyByZXF1aXJl
bWVudCBkb2VzIG5vdCBhcHBseQorIyAraWYgbmVpdGhlciB5b3Ugbm9yIGFueSB0aGlyZCBwYXJ0
eSByZXRhaW5zIHRoZSBhYmlsaXR5IHRvIGluc3RhbGwKKyMgK21vZGlmaWVkIG9iamVjdCBjb2Rl
IG9uIHRoZSBVc2VyIFByb2R1Y3QgKGZvciBleGFtcGxlLCB0aGUgd29yayBoYXMKKyMgK2JlZW4g
aW5zdGFsbGVkIGluIFJPTSkuCisjICsKKyMgKyAgVGhlIHJlcXVpcmVtZW50IHRvIHByb3ZpZGUg
SW5zdGFsbGF0aW9uIEluZm9ybWF0aW9uIGRvZXMgbm90IGluY2x1ZGUgYQorIyArcmVxdWlyZW1l
bnQgdG8gY29udGludWUgdG8gcHJvdmlkZSBzdXBwb3J0IHNlcnZpY2UsIHdhcnJhbnR5LCBvciB1
cGRhdGVzCisjICtmb3IgYSB3b3JrIHRoYXQgaGFzIGJlZW4gbW9kaWZpZWQgb3IgaW5zdGFsbGVk
IGJ5IHRoZSByZWNpcGllbnQsIG9yIGZvcgorIyArdGhlIFVzZXIgUHJvZHVjdCBpbiB3aGljaCBp
dCBoYXMgYmVlbiBtb2RpZmllZCBvciBpbnN0YWxsZWQuICBBY2Nlc3MgdG8gYQorIyArbmV0d29y
ayBtYXkgYmUgZGVuaWVkIHdoZW4gdGhlIG1vZGlmaWNhdGlvbiBpdHNlbGYgbWF0ZXJpYWxseSBh
bmQKKyMgK2FkdmVyc2VseSBhZmZlY3RzIHRoZSBvcGVyYXRpb24gb2YgdGhlIG5ldHdvcmsgb3Ig
dmlvbGF0ZXMgdGhlIHJ1bGVzIGFuZAorIyArcHJvdG9jb2xzIGZvciBjb21tdW5pY2F0aW9uIGFj
cm9zcyB0aGUgbmV0d29yay4KKyMgKworIyArICBDb3JyZXNwb25kaW5nIFNvdXJjZSBjb252ZXll
ZCwgYW5kIEluc3RhbGxhdGlvbiBJbmZvcm1hdGlvbiBwcm92aWRlZCwKKyMgK2luIGFjY29yZCB3
aXRoIHRoaXMgc2VjdGlvbiBtdXN0IGJlIGluIGEgZm9ybWF0IHRoYXQgaXMgcHVibGljbHkKKyMg
K2RvY3VtZW50ZWQgKGFuZCB3aXRoIGFuIGltcGxlbWVudGF0aW9uIGF2YWlsYWJsZSB0byB0aGUg
cHVibGljIGluCisjICtzb3VyY2UgY29kZSBmb3JtKSwgYW5kIG11c3QgcmVxdWlyZSBubyBzcGVj
aWFsIHBhc3N3b3JkIG9yIGtleSBmb3IKKyMgK3VucGFja2luZywgcmVhZGluZyBvciBjb3B5aW5n
LgorIyArCisjICsgIDcuIEFkZGl0aW9uYWwgVGVybXMuCisjICsKKyMgKyAgIkFkZGl0aW9uYWwg
cGVybWlzc2lvbnMiIGFyZSB0ZXJtcyB0aGF0IHN1cHBsZW1lbnQgdGhlIHRlcm1zIG9mIHRoaXMK
KyMgK0xpY2Vuc2UgYnkgbWFraW5nIGV4Y2VwdGlvbnMgZnJvbSBvbmUgb3IgbW9yZSBvZiBpdHMg
Y29uZGl0aW9ucy4KKyMgK0FkZGl0aW9uYWwgcGVybWlzc2lvbnMgdGhhdCBhcmUgYXBwbGljYWJs
ZSB0byB0aGUgZW50aXJlIFByb2dyYW0gc2hhbGwKKyMgK2JlIHRyZWF0ZWQgYXMgdGhvdWdoIHRo
ZXkgd2VyZSBpbmNsdWRlZCBpbiB0aGlzIExpY2Vuc2UsIHRvIHRoZSBleHRlbnQKKyMgK3RoYXQg
dGhleSBhcmUgdmFsaWQgdW5kZXIgYXBwbGljYWJsZSBsYXcuICBJZiBhZGRpdGlvbmFsIHBlcm1p
c3Npb25zCisjICthcHBseSBvbmx5IHRvIHBhcnQgb2YgdGhlIFByb2dyYW0sIHRoYXQgcGFydCBt
YXkgYmUgdXNlZCBzZXBhcmF0ZWx5CisjICt1bmRlciB0aG9zZSBwZXJtaXNzaW9ucywgYnV0IHRo
ZSBlbnRpcmUgUHJvZ3JhbSByZW1haW5zIGdvdmVybmVkIGJ5CisjICt0aGlzIExpY2Vuc2Ugd2l0
aG91dCByZWdhcmQgdG8gdGhlIGFkZGl0aW9uYWwgcGVybWlzc2lvbnMuCisjICsKKyMgKyAgV2hl
biB5b3UgY29udmV5IGEgY29weSBvZiBhIGNvdmVyZWQgd29yaywgeW91IG1heSBhdCB5b3VyIG9w
dGlvbgorIyArcmVtb3ZlIGFueSBhZGRpdGlvbmFsIHBlcm1pc3Npb25zIGZyb20gdGhhdCBjb3B5
LCBvciBmcm9tIGFueSBwYXJ0IG9mCisjICtpdC4gIChBZGRpdGlvbmFsIHBlcm1pc3Npb25zIG1h
eSBiZSB3cml0dGVuIHRvIHJlcXVpcmUgdGhlaXIgb3duCisjICtyZW1vdmFsIGluIGNlcnRhaW4g
Y2FzZXMgd2hlbiB5b3UgbW9kaWZ5IHRoZSB3b3JrLikgIFlvdSBtYXkgcGxhY2UKKyMgK2FkZGl0
aW9uYWwgcGVybWlzc2lvbnMgb24gbWF0ZXJpYWwsIGFkZGVkIGJ5IHlvdSB0byBhIGNvdmVyZWQg
d29yaywKKyMgK2ZvciB3aGljaCB5b3UgaGF2ZSBvciBjYW4gZ2l2ZSBhcHByb3ByaWF0ZSBjb3B5
cmlnaHQgcGVybWlzc2lvbi4KKyMgKworIyArICBOb3R3aXRoc3RhbmRpbmcgYW55IG90aGVyIHBy
b3Zpc2lvbiBvZiB0aGlzIExpY2Vuc2UsIGZvciBtYXRlcmlhbCB5b3UKKyMgK2FkZCB0byBhIGNv
dmVyZWQgd29yaywgeW91IG1heSAoaWYgYXV0aG9yaXplZCBieSB0aGUgY29weXJpZ2h0IGhvbGRl
cnMgb2YKKyMgK3RoYXQgbWF0ZXJpYWwpIHN1cHBsZW1lbnQgdGhlIHRlcm1zIG9mIHRoaXMgTGlj
ZW5zZSB3aXRoIHRlcm1zOgorIyArCisjICsgICAgYSkgRGlzY2xhaW1pbmcgd2FycmFudHkgb3Ig
bGltaXRpbmcgbGlhYmlsaXR5IGRpZmZlcmVudGx5IGZyb20gdGhlCisjICsgICAgdGVybXMgb2Yg
c2VjdGlvbnMgMTUgYW5kIDE2IG9mIHRoaXMgTGljZW5zZTsgb3IKKyMgKworIyArICAgIGIpIFJl
cXVpcmluZyBwcmVzZXJ2YXRpb24gb2Ygc3BlY2lmaWVkIHJlYXNvbmFibGUgbGVnYWwgbm90aWNl
cyBvcgorIyArICAgIGF1dGhvciBhdHRyaWJ1dGlvbnMgaW4gdGhhdCBtYXRlcmlhbCBvciBpbiB0
aGUgQXBwcm9wcmlhdGUgTGVnYWwKKyMgKyAgICBOb3RpY2VzIGRpc3BsYXllZCBieSB3b3JrcyBj
b250YWluaW5nIGl0OyBvcgorIyArCisjICsgICAgYykgUHJvaGliaXRpbmcgbWlzcmVwcmVzZW50
YXRpb24gb2YgdGhlIG9yaWdpbiBvZiB0aGF0IG1hdGVyaWFsLCBvcgorIyArICAgIHJlcXVpcmlu
ZyB0aGF0IG1vZGlmaWVkIHZlcnNpb25zIG9mIHN1Y2ggbWF0ZXJpYWwgYmUgbWFya2VkIGluCisj
ICsgICAgcmVhc29uYWJsZSB3YXlzIGFzIGRpZmZlcmVudCBmcm9tIHRoZSBvcmlnaW5hbCB2ZXJz
aW9uOyBvcgorIyArCisjICsgICAgZCkgTGltaXRpbmcgdGhlIHVzZSBmb3IgcHVibGljaXR5IHB1
cnBvc2VzIG9mIG5hbWVzIG9mIGxpY2Vuc29ycyBvcgorIyArICAgIGF1dGhvcnMgb2YgdGhlIG1h
dGVyaWFsOyBvcgorIyArCisjICsgICAgZSkgRGVjbGluaW5nIHRvIGdyYW50IHJpZ2h0cyB1bmRl
ciB0cmFkZW1hcmsgbGF3IGZvciB1c2Ugb2Ygc29tZQorIyArICAgIHRyYWRlIG5hbWVzLCB0cmFk
ZW1hcmtzLCBvciBzZXJ2aWNlIG1hcmtzOyBvcgorIyArCisjICsgICAgZikgUmVxdWlyaW5nIGlu
ZGVtbmlmaWNhdGlvbiBvZiBsaWNlbnNvcnMgYW5kIGF1dGhvcnMgb2YgdGhhdAorIyArICAgIG1h
dGVyaWFsIGJ5IGFueW9uZSB3aG8gY29udmV5cyB0aGUgbWF0ZXJpYWwgKG9yIG1vZGlmaWVkIHZl
cnNpb25zIG9mCisjICsgICAgaXQpIHdpdGggY29udHJhY3R1YWwgYXNzdW1wdGlvbnMgb2YgbGlh
YmlsaXR5IHRvIHRoZSByZWNpcGllbnQsIGZvcgorIyArICAgIGFueSBsaWFiaWxpdHkgdGhhdCB0
aGVzZSBjb250cmFjdHVhbCBhc3N1bXB0aW9ucyBkaXJlY3RseSBpbXBvc2Ugb24KKyMgKyAgICB0
aG9zZSBsaWNlbnNvcnMgYW5kIGF1dGhvcnMuCisjICsKKyMgKyAgQWxsIG90aGVyIG5vbi1wZXJt
aXNzaXZlIGFkZGl0aW9uYWwgdGVybXMgYXJlIGNvbnNpZGVyZWQgImZ1cnRoZXIKKyMgK3Jlc3Ry
aWN0aW9ucyIgd2l0aGluIHRoZSBtZWFuaW5nIG9mIHNlY3Rpb24gMTAuICBJZiB0aGUgUHJvZ3Jh
bSBhcyB5b3UKKyMgK3JlY2VpdmVkIGl0LCBvciBhbnkgcGFydCBvZiBpdCwgY29udGFpbnMgYSBu
b3RpY2Ugc3RhdGluZyB0aGF0IGl0IGlzCisjICtnb3Zlcm5lZCBieSB0aGlzIExpY2Vuc2UgYWxv
bmcgd2l0aCBhIHRlcm0gdGhhdCBpcyBhIGZ1cnRoZXIKKyMgK3Jlc3RyaWN0aW9uLCB5b3UgbWF5
IHJlbW92ZSB0aGF0IHRlcm0uICBJZiBhIGxpY2Vuc2UgZG9jdW1lbnQgY29udGFpbnMKKyMgK2Eg
ZnVydGhlciByZXN0cmljdGlvbiBidXQgcGVybWl0cyByZWxpY2Vuc2luZyBvciBjb252ZXlpbmcg
dW5kZXIgdGhpcworIyArTGljZW5zZSwgeW91IG1heSBhZGQgdG8gYSBjb3ZlcmVkIHdvcmsgbWF0
ZXJpYWwgZ292ZXJuZWQgYnkgdGhlIHRlcm1zCisjICtvZiB0aGF0IGxpY2Vuc2UgZG9jdW1lbnQs
IHByb3ZpZGVkIHRoYXQgdGhlIGZ1cnRoZXIgcmVzdHJpY3Rpb24gZG9lcworIyArbm90IHN1cnZp
dmUgc3VjaCByZWxpY2Vuc2luZyBvciBjb252ZXlpbmcuCisjICsKKyMgKyAgSWYgeW91IGFkZCB0
ZXJtcyB0byBhIGNvdmVyZWQgd29yayBpbiBhY2NvcmQgd2l0aCB0aGlzIHNlY3Rpb24sIHlvdQor
IyArbXVzdCBwbGFjZSwgaW4gdGhlIHJlbGV2YW50IHNvdXJjZSBmaWxlcywgYSBzdGF0ZW1lbnQg
b2YgdGhlCisjICthZGRpdGlvbmFsIHRlcm1zIHRoYXQgYXBwbHkgdG8gdGhvc2UgZmlsZXMsIG9y
IGEgbm90aWNlIGluZGljYXRpbmcKKyMgK3doZXJlIHRvIGZpbmQgdGhlIGFwcGxpY2FibGUgdGVy
bXMuCisjICsKKyMgKyAgQWRkaXRpb25hbCB0ZXJtcywgcGVybWlzc2l2ZSBvciBub24tcGVybWlz
c2l2ZSwgbWF5IGJlIHN0YXRlZCBpbiB0aGUKKyMgK2Zvcm0gb2YgYSBzZXBhcmF0ZWx5IHdyaXR0
ZW4gbGljZW5zZSwgb3Igc3RhdGVkIGFzIGV4Y2VwdGlvbnM7CisjICt0aGUgYWJvdmUgcmVxdWly
ZW1lbnRzIGFwcGx5IGVpdGhlciB3YXkuCisjICsKKyMgKyAgOC4gVGVybWluYXRpb24uCisjICsK
KyMgKyAgWW91IG1heSBub3QgcHJvcGFnYXRlIG9yIG1vZGlmeSBhIGNvdmVyZWQgd29yayBleGNl
cHQgYXMgZXhwcmVzc2x5CisjICtwcm92aWRlZCB1bmRlciB0aGlzIExpY2Vuc2UuICBBbnkgYXR0
ZW1wdCBvdGhlcndpc2UgdG8gcHJvcGFnYXRlIG9yCisjICttb2RpZnkgaXQgaXMgdm9pZCwgYW5k
IHdpbGwgYXV0b21hdGljYWxseSB0ZXJtaW5hdGUgeW91ciByaWdodHMgdW5kZXIKKyMgK3RoaXMg
TGljZW5zZSAoaW5jbHVkaW5nIGFueSBwYXRlbnQgbGljZW5zZXMgZ3JhbnRlZCB1bmRlciB0aGUg
dGhpcmQKKyMgK3BhcmFncmFwaCBvZiBzZWN0aW9uIDExKS4KKyMgKworIyArICBIb3dldmVyLCBp
ZiB5b3UgY2Vhc2UgYWxsIHZpb2xhdGlvbiBvZiB0aGlzIExpY2Vuc2UsIHRoZW4geW91cgorIyAr
bGljZW5zZSBmcm9tIGEgcGFydGljdWxhciBjb3B5cmlnaHQgaG9sZGVyIGlzIHJlaW5zdGF0ZWQg
KGEpCisjICtwcm92aXNpb25hbGx5LCB1bmxlc3MgYW5kIHVudGlsIHRoZSBjb3B5cmlnaHQgaG9s
ZGVyIGV4cGxpY2l0bHkgYW5kCisjICtmaW5hbGx5IHRlcm1pbmF0ZXMgeW91ciBsaWNlbnNlLCBh
bmQgKGIpIHBlcm1hbmVudGx5LCBpZiB0aGUgY29weXJpZ2h0CisjICtob2xkZXIgZmFpbHMgdG8g
bm90aWZ5IHlvdSBvZiB0aGUgdmlvbGF0aW9uIGJ5IHNvbWUgcmVhc29uYWJsZSBtZWFucworIyAr
cHJpb3IgdG8gNjAgZGF5cyBhZnRlciB0aGUgY2Vzc2F0aW9uLgorIyArCisjICsgIE1vcmVvdmVy
LCB5b3VyIGxpY2Vuc2UgZnJvbSBhIHBhcnRpY3VsYXIgY29weXJpZ2h0IGhvbGRlciBpcworIyAr
cmVpbnN0YXRlZCBwZXJtYW5lbnRseSBpZiB0aGUgY29weXJpZ2h0IGhvbGRlciBub3RpZmllcyB5
b3Ugb2YgdGhlCisjICt2aW9sYXRpb24gYnkgc29tZSByZWFzb25hYmxlIG1lYW5zLCB0aGlzIGlz
IHRoZSBmaXJzdCB0aW1lIHlvdSBoYXZlCisjICtyZWNlaXZlZCBub3RpY2Ugb2YgdmlvbGF0aW9u
IG9mIHRoaXMgTGljZW5zZSAoZm9yIGFueSB3b3JrKSBmcm9tIHRoYXQKKyMgK2NvcHlyaWdodCBo
b2xkZXIsIGFuZCB5b3UgY3VyZSB0aGUgdmlvbGF0aW9uIHByaW9yIHRvIDMwIGRheXMgYWZ0ZXIK
KyMgK3lvdXIgcmVjZWlwdCBvZiB0aGUgbm90aWNlLgorIyArCisjICsgIFRlcm1pbmF0aW9uIG9m
IHlvdXIgcmlnaHRzIHVuZGVyIHRoaXMgc2VjdGlvbiBkb2VzIG5vdCB0ZXJtaW5hdGUgdGhlCisj
ICtsaWNlbnNlcyBvZiBwYXJ0aWVzIHdobyBoYXZlIHJlY2VpdmVkIGNvcGllcyBvciByaWdodHMg
ZnJvbSB5b3UgdW5kZXIKKyMgK3RoaXMgTGljZW5zZS4gIElmIHlvdXIgcmlnaHRzIGhhdmUgYmVl
biB0ZXJtaW5hdGVkIGFuZCBub3QgcGVybWFuZW50bHkKKyMgK3JlaW5zdGF0ZWQsIHlvdSBkbyBu
b3QgcXVhbGlmeSB0byByZWNlaXZlIG5ldyBsaWNlbnNlcyBmb3IgdGhlIHNhbWUKKyMgK21hdGVy
aWFsIHVuZGVyIHNlY3Rpb24gMTAuCisjICsKKyMgKyAgOS4gQWNjZXB0YW5jZSBOb3QgUmVxdWly
ZWQgZm9yIEhhdmluZyBDb3BpZXMuCisjICsKKyMgKyAgWW91IGFyZSBub3QgcmVxdWlyZWQgdG8g
YWNjZXB0IHRoaXMgTGljZW5zZSBpbiBvcmRlciB0byByZWNlaXZlIG9yCisjICtydW4gYSBjb3B5
IG9mIHRoZSBQcm9ncmFtLiAgQW5jaWxsYXJ5IHByb3BhZ2F0aW9uIG9mIGEgY292ZXJlZCB3b3Jr
CisjICtvY2N1cnJpbmcgc29sZWx5IGFzIGEgY29uc2VxdWVuY2Ugb2YgdXNpbmcgcGVlci10by1w
ZWVyIHRyYW5zbWlzc2lvbgorIyArdG8gcmVjZWl2ZSBhIGNvcHkgbGlrZXdpc2UgZG9lcyBub3Qg
cmVxdWlyZSBhY2NlcHRhbmNlLiAgSG93ZXZlciwKKyMgK25vdGhpbmcgb3RoZXIgdGhhbiB0aGlz
IExpY2Vuc2UgZ3JhbnRzIHlvdSBwZXJtaXNzaW9uIHRvIHByb3BhZ2F0ZSBvcgorIyArbW9kaWZ5
IGFueSBjb3ZlcmVkIHdvcmsuICBUaGVzZSBhY3Rpb25zIGluZnJpbmdlIGNvcHlyaWdodCBpZiB5
b3UgZG8KKyMgK25vdCBhY2NlcHQgdGhpcyBMaWNlbnNlLiAgVGhlcmVmb3JlLCBieSBtb2RpZnlp
bmcgb3IgcHJvcGFnYXRpbmcgYQorIyArY292ZXJlZCB3b3JrLCB5b3UgaW5kaWNhdGUgeW91ciBh
Y2NlcHRhbmNlIG9mIHRoaXMgTGljZW5zZSB0byBkbyBzby4KKyMgKworIyArICAxMC4gQXV0b21h
dGljIExpY2Vuc2luZyBvZiBEb3duc3RyZWFtIFJlY2lwaWVudHMuCisjICsKKyMgKyAgRWFjaCB0
aW1lIHlvdSBjb252ZXkgYSBjb3ZlcmVkIHdvcmssIHRoZSByZWNpcGllbnQgYXV0b21hdGljYWxs
eQorIyArcmVjZWl2ZXMgYSBsaWNlbnNlIGZyb20gdGhlIG9yaWdpbmFsIGxpY2Vuc29ycywgdG8g
cnVuLCBtb2RpZnkgYW5kCisjICtwcm9wYWdhdGUgdGhhdCB3b3JrLCBzdWJqZWN0IHRvIHRoaXMg
TGljZW5zZS4gIFlvdSBhcmUgbm90IHJlc3BvbnNpYmxlCisjICtmb3IgZW5mb3JjaW5nIGNvbXBs
aWFuY2UgYnkgdGhpcmQgcGFydGllcyB3aXRoIHRoaXMgTGljZW5zZS4KKyMgKworIyArICBBbiAi
ZW50aXR5IHRyYW5zYWN0aW9uIiBpcyBhIHRyYW5zYWN0aW9uIHRyYW5zZmVycmluZyBjb250cm9s
IG9mIGFuCisjICtvcmdhbml6YXRpb24sIG9yIHN1YnN0YW50aWFsbHkgYWxsIGFzc2V0cyBvZiBv
bmUsIG9yIHN1YmRpdmlkaW5nIGFuCisjICtvcmdhbml6YXRpb24sIG9yIG1lcmdpbmcgb3JnYW5p
emF0aW9ucy4gIElmIHByb3BhZ2F0aW9uIG9mIGEgY292ZXJlZAorIyArd29yayByZXN1bHRzIGZy
b20gYW4gZW50aXR5IHRyYW5zYWN0aW9uLCBlYWNoIHBhcnR5IHRvIHRoYXQKKyMgK3RyYW5zYWN0
aW9uIHdobyByZWNlaXZlcyBhIGNvcHkgb2YgdGhlIHdvcmsgYWxzbyByZWNlaXZlcyB3aGF0ZXZl
cgorIyArbGljZW5zZXMgdG8gdGhlIHdvcmsgdGhlIHBhcnR5J3MgcHJlZGVjZXNzb3IgaW4gaW50
ZXJlc3QgaGFkIG9yIGNvdWxkCisjICtnaXZlIHVuZGVyIHRoZSBwcmV2aW91cyBwYXJhZ3JhcGgs
IHBsdXMgYSByaWdodCB0byBwb3NzZXNzaW9uIG9mIHRoZQorIyArQ29ycmVzcG9uZGluZyBTb3Vy
Y2Ugb2YgdGhlIHdvcmsgZnJvbSB0aGUgcHJlZGVjZXNzb3IgaW4gaW50ZXJlc3QsIGlmCisjICt0
aGUgcHJlZGVjZXNzb3IgaGFzIGl0IG9yIGNhbiBnZXQgaXQgd2l0aCByZWFzb25hYmxlIGVmZm9y
dHMuCisjICsKKyMgKyAgWW91IG1heSBub3QgaW1wb3NlIGFueSBmdXJ0aGVyIHJlc3RyaWN0aW9u
cyBvbiB0aGUgZXhlcmNpc2Ugb2YgdGhlCisjICtyaWdodHMgZ3JhbnRlZCBvciBhZmZpcm1lZCB1
bmRlciB0aGlzIExpY2Vuc2UuICBGb3IgZXhhbXBsZSwgeW91IG1heQorIyArbm90IGltcG9zZSBh
IGxpY2Vuc2UgZmVlLCByb3lhbHR5LCBvciBvdGhlciBjaGFyZ2UgZm9yIGV4ZXJjaXNlIG9mCisj
ICtyaWdodHMgZ3JhbnRlZCB1bmRlciB0aGlzIExpY2Vuc2UsIGFuZCB5b3UgbWF5IG5vdCBpbml0
aWF0ZSBsaXRpZ2F0aW9uCisjICsoaW5jbHVkaW5nIGEgY3Jvc3MtY2xhaW0gb3IgY291bnRlcmNs
YWltIGluIGEgbGF3c3VpdCkgYWxsZWdpbmcgdGhhdAorIyArYW55IHBhdGVudCBjbGFpbSBpcyBp
bmZyaW5nZWQgYnkgbWFraW5nLCB1c2luZywgc2VsbGluZywgb2ZmZXJpbmcgZm9yCisjICtzYWxl
LCBvciBpbXBvcnRpbmcgdGhlIFByb2dyYW0gb3IgYW55IHBvcnRpb24gb2YgaXQuCisjICsKKyMg
KyAgMTEuIFBhdGVudHMuCisjICsKKyMgKyAgQSAiY29udHJpYnV0b3IiIGlzIGEgY29weXJpZ2h0
IGhvbGRlciB3aG8gYXV0aG9yaXplcyB1c2UgdW5kZXIgdGhpcworIyArTGljZW5zZSBvZiB0aGUg
UHJvZ3JhbSBvciBhIHdvcmsgb24gd2hpY2ggdGhlIFByb2dyYW0gaXMgYmFzZWQuICBUaGUKKyMg
K3dvcmsgdGh1cyBsaWNlbnNlZCBpcyBjYWxsZWQgdGhlIGNvbnRyaWJ1dG9yJ3MgImNvbnRyaWJ1
dG9yIHZlcnNpb24iLgorIyArCisjICsgIEEgY29udHJpYnV0b3IncyAiZXNzZW50aWFsIHBhdGVu
dCBjbGFpbXMiIGFyZSBhbGwgcGF0ZW50IGNsYWltcworIyArb3duZWQgb3IgY29udHJvbGxlZCBi
eSB0aGUgY29udHJpYnV0b3IsIHdoZXRoZXIgYWxyZWFkeSBhY3F1aXJlZCBvcgorIyAraGVyZWFm
dGVyIGFjcXVpcmVkLCB0aGF0IHdvdWxkIGJlIGluZnJpbmdlZCBieSBzb21lIG1hbm5lciwgcGVy
bWl0dGVkCisjICtieSB0aGlzIExpY2Vuc2UsIG9mIG1ha2luZywgdXNpbmcsIG9yIHNlbGxpbmcg
aXRzIGNvbnRyaWJ1dG9yIHZlcnNpb24sCisjICtidXQgZG8gbm90IGluY2x1ZGUgY2xhaW1zIHRo
YXQgd291bGQgYmUgaW5mcmluZ2VkIG9ubHkgYXMgYQorIyArY29uc2VxdWVuY2Ugb2YgZnVydGhl
ciBtb2RpZmljYXRpb24gb2YgdGhlIGNvbnRyaWJ1dG9yIHZlcnNpb24uICBGb3IKKyMgK3B1cnBv
c2VzIG9mIHRoaXMgZGVmaW5pdGlvbiwgImNvbnRyb2wiIGluY2x1ZGVzIHRoZSByaWdodCB0byBn
cmFudAorIyArcGF0ZW50IHN1YmxpY2Vuc2VzIGluIGEgbWFubmVyIGNvbnNpc3RlbnQgd2l0aCB0
aGUgcmVxdWlyZW1lbnRzIG9mCisjICt0aGlzIExpY2Vuc2UuCisjICsKKyMgKyAgRWFjaCBjb250
cmlidXRvciBncmFudHMgeW91IGEgbm9uLWV4Y2x1c2l2ZSwgd29ybGR3aWRlLCByb3lhbHR5LWZy
ZWUKKyMgK3BhdGVudCBsaWNlbnNlIHVuZGVyIHRoZSBjb250cmlidXRvcidzIGVzc2VudGlhbCBw
YXRlbnQgY2xhaW1zLCB0bworIyArbWFrZSwgdXNlLCBzZWxsLCBvZmZlciBmb3Igc2FsZSwgaW1w
b3J0IGFuZCBvdGhlcndpc2UgcnVuLCBtb2RpZnkgYW5kCisjICtwcm9wYWdhdGUgdGhlIGNvbnRl
bnRzIG9mIGl0cyBjb250cmlidXRvciB2ZXJzaW9uLgorIyArCisjICsgIEluIHRoZSBmb2xsb3dp
bmcgdGhyZWUgcGFyYWdyYXBocywgYSAicGF0ZW50IGxpY2Vuc2UiIGlzIGFueSBleHByZXNzCisj
ICthZ3JlZW1lbnQgb3IgY29tbWl0bWVudCwgaG93ZXZlciBkZW5vbWluYXRlZCwgbm90IHRvIGVu
Zm9yY2UgYSBwYXRlbnQKKyMgKyhzdWNoIGFzIGFuIGV4cHJlc3MgcGVybWlzc2lvbiB0byBwcmFj
dGljZSBhIHBhdGVudCBvciBjb3ZlbmFudCBub3QgdG8KKyMgK3N1ZSBmb3IgcGF0ZW50IGluZnJp
bmdlbWVudCkuICBUbyAiZ3JhbnQiIHN1Y2ggYSBwYXRlbnQgbGljZW5zZSB0byBhCisjICtwYXJ0
eSBtZWFucyB0byBtYWtlIHN1Y2ggYW4gYWdyZWVtZW50IG9yIGNvbW1pdG1lbnQgbm90IHRvIGVu
Zm9yY2UgYQorIyArcGF0ZW50IGFnYWluc3QgdGhlIHBhcnR5LgorIyArCisjICsgIElmIHlvdSBj
b252ZXkgYSBjb3ZlcmVkIHdvcmssIGtub3dpbmdseSByZWx5aW5nIG9uIGEgcGF0ZW50IGxpY2Vu
c2UsCisjICthbmQgdGhlIENvcnJlc3BvbmRpbmcgU291cmNlIG9mIHRoZSB3b3JrIGlzIG5vdCBh
dmFpbGFibGUgZm9yIGFueW9uZQorIyArdG8gY29weSwgZnJlZSBvZiBjaGFyZ2UgYW5kIHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGlzIExpY2Vuc2UsIHRocm91Z2ggYQorIyArcHVibGljbHkgYXZhaWxh
YmxlIG5ldHdvcmsgc2VydmVyIG9yIG90aGVyIHJlYWRpbHkgYWNjZXNzaWJsZSBtZWFucywKKyMg
K3RoZW4geW91IG11c3QgZWl0aGVyICgxKSBjYXVzZSB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2Ug
dG8gYmUgc28KKyMgK2F2YWlsYWJsZSwgb3IgKDIpIGFycmFuZ2UgdG8gZGVwcml2ZSB5b3Vyc2Vs
ZiBvZiB0aGUgYmVuZWZpdCBvZiB0aGUKKyMgK3BhdGVudCBsaWNlbnNlIGZvciB0aGlzIHBhcnRp
Y3VsYXIgd29yaywgb3IgKDMpIGFycmFuZ2UsIGluIGEgbWFubmVyCisjICtjb25zaXN0ZW50IHdp
dGggdGhlIHJlcXVpcmVtZW50cyBvZiB0aGlzIExpY2Vuc2UsIHRvIGV4dGVuZCB0aGUgcGF0ZW50
CisjICtsaWNlbnNlIHRvIGRvd25zdHJlYW0gcmVjaXBpZW50cy4gICJLbm93aW5nbHkgcmVseWlu
ZyIgbWVhbnMgeW91IGhhdmUKKyMgK2FjdHVhbCBrbm93bGVkZ2UgdGhhdCwgYnV0IGZvciB0aGUg
cGF0ZW50IGxpY2Vuc2UsIHlvdXIgY29udmV5aW5nIHRoZQorIyArY292ZXJlZCB3b3JrIGluIGEg
Y291bnRyeSwgb3IgeW91ciByZWNpcGllbnQncyB1c2Ugb2YgdGhlIGNvdmVyZWQgd29yaworIyAr
aW4gYSBjb3VudHJ5LCB3b3VsZCBpbmZyaW5nZSBvbmUgb3IgbW9yZSBpZGVudGlmaWFibGUgcGF0
ZW50cyBpbiB0aGF0CisjICtjb3VudHJ5IHRoYXQgeW91IGhhdmUgcmVhc29uIHRvIGJlbGlldmUg
YXJlIHZhbGlkLgorIyArCisjICsgIElmLCBwdXJzdWFudCB0byBvciBpbiBjb25uZWN0aW9uIHdp
dGggYSBzaW5nbGUgdHJhbnNhY3Rpb24gb3IKKyMgK2FycmFuZ2VtZW50LCB5b3UgY29udmV5LCBv
ciBwcm9wYWdhdGUgYnkgcHJvY3VyaW5nIGNvbnZleWFuY2Ugb2YsIGEKKyMgK2NvdmVyZWQgd29y
aywgYW5kIGdyYW50IGEgcGF0ZW50IGxpY2Vuc2UgdG8gc29tZSBvZiB0aGUgcGFydGllcworIyAr
cmVjZWl2aW5nIHRoZSBjb3ZlcmVkIHdvcmsgYXV0aG9yaXppbmcgdGhlbSB0byB1c2UsIHByb3Bh
Z2F0ZSwgbW9kaWZ5CisjICtvciBjb252ZXkgYSBzcGVjaWZpYyBjb3B5IG9mIHRoZSBjb3ZlcmVk
IHdvcmssIHRoZW4gdGhlIHBhdGVudCBsaWNlbnNlCisjICt5b3UgZ3JhbnQgaXMgYXV0b21hdGlj
YWxseSBleHRlbmRlZCB0byBhbGwgcmVjaXBpZW50cyBvZiB0aGUgY292ZXJlZAorIyArd29yayBh
bmQgd29ya3MgYmFzZWQgb24gaXQuCisjICsKKyMgKyAgQSBwYXRlbnQgbGljZW5zZSBpcyAiZGlz
Y3JpbWluYXRvcnkiIGlmIGl0IGRvZXMgbm90IGluY2x1ZGUgd2l0aGluCisjICt0aGUgc2NvcGUg
b2YgaXRzIGNvdmVyYWdlLCBwcm9oaWJpdHMgdGhlIGV4ZXJjaXNlIG9mLCBvciBpcworIyArY29u
ZGl0aW9uZWQgb24gdGhlIG5vbi1leGVyY2lzZSBvZiBvbmUgb3IgbW9yZSBvZiB0aGUgcmlnaHRz
IHRoYXQgYXJlCisjICtzcGVjaWZpY2FsbHkgZ3JhbnRlZCB1bmRlciB0aGlzIExpY2Vuc2UuICBZ
b3UgbWF5IG5vdCBjb252ZXkgYSBjb3ZlcmVkCisjICt3b3JrIGlmIHlvdSBhcmUgYSBwYXJ0eSB0
byBhbiBhcnJhbmdlbWVudCB3aXRoIGEgdGhpcmQgcGFydHkgdGhhdCBpcworIyAraW4gdGhlIGJ1
c2luZXNzIG9mIGRpc3RyaWJ1dGluZyBzb2Z0d2FyZSwgdW5kZXIgd2hpY2ggeW91IG1ha2UgcGF5
bWVudAorIyArdG8gdGhlIHRoaXJkIHBhcnR5IGJhc2VkIG9uIHRoZSBleHRlbnQgb2YgeW91ciBh
Y3Rpdml0eSBvZiBjb252ZXlpbmcKKyMgK3RoZSB3b3JrLCBhbmQgdW5kZXIgd2hpY2ggdGhlIHRo
aXJkIHBhcnR5IGdyYW50cywgdG8gYW55IG9mIHRoZQorIyArcGFydGllcyB3aG8gd291bGQgcmVj
ZWl2ZSB0aGUgY292ZXJlZCB3b3JrIGZyb20geW91LCBhIGRpc2NyaW1pbmF0b3J5CisjICtwYXRl
bnQgbGljZW5zZSAoYSkgaW4gY29ubmVjdGlvbiB3aXRoIGNvcGllcyBvZiB0aGUgY292ZXJlZCB3
b3JrCisjICtjb252ZXllZCBieSB5b3UgKG9yIGNvcGllcyBtYWRlIGZyb20gdGhvc2UgY29waWVz
KSwgb3IgKGIpIHByaW1hcmlseQorIyArZm9yIGFuZCBpbiBjb25uZWN0aW9uIHdpdGggc3BlY2lm
aWMgcHJvZHVjdHMgb3IgY29tcGlsYXRpb25zIHRoYXQKKyMgK2NvbnRhaW4gdGhlIGNvdmVyZWQg
d29yaywgdW5sZXNzIHlvdSBlbnRlcmVkIGludG8gdGhhdCBhcnJhbmdlbWVudCwKKyMgK29yIHRo
YXQgcGF0ZW50IGxpY2Vuc2Ugd2FzIGdyYW50ZWQsIHByaW9yIHRvIDI4IE1hcmNoIDIwMDcuCisj
ICsKKyMgKyAgTm90aGluZyBpbiB0aGlzIExpY2Vuc2Ugc2hhbGwgYmUgY29uc3RydWVkIGFzIGV4
Y2x1ZGluZyBvciBsaW1pdGluZworIyArYW55IGltcGxpZWQgbGljZW5zZSBvciBvdGhlciBkZWZl
bnNlcyB0byBpbmZyaW5nZW1lbnQgdGhhdCBtYXkKKyMgK290aGVyd2lzZSBiZSBhdmFpbGFibGUg
dG8geW91IHVuZGVyIGFwcGxpY2FibGUgcGF0ZW50IGxhdy4KKyMgKworIyArICAxMi4gTm8gU3Vy
cmVuZGVyIG9mIE90aGVycycgRnJlZWRvbS4KKyMgKworIyArICBJZiBjb25kaXRpb25zIGFyZSBp
bXBvc2VkIG9uIHlvdSAod2hldGhlciBieSBjb3VydCBvcmRlciwgYWdyZWVtZW50IG9yCisjICtv
dGhlcndpc2UpIHRoYXQgY29udHJhZGljdCB0aGUgY29uZGl0aW9ucyBvZiB0aGlzIExpY2Vuc2Us
IHRoZXkgZG8gbm90CisjICtleGN1c2UgeW91IGZyb20gdGhlIGNvbmRpdGlvbnMgb2YgdGhpcyBM
aWNlbnNlLiAgSWYgeW91IGNhbm5vdCBjb252ZXkgYQorIyArY292ZXJlZCB3b3JrIHNvIGFzIHRv
IHNhdGlzZnkgc2ltdWx0YW5lb3VzbHkgeW91ciBvYmxpZ2F0aW9ucyB1bmRlciB0aGlzCisjICtM
aWNlbnNlIGFuZCBhbnkgb3RoZXIgcGVydGluZW50IG9ibGlnYXRpb25zLCB0aGVuIGFzIGEgY29u
c2VxdWVuY2UgeW91IG1heQorIyArbm90IGNvbnZleSBpdCBhdCBhbGwuICBGb3IgZXhhbXBsZSwg
aWYgeW91IGFncmVlIHRvIHRlcm1zIHRoYXQgb2JsaWdhdGUgeW91CisjICt0byBjb2xsZWN0IGEg
cm95YWx0eSBmb3IgZnVydGhlciBjb252ZXlpbmcgZnJvbSB0aG9zZSB0byB3aG9tIHlvdSBjb252
ZXkKKyMgK3RoZSBQcm9ncmFtLCB0aGUgb25seSB3YXkgeW91IGNvdWxkIHNhdGlzZnkgYm90aCB0
aG9zZSB0ZXJtcyBhbmQgdGhpcworIyArTGljZW5zZSB3b3VsZCBiZSB0byByZWZyYWluIGVudGly
ZWx5IGZyb20gY29udmV5aW5nIHRoZSBQcm9ncmFtLgorIyArCisjICsgIDEzLiBSZW1vdGUgTmV0
d29yayBJbnRlcmFjdGlvbjsgVXNlIHdpdGggdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
LgorIyArCisjICsgIE5vdHdpdGhzdGFuZGluZyBhbnkgb3RoZXIgcHJvdmlzaW9uIG9mIHRoaXMg
TGljZW5zZSwgaWYgeW91IG1vZGlmeSB0aGUKKyMgK1Byb2dyYW0sIHlvdXIgbW9kaWZpZWQgdmVy
c2lvbiBtdXN0IHByb21pbmVudGx5IG9mZmVyIGFsbCB1c2VycworIyAraW50ZXJhY3Rpbmcgd2l0
aCBpdCByZW1vdGVseSB0aHJvdWdoIGEgY29tcHV0ZXIgbmV0d29yayAoaWYgeW91ciB2ZXJzaW9u
CisjICtzdXBwb3J0cyBzdWNoIGludGVyYWN0aW9uKSBhbiBvcHBvcnR1bml0eSB0byByZWNlaXZl
IHRoZSBDb3JyZXNwb25kaW5nCisjICtTb3VyY2Ugb2YgeW91ciB2ZXJzaW9uIGJ5IHByb3ZpZGlu
ZyBhY2Nlc3MgdG8gdGhlIENvcnJlc3BvbmRpbmcgU291cmNlCisjICtmcm9tIGEgbmV0d29yayBz
ZXJ2ZXIgYXQgbm8gY2hhcmdlLCB0aHJvdWdoIHNvbWUgc3RhbmRhcmQgb3IgY3VzdG9tYXJ5Cisj
ICttZWFucyBvZiBmYWNpbGl0YXRpbmcgY29weWluZyBvZiBzb2Z0d2FyZS4gIFRoaXMgQ29ycmVz
cG9uZGluZyBTb3VyY2UKKyMgK3NoYWxsIGluY2x1ZGUgdGhlIENvcnJlc3BvbmRpbmcgU291cmNl
IGZvciBhbnkgd29yayBjb3ZlcmVkIGJ5IHZlcnNpb24gMworIyArb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIHRoYXQgaXMgaW5jb3Jwb3JhdGVkIHB1cnN1YW50IHRvIHRoZQorIyAr
Zm9sbG93aW5nIHBhcmFncmFwaC4KKyMgKworIyArICBOb3R3aXRoc3RhbmRpbmcgYW55IG90aGVy
IHByb3Zpc2lvbiBvZiB0aGlzIExpY2Vuc2UsIHlvdSBoYXZlCisjICtwZXJtaXNzaW9uIHRvIGxp
bmsgb3IgY29tYmluZSBhbnkgY292ZXJlZCB3b3JrIHdpdGggYSB3b3JrIGxpY2Vuc2VkCisjICt1
bmRlciB2ZXJzaW9uIDMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGludG8gYSBz
aW5nbGUKKyMgK2NvbWJpbmVkIHdvcmssIGFuZCB0byBjb252ZXkgdGhlIHJlc3VsdGluZyB3b3Jr
LiAgVGhlIHRlcm1zIG9mIHRoaXMKKyMgK0xpY2Vuc2Ugd2lsbCBjb250aW51ZSB0byBhcHBseSB0
byB0aGUgcGFydCB3aGljaCBpcyB0aGUgY292ZXJlZCB3b3JrLAorIyArYnV0IHRoZSB3b3JrIHdp
dGggd2hpY2ggaXQgaXMgY29tYmluZWQgd2lsbCByZW1haW4gZ292ZXJuZWQgYnkgdmVyc2lvbgor
IyArMyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuCisjICsKKyMgKyAgMTQuIFJl
dmlzZWQgVmVyc2lvbnMgb2YgdGhpcyBMaWNlbnNlLgorIyArCisjICsgIFRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb24gbWF5IHB1Ymxpc2ggcmV2aXNlZCBhbmQvb3IgbmV3IHZlcnNpb25zIG9m
CisjICt0aGUgR05VIEFmZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZyb20gdGltZSB0byB0
aW1lLiAgU3VjaCBuZXcgdmVyc2lvbnMKKyMgK3dpbGwgYmUgc2ltaWxhciBpbiBzcGlyaXQgdG8g
dGhlIHByZXNlbnQgdmVyc2lvbiwgYnV0IG1heSBkaWZmZXIgaW4gZGV0YWlsIHRvCisjICthZGRy
ZXNzIG5ldyBwcm9ibGVtcyBvciBjb25jZXJucy4KKyMgKworIyArICBFYWNoIHZlcnNpb24gaXMg
Z2l2ZW4gYSBkaXN0aW5ndWlzaGluZyB2ZXJzaW9uIG51bWJlci4gIElmIHRoZQorIyArUHJvZ3Jh
bSBzcGVjaWZpZXMgdGhhdCBhIGNlcnRhaW4gbnVtYmVyZWQgdmVyc2lvbiBvZiB0aGUgR05VIEFm
ZmVybyBHZW5lcmFsCisjICtQdWJsaWMgTGljZW5zZSAib3IgYW55IGxhdGVyIHZlcnNpb24iIGFw
cGxpZXMgdG8gaXQsIHlvdSBoYXZlIHRoZQorIyArb3B0aW9uIG9mIGZvbGxvd2luZyB0aGUgdGVy
bXMgYW5kIGNvbmRpdGlvbnMgZWl0aGVyIG9mIHRoYXQgbnVtYmVyZWQKKyMgK3ZlcnNpb24gb3Ig
b2YgYW55IGxhdGVyIHZlcnNpb24gcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlCisjICtG
b3VuZGF0aW9uLiAgSWYgdGhlIFByb2dyYW0gZG9lcyBub3Qgc3BlY2lmeSBhIHZlcnNpb24gbnVt
YmVyIG9mIHRoZQorIyArR05VIEFmZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLCB5b3UgbWF5
IGNob29zZSBhbnkgdmVyc2lvbiBldmVyIHB1Ymxpc2hlZAorIyArYnkgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbi4KKyMgKworIyArICBJZiB0aGUgUHJvZ3JhbSBzcGVjaWZpZXMgdGhhdCBh
IHByb3h5IGNhbiBkZWNpZGUgd2hpY2ggZnV0dXJlCisjICt2ZXJzaW9ucyBvZiB0aGUgR05VIEFm
ZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGNhbiBiZSB1c2VkLCB0aGF0IHByb3h5J3MKKyMg
K3B1YmxpYyBzdGF0ZW1lbnQgb2YgYWNjZXB0YW5jZSBvZiBhIHZlcnNpb24gcGVybWFuZW50bHkg
YXV0aG9yaXplcyB5b3UKKyMgK3RvIGNob29zZSB0aGF0IHZlcnNpb24gZm9yIHRoZSBQcm9ncmFt
LgorIyArCisjICsgIExhdGVyIGxpY2Vuc2UgdmVyc2lvbnMgbWF5IGdpdmUgeW91IGFkZGl0aW9u
YWwgb3IgZGlmZmVyZW50CisjICtwZXJtaXNzaW9ucy4gIEhvd2V2ZXIsIG5vIGFkZGl0aW9uYWwg
b2JsaWdhdGlvbnMgYXJlIGltcG9zZWQgb24gYW55CisjICthdXRob3Igb3IgY29weXJpZ2h0IGhv
bGRlciBhcyBhIHJlc3VsdCBvZiB5b3VyIGNob29zaW5nIHRvIGZvbGxvdyBhCisjICtsYXRlciB2
ZXJzaW9uLgorIyArCisjICsgIDE1LiBEaXNjbGFpbWVyIG9mIFdhcnJhbnR5LgorIyArCisjICsg
IFRIRVJFIElTIE5PIFdBUlJBTlRZIEZPUiBUSEUgUFJPR1JBTSwgVE8gVEhFIEVYVEVOVCBQRVJN
SVRURUQgQlkKKyMgK0FQUExJQ0FCTEUgTEFXLiAgRVhDRVBUIFdIRU4gT1RIRVJXSVNFIFNUQVRF
RCBJTiBXUklUSU5HIFRIRSBDT1BZUklHSFQKKyMgK0hPTERFUlMgQU5EL09SIE9USEVSIFBBUlRJ
RVMgUFJPVklERSBUSEUgUFJPR1JBTSAiQVMgSVMiIFdJVEhPVVQgV0FSUkFOVFkKKyMgK09GIEFO
WSBLSU5ELCBFSVRIRVIgRVhQUkVTU0VEIE9SIElNUExJRUQsIElOQ0xVRElORywgQlVUIE5PVCBM
SU1JVEVEIFRPLAorIyArVEhFIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkg
QU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUgorIyArUFVSUE9TRS4gIFRIRSBFTlRJUkUgUklT
SyBBUyBUTyBUSEUgUVVBTElUWSBBTkQgUEVSRk9STUFOQ0UgT0YgVEhFIFBST0dSQU0KKyMgK0lT
IFdJVEggWU9VLiAgU0hPVUxEIFRIRSBQUk9HUkFNIFBST1ZFIERFRkVDVElWRSwgWU9VIEFTU1VN
RSBUSEUgQ09TVCBPRgorIyArQUxMIE5FQ0VTU0FSWSBTRVJWSUNJTkcsIFJFUEFJUiBPUiBDT1JS
RUNUSU9OLgorIyArCisjICsgIDE2LiBMaW1pdGF0aW9uIG9mIExpYWJpbGl0eS4KKyMgKworIyAr
ICBJTiBOTyBFVkVOVCBVTkxFU1MgUkVRVUlSRUQgQlkgQVBQTElDQUJMRSBMQVcgT1IgQUdSRUVE
IFRPIElOIFdSSVRJTkcKKyMgK1dJTEwgQU5ZIENPUFlSSUdIVCBIT0xERVIsIE9SIEFOWSBPVEhF
UiBQQVJUWSBXSE8gTU9ESUZJRVMgQU5EL09SIENPTlZFWVMKKyMgK1RIRSBQUk9HUkFNIEFTIFBF
Uk1JVFRFRCBBQk9WRSwgQkUgTElBQkxFIFRPIFlPVSBGT1IgREFNQUdFUywgSU5DTFVESU5HIEFO
WQorIyArR0VORVJBTCwgU1BFQ0lBTCwgSU5DSURFTlRBTCBPUiBDT05TRVFVRU5USUFMIERBTUFH
RVMgQVJJU0lORyBPVVQgT0YgVEhFCisjICtVU0UgT1IgSU5BQklMSVRZIFRPIFVTRSBUSEUgUFJP
R1JBTSAoSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBMT1NTIE9GCisjICtEQVRBIE9SIERB
VEEgQkVJTkcgUkVOREVSRUQgSU5BQ0NVUkFURSBPUiBMT1NTRVMgU1VTVEFJTkVEIEJZIFlPVSBP
UiBUSElSRAorIyArUEFSVElFUyBPUiBBIEZBSUxVUkUgT0YgVEhFIFBST0dSQU0gVE8gT1BFUkFU
RSBXSVRIIEFOWSBPVEhFUiBQUk9HUkFNUyksCisjICtFVkVOIElGIFNVQ0ggSE9MREVSIE9SIE9U
SEVSIFBBUlRZIEhBUyBCRUVOIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GCisjICtTVUNI
IERBTUFHRVMuCisjICsKKyMgKyAgMTcuIEludGVycHJldGF0aW9uIG9mIFNlY3Rpb25zIDE1IGFu
ZCAxNi4KKyMgKworIyArICBJZiB0aGUgZGlzY2xhaW1lciBvZiB3YXJyYW50eSBhbmQgbGltaXRh
dGlvbiBvZiBsaWFiaWxpdHkgcHJvdmlkZWQKKyMgK2Fib3ZlIGNhbm5vdCBiZSBnaXZlbiBsb2Nh
bCBsZWdhbCBlZmZlY3QgYWNjb3JkaW5nIHRvIHRoZWlyIHRlcm1zLAorIyArcmV2aWV3aW5nIGNv
dXJ0cyBzaGFsbCBhcHBseSBsb2NhbCBsYXcgdGhhdCBtb3N0IGNsb3NlbHkgYXBwcm94aW1hdGVz
CisjICthbiBhYnNvbHV0ZSB3YWl2ZXIgb2YgYWxsIGNpdmlsIGxpYWJpbGl0eSBpbiBjb25uZWN0
aW9uIHdpdGggdGhlCisjICtQcm9ncmFtLCB1bmxlc3MgYSB3YXJyYW50eSBvciBhc3N1bXB0aW9u
IG9mIGxpYWJpbGl0eSBhY2NvbXBhbmllcyBhCisjICtjb3B5IG9mIHRoZSBQcm9ncmFtIGluIHJl
dHVybiBmb3IgYSBmZWUuCisjICsKKyMgKyAgICAgICAgICAgICAgICAgICAgIEVORCBPRiBURVJN
UyBBTkQgQ09ORElUSU9OUworIyArCisjICsgICAgICAgICAgICBIb3cgdG8gQXBwbHkgVGhlc2Ug
VGVybXMgdG8gWW91ciBOZXcgUHJvZ3JhbXMKKyMgKworIyArICBJZiB5b3UgZGV2ZWxvcCBhIG5l
dyBwcm9ncmFtLCBhbmQgeW91IHdhbnQgaXQgdG8gYmUgb2YgdGhlIGdyZWF0ZXN0CisjICtwb3Nz
aWJsZSB1c2UgdG8gdGhlIHB1YmxpYywgdGhlIGJlc3Qgd2F5IHRvIGFjaGlldmUgdGhpcyBpcyB0
byBtYWtlIGl0CisjICtmcmVlIHNvZnR3YXJlIHdoaWNoIGV2ZXJ5b25lIGNhbiByZWRpc3RyaWJ1
dGUgYW5kIGNoYW5nZSB1bmRlciB0aGVzZSB0ZXJtcy4KKyMgKworIyArICBUbyBkbyBzbywgYXR0
YWNoIHRoZSBmb2xsb3dpbmcgbm90aWNlcyB0byB0aGUgcHJvZ3JhbS4gIEl0IGlzIHNhZmVzdAor
IyArdG8gYXR0YWNoIHRoZW0gdG8gdGhlIHN0YXJ0IG9mIGVhY2ggc291cmNlIGZpbGUgdG8gbW9z
dCBlZmZlY3RpdmVseQorIyArc3RhdGUgdGhlIGV4Y2x1c2lvbiBvZiB3YXJyYW50eTsgYW5kIGVh
Y2ggZmlsZSBzaG91bGQgaGF2ZSBhdCBsZWFzdAorIyArdGhlICJjb3B5cmlnaHQiIGxpbmUgYW5k
IGEgcG9pbnRlciB0byB3aGVyZSB0aGUgZnVsbCBub3RpY2UgaXMgZm91bmQuCisjICsKKyMgKyAg
ICA8b25lIGxpbmUgdG8gZ2l2ZSB0aGUgcHJvZ3JhbSdzIG5hbWUgYW5kIGEgYnJpZWYgaWRlYSBv
ZiB3aGF0IGl0IGRvZXMuPgorIyArICAgIENvcHlyaWdodCAoQykgPHllYXI+ICA8bmFtZSBvZiBh
dXRob3I+CisjICsKKyMgKyAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTogeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorIyArICAgIGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEFmZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZAor
IyArICAgIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIGVpdGhlciB2ZXJzaW9uIDMg
b2YgdGhlIExpY2Vuc2UsIG9yCisjICsgICAgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVy
c2lvbi4KKyMgKworIyArICAgIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9w
ZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorIyArICAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5U
WTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisjICsgICAgTUVSQ0hBTlRB
QklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorIyAr
ICAgIEdOVSBBZmZlcm8gR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgor
IyArCisjICsgICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEFm
ZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisjICsgICAgYWxvbmcgd2l0aCB0aGlzIHByb2dy
YW0uICBJZiBub3QsIHNlZSA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorIyArCisj
ICtBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ryb25p
YyBhbmQgcGFwZXIgbWFpbC4KKyMgKworIyArICBJZiB5b3VyIHNvZnR3YXJlIGNhbiBpbnRlcmFj
dCB3aXRoIHVzZXJzIHJlbW90ZWx5IHRocm91Z2ggYSBjb21wdXRlcgorIyArbmV0d29yaywgeW91
IHNob3VsZCBhbHNvIG1ha2Ugc3VyZSB0aGF0IGl0IHByb3ZpZGVzIGEgd2F5IGZvciB1c2VycyB0
bworIyArZ2V0IGl0cyBzb3VyY2UuICBGb3IgZXhhbXBsZSwgaWYgeW91ciBwcm9ncmFtIGlzIGEg
d2ViIGFwcGxpY2F0aW9uLCBpdHMKKyMgK2ludGVyZmFjZSBjb3VsZCBkaXNwbGF5IGEgIlNvdXJj
ZSIgbGluayB0aGF0IGxlYWRzIHVzZXJzIHRvIGFuIGFyY2hpdmUKKyMgK29mIHRoZSBjb2RlLiAg
VGhlcmUgYXJlIG1hbnkgd2F5cyB5b3UgY291bGQgb2ZmZXIgc291cmNlLCBhbmQgZGlmZmVyZW50
CisjICtzb2x1dGlvbnMgd2lsbCBiZSBiZXR0ZXIgZm9yIGRpZmZlcmVudCBwcm9ncmFtczsgc2Vl
IHNlY3Rpb24gMTMgZm9yIHRoZQorIyArc3BlY2lmaWMgcmVxdWlyZW1lbnRzLgorIyArCisjICsg
IFlvdSBzaG91bGQgYWxzbyBnZXQgeW91ciBlbXBsb3llciAoaWYgeW91IHdvcmsgYXMgYSBwcm9n
cmFtbWVyKSBvciBzY2hvb2wsCisjICtpZiBhbnksIHRvIHNpZ24gYSAiY29weXJpZ2h0IGRpc2Ns
YWltZXIiIGZvciB0aGUgcHJvZ3JhbSwgaWYgbmVjZXNzYXJ5LgorIyArRm9yIG1vcmUgaW5mb3Jt
YXRpb24gb24gdGhpcywgYW5kIGhvdyB0byBhcHBseSBhbmQgZm9sbG93IHRoZSBHTlUgQUdQTCwg
c2VlCisjICs8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorIyAKKyMKKworU1VNTUFS
WSA9ICJTUUxpdGUgT1JNIGxpZ2h0IGhlYWRlciBvbmx5IGxpYnJhcnkgZm9yIG1vZGVybiBDKysi
CitIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vZm5jMTIvc3FsaXRlX29ybSIKK0xJQ0VO
U0UgPSAiQlNELTMtQ2xhdXNlIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9NGFlMDlkNDVlYWM0YWEwOGQwMTNiNWYyZTAxYzY3ZjYiCisKK2luaGVyaXQgY21ha2UKKwor
REVQRU5EUyArPSAic3FsaXRlMyIKKworU1JDUkVWID0gImZmN2M4NzhhZjg3MmY3OTg3YjYyZDgy
NTI4NGZiMjVkNjA0M2FmMTAiCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZm5jMTIvc3Fs
aXRlX29ybTtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgorUyA9ICIke1dPUktESVJ9L2dp
dCIKKworRVhUUkFfT0VDTUFLRSArPSAiLURTcWxpdGVPcm1fQnVpbGRUZXN0cz1PRkYgLURMSUJf
SU5TVEFMTF9ESVI9JHtsaWJkaXJ9IFwKKyAgICAgICAgICAgICAgICAgIC1EQ01BS0VfSU5TVEFM
TF9ESVI9JHtsaWJkaXJ9L2NtYWtlIFwKKyAgICAgICAgICAgICAgICAgIC1EUEtHQ09ORklHX0lO
U1RBTExfRElSPSR7bGliZGlyfS9wa2djb25maWciCisKK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZl
IG5hdGl2ZXNkayIKKworRklMRVM6JHtQTn0tZGV2ICs9ICIke2xpYmRpcn0vY21ha2UvJHtCUE59
IgorCisjIEhlYWRlci1vbmx5IGxpYnJhcnkKK1JERVBFTkRTOiR7UE59LWRldiA9ICIiCitSUkVD
T01NRU5EUzoke1BOfS1kYmcgPSAiJHtQTn0tZGV2ICg9ICR7RVhURU5EUEtHVn0pIgotLSAKMi4z
OS4yCgo=

--===============8686382910930291769==--


Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6768C41513
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 08:07:09 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.2388.1691222824212735317
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 01:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=H79vB5qC;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E8AC40006
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691222822;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=IL0drAwHtQj0tjrbrlRrmPSIMZQdNkcE8pkRoaYMApM=;
	b=H79vB5qC4g9nGDudD1V1xzU0HR1R3CFhwjbBvmGMM/vOLhXWqXVK/gGcQynJVN8SbF/VKC
	UTZ7+kCtRX2H/OC0+kgP9ICnOvfOkadP0FrwrgJtbvvXhZZ4iy3kjDx0ieETfUL8+QAQ+u
	i9MoCwzvcO/MQF4lXoESOURQ3bL1d9g5xnS9WzsAIkIOe8Lco3lAx7sjfPI8NRxcQV+HO6
	uIIrd1yphmDDjAlORkFFb+kRnzbQc3BmwXoYEV6O6auL29feJ3JwW4CnVGN2h8KLX7dJ+Y
	mhCDdXNGev5z0XLFcqf38SGdP7gGzdRaxuJJANKMN6+i0yHDWJ5eXPiN17Hy/Q==
Content-Type: multipart/mixed; boundary="===============0972288759330885269=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] libmodule-build-tiny-perl: upgrading to 0.046 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 08:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104287
Message-Id: <20230805080709.D6768C41513@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 08:07:09 +0000 (UTC)

--===============0972288759330885269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmodule-build-tiny-perl* to *0.046* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmodule-build-tiny-perl-upgrade-0.045-0.046.patch
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
From 287b9e43cc8f86f41cb58f5dfbbca5987ff12b5d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:59:11 -0500
Subject: [PATCH] libmodule-build-tiny-perl: upgrade 0.045 -> 0.046

---
 ....bb => libmodule-build-tiny-perl_0.046.bb} | 251 +++++++++++++++++-
 1 file changed, 249 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-build-tiny-perl_0.045.bb => libmodule-build-tiny-perl_0.046.bb} (13%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
similarity index 13%
rename from meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
index 17ee50d7c..78687b8cd 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
@@ -1,3 +1,250 @@
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
+# @@ -270,110 +270,143 @@
+#  That's all there is to it!
+#  
+#  
+# ---- The Artistic License 1.0 ---
+# +--- The Artistic License 1.0 (Perl) ---
+#  
+#  This software is Copyright (c) 2011 by Leon Timmermans, David Golden.
+#  
+#  This is free software, licensed under:
+#  
+# -  The Artistic License 1.0
+# -
+# -The Artistic License
+# -
+# -Preamble
+# -
+# -The intent of this document is to state the conditions under which a Package
+# -may be copied, such that the Copyright Holder maintains some semblance of
+# -artistic control over the development of the package, while giving the users of
+# -the package the right to use and distribute the Package in a more-or-less
+# -customary fashion, plus the right to make reasonable modifications.
+# +  The Artistic License 1.0 (Perl)
+# +
+# +
+# +
+# +
+# +
+# +                         The "Artistic License"
+# +
+# +                                Preamble
+# +
+# +The intent of this document is to state the conditions under which a
+# +Package may be copied, such that the Copyright Holder maintains some
+# +semblance of artistic control over the development of the package,
+# +while giving the users of the package the right to use and distribute
+# +the Package in a more-or-less customary fashion, plus the right to make
+# +reasonable modifications.
+#  
+#  Definitions:
+#  
+# -  - "Package" refers to the collection of files distributed by the Copyright
+# -    Holder, and derivatives of that collection of files created through
+# -    textual modification.
+# -  - "Standard Version" refers to such a Package if it has not been modified,
+# -    or has been modified in accordance with the wishes of the Copyright
+# -    Holder.
+# -  - "Copyright Holder" is whoever is named in the copyright or copyrights for
+# -    the package.
+# -  - "You" is you, if you're thinking about copying or distributing this Package.
+# -  - "Reasonable copying fee" is whatever you can justify on the basis of media
+# -    cost, duplication charges, time of people involved, and so on. (You will
+# -    not be required to justify it to the Copyright Holder, but only to the
+# -    computing community at large as a market that must bear the fee.)
+# -  - "Freely Available" means that no fee is charged for the item itself, though
+# -    there may be fees involved in handling the item. It also means that
+# -    recipients of the item may redistribute it under the same conditions they
+# -    received it.
+# +        "Package" refers to the collection of files distributed by the
+# +        Copyright Holder, and derivatives of that collection of files
+# +        created through textual modification.
+# +
+# +        "Standard Version" refers to such a Package if it has not been
+# +        modified, or has been modified in accordance with the wishes
+# +        of the Copyright Holder as specified below.
+# +
+# +        "Copyright Holder" is whoever is named in the copyright or
+# +        copyrights for the package.
+# +
+# +        "You" is you, if you're thinking about copying or distributing
+# +        this Package.
+# +
+# +        "Reasonable copying fee" is whatever you can justify on the
+# +        basis of media cost, duplication charges, time of people involved,
+# +        and so on.  (You will not be required to justify it to the
+# +        Copyright Holder, but only to the computing community at large
+# +        as a market that must bear the fee.)
+# +
+# +        "Freely Available" means that no fee is charged for the item
+# +        itself, though there may be fees involved in handling the item.
+# +        It also means that recipients of the item may redistribute it
+# +        under the same conditions they received it.
+#  
+#  1. You may make and give away verbatim copies of the source form of the
+#  Standard Version of this Package without restriction, provided that you
+#  duplicate all of the original copyright notices and associated disclaimers.
+#  
+# -2. You may apply bug fixes, portability fixes and other modifications derived
+# -from the Public Domain or from the Copyright Holder. A Package modified in such
+# -a way shall still be considered the Standard Version.
+# -
+# -3. You may otherwise modify your copy of this Package in any way, provided that
+# -you insert a prominent notice in each changed file stating how and when you
+# -changed that file, and provided that you do at least ONE of the following:
+# -
+# -  a) place your modifications in the Public Domain or otherwise make them
+# -     Freely Available, such as by posting said modifications to Usenet or an
+# -     equivalent medium, or placing the modifications on a major archive site
+# -     such as ftp.uu.net, or by allowing the Copyright Holder to include your
+# -     modifications in the Standard Version of the Package.
+# -
+# -  b) use the modified Package only within your corporation or organization.
+# -
+# -  c) rename any non-standard executables so the names do not conflict with
+# -     standard executables, which must also be provided, and provide a separate
+# -     manual page for each non-standard executable that clearly documents how it
+# -     differs from the Standard Version.
+# -
+# -  d) make other distribution arrangements with the Copyright Holder.
+# -
+# -4. You may distribute the programs of this Package in object code or executable
+# -form, provided that you do at least ONE of the following:
+# -
+# -  a) distribute a Standard Version of the executables and library files,
+# -     together with instructions (in the manual page or equivalent) on where to
+# -     get the Standard Version.
+# -
+# -  b) accompany the distribution with the machine-readable source of the Package
+# -     with your modifications.
+# -
+# -  c) accompany any non-standard executables with their corresponding Standard
+# -     Version executables, giving the non-standard executables non-standard
+# -     names, and clearly documenting the differences in manual pages (or
+# -     equivalent), together with instructions on where to get the Standard
+# -     Version.
+# -
+# -  d) make other distribution arrangements with the Copyright Holder.
+# +2. You may apply bug fixes, portability fixes and other modifications
+# +derived from the Public Domain or from the Copyright Holder.  A Package
+# +modified in such a way shall still be considered the Standard Version.
+# +
+# +3. You may otherwise modify your copy of this Package in any way, provided
+# +that you insert a prominent notice in each changed file stating how and
+# +when you changed that file, and provided that you do at least ONE of the
+# +following:
+# +
+# +    a) place your modifications in the Public Domain or otherwise make them
+# +    Freely Available, such as by posting said modifications to Usenet or
+# +    an equivalent medium, or placing the modifications on a major archive
+# +    site such as uunet.uu.net, or by allowing the Copyright Holder to include
+# +    your modifications in the Standard Version of the Package.
+# +
+# +    b) use the modified Package only within your corporation or organization.
+# +
+# +    c) rename any non-standard executables so the names do not conflict
+# +    with standard executables, which must also be provided, and provide
+# +    a separate manual page for each non-standard executable that clearly
+# +    documents how it differs from the Standard Version.
+# +
+# +    d) make other distribution arrangements with the Copyright Holder.
+# +
+# +4. You may distribute the programs of this Package in object code or
+# +executable form, provided that you do at least ONE of the following:
+# +
+# +    a) distribute a Standard Version of the executables and library files,
+# +    together with instructions (in the manual page or equivalent) on where
+# +    to get the Standard Version.
+# +
+# +    b) accompany the distribution with the machine-readable source of
+# +    the Package with your modifications.
+# +
+# +    c) give non-standard executables non-standard names, and clearly
+# +    document the differences in manual pages (or equivalent), together
+# +    with instructions on where to get the Standard Version.
+# +
+# +    d) make other distribution arrangements with the Copyright Holder.
+#  
+#  5. You may charge a reasonable copying fee for any distribution of this
+# -Package.  You may charge any fee you choose for support of this Package. You
+# -may not charge a fee for this Package itself. However, you may distribute this
+# -Package in aggregate with other (possibly commercial) programs as part of a
+# -larger (possibly commercial) software distribution provided that you do not
+# -advertise this Package as a product of your own.
+# -
+# -6. The scripts and library files supplied as input to or produced as output
+# -from the programs of this Package do not automatically fall under the copyright
+# -of this Package, but belong to whomever generated them, and may be sold
+# -commercially, and may be aggregated with this Package.
+# -
+# -7. C or perl subroutines supplied by you and linked into this Package shall not
+# -be considered part of this Package.
+# -
+# -8. The name of the Copyright Holder may not be used to endorse or promote
+# +Package.  You may charge any fee you choose for support of this
+# +Package.  You may not charge a fee for this Package itself.  However,
+# +you may distribute this Package in aggregate with other (possibly
+# +commercial) programs as part of a larger (possibly commercial) software
+# +distribution provided that you do not advertise this Package as a
+# +product of your own.  You may embed this Package's interpreter within
+# +an executable of yours (by linking); this shall be construed as a mere
+# +form of aggregation, provided that the complete Standard Version of the
+# +interpreter is so embedded.
+# +
+# +6. The scripts and library files supplied as input to or produced as
+# +output from the programs of this Package do not automatically fall
+# +under the copyright of this Package, but belong to whoever generated
+# +them, and may be sold commercially, and may be aggregated with this
+# +Package.  If such scripts or library files are aggregated with this
+# +Package via the so-called "undump" or "unexec" methods of producing a
+# +binary executable image, then distribution of such an image shall
+# +neither be construed as a distribution of this Package nor shall it
+# +fall under the restrictions of Paragraphs 3 and 4, provided that you do
+# +not represent such an executable image as a Standard Version of this
+# +Package.
+# +
+# +7. C subroutines (or comparably compiled subroutines in other
+# +languages) supplied by you and linked into this Package in order to
+# +emulate subroutines and variables of the language defined by this
+# +Package shall not be considered part of this Package, but are the
+# +equivalent of input as in Paragraph 6, provided these subroutines do
+# +not change the language in any way that would cause it to fail the
+# +regression tests for the language.
+# +
+# +8. Aggregation of this Package with a commercial distribution is always
+# +permitted provided that the use of this Package is embedded; that is,
+# +when no overt attempt is made to make this Package's interfaces visible
+# +to the end user of the commercial distribution.  Such use shall not be
+# +construed as a distribution of this Package.
+# +
+# +9. The name of the Copyright Holder may not be used to endorse or promote
+#  products derived from this software without specific prior written permission.
+#  
+# -9. THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
+# -WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
+# -MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+# -
+# -The End
+# -
+# +10. THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
+# +IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
+# +WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+# +
+# +                                The End
+# +
+# 
+#
+
 SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
 DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
 Makefile.PL file to drive distribution configuration, build, test and \
@@ -10,12 +257,12 @@ SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6374136f6774db2f51cc116f5efbf705"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=147a7b891d1584d3d33e478b1f2327c5"
 
 DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d20692eee246d0b329b7f7659f36286b14ae0696fe91078a64b7078f8876d300"
+SRC_URI[sha256sum] = "be193027e2debb4c9926434aaf1aa46c9fc7bf4db83dcc347eb6e359ee878289"
 
 S = "${WORKDIR}/Module-Build-Tiny-${PV}"
 
-- 
2.25.1


--===============0972288759330885269==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libmodule-build-tiny-perl-upgrade-0.045-0.046.patch"

From 287b9e43cc8f86f41cb58f5dfbbca5987ff12b5d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:59:11 -0500
Subject: [PATCH] libmodule-build-tiny-perl: upgrade 0.045 -> 0.046

---
 ....bb => libmodule-build-tiny-perl_0.046.bb} | 251 +++++++++++++++++-
 1 file changed, 249 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-build-tiny-perl_0.045.bb => libmodule-build-tiny-perl_0.046.bb} (13%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
similarity index 13%
rename from meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
index 17ee50d7c..78687b8cd 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.046.bb
@@ -1,3 +1,250 @@
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
+# @@ -270,110 +270,143 @@
+#  That's all there is to it!
+#  
+#  
+# ---- The Artistic License 1.0 ---
+# +--- The Artistic License 1.0 (Perl) ---
+#  
+#  This software is Copyright (c) 2011 by Leon Timmermans, David Golden.
+#  
+#  This is free software, licensed under:
+#  
+# -  The Artistic License 1.0
+# -
+# -The Artistic License
+# -
+# -Preamble
+# -
+# -The intent of this document is to state the conditions under which a Package
+# -may be copied, such that the Copyright Holder maintains some semblance of
+# -artistic control over the development of the package, while giving the users of
+# -the package the right to use and distribute the Package in a more-or-less
+# -customary fashion, plus the right to make reasonable modifications.
+# +  The Artistic License 1.0 (Perl)
+# +
+# +
+# +
+# +
+# +
+# +                         The "Artistic License"
+# +
+# +                                Preamble
+# +
+# +The intent of this document is to state the conditions under which a
+# +Package may be copied, such that the Copyright Holder maintains some
+# +semblance of artistic control over the development of the package,
+# +while giving the users of the package the right to use and distribute
+# +the Package in a more-or-less customary fashion, plus the right to make
+# +reasonable modifications.
+#  
+#  Definitions:
+#  
+# -  - "Package" refers to the collection of files distributed by the Copyright
+# -    Holder, and derivatives of that collection of files created through
+# -    textual modification.
+# -  - "Standard Version" refers to such a Package if it has not been modified,
+# -    or has been modified in accordance with the wishes of the Copyright
+# -    Holder.
+# -  - "Copyright Holder" is whoever is named in the copyright or copyrights for
+# -    the package.
+# -  - "You" is you, if you're thinking about copying or distributing this Package.
+# -  - "Reasonable copying fee" is whatever you can justify on the basis of media
+# -    cost, duplication charges, time of people involved, and so on. (You will
+# -    not be required to justify it to the Copyright Holder, but only to the
+# -    computing community at large as a market that must bear the fee.)
+# -  - "Freely Available" means that no fee is charged for the item itself, though
+# -    there may be fees involved in handling the item. It also means that
+# -    recipients of the item may redistribute it under the same conditions they
+# -    received it.
+# +        "Package" refers to the collection of files distributed by the
+# +        Copyright Holder, and derivatives of that collection of files
+# +        created through textual modification.
+# +
+# +        "Standard Version" refers to such a Package if it has not been
+# +        modified, or has been modified in accordance with the wishes
+# +        of the Copyright Holder as specified below.
+# +
+# +        "Copyright Holder" is whoever is named in the copyright or
+# +        copyrights for the package.
+# +
+# +        "You" is you, if you're thinking about copying or distributing
+# +        this Package.
+# +
+# +        "Reasonable copying fee" is whatever you can justify on the
+# +        basis of media cost, duplication charges, time of people involved,
+# +        and so on.  (You will not be required to justify it to the
+# +        Copyright Holder, but only to the computing community at large
+# +        as a market that must bear the fee.)
+# +
+# +        "Freely Available" means that no fee is charged for the item
+# +        itself, though there may be fees involved in handling the item.
+# +        It also means that recipients of the item may redistribute it
+# +        under the same conditions they received it.
+#  
+#  1. You may make and give away verbatim copies of the source form of the
+#  Standard Version of this Package without restriction, provided that you
+#  duplicate all of the original copyright notices and associated disclaimers.
+#  
+# -2. You may apply bug fixes, portability fixes and other modifications derived
+# -from the Public Domain or from the Copyright Holder. A Package modified in such
+# -a way shall still be considered the Standard Version.
+# -
+# -3. You may otherwise modify your copy of this Package in any way, provided that
+# -you insert a prominent notice in each changed file stating how and when you
+# -changed that file, and provided that you do at least ONE of the following:
+# -
+# -  a) place your modifications in the Public Domain or otherwise make them
+# -     Freely Available, such as by posting said modifications to Usenet or an
+# -     equivalent medium, or placing the modifications on a major archive site
+# -     such as ftp.uu.net, or by allowing the Copyright Holder to include your
+# -     modifications in the Standard Version of the Package.
+# -
+# -  b) use the modified Package only within your corporation or organization.
+# -
+# -  c) rename any non-standard executables so the names do not conflict with
+# -     standard executables, which must also be provided, and provide a separate
+# -     manual page for each non-standard executable that clearly documents how it
+# -     differs from the Standard Version.
+# -
+# -  d) make other distribution arrangements with the Copyright Holder.
+# -
+# -4. You may distribute the programs of this Package in object code or executable
+# -form, provided that you do at least ONE of the following:
+# -
+# -  a) distribute a Standard Version of the executables and library files,
+# -     together with instructions (in the manual page or equivalent) on where to
+# -     get the Standard Version.
+# -
+# -  b) accompany the distribution with the machine-readable source of the Package
+# -     with your modifications.
+# -
+# -  c) accompany any non-standard executables with their corresponding Standard
+# -     Version executables, giving the non-standard executables non-standard
+# -     names, and clearly documenting the differences in manual pages (or
+# -     equivalent), together with instructions on where to get the Standard
+# -     Version.
+# -
+# -  d) make other distribution arrangements with the Copyright Holder.
+# +2. You may apply bug fixes, portability fixes and other modifications
+# +derived from the Public Domain or from the Copyright Holder.  A Package
+# +modified in such a way shall still be considered the Standard Version.
+# +
+# +3. You may otherwise modify your copy of this Package in any way, provided
+# +that you insert a prominent notice in each changed file stating how and
+# +when you changed that file, and provided that you do at least ONE of the
+# +following:
+# +
+# +    a) place your modifications in the Public Domain or otherwise make them
+# +    Freely Available, such as by posting said modifications to Usenet or
+# +    an equivalent medium, or placing the modifications on a major archive
+# +    site such as uunet.uu.net, or by allowing the Copyright Holder to include
+# +    your modifications in the Standard Version of the Package.
+# +
+# +    b) use the modified Package only within your corporation or organization.
+# +
+# +    c) rename any non-standard executables so the names do not conflict
+# +    with standard executables, which must also be provided, and provide
+# +    a separate manual page for each non-standard executable that clearly
+# +    documents how it differs from the Standard Version.
+# +
+# +    d) make other distribution arrangements with the Copyright Holder.
+# +
+# +4. You may distribute the programs of this Package in object code or
+# +executable form, provided that you do at least ONE of the following:
+# +
+# +    a) distribute a Standard Version of the executables and library files,
+# +    together with instructions (in the manual page or equivalent) on where
+# +    to get the Standard Version.
+# +
+# +    b) accompany the distribution with the machine-readable source of
+# +    the Package with your modifications.
+# +
+# +    c) give non-standard executables non-standard names, and clearly
+# +    document the differences in manual pages (or equivalent), together
+# +    with instructions on where to get the Standard Version.
+# +
+# +    d) make other distribution arrangements with the Copyright Holder.
+#  
+#  5. You may charge a reasonable copying fee for any distribution of this
+# -Package.  You may charge any fee you choose for support of this Package. You
+# -may not charge a fee for this Package itself. However, you may distribute this
+# -Package in aggregate with other (possibly commercial) programs as part of a
+# -larger (possibly commercial) software distribution provided that you do not
+# -advertise this Package as a product of your own.
+# -
+# -6. The scripts and library files supplied as input to or produced as output
+# -from the programs of this Package do not automatically fall under the copyright
+# -of this Package, but belong to whomever generated them, and may be sold
+# -commercially, and may be aggregated with this Package.
+# -
+# -7. C or perl subroutines supplied by you and linked into this Package shall not
+# -be considered part of this Package.
+# -
+# -8. The name of the Copyright Holder may not be used to endorse or promote
+# +Package.  You may charge any fee you choose for support of this
+# +Package.  You may not charge a fee for this Package itself.  However,
+# +you may distribute this Package in aggregate with other (possibly
+# +commercial) programs as part of a larger (possibly commercial) software
+# +distribution provided that you do not advertise this Package as a
+# +product of your own.  You may embed this Package's interpreter within
+# +an executable of yours (by linking); this shall be construed as a mere
+# +form of aggregation, provided that the complete Standard Version of the
+# +interpreter is so embedded.
+# +
+# +6. The scripts and library files supplied as input to or produced as
+# +output from the programs of this Package do not automatically fall
+# +under the copyright of this Package, but belong to whoever generated
+# +them, and may be sold commercially, and may be aggregated with this
+# +Package.  If such scripts or library files are aggregated with this
+# +Package via the so-called "undump" or "unexec" methods of producing a
+# +binary executable image, then distribution of such an image shall
+# +neither be construed as a distribution of this Package nor shall it
+# +fall under the restrictions of Paragraphs 3 and 4, provided that you do
+# +not represent such an executable image as a Standard Version of this
+# +Package.
+# +
+# +7. C subroutines (or comparably compiled subroutines in other
+# +languages) supplied by you and linked into this Package in order to
+# +emulate subroutines and variables of the language defined by this
+# +Package shall not be considered part of this Package, but are the
+# +equivalent of input as in Paragraph 6, provided these subroutines do
+# +not change the language in any way that would cause it to fail the
+# +regression tests for the language.
+# +
+# +8. Aggregation of this Package with a commercial distribution is always
+# +permitted provided that the use of this Package is embedded; that is,
+# +when no overt attempt is made to make this Package's interfaces visible
+# +to the end user of the commercial distribution.  Such use shall not be
+# +construed as a distribution of this Package.
+# +
+# +9. The name of the Copyright Holder may not be used to endorse or promote
+#  products derived from this software without specific prior written permission.
+#  
+# -9. THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
+# -WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
+# -MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+# -
+# -The End
+# -
+# +10. THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
+# +IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
+# +WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+# +
+# +                                The End
+# +
+# 
+#
+
 SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
 DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
 Makefile.PL file to drive distribution configuration, build, test and \
@@ -10,12 +257,12 @@ SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6374136f6774db2f51cc116f5efbf705"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=147a7b891d1584d3d33e478b1f2327c5"
 
 DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d20692eee246d0b329b7f7659f36286b14ae0696fe91078a64b7078f8876d300"
+SRC_URI[sha256sum] = "be193027e2debb4c9926434aaf1aa46c9fc7bf4db83dcc347eb6e359ee878289"
 
 S = "${WORKDIR}/Module-Build-Tiny-${PV}"
 
-- 
2.25.1


--===============0972288759330885269==--


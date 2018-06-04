Return-Path: <prvs=6867199e8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id BDE9E74D0B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 11:06:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,476,1520895600"; d="scan'208";a="10657279"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jun 2018 13:06:34 +0200
Message-ID: <20180604110634.8471-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: dev@g0hl1n.net
Subject: [meta-oe][PATCH] libmxml: add recipe
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
X-List-Received-Date: Mon, 04 Jun 2018 11:06:42 -0000
Content-Type: text/plain

Add version 2.11 of libmxml with the debian patches and a
fix for libmxml.a installation applied.

Upstreaming of these patches was requested by following pull-request:
	https://github.com/michaelrsweet/mxml/pull/223

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
Tested for linux-gnueabi (qemuarm & i.MX6)
---
 meta-oe/licenses/Mini-XML-License                  | 507 +++++++++++++++++++++
 ...ove-rpath-from-configure.in-and-configure.patch |  55 +++
 .../libmxml/0002-link-libmxml-with-pthread.patch   |  27 ++
 .../0003-add-missing-LDFLAGS-to-Makefile.patch     |  27 ++
 .../libmxml/0004-mxml-string-compile-headers.patch |  28 ++
 .../0005-several-autoheader-define-fixes.patch     |  54 +++
 .../libmxml/0006-several-compile-fixes.patch       |  49 ++
 ...le-require-libmxml.a-for-its-installation.patch |  26 ++
 meta-oe/recipes-support/libmxml/libmxml_2.11.bb    |  29 ++
 9 files changed, 802 insertions(+)
 create mode 100644 meta-oe/licenses/Mini-XML-License
 create mode 100644 meta-oe/recipes-support/libmxml/libmxml/0001-remove-rpath-from-configure.in-and-configure.patch
 create mode 100644 meta-oe/recipes-support/libmxml/libmxml/0002-link-libmxml-with-pthread.patch
 create mode 100644 meta-oe/recipes-support/libmxml/libmxml/0003-add-missing-LDFLAGS-to-Makefile.patch
 create mode 100644 meta-oe/recipes-support/libmxml/libmxml/0004-mxml-string-compile-headers.patch
 create mode 100644 meta-oe/recipes-support/libmxml/libmxml/0005-several-autoheader-define-fixes.patch
 create mode 100644 meta-oe/recipes-support/libmxml/libmxml/0006-several-compile-fixes.patch
 create mode 100644 meta-oe/recipes-support/libmxml/libmxml/0007-Makefile-require-libmxml.a-for-its-installation.patch
 create mode 100644 meta-oe/recipes-support/libmxml/libmxml_2.11.bb

diff --git a/meta-oe/licenses/Mini-XML-License b/meta-oe/licenses/Mini-XML-License
new file mode 100644
index 000000000..4d0aa78af
--- /dev/null
+++ b/meta-oe/licenses/Mini-XML-License
@@ -0,0 +1,507 @@
+			   Mini-XML License
+			  September 18, 2010
+
+
+The Mini-XML library and included programs are provided under the
+terms of the GNU Library General Public License version 2 (LGPL2)
+with the following exceptions:
+
+  1. Static linking of applications to the Mini-XML library
+does not constitute a derivative work and does not require
+the author to provide source code for the application, use
+the shared Mini-XML libraries, or link their applications
+against a user-supplied version of Mini-XML.
+
+If you link the application to a modified version of
+Mini-XML, then the changes to Mini-XML must be provided
+under the terms of the LGPL2 in sections 1, 2, and 4.
+
+  2. You do not have to provide a copy of the Mini-XML license
+with programs that are linked to the Mini-XML library, nor
+do you have to identify the Mini-XML license in your
+program or documentation as required by section 6 of the
+LGPL2.
+
+
+		  GNU LIBRARY GENERAL PUBLIC LICENSE
+			 Version 2, June 1991
+
+	  Copyright (C) 1991 Free Software Foundation, Inc.
+       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+
+     Everyone is permitted to copy and distribute verbatim copies
+      of this license document, but changing it is not allowed.
+
+    [This is the first released version of the library GPL.  It is
+   numbered 2 because it goes with version 2 of the ordinary GPL.]
+
+			       Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+Licenses are intended to guarantee your freedom to share and change
+free software--to make sure the software is free for all its users.
+
+  This license, the Library General Public License, applies to some
+specially designated Free Software Foundation software, and to any
+other libraries whose authors decide to use it.  You can use it for
+your libraries, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
+
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if
+you distribute copies of the library, or if you modify it.
+
+  For example, if you distribute copies of the library, whether gratis
+or for a fee, you must give the recipients all the rights that we gave
+you.  You must make sure that they, too, receive or can get the source
+code.  If you link a program with the library, you must provide
+complete object files to the recipients so that they can relink them
+with the library, after making changes to the library and recompiling
+it.  And you must show them these terms so they know their rights.
+
+  Our method of protecting your rights has two steps: (1) copyright
+the library, and (2) offer you this license which gives you legal
+permission to copy, distribute and/or modify the library.
+
+  Also, for each distributor's protection, we want to make certain
+that everyone understands that there is no warranty for this free
+library.  If the library is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original
+version, so that any problems introduced by others will not reflect on
+the original authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that companies distributing free
+software will individually obtain patent licenses, thus in effect
+transforming the program into proprietary software.  To prevent this,
+we have made it clear that any patent must be licensed for everyone's
+free use or not licensed at all.
+
+  Most GNU software, including some libraries, is covered by the ordinary
+GNU General Public License, which was designed for utility programs.  This
+license, the GNU Library General Public License, applies to certain
+designated libraries.  This license is quite different from the ordinary
+one; be sure to read it in full, and don't assume that anything in it is
+the same as in the ordinary license.
+
+  The reason we have a separate public license for some libraries is that
+they blur the distinction we usually make between modifying or adding to a
+program and simply using it.  Linking a program with a library, without
+changing the library, is in some sense simply using the library, and is
+analogous to running a utility program or application program.  However, in
+a textual and legal sense, the linked executable is a combined work, a
+derivative of the original library, and the ordinary General Public License
+treats it as such.
+
+  Because of this blurred distinction, using the ordinary General
+Public License for libraries did not effectively promote software
+sharing, because most developers did not use the libraries.  We
+concluded that weaker conditions might promote sharing better.
+
+  However, unrestricted linking of non-free programs would deprive the
+users of those programs of all benefit from the free status of the
+libraries themselves.  This Library General Public License is intended to
+permit developers of non-free programs to use free libraries, while
+preserving your freedom as a user of such programs to change the free
+libraries that are incorporated in them.  (We have not seen how to achieve
+this as regards changes in header files, but we have achieved it as regards
+changes in the actual functions of the Library.)  The hope is that this
+will lead to faster development of free libraries.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.  Pay close attention to the difference between a
+"work based on the library" and a "work that uses the library".  The
+former contains code derived from the library, while the latter only
+works together with the library.
+
+  Note that it is possible for a library to be covered by the ordinary
+General Public License rather than by this special one.
+
+		  GNU LIBRARY GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License Agreement applies to any software library which
+contains a notice placed by the copyright holder or other authorized
+party saying it may be distributed under the terms of this Library
+General Public License (also called "this License").  Each licensee is
+addressed as "you".
+
+  A "library" means a collection of software functions and/or data
+prepared so as to be conveniently linked with application programs
+(which use some of those functions and data) to form executables.
+
+  The "Library", below, refers to any such software library or work
+which has been distributed under these terms.  A "work based on the
+Library" means either the Library or any derivative work under
+copyright law: that is to say, a work containing the Library or a
+portion of it, either verbatim or with modifications and/or translated
+straightforwardly into another language.  (Hereinafter, translation is
+included without limitation in the term "modification".)
+
+  "Source code" for a work means the preferred form of the work for
+making modifications to it.  For a library, complete source code means
+all the source code for all modules it contains, plus any associated
+interface definition files, plus the scripts used to control compilation
+and installation of the library.
+
+  Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running a program using the Library is not restricted, and output from
+such a program is covered only if its contents constitute a work based
+on the Library (independent of the use of the Library in a tool for
+writing it).  Whether that is true depends on what the Library does
+and what the program that uses the Library does.
+
+  1. You may copy and distribute verbatim copies of the Library's
+complete source code as you receive it, in any medium, provided that
+you conspicuously and appropriately publish on each copy an
+appropriate copyright notice and disclaimer of warranty; keep intact
+all the notices that refer to this License and to the absence of any
+warranty; and distribute a copy of this License along with the
+Library.
+
+  You may charge a fee for the physical act of transferring a copy,
+and you may at your option offer warranty protection in exchange for a
+fee.
+
+  2. You may modify your copy or copies of the Library or any portion
+of it, thus forming a work based on the Library, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) The modified work must itself be a software library.
+
+    b) You must cause the files modified to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    c) You must cause the whole of the work to be licensed at no
+    charge to all third parties under the terms of this License.
+
+    d) If a facility in the modified Library refers to a function or a
+    table of data to be supplied by an application program that uses
+    the facility, other than as an argument passed when the facility
+    is invoked, then you must make a good faith effort to ensure that,
+    in the event an application does not supply such function or
+    table, the facility still operates, and performs whatever part of
+    its purpose remains meaningful.
+
+    (For example, a function in a library to compute square roots has
+    a purpose that is entirely well-defined independent of the
+    application.  Therefore, Subsection 2d requires that any
+    application-supplied function or table used by this function must
+    be optional: if the application does not supply it, the square
+    root function must still compute square roots.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Library,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Library, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote
+it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Library.
+
+In addition, mere aggregation of another work not based on the Library
+with the Library (or with a work based on the Library) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may opt to apply the terms of the ordinary GNU General Public
+License instead of this License to a given copy of the Library.  To do
+this, you must alter all the notices that refer to this License, so
+that they refer to the ordinary GNU General Public License, version 2,
+instead of to this License.  (If a newer version than version 2 of the
+ordinary GNU General Public License has appeared, then you can specify
+that version instead if you wish.)  Do not make any other change in
+these notices.
+
+  Once this change is made in a given copy, it is irreversible for
+that copy, so the ordinary GNU General Public License applies to all
+subsequent copies and derivative works made from that copy.
+
+  This option is useful when you wish to copy part of the code of
+the Library into a program that is not a library.
+
+  4. You may copy and distribute the Library (or a portion or
+derivative of it, under Section 2) in object code or executable form
+under the terms of Sections 1 and 2 above provided that you accompany
+it with the complete corresponding machine-readable source code, which
+must be distributed under the terms of Sections 1 and 2 above on a
+medium customarily used for software interchange.
+
+  If distribution of object code is made by offering access to copy
+from a designated place, then offering equivalent access to copy the
+source code from the same place satisfies the requirement to
+distribute the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  5. A program that contains no derivative of any portion of the
+Library, but is designed to work with the Library by being compiled or
+linked with it, is called a "work that uses the Library".  Such a
+work, in isolation, is not a derivative work of the Library, and
+therefore falls outside the scope of this License.
+
+  However, linking a "work that uses the Library" with the Library
+creates an executable that is a derivative of the Library (because it
+contains portions of the Library), rather than a "work that uses the
+library".  The executable is therefore covered by this License.
+Section 6 states terms for distribution of such executables.
+
+  When a "work that uses the Library" uses material from a header file
+that is part of the Library, the object code for the work may be a
+derivative work of the Library even though the source code is not.
+Whether this is true is especially significant if the work can be
+linked without the Library, or if the work is itself a library.  The
+threshold for this to be true is not precisely defined by law.
+
+  If such an object file uses only numerical parameters, data
+structure layouts and accessors, and small macros and small inline
+functions (ten lines or less in length), then the use of the object
+file is unrestricted, regardless of whether it is legally a derivative
+work.  (Executables containing this object code plus portions of the
+Library will still fall under Section 6.)
+
+  Otherwise, if the work is a derivative of the Library, you may
+distribute the object code for the work under the terms of Section 6.
+Any executables containing that work also fall under Section 6,
+whether or not they are linked directly with the Library itself.
+
+  6. As an exception to the Sections above, you may also compile or
+link a "work that uses the Library" with the Library to produce a
+work containing portions of the Library, and distribute that work
+under terms of your choice, provided that the terms permit
+modification of the work for the customer's own use and reverse
+engineering for debugging such modifications.
+
+  You must give prominent notice with each copy of the work that the
+Library is used in it and that the Library and its use are covered by
+this License.  You must supply a copy of this License.  If the work
+during execution displays copyright notices, you must include the
+copyright notice for the Library among them, as well as a reference
+directing the user to the copy of this License.  Also, you must do one
+of these things:
+
+    a) Accompany the work with the complete corresponding
+    machine-readable source code for the Library including whatever
+    changes were used in the work (which must be distributed under
+    Sections 1 and 2 above); and, if the work is an executable linked
+    with the Library, with the complete machine-readable "work that
+    uses the Library", as object code and/or source code, so that the
+    user can modify the Library and then relink to produce a modified
+    executable containing the modified Library.  (It is understood
+    that the user who changes the contents of definitions files in the
+    Library will not necessarily be able to recompile the application
+    to use the modified definitions.)
+
+    b) Accompany the work with a written offer, valid for at
+    least three years, to give the same user the materials
+    specified in Subsection 6a, above, for a charge no more
+    than the cost of performing this distribution.
+
+    c) If distribution of the work is made by offering access to copy
+    from a designated place, offer equivalent access to copy the above
+    specified materials from the same place.
+
+    d) Verify that the user has already received a copy of these
+    materials or that you have already sent this user a copy.
+
+  For an executable, the required form of the "work that uses the
+Library" must include any data and utility programs needed for
+reproducing the executable from it.  However, as a special exception,
+the source code distributed need not include anything that is normally
+distributed (in either source or binary form) with the major
+components (compiler, kernel, and so on) of the operating system on
+which the executable runs, unless that component itself accompanies
+the executable.
+
+  It may happen that this requirement contradicts the license
+restrictions of other proprietary libraries that do not normally
+accompany the operating system.  Such a contradiction means you cannot
+use both them and the Library together in an executable that you
+distribute.
+
+  7. You may place library facilities that are a work based on the
+Library side-by-side in a single library together with other library
+facilities not covered by this License, and distribute such a combined
+library, provided that the separate distribution of the work based on
+the Library and of the other library facilities is otherwise
+permitted, and provided that you do these two things:
+
+    a) Accompany the combined library with a copy of the same work
+    based on the Library, uncombined with any other library
+    facilities.  This must be distributed under the terms of the
+    Sections above.
+
+    b) Give prominent notice with the combined library of the fact
+    that part of it is a work based on the Library, and explaining
+    where to find the accompanying uncombined form of the same work.
+
+  8. You may not copy, modify, sublicense, link with, or distribute
+the Library except as expressly provided under this License.  Any
+attempt otherwise to copy, modify, sublicense, link with, or
+distribute the Library is void, and will automatically terminate your
+rights under this License.  However, parties who have received copies,
+or rights, from you under this License will not have their licenses
+terminated so long as such parties remain in full compliance.
+
+  9. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Library or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Library (or any work based on the
+Library), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Library or works based on it.
+
+  10. Each time you redistribute the Library (or any work based on the
+Library), the recipient automatically receives a license from the
+original licensor to copy, distribute, link with or modify the Library
+subject to these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  11. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Library at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Library by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Library.
+
+If any portion of this section is held invalid or unenforceable under any
+particular circumstance, the balance of the section is intended to apply,
+and the section as a whole is intended to apply in other circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  12. If the distribution and/or use of the Library is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Library under this License may add
+an explicit geographical distribution limitation excluding those countries,
+so that distribution is permitted only in or among countries not thus
+excluded.  In such case, this License incorporates the limitation as if
+written in the body of this License.
+
+  13. The Free Software Foundation may publish revised and/or new
+versions of the Library General Public License from time to time.
+Such new versions will be similar in spirit to the present version,
+but may differ in detail to address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Library
+specifies a version number of this License which applies to it and
+"any later version", you have the option of following the terms and
+conditions either of that version or of any later version published by
+the Free Software Foundation.  If the Library does not specify a
+license version number, you may choose any version ever published by
+the Free Software Foundation.
+
+  14. If you wish to incorporate parts of the Library into other free
+programs whose distribution conditions are incompatible with these,
+write to the author to ask for permission.  For software which is
+copyrighted by the Free Software Foundation, write to the Free
+Software Foundation; we sometimes make exceptions for this.  Our
+decision will be guided by the two goals of preserving the free status
+of all derivatives of our free software and of promoting the sharing
+and reuse of software generally.
+
+			    NO WARRANTY
+
+  15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
+WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
+EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY
+KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
+LIBRARY IS WITH YOU.  SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+  16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
+WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY
+AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU
+FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR
+CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
+LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
+RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
+FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
+SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGES.
+
+		     END OF TERMS AND CONDITIONS
+
+     Appendix: How to Apply These Terms to Your New Libraries
+
+  If you develop a new library, and you want it to be of the greatest
+possible use to the public, we recommend making it free software that
+everyone can redistribute and change.  You can do so by permitting
+redistribution under these terms (or, alternatively, under the terms of the
+ordinary General Public License).
+
+  To apply these terms, attach the following notices to the library.  It is
+safest to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least the
+"copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the library's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Library General Public
+    License as published by the Free Software Foundation; either
+    version 2 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Library General Public License for more details.
+
+    You should have received a copy of the GNU Library General Public
+    License along with this library; if not, write to the Free
+    Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the library, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the
+  library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+
+  <signature of Ty Coon>, 1 April 1990
+  Ty Coon, President of Vice
+
+That's all there is to it!
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0001-remove-rpath-from-configure.in-and-configure.patch b/meta-oe/recipes-support/libmxml/libmxml/0001-remove-rpath-from-configure.in-and-configure.patch
new file mode 100644
index 000000000..cab203e7f
--- /dev/null
+++ b/meta-oe/recipes-support/libmxml/libmxml/0001-remove-rpath-from-configure.in-and-configure.patch
@@ -0,0 +1,55 @@
+From bcf5391c0c7edd85ee0c956be65cf4eeeea0a82a Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fboudra@free.fr>
+Date: Fri, 1 Jun 2018 14:16:52 +0200
+Subject: [PATCH 1/7] remove rpath from configure.in and configure
+
+This patch was taken from Debian's libmxml 2.11-1 source:
+	01_remove_rpath.diff
+---
+ configure.ac | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 47a0d41..6b3bbfa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -184,8 +184,7 @@ if test x$enable_shared != xno; then
+ 			AC_MSG_RESULT(yes)
+ 			LIBMXML="libmxml.so.1.6"
+ 			DSO="\$(CC)"
+-			DSOFLAGS="$DSOFLAGS -Wl,-h,libmxml.so.1 -G -R\$(libdir) \$(OPTIM)"
+-			LDFLAGS="$LDFLAGS -R\$(libdir)"
++			DSOFLAGS="$DSOFLAGS -Wl,-h,libmxml.so.1 -G \$(OPTIM)"
+                 	;;
+ 
+ 		hp-ux)
+@@ -200,23 +199,21 @@ if test x$enable_shared != xno; then
+ 			AC_MSG_RESULT(yes)
+ 			LIBMXML="libmxml.so.1.6"
+ 			DSO="\$(CC)"
+-			DSOFLAGS="$DSOFLAGS -Wl,-rpath,\$(libdir),-set_version,sgi1.0,-soname,libmxml.so.1 -shared \$(OPTIM)"
++			DSOFLAGS="$DSOFLAGS -Wl,-set_version,sgi1.0,-soname,libmxml.so.1 -shared \$(OPTIM)"
+ 			;;
+ 
+ 		osf | linux* | gnu)
+ 			AC_MSG_RESULT(yes)
+ 			LIBMXML="libmxml.so.1.6"
+ 			DSO="\$(CC)"
+-			DSOFLAGS="$DSOFLAGS -Wl,-soname,libmxml.so.1,-rpath,\$(libdir) -shared \$(OPTIM)"
+-                        LDFLAGS="$LDFLAGS -Wl,-rpath,\$(libdir)"
++			DSOFLAGS="$DSOFLAGS -Wl,-soname,libmxml.so.1 -shared \$(OPTIM)"
+ 			;;
+ 
+ 		*bsd)
+ 			AC_MSG_RESULT(yes)
+ 			LIBMXML="libmxml.so.1.6"
+ 			DSO="\$(CC)"
+-			DSOFLAGS="$DSOFLAGS -Wl,-soname,libmxml.so.1,-R\$(libdir) -shared \$(OPTIM)"
+-			LDFLAGS="$LDFLAGS -Wl,-R\$(libdir)"
++			DSOFLAGS="$DSOFLAGS -Wl,-soname,libmxml.so.1  -shared \$(OPTIM)"
+                         ;;
+ 
+ 		darwin)
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0002-link-libmxml-with-pthread.patch b/meta-oe/recipes-support/libmxml/libmxml/0002-link-libmxml-with-pthread.patch
new file mode 100644
index 000000000..ec9d170bb
--- /dev/null
+++ b/meta-oe/recipes-support/libmxml/libmxml/0002-link-libmxml-with-pthread.patch
@@ -0,0 +1,27 @@
+From 5e415d207465f41ae821235eb64c94916b515260 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gon=C3=A9ri=20Le=20Bouder?= <goneri@rulezlan.org>
+Date: Fri, 1 Jun 2018 14:20:10 +0200
+Subject: [PATCH 2/7] link libmxml with pthread
+
+This patch was taken from Debian's libmxml 2.11-1 source:
+	02_link_with_pthread.diff
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index eef14fe..70c322c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -271,7 +271,7 @@ mxml1.dll:	$(LIBOBJS)
+ 
+ libmxml.so.1.6:	$(LIBOBJS)
+ 	echo Creating $@...
+-	$(DSO) $(DSOFLAGS) -o libmxml.so.1.6 $(LIBOBJS)
++	$(DSO) $(DSOFLAGS) -o libmxml.so.1.6 $(LIBOBJS) $(LIBS)
+ 	$(RM) libmxml.so libmxml.so.1
+ 	$(LN) libmxml.so.1.6 libmxml.so
+ 	$(LN) libmxml.so.1.6 libmxml.so.1
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0003-add-missing-LDFLAGS-to-Makefile.patch b/meta-oe/recipes-support/libmxml/libmxml/0003-add-missing-LDFLAGS-to-Makefile.patch
new file mode 100644
index 000000000..33b1d0893
--- /dev/null
+++ b/meta-oe/recipes-support/libmxml/libmxml/0003-add-missing-LDFLAGS-to-Makefile.patch
@@ -0,0 +1,27 @@
+From 249c34c57ecd9bb49f8e3b420bde651c4bcad36d Mon Sep 17 00:00:00 2001
+From: Luis Uribe <acme@eviled.org>
+Date: Fri, 1 Jun 2018 14:21:49 +0200
+Subject: [PATCH 3/7] add missing $(LDFLAGS) to Makefile
+
+This patch was taken from Debian's libmxml 2.11-1 source:
+	03_link_ldflags.diff
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 70c322c..fd48565 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -271,7 +271,7 @@ mxml1.dll:	$(LIBOBJS)
+ 
+ libmxml.so.1.6:	$(LIBOBJS)
+ 	echo Creating $@...
+-	$(DSO) $(DSOFLAGS) -o libmxml.so.1.6 $(LIBOBJS) $(LIBS)
++	$(DSO) $(DSOFLAGS) -o libmxml.so.1.6 $(LIBOBJS) $(LIBS) $(LDFLAGS)
+ 	$(RM) libmxml.so libmxml.so.1
+ 	$(LN) libmxml.so.1.6 libmxml.so
+ 	$(LN) libmxml.so.1.6 libmxml.so.1
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0004-mxml-string-compile-headers.patch b/meta-oe/recipes-support/libmxml/libmxml/0004-mxml-string-compile-headers.patch
new file mode 100644
index 000000000..0fd5422a7
--- /dev/null
+++ b/meta-oe/recipes-support/libmxml/libmxml/0004-mxml-string-compile-headers.patch
@@ -0,0 +1,28 @@
+From e0c02526840d26758e4bcfd84dd5f7cda3cfbe1a Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Fri, 1 Jun 2018 14:23:40 +0200
+Subject: [PATCH 4/7] mxml-string: compile headers
+
+This patch was taken from Debian's libmxml 2.11-1 source:
+	04_compile_headers.diff
+---
+ mxml-string.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/mxml-string.c b/mxml-string.c
+index 2495753..9bdb4c3 100644
+--- a/mxml-string.c
++++ b/mxml-string.c
+@@ -17,7 +17,8 @@
+  */
+ 
+ #include "config.h"
+-
++#include <stdlib.h>
++#include <stdarg.h>
+ 
+ /*
+  * The va_copy macro is part of C99, but many compilers don't implement it.
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0005-several-autoheader-define-fixes.patch b/meta-oe/recipes-support/libmxml/libmxml/0005-several-autoheader-define-fixes.patch
new file mode 100644
index 000000000..ba6541503
--- /dev/null
+++ b/meta-oe/recipes-support/libmxml/libmxml/0005-several-autoheader-define-fixes.patch
@@ -0,0 +1,54 @@
+From f77da2043c0840412f1a5bc89d04a8f595cc2027 Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Fri, 1 Jun 2018 14:26:15 +0200
+Subject: [PATCH 5/7] several autoheader define fixes
+
+This patch was taken from Debian's libmxml 2.11-1 source:
+	06_autoheader-fixes.patch
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6b3bbfa..47063dc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,7 +28,7 @@ AC_CONFIG_HEADER(config.h)
+ dnl Version number...
+ VERSION="AC_PACKAGE_VERSION"
+ AC_SUBST(VERSION)
+-AC_DEFINE_UNQUOTED(MXML_VERSION, "Mini-XML v$VERSION")
++AC_DEFINE_UNQUOTED(MXML_VERSION, "Mini-XML v$VERSION", "MXML VERSION")
+ 
+ dnl Clear default debugging options and set normal optimization by
+ dnl default unless the user asks for debugging specifically.
+@@ -113,7 +113,7 @@ AC_CACHE_CHECK(for long long int, ac_cv_c_long_long,
+ 	fi])
+ 
+ if test $ac_cv_c_long_long = yes; then
+-	AC_DEFINE(HAVE_LONG_LONG)
++	AC_DEFINE(HAVE_LONG_LONG, 1, "long long int support")
+ fi
+ 
+ dnl EPUB support (via libz and zipc)
+@@ -122,7 +122,7 @@ AC_SUBST(MXML_EPUB)
+ ZIPC=""
+ AC_SUBST(ZIPC)
+ AC_SEARCH_LIBS(gzgets,z,[
+-	AC_DEFINE(HAVE_ZLIB_H)
++	AC_DEFINE(HAVE_ZLIB_H, 1, "<zlib.h> present")
+ 	ZIPC="zipc.o"
+ 	MXML_EPUB="mxml.epub"
+ 	LIBS="-lz $LIBS"])
+@@ -135,7 +135,7 @@ PTHREAD_FLAGS=""
+ PTHREAD_LIBS=""
+ 
+ if test "x$enable_threads" != xno; then
+-	AC_CHECK_HEADER(pthread.h, AC_DEFINE(HAVE_PTHREAD_H))
++	AC_CHECK_HEADER(pthread.h, AC_DEFINE(HAVE_PTHREAD_H, 1, "pthreads headers available"))
+ 
+ 	if test x$ac_cv_header_pthread_h = xyes; then
+ 		dnl Check various threading options for the platforms we support
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0006-several-compile-fixes.patch b/meta-oe/recipes-support/libmxml/libmxml/0006-several-compile-fixes.patch
new file mode 100644
index 000000000..e6c3cba1a
--- /dev/null
+++ b/meta-oe/recipes-support/libmxml/libmxml/0006-several-compile-fixes.patch
@@ -0,0 +1,49 @@
+From 2477dbea92d4111fb70beaf975bce0eeee9ac8e5 Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Fri, 1 Jun 2018 14:28:05 +0200
+Subject: [PATCH 6/7] several compile fixes
+
+This patch was taken from Debian's libmxml 2.11-1 source:
+	07_compile_fixes.patch
+---
+ mxml.h    |  2 +-
+ mxmldoc.c | 10 +++++++++-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/mxml.h b/mxml.h
+index 5ad96b8..e78b8e9 100644
+--- a/mxml.h
++++ b/mxml.h
+@@ -28,7 +28,7 @@
+ #  include <string.h>
+ #  include <ctype.h>
+ #  include <errno.h>
+-
++#  include <stdarg.h>
+ 
+ /*
+  * Constants...
+diff --git a/mxmldoc.c b/mxmldoc.c
+index de5c8a7..bbdf758 100644
+--- a/mxmldoc.c
++++ b/mxmldoc.c
+@@ -37,7 +37,15 @@ extern char **environ;
+ #  include "zipc.h"
+ #endif /* HAVE_ZLIB_H */
+ 
+-
++#  ifndef HAVE_STRLCPY
++extern size_t	_mxml_strlcpy(char *, const char *, size_t);
++#    define strlcpy _mxml_strlcpy
++#  endif /* !HAVE_STRLCPY */
++
++#ifndef HAVE_STRLCAT
++extern size_t  _mxml_strlcat( char *, const char *, size_t);
++#define strlcat _mxml_strlcat
++#endif
+ /*
+  * This program scans source and header files and produces public API
+  * documentation for code that conforms to the CUPS Configuration
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/libmxml/libmxml/0007-Makefile-require-libmxml.a-for-its-installation.patch b/meta-oe/recipes-support/libmxml/libmxml/0007-Makefile-require-libmxml.a-for-its-installation.patch
new file mode 100644
index 000000000..14c4ac0fa
--- /dev/null
+++ b/meta-oe/recipes-support/libmxml/libmxml/0007-Makefile-require-libmxml.a-for-its-installation.patch
@@ -0,0 +1,26 @@
+From 5d58c984e1a1173def37a99267afd78757998642 Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Mon, 4 Jun 2018 11:23:36 +0200
+Subject: [PATCH 7/7] Makefile: require libmxml.a for its installation
+
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index fd48565..155a17a 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -162,7 +162,7 @@ install:	$(TARGETS) install-$(LIBMXML) install-libmxml.a
+ 	$(INSTALL_DIR) $(BUILDROOT)$(mandir)/man3
+ 	$(INSTALL_MAN) doc/mxml.man $(BUILDROOT)$(mandir)/man3/mxml.3
+ 
+-install-libmxml.a:
++install-libmxml.a: libmxml.a
+ 	echo Installing libmxml.a to $(BUILDROOT)$(libdir)...
+ 	$(INSTALL_DIR) $(BUILDROOT)$(libdir)
+ 	$(INSTALL_LIB) libmxml.a $(BUILDROOT)$(libdir)
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/libmxml/libmxml_2.11.bb b/meta-oe/recipes-support/libmxml/libmxml_2.11.bb
new file mode 100644
index 000000000..384e056d1
--- /dev/null
+++ b/meta-oe/recipes-support/libmxml/libmxml_2.11.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Tiny XML Library"
+LICENSE = "Mini-XML-License"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6ba38606d63bb042c5d8cfee182e120"
+HOMEPAGE = "https://www.msweet.org/mxml/"
+BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
+
+SRC_URI = " \
+    https://github.com/michaelrsweet/mxml/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
+    file://0001-remove-rpath-from-configure.in-and-configure.patch \
+    file://0002-link-libmxml-with-pthread.patch \
+    file://0003-add-missing-LDFLAGS-to-Makefile.patch \
+    file://0004-mxml-string-compile-headers.patch \
+    file://0005-several-autoheader-define-fixes.patch \
+    file://0006-several-compile-fixes.patch \
+    file://0007-Makefile-require-libmxml.a-for-its-installation.patch \
+"
+
+SRC_URI[md5sum] = "b9b49af414a2f0a8b13636d9635c3b6a"
+SRC_URI[sha256sum] = "7d3dfe661e50908fe41aef9b97ba6f7f158cab5208515c6be9f5bc9daf032329"
+
+inherit autotools-brokensep gettext
+
+S = "${WORKDIR}/mxml-${PV}"
+
+EXTRA_OEMAKE = "DSTROOT=${D}"
+
+PACKAGES += " ${PN}-bin "
+FILES_${PN} = "${libdir}/*"
+FILES_${PN}-bin = "${bindir}/*"
-- 
2.11.0



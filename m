Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54680C0018A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.5405.1699083061685680466
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KkQca3Kl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JObTYviC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b993e06f3-ae739784-a5cd-42e4-9a2c-cf395c1c46dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083061;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=plehcFwbADuGCEtXyGfvcvGVh66XDEnIlgyVriB53ss=;
	b=KkQca3KllI58Due2IPitzMm+5rzMBOF3x7jDB4pTBrTtNoyMajTT0DUFLXogbBhv
	AOtDG7zULSJ42g49SbBk/88Q7jjKhQj1DGrQwsJ1W8hj+ZunD1bPygn9HWRNse8UJpO
	4AOLg3T7MP7ezMbAWNQvYv80NECShAH5cYYFEWOE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083061;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=plehcFwbADuGCEtXyGfvcvGVh66XDEnIlgyVriB53ss=;
	b=JObTYviC2iKJyzaqyGzdTLYmv564jhW11kZzzx0L7juuchDeeHKDONkUMw67zK7l
	21ZbMyJylYRC/42IX3KwCBXVXMz6Tm9jCo8JX7V45UuPNFoh0woLi6CwfCfFOi/KZ76
	rZ/cAut1W9IuJmih8pWaepC9taeU6Zc7Xhgg+nnQ=
Content-Type: multipart/mixed; boundary="===============5470646037118307644=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfmpc: upgrading to 0.3.1 SUCCEEDED
Message-ID: <0101018b993e06f3-ae739784-a5cd-42e4-9a2c-cf395c1c46dd-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106348

--===============5470646037118307644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfmpc* to *0.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfmpc-upgrade-0.3.0-0.3.1.patch
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
From 8df41c28fe3b1d2f73fd043d9641d159d9868343 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:25:26 +0000
Subject: [PATCH] xfmpc: upgrade 0.3.0 -> 0.3.1

---
 .../recipes-multimedia/xfmpc/xfmpc_0.3.0.bb   |  16 --
 .../recipes-multimedia/xfmpc/xfmpc_0.3.1.bb   | 145 ++++++++++++++++++
 2 files changed, 145 insertions(+), 16 deletions(-)
 delete mode 100644 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb
 create mode 100644 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb

diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb
deleted file mode 100644
index b8521ba95..000000000
--- a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Music Player Daemon (MPD) client written in GTK+"
-HOMEPAGE = "https://goodies.xfce.org/projects/applications/xfmpc"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "libxfce4util libxfce4ui libmpd vala-native"
-
-# While this item does not require it, it depends on mpd which does
-LICENSE_FLAGS = "commercial"
-
-# for now we recommend our own mpd-server
-RRECOMMENDS:${PN} = "mpd"
-
-inherit xfce-app
-
-SRC_URI[md5sum] = "e6ff8563f159d1e727d656fb88964998"
-SRC_URI[sha256sum] = "c76e2a88dc3e1d345da7a5c68fa39981494c2b40033748efcac54411c9e65689"
diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb
new file mode 100644
index 000000000..755480dfb
--- /dev/null
+++ b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.1.bb
@@ -0,0 +1,145 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,12 +1,12 @@
+# -		    GNU GENERAL PUBLIC LICENSE
+# -		       Version 2, June 1991
+# -
+# - Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+# -     59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# +                    GNU GENERAL PUBLIC LICENSE
+# +                       Version 2, June 1991
+# +
+# + Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# + 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# -			    Preamble
+# +                            Preamble
+#  
+#    The licenses for most software are designed to take away your
+#  freedom to share and change it.  By contrast, the GNU General Public
+# @@ -15,7 +15,7 @@
+#  General Public License applies to most of the Free Software
+#  Foundation's software and to any other program whose authors commit to
+#  using it.  (Some other Free Software Foundation software is covered by
+# -the GNU Library General Public License instead.)  You can apply it to
+# +the GNU Lesser General Public License instead.)  You can apply it to
+#  your programs, too.
+#  
+#    When we speak of free software, we are referring to freedom, not
+# @@ -55,8 +55,8 @@
+#  
+#    The precise terms and conditions for copying, distribution and
+#  modification follow.
+# -
+# -		    GNU GENERAL PUBLIC LICENSE
+# +
+# +                    GNU GENERAL PUBLIC LICENSE
+#     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
+#    0. This License applies to any program or other work which contains
+# @@ -110,7 +110,7 @@
+#      License.  (Exception: if the Program itself is interactive but
+#      does not normally print such an announcement, your work based on
+#      the Program is not required to print an announcement.)
+# -
+# +
+#  These requirements apply to the modified work as a whole.  If
+#  identifiable sections of that work are not derived from the Program,
+#  and can be reasonably considered independent and separate works in
+# @@ -168,7 +168,7 @@
+#  access to copy the source code from the same place counts as
+#  distribution of the source code, even though third parties are not
+#  compelled to copy the source along with the object code.
+# -
+# +
+#    4. You may not copy, modify, sublicense, or distribute the Program
+#  except as expressly provided under this License.  Any attempt
+#  otherwise to copy, modify, sublicense or distribute the Program is
+# @@ -225,7 +225,7 @@
+#  
+#  This section is intended to make thoroughly clear what is believed to
+#  be a consequence of the rest of this License.
+# -
+# +
+#    8. If the distribution and/or use of the Program is restricted in
+#  certain countries either by patents or by copyrighted interfaces, the
+#  original copyright holder who places the Program under this License
+# @@ -255,7 +255,7 @@
+#  of preserving the free status of all derivatives of our free software and
+#  of promoting the sharing and reuse of software generally.
+#  
+# -			    NO WARRANTY
+# +                            NO WARRANTY
+#  
+#    11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+#  FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+# @@ -277,9 +277,9 @@
+#  PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+#  POSSIBILITY OF SUCH DAMAGES.
+#  
+# -		     END OF TERMS AND CONDITIONS
+# -
+# -	    How to Apply These Terms to Your New Programs
+# +                     END OF TERMS AND CONDITIONS
+# +
+# +            How to Apply These Terms to Your New Programs
+#  
+#    If you develop a new program, and you want it to be of the greatest
+#  possible use to the public, the best way to achieve this is to make it
+# @@ -303,17 +303,16 @@
+#      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#      GNU General Public License for more details.
+#  
+# -    You should have received a copy of the GNU General Public License
+# -    along with this program; if not, write to the Free Software
+# -    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# -
+# +    You should have received a copy of the GNU General Public License along
+# +    with this program; if not, write to the Free Software Foundation, Inc.,
+# +    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+#  If the program is interactive, make it output a short notice like this
+#  when it starts in an interactive mode:
+#  
+# -    Gnomovision version 69, Copyright (C) year  name of author
+# +    Gnomovision version 69, Copyright (C) year name of author
+#      Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+#      This is free software, and you are welcome to redistribute it
+#      under certain conditions; type `show c' for details.
+# @@ -336,5 +335,5 @@
+#  This General Public License does not permit incorporating your program into
+#  proprietary programs.  If your program is a subroutine library, you may
+#  consider it more useful to permit linking proprietary applications with the
+# -library.  If this is what you want to do, use the GNU Library General
+# +library.  If this is what you want to do, use the GNU Lesser General
+#  Public License instead of this License.
+# 
+#
+
+SUMMARY = "Music Player Daemon (MPD) client written in GTK+"
+HOMEPAGE = "https://goodies.xfce.org/projects/applications/xfmpc"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "libxfce4util libxfce4ui libmpd vala-native"
+
+# While this item does not require it, it depends on mpd which does
+LICENSE_FLAGS = "commercial"
+
+# for now we recommend our own mpd-server
+RRECOMMENDS:${PN} = "mpd"
+
+inherit xfce-app
+
+SRC_URI[sha256sum] = "4867d5dd100fa42ab39ebde6c784ec21ee31717f1adb3f4da070dafb3848d96d"
-- 
2.39.2


--===============5470646037118307644==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfmpc-upgrade-0.3.0-0.3.1.patch"

RnJvbSA4ZGY0MWMyOGZlM2IxZDJmNzNmZDA0M2Q5NjQxZDE1OWQ5ODY4MzQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzoyNToyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
bXBjOiB1cGdyYWRlIDAuMy4wIC0+IDAuMy4xCgotLS0KIC4uLi9yZWNpcGVzLW11bHRpbWVkaWEv
eGZtcGMveGZtcGNfMC4zLjAuYmIgICB8ICAxNiAtLQogLi4uL3JlY2lwZXMtbXVsdGltZWRpYS94
Zm1wYy94Zm1wY18wLjMuMS5iYiAgIHwgMTQ1ICsrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCAxNDUgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS14ZmNlL3JlY2lwZXMtbXVsdGltZWRpYS94Zm1wYy94Zm1wY18wLjMuMC5iYgog
Y3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEteGZjZS9yZWNpcGVzLW11bHRpbWVkaWEveGZtcGMveGZt
cGNfMC4zLjEuYmIKCmRpZmYgLS1naXQgYS9tZXRhLXhmY2UvcmVjaXBlcy1tdWx0aW1lZGlhL3hm
bXBjL3hmbXBjXzAuMy4wLmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMtbXVsdGltZWRpYS94Zm1wYy94
Zm1wY18wLjMuMC5iYgpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYjg1MjFiYTk1Li4w
MDAwMDAwMDAKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMtbXVsdGltZWRpYS94Zm1wYy94Zm1wY18w
LjMuMC5iYgorKysgL2Rldi9udWxsCkBAIC0xLDE2ICswLDAgQEAKLVNVTU1BUlkgPSAiTXVzaWMg
UGxheWVyIERhZW1vbiAoTVBEKSBjbGllbnQgd3JpdHRlbiBpbiBHVEsrIgotSE9NRVBBR0UgPSAi
aHR0cHM6Ly9nb29kaWVzLnhmY2Uub3JnL3Byb2plY3RzL2FwcGxpY2F0aW9ucy94Zm1wYyIKLUxJ
Q0VOU0UgPSAiR1BMLTIuMC1vbmx5IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlO
RzttZDU9OTRkNTVkNTEyYTliYTM2Y2FhOWI3ZGYwNzliYWUxOWYiCi1ERVBFTkRTID0gImxpYnhm
Y2U0dXRpbCBsaWJ4ZmNlNHVpIGxpYm1wZCB2YWxhLW5hdGl2ZSIKLQotIyBXaGlsZSB0aGlzIGl0
ZW0gZG9lcyBub3QgcmVxdWlyZSBpdCwgaXQgZGVwZW5kcyBvbiBtcGQgd2hpY2ggZG9lcwotTElD
RU5TRV9GTEFHUyA9ICJjb21tZXJjaWFsIgotCi0jIGZvciBub3cgd2UgcmVjb21tZW5kIG91ciBv
d24gbXBkLXNlcnZlcgotUlJFQ09NTUVORFM6JHtQTn0gPSAibXBkIgotCi1pbmhlcml0IHhmY2Ut
YXBwCi0KLVNSQ19VUklbbWQ1c3VtXSA9ICJlNmZmODU2M2YxNTlkMWU3MjdkNjU2ZmI4ODk2NDk5
OCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNzZlMmE4OGRjM2UxZDM0NWRhN2E1YzY4ZmEzOTk4
MTQ5NGMyYjQwMDMzNzQ4ZWZjYWM1NDQxMWM5ZTY1Njg5IgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNl
L3JlY2lwZXMtbXVsdGltZWRpYS94Zm1wYy94Zm1wY18wLjMuMS5iYiBiL21ldGEteGZjZS9yZWNp
cGVzLW11bHRpbWVkaWEveGZtcGMveGZtcGNfMC4zLjEuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwLi43NTU0ODBkZmIKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLXhmY2Uv
cmVjaXBlcy1tdWx0aW1lZGlhL3hmbXBjL3hmbXBjXzAuMy4xLmJiCkBAIC0wLDAgKzEsMTQ1IEBA
CisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQg
YnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0
ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMg
aW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChl
eGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisj
IFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMSwx
MiArMSwxMiBAQAorIyAtCQkgICAgR05VIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgLQkJICAg
ICAgIFZlcnNpb24gMiwgSnVuZSAxOTkxCisjIC0KKyMgLSBDb3B5cmlnaHQgKEMpIDE5ODksIDE5
OTEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisjIC0gICAgIDU5IFRlbXBsZSBQbGFj
ZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1BICAwMjExMS0xMzA3ICBVU0EKKyMgKyAgICAgICAgICAg
ICAgICAgICAgR05VIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgKyAgICAgICAgICAgICAgICAg
ICAgICAgVmVyc2lvbiAyLCBKdW5lIDE5OTEKKyMgKworIyArIENvcHlyaWdodCAoQykgMTk4OSwg
MTk5MSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCisjICsgNTEgRnJhbmtsaW4gU3Ry
ZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQQorIyAgIEV2ZXJ5b25l
IGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcworIyAg
IG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxvd2Vk
LgorIyAgCisjIC0JCQkgICAgUHJlYW1ibGUKKyMgKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQcmVhbWJsZQorIyAgCisjICAgIFRoZSBsaWNlbnNlcyBmb3IgbW9zdCBzb2Z0d2FyZSBhcmUg
ZGVzaWduZWQgdG8gdGFrZSBhd2F5IHlvdXIKKyMgIGZyZWVkb20gdG8gc2hhcmUgYW5kIGNoYW5n
ZSBpdC4gIEJ5IGNvbnRyYXN0LCB0aGUgR05VIEdlbmVyYWwgUHVibGljCisjIEBAIC0xNSw3ICsx
NSw3IEBACisjICBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFwcGxpZXMgdG8gbW9zdCBvZiB0aGUg
RnJlZSBTb2Z0d2FyZQorIyAgRm91bmRhdGlvbidzIHNvZnR3YXJlIGFuZCB0byBhbnkgb3RoZXIg
cHJvZ3JhbSB3aG9zZSBhdXRob3JzIGNvbW1pdCB0bworIyAgdXNpbmcgaXQuICAoU29tZSBvdGhl
ciBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24gc29mdHdhcmUgaXMgY292ZXJlZCBieQorIyAtdGhl
IEdOVSBMaWJyYXJ5IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgaW5zdGVhZC4pICBZb3UgY2FuIGFw
cGx5IGl0IHRvCisjICt0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGluc3Rl
YWQuKSAgWW91IGNhbiBhcHBseSBpdCB0bworIyAgeW91ciBwcm9ncmFtcywgdG9vLgorIyAgCisj
ICAgIFdoZW4gd2Ugc3BlYWsgb2YgZnJlZSBzb2Z0d2FyZSwgd2UgYXJlIHJlZmVycmluZyB0byBm
cmVlZG9tLCBub3QKKyMgQEAgLTU1LDggKzU1LDggQEAKKyMgIAorIyAgICBUaGUgcHJlY2lzZSB0
ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3IgY29weWluZywgZGlzdHJpYnV0aW9uIGFuZAorIyAgbW9k
aWZpY2F0aW9uIGZvbGxvdy4KKyMgLQwKKyMgLQkJICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNF
TlNFCisjICsKKyMgKyAgICAgICAgICAgICAgICAgICAgR05VIEdFTkVSQUwgUFVCTElDIExJQ0VO
U0UKKyMgICAgIFRFUk1TIEFORCBDT05ESVRJT05TIEZPUiBDT1BZSU5HLCBESVNUUklCVVRJT04g
QU5EIE1PRElGSUNBVElPTgorIyAgCisjICAgIDAuIFRoaXMgTGljZW5zZSBhcHBsaWVzIHRvIGFu
eSBwcm9ncmFtIG9yIG90aGVyIHdvcmsgd2hpY2ggY29udGFpbnMKKyMgQEAgLTExMCw3ICsxMTAs
NyBAQAorIyAgICAgIExpY2Vuc2UuICAoRXhjZXB0aW9uOiBpZiB0aGUgUHJvZ3JhbSBpdHNlbGYg
aXMgaW50ZXJhY3RpdmUgYnV0CisjICAgICAgZG9lcyBub3Qgbm9ybWFsbHkgcHJpbnQgc3VjaCBh
biBhbm5vdW5jZW1lbnQsIHlvdXIgd29yayBiYXNlZCBvbgorIyAgICAgIHRoZSBQcm9ncmFtIGlz
IG5vdCByZXF1aXJlZCB0byBwcmludCBhbiBhbm5vdW5jZW1lbnQuKQorIyAtDAorIyArCisjICBU
aGVzZSByZXF1aXJlbWVudHMgYXBwbHkgdG8gdGhlIG1vZGlmaWVkIHdvcmsgYXMgYSB3aG9sZS4g
IElmCisjICBpZGVudGlmaWFibGUgc2VjdGlvbnMgb2YgdGhhdCB3b3JrIGFyZSBub3QgZGVyaXZl
ZCBmcm9tIHRoZSBQcm9ncmFtLAorIyAgYW5kIGNhbiBiZSByZWFzb25hYmx5IGNvbnNpZGVyZWQg
aW5kZXBlbmRlbnQgYW5kIHNlcGFyYXRlIHdvcmtzIGluCisjIEBAIC0xNjgsNyArMTY4LDcgQEAK
KyMgIGFjY2VzcyB0byBjb3B5IHRoZSBzb3VyY2UgY29kZSBmcm9tIHRoZSBzYW1lIHBsYWNlIGNv
dW50cyBhcworIyAgZGlzdHJpYnV0aW9uIG9mIHRoZSBzb3VyY2UgY29kZSwgZXZlbiB0aG91Z2gg
dGhpcmQgcGFydGllcyBhcmUgbm90CisjICBjb21wZWxsZWQgdG8gY29weSB0aGUgc291cmNlIGFs
b25nIHdpdGggdGhlIG9iamVjdCBjb2RlLgorIyAtDAorIyArCisjICAgIDQuIFlvdSBtYXkgbm90
IGNvcHksIG1vZGlmeSwgc3VibGljZW5zZSwgb3IgZGlzdHJpYnV0ZSB0aGUgUHJvZ3JhbQorIyAg
ZXhjZXB0IGFzIGV4cHJlc3NseSBwcm92aWRlZCB1bmRlciB0aGlzIExpY2Vuc2UuICBBbnkgYXR0
ZW1wdAorIyAgb3RoZXJ3aXNlIHRvIGNvcHksIG1vZGlmeSwgc3VibGljZW5zZSBvciBkaXN0cmli
dXRlIHRoZSBQcm9ncmFtIGlzCisjIEBAIC0yMjUsNyArMjI1LDcgQEAKKyMgIAorIyAgVGhpcyBz
ZWN0aW9uIGlzIGludGVuZGVkIHRvIG1ha2UgdGhvcm91Z2hseSBjbGVhciB3aGF0IGlzIGJlbGll
dmVkIHRvCisjICBiZSBhIGNvbnNlcXVlbmNlIG9mIHRoZSByZXN0IG9mIHRoaXMgTGljZW5zZS4K
KyMgLQwKKyMgKworIyAgICA4LiBJZiB0aGUgZGlzdHJpYnV0aW9uIGFuZC9vciB1c2Ugb2YgdGhl
IFByb2dyYW0gaXMgcmVzdHJpY3RlZCBpbgorIyAgY2VydGFpbiBjb3VudHJpZXMgZWl0aGVyIGJ5
IHBhdGVudHMgb3IgYnkgY29weXJpZ2h0ZWQgaW50ZXJmYWNlcywgdGhlCisjICBvcmlnaW5hbCBj
b3B5cmlnaHQgaG9sZGVyIHdobyBwbGFjZXMgdGhlIFByb2dyYW0gdW5kZXIgdGhpcyBMaWNlbnNl
CisjIEBAIC0yNTUsNyArMjU1LDcgQEAKKyMgIG9mIHByZXNlcnZpbmcgdGhlIGZyZWUgc3RhdHVz
IG9mIGFsbCBkZXJpdmF0aXZlcyBvZiBvdXIgZnJlZSBzb2Z0d2FyZSBhbmQKKyMgIG9mIHByb21v
dGluZyB0aGUgc2hhcmluZyBhbmQgcmV1c2Ugb2Ygc29mdHdhcmUgZ2VuZXJhbGx5LgorIyAgCisj
IC0JCQkgICAgTk8gV0FSUkFOVFkKKyMgKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBOTyBX
QVJSQU5UWQorIyAgCisjICAgIDExLiBCRUNBVVNFIFRIRSBQUk9HUkFNIElTIExJQ0VOU0VEIEZS
RUUgT0YgQ0hBUkdFLCBUSEVSRSBJUyBOTyBXQVJSQU5UWQorIyAgRk9SIFRIRSBQUk9HUkFNLCBU
TyBUSEUgRVhURU5UIFBFUk1JVFRFRCBCWSBBUFBMSUNBQkxFIExBVy4gIEVYQ0VQVCBXSEVOCisj
IEBAIC0yNzcsOSArMjc3LDkgQEAKKyMgIFBST0dSQU1TKSwgRVZFTiBJRiBTVUNIIEhPTERFUiBP
UiBPVEhFUiBQQVJUWSBIQVMgQkVFTiBBRFZJU0VEIE9GIFRIRQorIyAgUE9TU0lCSUxJVFkgT0Yg
U1VDSCBEQU1BR0VTLgorIyAgCisjIC0JCSAgICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJT05T
CisjIC0MCisjIC0JICAgIEhvdyB0byBBcHBseSBUaGVzZSBUZXJtcyB0byBZb3VyIE5ldyBQcm9n
cmFtcworIyArICAgICAgICAgICAgICAgICAgICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJT05T
CisjICsKKyMgKyAgICAgICAgICAgIEhvdyB0byBBcHBseSBUaGVzZSBUZXJtcyB0byBZb3VyIE5l
dyBQcm9ncmFtcworIyAgCisjICAgIElmIHlvdSBkZXZlbG9wIGEgbmV3IHByb2dyYW0sIGFuZCB5
b3Ugd2FudCBpdCB0byBiZSBvZiB0aGUgZ3JlYXRlc3QKKyMgIHBvc3NpYmxlIHVzZSB0byB0aGUg
cHVibGljLCB0aGUgYmVzdCB3YXkgdG8gYWNoaWV2ZSB0aGlzIGlzIHRvIG1ha2UgaXQKKyMgQEAg
LTMwMywxNyArMzAzLDE2IEBACisjICAgICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorIyAgICAgIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisjICAKKyMgLSAgICBZb3Ugc2hvdWxkIGhhdmUg
cmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorIyAtICAg
IGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3
YXJlCisjIC0gICAgRm91bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAzMzAs
IEJvc3RvbiwgTUEgIDAyMTExLTEzMDcgIFVTQQorIyAtCisjICsgICAgWW91IHNob3VsZCBoYXZl
IHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYWxvbmcK
KyMgKyAgICB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0
d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAorIyArICAgIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGgg
Rmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EuCisjICAKKyMgIEFsc28gYWRkIGluZm9y
bWF0aW9uIG9uIGhvdyB0byBjb250YWN0IHlvdSBieSBlbGVjdHJvbmljIGFuZCBwYXBlciBtYWls
LgorIyAgCisjICBJZiB0aGUgcHJvZ3JhbSBpcyBpbnRlcmFjdGl2ZSwgbWFrZSBpdCBvdXRwdXQg
YSBzaG9ydCBub3RpY2UgbGlrZSB0aGlzCisjICB3aGVuIGl0IHN0YXJ0cyBpbiBhbiBpbnRlcmFj
dGl2ZSBtb2RlOgorIyAgCisjIC0gICAgR25vbW92aXNpb24gdmVyc2lvbiA2OSwgQ29weXJpZ2h0
IChDKSB5ZWFyICBuYW1lIG9mIGF1dGhvcgorIyArICAgIEdub21vdmlzaW9uIHZlcnNpb24gNjks
IENvcHlyaWdodCAoQykgeWVhciBuYW1lIG9mIGF1dGhvcgorIyAgICAgIEdub21vdmlzaW9uIGNv
bWVzIHdpdGggQUJTT0xVVEVMWSBOTyBXQVJSQU5UWTsgZm9yIGRldGFpbHMgdHlwZSBgc2hvdyB3
Jy4KKyMgICAgICBUaGlzIGlzIGZyZWUgc29mdHdhcmUsIGFuZCB5b3UgYXJlIHdlbGNvbWUgdG8g
cmVkaXN0cmlidXRlIGl0CisjICAgICAgdW5kZXIgY2VydGFpbiBjb25kaXRpb25zOyB0eXBlIGBz
aG93IGMnIGZvciBkZXRhaWxzLgorIyBAQCAtMzM2LDUgKzMzNSw1IEBACisjICBUaGlzIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UgZG9lcyBub3QgcGVybWl0IGluY29ycG9yYXRpbmcgeW91ciBwcm9n
cmFtIGludG8KKyMgIHByb3ByaWV0YXJ5IHByb2dyYW1zLiAgSWYgeW91ciBwcm9ncmFtIGlzIGEg
c3Vicm91dGluZSBsaWJyYXJ5LCB5b3UgbWF5CisjICBjb25zaWRlciBpdCBtb3JlIHVzZWZ1bCB0
byBwZXJtaXQgbGlua2luZyBwcm9wcmlldGFyeSBhcHBsaWNhdGlvbnMgd2l0aCB0aGUKKyMgLWxp
YnJhcnkuICBJZiB0aGlzIGlzIHdoYXQgeW91IHdhbnQgdG8gZG8sIHVzZSB0aGUgR05VIExpYnJh
cnkgR2VuZXJhbAorIyArbGlicmFyeS4gIElmIHRoaXMgaXMgd2hhdCB5b3Ugd2FudCB0byBkbywg
dXNlIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwKKyMgIFB1YmxpYyBMaWNlbnNlIGluc3RlYWQgb2Yg
dGhpcyBMaWNlbnNlLgorIyAKKyMKKworU1VNTUFSWSA9ICJNdXNpYyBQbGF5ZXIgRGFlbW9uIChN
UEQpIGNsaWVudCB3cml0dGVuIGluIEdUSysiCitIT01FUEFHRSA9ICJodHRwczovL2dvb2RpZXMu
eGZjZS5vcmcvcHJvamVjdHMvYXBwbGljYXRpb25zL3hmbXBjIgorTElDRU5TRSA9ICJHUEwtMi4w
LW9ubHkiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5
ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKK0RFUEVORFMgPSAibGlieGZjZTR1dGlsIGxpYnhmY2U0
dWkgbGlibXBkIHZhbGEtbmF0aXZlIgorCisjIFdoaWxlIHRoaXMgaXRlbSBkb2VzIG5vdCByZXF1
aXJlIGl0LCBpdCBkZXBlbmRzIG9uIG1wZCB3aGljaCBkb2VzCitMSUNFTlNFX0ZMQUdTID0gImNv
bW1lcmNpYWwiCisKKyMgZm9yIG5vdyB3ZSByZWNvbW1lbmQgb3VyIG93biBtcGQtc2VydmVyCitS
UkVDT01NRU5EUzoke1BOfSA9ICJtcGQiCisKK2luaGVyaXQgeGZjZS1hcHAKKworU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjQ4NjdkNWRkMTAwZmE0MmFiMzllYmRlNmM3ODRlYzIxZWUzMTcxN2YxYWRi
M2Y0ZGEwNzBkYWZiMzg0OGQ5NmQiCi0tIAoyLjM5LjIKCg==

--===============5470646037118307644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfmpc: PACKAGES: added "xfmpc-locale-hye xfmpc-locale-fa-ir xfmpc-locale-et"
packages/core2-64-poky-linux/xfmpc: SRC_URI changed from "http://archive.xfce.org/src/apps/xfmpc/0.3/xfmpc-0.3.0.tar.bz2" to "http://archive.xfce.org/src/apps/xfmpc/0.3/xfmpc-0.3.1.tar.bz2"
packages/core2-64-poky-linux/xfmpc: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-dbg: PKGSIZE changed from 685968 to 657784 (-4%)
packages/core2-64-poky-linux/xfmpc/xfmpc-dbg: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-dbg: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-dev: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-dev: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-doc: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-doc: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-am: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-am: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ar: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ar: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ast: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ast: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-be: PKGSIZE changed from 5444 to 5446 (+0%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-be: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-be: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-bg: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-bg: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ca: PKGSIZE changed from 4718 to 4720 (+0%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ca: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ca: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-cs: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-cs: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-da: PKGSIZE changed from 4535 to 4472 (-1%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-da: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-da: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-de: PKGSIZE changed from 4681 to 4655 (-1%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-de: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-de: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-el: PKGSIZE changed from 5780 to 5865 (+1%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-el: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-el: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-en-au: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-en-au: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-en-gb: PKGSIZE changed from 4298 to 4459 (+4%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-en-gb: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-en-gb: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-es: PKGSIZE changed from 4686 to 4777 (+2%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-es: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-es: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-eu: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-eu: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-fi: PKGSIZE changed from 4645 to 4719 (+2%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-fi: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-fi: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-fr: PKGSIZE changed from 4711 to 4720 (+0%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-fr: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-fr: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-gl: PKGSIZE changed from 4719 to 4734 (+0%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-gl: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-gl: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-he: PKGSIZE changed from 5044 to 5059 (+0%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-he: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-he: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-hr: PKGSIZE changed from 4652 to 4644 (-0%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-hr: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-hr: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-hu: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-hu: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-hy-am: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-hy-am: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-id: PKGSIZE changed from 4429 to 4552 (+3%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-id: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-id: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ie: PKGSIZE changed from 4530 to 4509 (-0%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ie: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ie: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-is: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-is: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-it: PKGSIZE changed from 4734 to 4768 (+1%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-it: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-it: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ja: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ja: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ko: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ko: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-lt: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-lt: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ms: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ms: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-nb: PKGSIZE changed from 4592 to 4675 (+2%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-nb: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-nb: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-nl: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-nl: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-oc: PKGSIZE changed from 4641 to 4692 (+1%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-oc: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-oc: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-pl: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-pl: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-pt-br: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-pt-br: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-pt: PKGSIZE changed from 4591 to 4715 (+3%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-pt: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-pt: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ru: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ru: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-si: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-si: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sk: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sk: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sl: PKGSIZE changed from 4696 to 4766 (+1%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sl: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sl: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sq: PKGSIZE changed from 4615 to 4620 (+0%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sq: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sq: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sr: PKGSIZE changed from 5512 to 5607 (+2%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sr: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sr: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sv: PKGSIZE changed from 4588 to 4662 (+2%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sv: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-sv: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-th: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-th: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-tr: PKGSIZE changed from 4668 to 4696 (+1%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-tr: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-tr: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ug: PKGSIZE changed from 5338 to 5345 (+0%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ug: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ug: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-uk: PKGSIZE changed from 5652 to 5788 (+2%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-uk: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-uk: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ur-pk: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ur-pk: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ur: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-ur: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-zh-cn: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-zh-cn: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-zh-tw: PKGSIZE changed from 4563 to 4562 (-0%)
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-zh-tw: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-locale-zh-tw: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-src: FILELIST: removed "/usr/src/debug/xfmpc/0.3.0-r0/src/xfce-arrow-button.h /usr/src/debug/xfmpc/0.3.0-r0/src/mpdclient.c /usr/src/debug/xfmpc/0.3.0-r0/src/xfmpc.h /usr/src/debug/xfmpc/0.3.0-r0/src/main.c /usr/src/debug/xfmpc/0.3.0-r0/src/main-window.c /usr/src/debug/xfmpc/0.3.0-r0/src/mpdclient.h /usr/src/debug/xfmpc/0.3.0-r0/src/progress-bar.c /usr/src/debug/xfmpc/0.3.0-r0/src/xfce-arrow-button.c /usr/src/debug/xfmpc/0.3.0-r0/src/extended-interface.c /usr/src/debug/xfmpc/0.3.0-r0/src/shortcuts-dialog.c /usr/src/debug/xfmpc/0.3.0-r0/src/song-dialog.c /usr/src/debug/xfmpc/0.3.0-r0/src/playlist.c /usr/src/debug/xfmpc/0.3.0-r0/src/statusbar.c /usr/src/debug/xfmpc/0.3.0-r0/src/preferences.c /usr/src/debug/xfmpc/0.3.0-r0/src/interface.c /usr/src/debug/xfmpc/0.3.0-r0/src/dbbrowser.c /usr/src/debug/xfmpc/0.3.0-r0/src/preferences-dialog.c", added "/usr/src/debug/xfmpc/0.3.1-r0/src/main.c /usr/src/debug/xfmpc/0.3.1-r0/src/xfmpc.h /usr/src/debug/xfmp
 c/0.3.1-r0/src/main-window.c /usr/src/debug/xfmpc/0.3.1-r0/src/progress-bar.c /usr/src/debug/xfmpc/0.3.1-r0/src/shortcuts-dialog.c /usr/src/debug/xfmpc/0.3.1-r0/src/libc/mpdclient.c /usr/src/debug/xfmpc/0.3.1-r0/src/playlist.c /usr/src/debug/xfmpc/0.3.1-r0/src/song-dialog.c /usr/src/debug/xfmpc/0.3.1-r0/src/preferences.c /usr/src/debug/xfmpc/0.3.1-r0/src/statusbar.c /usr/src/debug/xfmpc/0.3.1-r0/src/libc/mpdclient.h /usr/src/debug/xfmpc/0.3.1-r0/src/extended-interface.c /usr/src/debug/xfmpc/0.3.1-r0/src/interface.c /usr/src/debug/xfmpc/0.3.1-r0/src/dbbrowser.c /usr/src/debug/xfmpc/0.3.1-r0/src/preferences-dialog.c"
packages/core2-64-poky-linux/xfmpc/xfmpc-src: PKGSIZE changed from 462332 to 410471 (-11%)
packages/core2-64-poky-linux/xfmpc/xfmpc-src: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-src: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc-staticdev: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc-staticdev: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/core2-64-poky-linux/xfmpc/xfmpc: PKGSIZE changed from 146893 to 143017 (-3%)
packages/core2-64-poky-linux/xfmpc/xfmpc: PV changed from "0.3.0" to "0.3.1"
packages/core2-64-poky-linux/xfmpc/xfmpc: PKGV changed from 0.3.0 [default] to 0.3.1 [default]

--===============5470646037118307644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfmpc: PACKAGES: added "xfmpc-locale-et xfmpc-locale-hye xfmpc-locale-fa-ir"
packages/core2-64-poky-linux/xfmpc/xfmpc-src: PKGSIZE changed from 462332 to 410471 (-11%)

--===============5470646037118307644==--


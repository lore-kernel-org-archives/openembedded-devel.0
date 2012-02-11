Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ka6sox@gmail.com>) id 1RwMQM-0006rh-RU
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Feb 2012 00:32:11 +0100
Received: by iaby12 with SMTP id y12so2413590iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2012 15:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=K18LzMJsRmdxKP5A7O4Paq4zuVJTGFDWpc5JyEuAMuI=;
	b=lWS0A/56yarBlhJjdswc9ilfg83yF6dq8XSbEvl7kKNg813jcdz+V/BRWiG3NirBpi
	mGbldSWMTUpi/FXQ3YFkIifsXIRHHj910UwFck9SL7MJmJ805OEyCoLZOcF9VWAup+dI
	0zk0mdz1WJYUyZOZxvyMMWEAjAmcd3dr/xz9s=
MIME-Version: 1.0
Received: by 10.50.104.134 with SMTP id ge6mr12094934igb.1.1329002642265; Sat,
	11 Feb 2012 15:24:02 -0800 (PST)
Received: by 10.50.170.7 with HTTP; Sat, 11 Feb 2012 15:24:02 -0800 (PST)
In-Reply-To: <Pine.LNX.4.64.1202111600300.3065@www.vctlabs.com>
References: <Pine.LNX.4.64.1202111600300.3065@www.vctlabs.com>
Date: Sat, 11 Feb 2012 15:24:02 -0800
Message-ID: <CAHQecY5ARQUHqUScJqReFO_mD3t_U-ViMYQrS=Rox-xoGR3k-A@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OE scons cross-compile patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Feb 2012 23:32:11 -0000
X-Groupsio-MsgNum: 37090
Content-Type: multipart/mixed; boundary=e89a8f234cd765d4a704b8b88acd

--e89a8f234cd765d4a704b8b88acd
Content-Type: text/plain; charset=ISO-8859-1

---------- Forwarded message ----------
From: S. Lockwood-Childs <sjl@vctlabs.com>
Date: Sat, Feb 11, 2012 at 4:03 PM
Subject: OE scons cross-compile patch
To: ka6sox@gmail.com


commit 9f66f474614696154d50156ada5f4c**1629b1b28c
Author: S Lockwood-Childs <sjl@vctlabs.com>
Date:   Sat Feb 11 15:07:17 2012 -0800

   cross-compile support for SCons

   scons build system searches paths for hard-coded tool names like "gcc",
   so this patch teaches it to check first for a tool with cross-compile
prefix
   if the CROSS_COMPILE variable has been set. If not found, it falls back
   to searching for the un-prefixed tool name.

   For example, if CROSS_COMPILE=arm-angstrom-**linux-gnueabi-
   SCons.Evironment.Detect('gcc') should find arm-angstrom-linux-gnueabi-gcc
   SCons.Evironment.Detect('zip') should find plain zip

diff --git a/meta/recipes-devtools/**python/python-scons-native/**scons-cross-toolchain.patch
b/meta/recipes-devtools/**python/python-scons-native/**
scons-cross-toolchain.patch
new file mode 100644
index 0000000..041279e
--- /dev/null
+++ b/meta/recipes-devtools/**python/python-scons-native/**
scons-cross-toolchain.patch
@@ -0,0 +1,17 @@
+--- scons-2.1.0/engine/SCons/**Environment.py.orig       2012-02-10
16:59:10.000000000 -0800
++++ scons-2.1.0/engine/SCons/**Environment.py    2012-02-11
13:29:15.000000000 -0800
+@@ -1483,6 +1483,14 @@
+         if not SCons.Util.is_List(progs):
+             progs = [ progs ]
+         for prog in progs:
++            # prefer cross version of program, if it exists
++            if 'CROSS_COMPILE' in self._dict:
++                cross_prog = self['CROSS_COMPILE'] + prog
++                #print "Looking for %s" % cross_prog
++                path = self.WhereIs(cross_prog)
++                if path: return cross_prog
++
++            #print "Looking for %s" % prog
+             path = self.WhereIs(prog)
+             if path: return prog
+         return None
diff --git a/meta/recipes-devtools/**python/python-scons-native_2.**1.0.bb<http://python-scons-native_2.1.0.bb>b/meta/recipes-devtools/
**python/python-scons-native_2.**1.0.bb<http://python-scons-native_2.1.0.bb>
index ff94cf6..c653237 100644
--- a/meta/recipes-devtools/**python/python-scons-native_2.**1.0.bb<http://python-scons-native_2.1.0.bb>
+++ b/meta/recipes-devtools/**python/python-scons-native_2.**1.0.bb<http://python-scons-native_2.1.0.bb>
@@ -2,4 +2,6 @@ require python-scons_${PV}.bb
 inherit native
 DEPENDS = "python-native"
 RDEPENDS_${PN} = ""
-PR = "r1"
+PR = "r2"
+
+SRC_URI += "file://scons-cross-toolchain.**patch"

--e89a8f234cd765d4a704b8b88acd
Content-Type: TEXT/x-diff; charset=US-ASCII; name="oe-scons-cross-compile.patch"
Content-Disposition: attachment; filename="oe-scons-cross-compile.patch"
Content-Transfer-Encoding: base64
Content-ID: <Pine.LNX.4.64.1202111603100.3065@www.vctlabs.com>
X-Attachment-Id: e2f64a0e400ac881_0.1

Y29tbWl0IDlmNjZmNDc0NjE0Njk2MTU0ZDUwMTU2YWRhNWY0YzE2MjliMWIyOGMNCkF1dGhvcjog
UyBMb2Nrd29vZC1DaGlsZHMgPHNqbEB2Y3RsYWJzLmNvbT4NCkRhdGU6ICAgU2F0IEZlYiAxMSAx
NTowNzoxNyAyMDEyIC0wODAwDQoNCiAgICBjcm9zcy1jb21waWxlIHN1cHBvcnQgZm9yIFNDb25z
DQogICAgDQogICAgc2NvbnMgYnVpbGQgc3lzdGVtIHNlYXJjaGVzIHBhdGhzIGZvciBoYXJkLWNv
ZGVkIHRvb2wgbmFtZXMgbGlrZSAiZ2NjIiwNCiAgICBzbyB0aGlzIHBhdGNoIHRlYWNoZXMgaXQg
dG8gY2hlY2sgZmlyc3QgZm9yIGEgdG9vbCB3aXRoIGNyb3NzLWNvbXBpbGUgcHJlZml4DQogICAg
aWYgdGhlIENST1NTX0NPTVBJTEUgdmFyaWFibGUgaGFzIGJlZW4gc2V0LiBJZiBub3QgZm91bmQs
IGl0IGZhbGxzIGJhY2sNCiAgICB0byBzZWFyY2hpbmcgZm9yIHRoZSB1bi1wcmVmaXhlZCB0b29s
IG5hbWUuDQogICAgDQogICAgRm9yIGV4YW1wbGUsIGlmIENST1NTX0NPTVBJTEU9YXJtLWFuZ3N0
cm9tLWxpbnV4LWdudWVhYmktDQogICAgU0NvbnMuRXZpcm9ubWVudC5EZXRlY3QoJ2djYycpIHNo
b3VsZCBmaW5kIGFybS1hbmdzdHJvbS1saW51eC1nbnVlYWJpLWdjYw0KICAgIFNDb25zLkV2aXJv
bm1lbnQuRGV0ZWN0KCd6aXAnKSBzaG91bGQgZmluZCBwbGFpbiB6aXANCg0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXNjb25zLW5hdGl2ZS9zY29ucy1j
cm9zcy10b29sY2hhaW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bi1zY29ucy1uYXRpdmUvc2NvbnMtY3Jvc3MtdG9vbGNoYWluLnBhdGNoDQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KaW5kZXggMDAwMDAwMC4uMDQxMjc5ZQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tc2NvbnMtbmF0aXZlL3Njb25zLWNyb3Nz
LXRvb2xjaGFpbi5wYXRjaA0KQEAgLTAsMCArMSwxNyBAQA0KKy0tLSBzY29ucy0yLjEuMC9lbmdp
bmUvU0NvbnMvRW52aXJvbm1lbnQucHkub3JpZwkyMDEyLTAyLTEwIDE2OjU5OjEwLjAwMDAwMDAw
MCAtMDgwMA0KKysrKyBzY29ucy0yLjEuMC9lbmdpbmUvU0NvbnMvRW52aXJvbm1lbnQucHkJMjAx
Mi0wMi0xMSAxMzoyOToxNS4wMDAwMDAwMDAgLTA4MDANCitAQCAtMTQ4Myw2ICsxNDgzLDE0IEBA
DQorICAgICAgICAgaWYgbm90IFNDb25zLlV0aWwuaXNfTGlzdChwcm9ncyk6DQorICAgICAgICAg
ICAgIHByb2dzID0gWyBwcm9ncyBdDQorICAgICAgICAgZm9yIHByb2cgaW4gcHJvZ3M6DQorKyAg
ICAgICAgICAgICMgcHJlZmVyIGNyb3NzIHZlcnNpb24gb2YgcHJvZ3JhbSwgaWYgaXQgZXhpc3Rz
DQorKyAgICAgICAgICAgIGlmICdDUk9TU19DT01QSUxFJyBpbiBzZWxmLl9kaWN0Og0KKysgICAg
ICAgICAgICAgICAgY3Jvc3NfcHJvZyA9IHNlbGZbJ0NST1NTX0NPTVBJTEUnXSArIHByb2cNCisr
ICAgICAgICAgICAgICAgICNwcmludCAiTG9va2luZyBmb3IgJXMiICUgY3Jvc3NfcHJvZw0KKysg
ICAgICAgICAgICAgICAgcGF0aCA9IHNlbGYuV2hlcmVJcyhjcm9zc19wcm9nKQ0KKysgICAgICAg
ICAgICAgICAgaWYgcGF0aDogcmV0dXJuIGNyb3NzX3Byb2cNCisrDQorKyAgICAgICAgICAgICNw
cmludCAiTG9va2luZyBmb3IgJXMiICUgcHJvZw0KKyAgICAgICAgICAgICBwYXRoID0gc2VsZi5X
aGVyZUlzKHByb2cpDQorICAgICAgICAgICAgIGlmIHBhdGg6IHJldHVybiBwcm9nDQorICAgICAg
ICAgcmV0dXJuIE5vbmUNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbi1zY29ucy1uYXRpdmVfMi4xLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbi1zY29ucy1uYXRpdmVfMi4xLjAuYmINCmluZGV4IGZmOTRjZjYuLmM2NTMyMzcg
MTAwNjQ0DQotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1zY29ucy1u
YXRpdmVfMi4xLjAuYmINCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
LXNjb25zLW5hdGl2ZV8yLjEuMC5iYg0KQEAgLTIsNCArMiw2IEBAIHJlcXVpcmUgcHl0aG9uLXNj
b25zXyR7UFZ9LmJiDQogaW5oZXJpdCBuYXRpdmUNCiBERVBFTkRTID0gInB5dGhvbi1uYXRpdmUi
DQogUkRFUEVORFNfJHtQTn0gPSAiIg0KLVBSID0gInIxIg0KK1BSID0gInIyIg0KKw0KK1NSQ19V
UkkgKz0gImZpbGU6Ly9zY29ucy1jcm9zcy10b29sY2hhaW4ucGF0Y2giDQo=

--e89a8f234cd765d4a704b8b88acd--

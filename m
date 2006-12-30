Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H0g3w-0007TN-0b
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Dec 2006 16:23:56 +0100
Received: (qmail invoked by alias); 30 Dec 2006 15:23:09 -0000
Received: from c-134-233-96.f.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.233.96]
	by mail.gmx.net (mp040) with SMTP; 30 Dec 2006 16:23:09 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H0ftA-0002W7-00; Sat, 30 Dec 2006 16:12:48 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1163273077.4395.96.camel@ip6-localhost>
References: <1162936801.4808.78.camel@ip6-localhost>
	<1163273077.4395.96.camel@ip6-localhost>
Date: Sat, 30 Dec 2006 16:12:48 +0100
Message-Id: <1167491568.4160.16.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Sender: Patrick Ohly <patrick@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: cross-compiling for x86_64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Dec 2006 15:23:56 -0000
X-Groupsio-MsgNum: 1029
Content-Type: multipart/mixed; boundary="=-FpKnljncD0PXSpECtuc5"

--=-FpKnljncD0PXSpECtuc5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all,

I have had some time over the holidays to investigate this again and
have come up with patches that solves the problem for me. I'm attaching
them in the hope that someone else will find them useful and/or commit
them on dev.

Note that I have only patched the packages that were picked up by the
current "generic" distro - some of the changes will probably also need
to be done to other .bb files. I have also intentionally not updated any
PR variables to avoid conflicts.

On Sat, 2006-11-11 at 20:24 +0100, Patrick Ohly wrote:
> Here's a summary of the problems I had:
>       * glibc-initial-2.3.2+cvs20040726-r22: generic bits/wordsize.h and
>         bits/endian.h is used instead of the x86_64 ones

Failed differently for me now (something about NTPL requiring TLS), but
instead of investigating further I simply changed
gcc-cross-initial_4.1.1.bb to not depend on libc-initial. This is
already how it works for 'arm', 'armeb', 'mips', 'mipsel'.

If there is a particular reason why the initial libc should be needed
for x86_64, then I haven't noticed it.

>       * glibc-intermediate-2.5-r2: asm-x86_64 header files not found
>       * glibc-intermediate-2.5-r2: config-name.h not created by
>         configure although it is needed
>       * glibc-intermediate-2.5-r2: #error "__NR_pread and __NR_pread64
>         both defined???"

All caused by linux-libc-headers_2.6.18.bb not installing the
asm-i386/x86_64 directories which are referenced by the asm include
files depending on the current compiler flags. Along the same line
compiler.h also had to be installed explicitly because it was missing
otherwise.

Finally gcc-cross-initial_4.1.1.bb failed to stage the compiler shared
objects because the gcc make system insists on installing them in
<libdir>/../lib64 and the .bb file expects them in <libdir> (code came
from gcc-package-cross.inc).

With those changes I was able to compile the normal glibc and some other
packages. I have not tested whether any of these results actually run
anywhere, ATM my main goal is to just verify that compilation in 64 bit
mode works.

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/

--=-FpKnljncD0PXSpECtuc5
Content-Disposition: attachment; filename=gcc-cross-initial_4.1.1.bb.patch
Content-Type: text/x-patch; name=gcc-cross-initial_4.1.1.bb.patch; charset=ISO-8859-1
Content-Transfer-Encoding: base64

IyANCiMgb2xkX3JldmlzaW9uIFswODg1MmQzZWU5MjFlNWI1NGVmOTI0Mjg1Y2QwZWQxMjRjYjgz
ZTMxXQ0KIyANCiMgcGF0Y2ggInBhY2thZ2VzL2djYy9nY2MtY3Jvc3MtaW5pdGlhbF80LjEuMS5i
YiINCiMgIGZyb20gWzc4MjBjZDE2MDc4ZDQxY2ZjMWU2MWFmNWVjNDVmMWZiZTc4MzUxNTZdDQoj
ICAgIHRvIFsyNDZlMmQ2NzdmYmE2Njc5MTM4NDg5OTE1Y2I4NTcwNzkwYTg5NmNjXQ0KIyANCj09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KLS0tIHBhY2thZ2VzL2djYy9nY2MtY3Jvc3MtaW5pdGlhbF80LjEuMS5iYgk3ODIwY2QxNjA3
OGQ0MWNmYzFlNjFhZjVlYzQ1ZjFmYmU3ODM1MTU2DQorKysgcGFja2FnZXMvZ2NjL2djYy1jcm9z
cy1pbml0aWFsXzQuMS4xLmJiCTI0NmUyZDY3N2ZiYTY2NzkxMzg0ODk5MTVjYjg1NzA3OTBhODk2
Y2MNCkBAIC0xLDcgKzEsNyBAQCBERVBFTkRTID0gInZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWJp
bnV0DQogcmVxdWlyZSBnY2MtY3Jvc3NfJHtQVn0uYmINCiANCiBERVBFTkRTID0gInZpcnR1YWwv
JHtUQVJHRVRfUFJFRklYfWJpbnV0aWxzIg0KLURFUEVORFMgKz0gIiR7QFsndmlydHVhbC8ke1RB
UkdFVF9QUkVGSVh9bGliYy1pbml0aWFsJywnJ11bYmIuZGF0YS5nZXRWYXIoJ1RBUkdFVF9BUkNI
JywgZCwgMSkgaW4gWydhcm0nLCAnYXJtZWInLCAnbWlwcycsICdtaXBzZWwnXV19Ig0KK0RFUEVO
RFMgKz0gIiR7QFsndmlydHVhbC8ke1RBUkdFVF9QUkVGSVh9bGliYy1pbml0aWFsJywnJ11bYmIu
ZGF0YS5nZXRWYXIoJ1RBUkdFVF9BUkNIJywgZCwgMSkgaW4gWydhcm0nLCAnYXJtZWInLCAnbWlw
cycsICdtaXBzZWwnLCAneDg2XzY0J11dfSINCiBQUk9WSURFUyA9ICJ2aXJ0dWFsLyR7VEFSR0VU
X1BSRUZJWH1nY2MtaW5pdGlhbCINCiBQQUNLQUdFUyA9ICIiDQogDQo=

--=-FpKnljncD0PXSpECtuc5
Content-Disposition: attachment; filename=gcc-package-cross.inc.patch
Content-Type: text/x-patch; name=gcc-package-cross.inc.patch; charset=ISO-8859-1
Content-Transfer-Encoding: base64

IyANCiMgb2xkX3JldmlzaW9uIFswODg1MmQzZWU5MjFlNWI1NGVmOTI0Mjg1Y2QwZWQxMjRjYjgz
ZTMxXQ0KIyANCiMgcGF0Y2ggInBhY2thZ2VzL2djYy9nY2MtcGFja2FnZS1jcm9zcy5pbmMiDQoj
ICBmcm9tIFswMmNmMjVlNTg5ZWVmNzRhZDM0OTgxMjAyN2Q4MjM1MWE3Y2Y4ZWM5XQ0KIyAgICB0
byBbMmU1ZjA3Mzc3YTRkYjg4YTAzNWMzYTQ2ZTE2NjQ5ZTdjYjFhYWE5Yl0NCiMgDQo9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCi0t
LSBwYWNrYWdlcy9nY2MvZ2NjLXBhY2thZ2UtY3Jvc3MuaW5jCTAyY2YyNWU1ODllZWY3NGFkMzQ5
ODEyMDI3ZDgyMzUxYTdjZjhlYzkNCisrKyBwYWNrYWdlcy9nY2MvZ2NjLXBhY2thZ2UtY3Jvc3Mu
aW5jCTJlNWYwNzM3N2E0ZGI4OGEwMzVjM2E0NmUxNjY0OWU3Y2IxYWFhOWINCkBAIC00NywxOCAr
NDcsMTggQEAgZG9faW5zdGFsbCAoKSB7DQogCQk6DQogCWVsaWYgWyAtZiAke0R9JHtwcmVmaXh9
L2xpYi9saWJnY2Nfcy5zby4/IF07IHRoZW4NCiAJCW12IC1mICR7RH0ke3ByZWZpeH0vbGliL2xp
YmdjY19zLnNvKiAke0R9JHt0YXJnZXRfYmFzZV9saWJkaXJ9DQotCWVsc2UNCi0JCW12IC1mICR7
RH0ke3ByZWZpeH0vKi9saWIvbGliZ2NjX3Muc28qICR7RH0ke3RhcmdldF9iYXNlX2xpYmRpcn0N
CisgICAgICAgIGVsc2UNCisJCW12IC1mICR7RH0ke3ByZWZpeH0vKi9saWIqL2xpYmdjY19zLnNv
KiAke0R9JHt0YXJnZXRfYmFzZV9saWJkaXJ9DQogCWZpDQogDQogCSMgTW92ZSBsaWJzdGRjKysg
YW5kIGxpYmcyYyBpbnRvIGxpYmRpciAocmVzZXR0aW5nIG91ciBwcmVmaXggdG8gL3Vzcg0KIAlt
a2RpciAtcCAke0R9JHt0YXJnZXRfbGliZGlyfQ0KLQltdiAtZiAke0R9JHtwcmVmaXh9LyovbGli
L2xpYnN0ZGMrKy5zbyogJHtEfSR7dGFyZ2V0X2xpYmRpcn0NCisgICAgICBtdiAtZiAke0R9JHtw
cmVmaXh9LyovbGliKi9saWJzdGRjKysuc28qICR7RH0ke3RhcmdldF9saWJkaXJ9DQogCWlmIFsg
IiR7SEFTX0cyQ30iID0gInllcyIgXTsgdGhlbg0KLQkgIG12IC1mICR7RH0ke3ByZWZpeH0vKi9s
aWIvbGliZzJjLnNvKiAke0R9JHt0YXJnZXRfbGliZGlyfSB8fCB0cnVlDQorCSAgbXYgLWYgJHtE
fSR7cHJlZml4fS8qL2xpYiovbGliZzJjLnNvKiAke0R9JHt0YXJnZXRfbGliZGlyfSB8fCB0cnVl
DQogCWZpDQogCWlmIFsgIiR7SEFTX0dGT1JUUkFOfSIgPSAieWVzIiBdOyB0aGVuDQotCSAgbXYg
LWYgJHtEfSR7cHJlZml4fS8qL2xpYi9saWJnZm9ydHJhbiouc28qICR7RH0ke3RhcmdldF9saWJk
aXJ9DQorCSAgbXYgLWYgJHtEfSR7cHJlZml4fS8qL2xpYiovbGliZ2ZvcnRyYW4qLnNvKiAke0R9
JHt0YXJnZXRfbGliZGlyfQ0KIAlmaQ0KIA0KICAgICAgICAjIE1hbnVhbGx5IHJ1biB0aGUgdGFy
Z2V0IHN0cmlwcGVyIHNpbmNlIHdlIHdvbid0IGdldCBpdCBydW4gYnkNCg==

--=-FpKnljncD0PXSpECtuc5
Content-Disposition: attachment; filename=linux-libc-headers_2.6.18.bb.patch
Content-Type: text/x-patch; name=linux-libc-headers_2.6.18.bb.patch; charset=ISO-8859-1
Content-Transfer-Encoding: base64

IyANCiMgb2xkX3JldmlzaW9uIFswODg1MmQzZWU5MjFlNWI1NGVmOTI0Mjg1Y2QwZWQxMjRjYjgz
ZTMxXQ0KIyANCiMgcGF0Y2ggInBhY2thZ2VzL2xpbnV4LWxpYmMtaGVhZGVycy9saW51eC1saWJj
LWhlYWRlcnNfMi42LjE4LmJiIg0KIyAgZnJvbSBbMDM3ZGQwMTFlOTcwMTFmZWRjMjE2ZmRjZWFi
YTAwNzIwMWZhMTlkZF0NCiMgICAgdG8gWzRlM2FhYTRjODhiYzVmYzU5ZjExOWJmMWMxMDIzNzc0
NGU3ODAxZTBdDQojIA0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQotLS0gcGFja2FnZXMvbGludXgtbGliYy1oZWFkZXJzL2xpbnV4
LWxpYmMtaGVhZGVyc18yLjYuMTguYmIJMDM3ZGQwMTFlOTcwMTFmZWRjMjE2ZmRjZWFiYTAwNzIw
MWZhMTlkZA0KKysrIHBhY2thZ2VzL2xpbnV4LWxpYmMtaGVhZGVycy9saW51eC1saWJjLWhlYWRl
cnNfMi42LjE4LmJiCTRlM2FhYTRjODhiYzVmYzU5ZjExOWJmMWMxMDIzNzc0NGU3ODAxZTANCkBA
IC00Niw2ICs0NiwxMCBAQCBkb19pbnN0YWxsX2FwcGVuZF9hcm0oKSB7DQogCWNwIGluY2x1ZGUv
YXNtLWFybS9wcm9jaW5mby5oICR7RH0ke2luY2x1ZGVkaXJ9L2FzbQ0KIH0NCiANCitkb19pbnN0
YWxsX2FwcGVuZF94ODZfNjQoKSB7DQorICAgICAgICBjcCAtciBpbmNsdWRlL2FzbS14ODZfNjQg
aW5jbHVkZS9hc20taTM4NiAke0R9JHtpbmNsdWRlZGlyfS8NCit9DQorDQogU1RBR0VfVEVNUD0i
JHtXT1JLRElSfS90ZW1wLXN0YWdpbmciDQogDQogZG9fc3RhZ2UgKCkgew0KQEAgLTU2LDYgKzYw
LDkgQEAgZG9fc3RhZ2UgKCkgew0KIAlpZiBbICIke0FSQ0h9IiA9PSAiYXJtIiBdOyB0aGVuDQog
CQljcCBpbmNsdWRlL2FzbS1hcm0vcHJvY2luZm8uaCAke1NUQUdFX1RFTVB9JHtpbmNsdWRlZGly
fS9hc20NCiAJZmkNCisgICAgICAgIGlmIFsgIiR7QVJDSH0iID09ICJ4ODZfNjQiIF07IHRoZW4N
CisgICAgICAgICAgICAgICAgY3AgaW5jbHVkZS9saW51eC9jb21waWxlci5oICR7U1RBR0VfVEVN
UH0ke2luY2x1ZGVkaXJ9L2xpbnV4DQorICAgICAgICBmaQ0KIAlpbnN0YWxsIC1kICR7U1RBR0lO
R19JTkNESVJ9DQogCXJtIC1yZiAke1NUQUdJTkdfSU5DRElSfS9saW51eCAke1NUQUdJTkdfSU5D
RElSfS9hc20gJHtTVEFHSU5HX0lOQ0RJUn0vYXNtLWdlbmVyaWMNCiAJY3AgLXBmTFIgJHtTVEFH
RV9URU1QfSR7aW5jbHVkZWRpcn0vbGludXggJHtTVEFHSU5HX0lOQ0RJUn0vDQpAQCAtNjgsNCAr
NzUsMTEgQEAgZG9fc3RhZ2UgKCkgew0KIAljcCAtcGZMUiAke1NUQUdFX1RFTVB9JHtpbmNsdWRl
ZGlyfS9saW51eCAke0NST1NTX0RJUn0vJHtUQVJHRVRfU1lTfS9pbmNsdWRlLw0KIAljcCAtcGZM
UiAke1NUQUdFX1RFTVB9JHtpbmNsdWRlZGlyfS9hc20gJHtDUk9TU19ESVJ9LyR7VEFSR0VUX1NZ
U30vaW5jbHVkZS8NCiAJY3AgLXBmTFIgJHtTVEFHRV9URU1QfSR7aW5jbHVkZWRpcn0vYXNtLWdl
bmVyaWMgJHtDUk9TU19ESVJ9LyR7VEFSR0VUX1NZU30vaW5jbHVkZS8NCisgICAgICAgIGlmIFsg
IiR7QVJDSH0iID09ICJ4ODZfNjQiIF07IHRoZW4NCisgICAgICAgICAgICAgICAgY3AgLXBmTFIg
aW5jbHVkZS9hc20teDg2XzY0ICR7U1RBR0lOR19JTkNESVJ9DQorICAgICAgICAgICAgICAgIGNw
IC1wZmxSIGluY2x1ZGUvYXNtLWkzODYgJHtTVEFHSU5HX0lOQ0RJUn0NCisgICAgICAgICAgICAg
IAlybSAtcmYgJHtDUk9TU19ESVJ9LyR7VEFSR0VUX1NZU30vaW5jbHVkZS9hc20teDg2XzY0ICR7
Q1JPU1NfRElSfS8ke1RBUkdFVF9TWVN9L2luY2x1ZGUvYXNtLWkzODYNCisgICAgICAgICAgICAg
ICAgY3AgLXBmTFIgJHtTVEFHRV9URU1QfSR7aW5jbHVkZWRpcn0vYXNtLXg4Nl82NCAke0NST1NT
X0RJUn0vJHtUQVJHRVRfU1lTfS9pbmNsdWRlLw0KKyAgICAgICAgICAgICAgICBjcCAtcGZMUiAk
e1NUQUdFX1RFTVB9JHtpbmNsdWRlZGlyfS9hc20taTM4NiAke0NST1NTX0RJUn0vJHtUQVJHRVRf
U1lTfS9pbmNsdWRlLw0KKyAgICAgICAgZmkNCiB9DQo=

--=-FpKnljncD0PXSpECtuc5--

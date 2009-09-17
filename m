Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1MoPLn-0007Oh-3h
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Sep 2009 00:21:18 +0200
X-AuditID: 0a1e000a-b7ba8ae000000dd5-55-4ab2b6382f34
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: OE-Dev <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Sep 2009 18:20:07 -0400
Message-Id: <1253226007.1495.264.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: interest in binary packaging?
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
X-List-Received-Date: Thu, 17 Sep 2009 22:21:18 -0000
X-Groupsio-MsgNum: 13148
Content-Type: multipart/mixed; boundary="=-XYZjgH3lTFwpMCy0Uu2O"

--=-XYZjgH3lTFwpMCy0Uu2O
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've developed a rather simplistic method for managing "binary" packages
within OE in order to satisfy certain licensing requirements. I am not
sure whether other users would have an interest in such a system, but
I'll go ahead and pitch what I have working so far to see if there is
any interest in improving it further or merging upstream.

Problem: Some packages we maintain internally are proprietary, and we
need mechanisms for dealing with different licensing schemes.

Approach: Allow third parties to build images using the packages but
without seeing source.

Solution: binary_ipk.bbclass defines a type of package which simply
installs a prebuilt .ipk for use in an image. 

Also, for ease of deployment, I've added a flag to the standard
package_ipk.bbclass which will copy relevant packages into the WORKDIR
for a 'binreleasable' package.

The result is a developer with access to the code builds package FOO out
of the overlay and deploys the WORKDIR/binrelease .ipks onto a mirror.

Another developer without access to the code uses the FOO-bin recipe
which inherits the binary_ipk.bbclass. It pulls the ipk from the mirror
and tells OE about any runtime dependencies of the package.

A simple binary recipe looks like this (I'll just put it inline since
it's so short)

####################EXAMPLE FOO BINARY RECIPE
inherit binary_ipk

DESCRIPTION = "FOO"
HOMEPAGE = ""
LICENSE = "FOO License"
RPROVIDES += "foo"
RDEPENDS += "bar"
BIN_PR = "r21"

SRC_URI = "${FOO_MIRROR}/foo-bin/foo_${PV}-${BIN_PR}_
${PACKAGE_ARCH}.ipk"
############END EXAMPLE


Perhaps there is a smarter way to do this with ipkg feeds, but I saw no
clear route to get here using them.

Thoughts, comments, questions, patches, etc... are all welcomed.



--Chris Conroy






--=-XYZjgH3lTFwpMCy0Uu2O
Content-Disposition: attachment; filename="binary_packaging.patch"
Content-Type: text/x-patch; name="binary_packaging.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2NsYXNzZXMvYmluYXJ5X2lway5iYmNsYXNzIGIvY2xhc3Nlcy9iaW5hcnlf
aXBrLmJiY2xhc3MNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi44Y2IxZWIz
DQotLS0gL2Rldi9udWxsDQorKysgYi9jbGFzc2VzL2JpbmFyeV9pcGsuYmJjbGFzcw0KQEAgLTAs
MCArMSw1NiBAQA0KKyMjIyBBIGNsYXNzIGZvciBpbnN0YWxsaW5nIHByZWJ1aWx0IHBhY2thZ2Vz
DQorDQoraW5oZXJpdCBwYWNrYWdlX2lwaw0KKw0KK1BBQ0tBR0VTPSIke1BOfSINCisNCitkb19j
b25maWd1cmUoKSB7DQorICAgIDoNCit9DQorZG9fY29tcGlsZSgpIHsNCisgICAgOg0KK30NCitk
b19zdGFnZSgpIHsNCisgICAgOg0KK30NCitkb19pbnN0YWxsKCkgew0KKyAgICA6DQorfQ0KK2Rv
X3BvcHVsYXRlX3N0YWdpbmcoKSB7DQorICAgIDoNCit9DQorZG9faW5zdGFsbCgpIHsNCisgICAg
Og0KK30NCisNCitweXRob24gZG9fcGFja2FnZV9pcGsoKSB7DQorICAgIGltcG9ydCBzeXMsIGJi
LCBvcywgcmUsIGdsb2INCisNCisgICAgb3V0ZGlyID0gYmIuZGF0YS5nZXRWYXIoJ0RFUExPWV9E
SVJfSVBLJywgZCwgMSkNCisgICAgaWYgbm90IG91dGRpcjoNCisgICAgICAgIGJiLmVycm9yKCJE
RVBMT1lfRElSX0lQSyBub3QgZGVmaW5lZCwgdW5hYmxlIHRvIHBhY2thZ2UiKQ0KKyAgICAgICAg
cmV0dXJuDQorDQorICAgIHRtcGRpciA9IGJiLmRhdGEuZ2V0VmFyKCdUTVBESVInLCBkLCAxKQ0K
KyAgICBpZiBvcy5hY2Nlc3Mob3MucGF0aC5qb2luKHRtcGRpciwgInN0YW1wcyIsICJJUEtfUEFD
S0FHRV9JTkRFWF9DTEVBTiIpLCBvcy5SX09LKToNCisgICAgICAgIG9zLnVubGluayhvcy5wYXRo
LmpvaW4odG1wZGlyLCAic3RhbXBzIiwgIklQS19QQUNLQUdFX0lOREVYX0NMRUFOIikpDQorDQor
DQorICAgIHBhdGggPSBiYi5kYXRhLmdldFZhcignUEFUSCcsIGQsIDEpDQorICAgIHdvcmtkaXIg
PSBiYi5kYXRhLmdldFZhcignV09SS0RJUicsIGQsIDEpDQorICAgIHBhY2thZ2VzID0gZ2xvYi5n
bG9iKCIlcy8qLmlwayIgJSAod29ya2RpcikpDQorDQorICAgIGZvciBwa2cgaW4gcGFja2FnZXM6
DQorICAgICAgICBpcGtnUGlwZSA9IG9zLnBvcGVuKCJQQVRIPSVzIGlwa2ctbGlzdC1maWVsZHMg
JXMgfCBncmVwIFwiQXJjaGl0ZWN0dXJlXCIgfCBjdXQgLWQgXCcgXCcgLXNmMiIgJSAocGF0aCwg
cGtnKSkNCisgICAgICAgIGFyY2ggPSBpcGtnUGlwZS5yZWFkbGluZSgpDQorICAgICAgICBiYi5k
ZWJ1ZygxLCAiUEtHICVzLCBBUkNIICVzIiAlIChwa2csIGFyY2gpKQ0KKyAgICAgICAgaXBrZ1Bp
cGUuY2xvc2UoKQ0KKyAgICAgICAgaWYgYXJjaCA9PSAnJyBvciBhcmNoID09IE5vbmU6DQorICAg
ICAgICAgICAgYmIuZmF0YWwoIlVuYWJsZSB0byByZWFkIGFyY2hpdGVjdHVyZSBmcm9tICVzIiAl
IChwa2cpKQ0KKw0KKyAgICAgICAgcGtnb3V0ZGlyID0gIiVzLyVzIiAlIChvdXRkaXIsIGFyY2gp
DQorDQorICAgICAgICBiYi5ub3RlKCJJbnN0YWxsaW5nICVzIGludG8gJXMiICUgKHBrZywgcGtn
b3V0ZGlyKSkNCisgICAgICAgIG9zLnN5c3RlbSgiY3AgJXMgJXMiICUgKHBrZywgcGtnb3V0ZGly
KSkNCit9DQorDQpkaWZmIC0tZ2l0IGEvY2xhc3Nlcy9wYWNrYWdlX2lway5iYmNsYXNzIGIvY2xh
c3Nlcy9wYWNrYWdlX2lway5iYmNsYXNzDQppbmRleCBlNTU2MTA4Li44NTNkYTIxIDEwMDY0NA0K
LS0tIGEvY2xhc3Nlcy9wYWNrYWdlX2lway5iYmNsYXNzDQorKysgYi9jbGFzc2VzL3BhY2thZ2Vf
aXBrLmJiY2xhc3MNCkBAIC0zMDIsNiArMzAyLDIxIEBAIHB5dGhvbiBkb19wYWNrYWdlX2lwayAo
KSB7DQogCQkJYmIudXRpbHMudW5sb2NrZmlsZShsZikNCiAJCQlyYWlzZSBiYi5idWlsZC5GdW5j
RmFpbGVkKCJpcGtnLWJ1aWxkIGV4ZWN1dGlvbiBmYWlsZWQiKQ0KIA0KKwkJI2ZvciBiaW5hcnkg
cGFja2FnaW5nLCBhIHJlbGVhc2UgcGFja2FnZSB3aWxsIGFsc28gaW5zdGFsbCBpbnRvIGl0cyBX
T1JLRElSDQorCQliaW5yZWxlYXNlID0gYmIuZGF0YS5nZXRWYXIoIkJJTlJFTEVBU0UiLCBkLCAx
KQ0KKwkJaWYgYmlucmVsZWFzZSA9PSAnMSc6DQorCQkJYmluZGlyID0gIiVzL2JpbnJlbGVhc2Ui
ICUgKHdvcmtkaXIpDQorCQkJYmIubWtkaXJoaWVyKGJpbmRpcikNCisJCQlyZXQgPSBvcy5zeXN0
ZW0oIlBBVEg9XCIlc1wiICVzICVzICVzIiAlIChiYi5kYXRhLmdldFZhcigiUEFUSCIsIGxvY2Fs
ZGF0YSwgMSksIGJiLmRhdGEuZ2V0VmFyKCJJUEtHQlVJTERDTUQiLGQsMSksIHBrZywgYmluZGly
KSkNCisNCisJCQkjRG9uJ3QgYmlucmVsZWFzZSBkYmcvZGV2L2RvYyBwYWNrYWdlcw0KKwkJCXRv
ZGVsUGtncyA9IGdsb2IoIiVzLyotZGJnKi5pcGsiICUgKGJpbmRpcikpDQorCQkJdG9kZWxQa2dz
LmV4dGVuZChnbG9iKCIlcy8qLWRldiouaXBrIiAlIChiaW5kaXIpKSkNCisJCQl0b2RlbFBrZ3Mu
ZXh0ZW5kKGdsb2IoIiVzLyotZG9jKi5pcGsiICUgKGJpbmRpcikpKQ0KKwkJCWZvciB0b2RlbCBp
biB0b2RlbFBrZ3M6DQorCQkJCWJiLmRlYnVnKDEsICJVbmluc3RhbGxpbmcgJXMgZm9yIGJpbnJl
bGVhc2UiICUgKHRvZGVsKSkNCisJCQkJb3Muc3lzdGVtKCJybSAtZiAlcyIgJSAodG9kZWwpKQ0K
Kw0KIAkJYmIudXRpbHMucHJ1bmVkaXIoY29udHJvbGRpcikNCiAJCWJiLnV0aWxzLnVubG9ja2Zp
bGUobGYpDQogfQ0K

--=-XYZjgH3lTFwpMCy0Uu2O--

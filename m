Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <arkaitzj@gmail.com>) id 1HW87g-0002rA-V3
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2007 11:37:49 +0200
Received: by an-out-0708.google.com with SMTP id c5so2094890anc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2007 02:37:48 -0700 (PDT)
Received: by 10.100.112.19 with SMTP id k19mr5705646anc.1174988267388;
	Tue, 27 Mar 2007 02:37:47 -0700 (PDT)
Received: by 10.100.153.4 with HTTP; Tue, 27 Mar 2007 02:37:47 -0700 (PDT)
Message-ID: <7ceeaed30703270237u2affdaf5vdf579e5a769525cb@mail.gmail.com>
Date: Tue, 27 Mar 2007 11:37:47 +0200
From: Arkaitz <arkaitzj@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: A patch is needed for uclibc distros based on slugos
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
X-List-Received-Date: Tue, 27 Mar 2007 09:37:50 -0000
X-Groupsio-MsgNum: 1671
Content-Type: multipart/mixed; 
	boundary="----=_Part_2730_32938054.1174988267353"

------=_Part_2730_32938054.1174988267353
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
The rng-tools package, added to task-slugos.bb file some time ago,
broke the uclibc distros image compilation because uclibc lacks argp
support[1], and it is not supposed to have it.
It is marked also as not compilable with uclibc in
packages/meta/slugos-packages.bb.
This patch avoids rng-tools compilation for distros with TARGET_OS=linux-uclibc.
Am I wrong?
Thanks

[1]http://purl.rikers.org/%23uclibc/20050304.html.gz
-- 
Arkaitz

------=_Part_2730_32938054.1174988267353
Content-Type: application/octet-stream; name=rngtools.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ezs58tyj
Content-Disposition: attachment; filename="rngtools.patch"

LS0tIHBhY2thZ2VzL3Rhc2tzL3Rhc2stc2x1Z29zLmJiLm9yaWcJMjAwNy0wMy0yNyAxMToyNDoy
MS4wMDAwMDAwMDAgKzAyMDAKKysrIHBhY2thZ2VzL3Rhc2tzL3Rhc2stc2x1Z29zLmJiCTIwMDct
MDMtMjcgMTE6Mjk6MzguMDAwMDAwMDAwICswMjAwCkBAIC02OSw5ICs2OSwxMiBAQAogIgogCiAj
IEFkZCBkYWVtb24gcmVxdWlyZWQgZm9yIEhXIFJORyBzdXBwb3J0Ci1TTFVHT1NfU1RBTkRBUkRf
UlJFQ09NTUVORFMgKz0gIlwKK1NMVUdPU19STkdfVE9PTFNfUEFDS0FHRSA9ICJcCiBybmctdG9v
bHMgXAogIgorU0xVR09TX1JOR19UT09MU19QQUNLQUdFX2xpbnV4LXVjbGliYyA9ICIiCisKK1NM
VUdPU19TVEFOREFSRF9SUkVDT01NRU5EUyArPSAiJHtTTFVHT1NfUk5HX1RPT0xTX1BBQ0tBR0V9
IgogCiAjIEFkZCBtb2R1bGVzIHJlcXVpcmVkIGZvciB1c2Igc3VwcG9ydAogU0xVR09TX1NUQU5E
QVJEX1JSRUNPTU1FTkRTICs9ICJcCg==

------=_Part_2730_32938054.1174988267353--

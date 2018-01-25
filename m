Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id A47357827A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 03:48:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1516852103; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=vSe2bVnmYjXP2G8RPW3Ki7XJBUvhnpAxHkAeqUq9CDA=;
	b=GRw0oxPzQydrdobT2EkBZjLZw0hAQeOI5iT77QVbM7Ezm9lKTp5+5ruSLMUJ6HtWBsWTSZDI
	tOLkFAdWbou+2FFx+5yOfksDzoO+HM2yXBv1BZHothr9R4P0D2kB5goDpkeNp/5zoXhY3OMf
	W94iqRkqvyqVrFgrVIOO4zEckH4=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mxa.mailgun.org with ESMTP id 5a695387.7fb0e4a6a130-smtp-out-n02;
	Thu, 25 Jan 2018 03:48:23 -0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id s39so16030172qth.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 19:48:23 -0800 (PST)
X-Gm-Message-State: AKwxyteVNUJ5Uof6hFuedfnFIQe9kd9Gc3I6SreG8nN4RXd0cq0yUnTg
	NXEttEho2DeEA5DkI5Rcsd3rhk3PVo7/ZClJuc8=
X-Google-Smtp-Source: AH8x227h0uSNvV+fiHiB7KK5a88/d8XU+zDu6tCVgqKZycR8OccwPqkHWLTBuUeMmvN2tparf3lrXSXQDdtbqORsXOg=
X-Received: by 10.237.57.100 with SMTP id l91mr14736554qte.25.1516852103092;
	Wed, 24 Jan 2018 19:48:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.71 with HTTP; Wed, 24 Jan 2018 19:48:22 -0800 (PST)
Received: by 10.140.40.71 with HTTP; Wed, 24 Jan 2018 19:48:22 -0800 (PST)
In-Reply-To: <CADNbA1o5kkKtQYB2iEsUArp3ynADdvYkwHS1997NqEV+fuC6+A@mail.gmail.com>
References: <1516849201-27005-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
	<CADNbA1pOzv0Si-7EoAzCUkXET=qfuU8u9zaUhG6oToP4u7KTqQ@mail.gmail.com>
	<CADNbA1o5kkKtQYB2iEsUArp3ynADdvYkwHS1997NqEV+fuC6+A@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Wed, 24 Jan 2018 22:48:22 -0500
X-Gmail-Original-Message-ID: <CADNbA1osLqof7hmEAtz0uCpWrqZVNaJS_fQV+p5iSgc2MV0fJw@mail.gmail.com>
Message-ID: <CADNbA1osLqof7hmEAtz0uCpWrqZVNaJS_fQV+p5iSgc2MV0fJw@mail.gmail.com>
To: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: manjukum@xilinx.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH]] python-oauthlib_2.0.6.bb: Add python-oauthlib
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
X-List-Received-Date: Thu, 25 Jan 2018 03:48:22 -0000
Content-Type: text/plain; charset="UTF-8"

Any chance you can adapt it work on both python 2.7 and python3?

On Jan 24, 2018 10:34 PM, "Bhargava Sreekantappa Gayathri" <
bhargava.sreekantappa-gayathri@xilinx.com> wrote:

This patch adds python-oauthlib.

Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-
gayathri@xilinx.com>
---
 .../python/python-oauthlib_2.0.6.bb                | 27
++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/
python-oauthlib_2.0.6.bb

diff --git a/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
b/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
new file mode 100644
index 0000000..0bcb7b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
@@ -0,0 +1,27 @@
+SUMMARY = "A generic, spec-compliant, thorough implementation of the OAuth
request-signing logic"
+HOMEPAGE = "https://github.com/idan/oauthlib"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ba9ce41463615e082609806255bce1b"
+
+SRC_URI = "https://pypi.python.org/packages/a5/8a/
212e9b47fb54be109f3ff0684165bb38c51117f34e175c379fce5c7df754
/oauthlib-${PV}.tar.gz"
+SRC_URI[md5sum] = "277a9a966cc8c72e492b4eeb41332445"
+SRC_URI[sha256sum] = "ce57b501e906ff4f614e71c36a3ab9
eacbb96d35c24d1970d2539bbc3ec70ce1"
+
+S = "${WORKDIR}/oauthlib-${PV}"
+
+inherit setuptools
+
+# The following configs & dependencies are from setuptools extras_require.
+# These dependencies are optional, hence can be controlled via
PACKAGECONFIG.
+# The upstream names may not correspond exactly to bitbake package names.
+#
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?= "test signedtoken signals rsa"
+PACKAGECONFIG[test] = ",,,python-blinker python-cryptography python-nose
python-pyjwt"
+PACKAGECONFIG[signedtoken] = ",,,python-cryptography python-pyjwt"
+PACKAGECONFIG[signals] = ",,,python-blinker"
+PACKAGECONFIG[rsa] = ",,,python-cryptography"
+
+RDEPENDS_${PN} += "python-core python-crypt python-datetime python-json
python-lang python-logging python-math python-netclient python-re
python-unittest"
+
--
2.7.4

This email and any attachments are intended for the sole use of the named
recipient(s) and contain(s) confidential information that may be
proprietary, privileged or copyrighted under applicable law. If you are not
the intended recipient, do not read, copy, or forward this email message or
any attachments. Delete this email message and any attachments immediately.
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


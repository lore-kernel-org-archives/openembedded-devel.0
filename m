Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OayZg-000087-J4
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 00:12:37 +0200
Received: by gwj22 with SMTP id 22so2427040gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 15:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=yVFYtMqTmT4Of7O/fsHbFy/osfhLFYGz/2cHJHYekOI=;
	b=dTCEudvxiv93i5kLfFFES0GNcwENKII5cRyo3Ex93BhDs/qeL7iY0sZTg5hokX/+R9
	tyut0uKR5yrKElcE7xqQ7DUSt0Yun2QSdhOgEGLbB9aiCUgThdJg2HxjM/8WIYRhlSwm
	QpPVRtEMNboyr1nAlZ+2xkyjvhf30m2xBn7Is=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=f/Sv1YuO5pdG1lN/cG1rIa54cuGyedyc/shwcJFP3yeS12abWM7ZjgJWPEd55IFJFd
	bTQHzCa5P5fIe2v+XAQ/rV6LWy6QtM+Uo7lQdwUMIBRKRQw5W41fk1Vp6mxUtzwytc17
	/7XUSLafxtlQesi5V8qJVhlytNGyozwzHkzmc=
MIME-Version: 1.0
Received: by 10.100.54.19 with SMTP id c19mr5608292ana.71.1279577546232; Mon, 
	19 Jul 2010 15:12:26 -0700 (PDT)
Received: by 10.100.42.4 with HTTP; Mon, 19 Jul 2010 15:12:26 -0700 (PDT)
Date: Mon, 19 Jul 2010 15:12:26 -0700
Message-ID: <AANLkTimlxdwUxIog99H_Er_QL-tzZ5Ntd9kTyT8BcG-Y@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: GPSBABLE -- fixed recipe
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
X-List-Received-Date: Mon, 19 Jul 2010 22:12:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

It had bad checksums here is the fixed file, hope this helps


SECTION = "console/utils"
DESCRIPTION = "GPS data converter"
DEPENDS = "expat virtual/libusb0"
HOMEPAGE = "http://www.gpsbabel.org/"
LICENSE = "GPL"

SRC_URI = "http://www.gpsbabel.org/plan9.php?dl=gpsbabel-${PV}.tar.gz \
           file://autotools.patch"

inherit autotools pkgconfig

SRC_URI[md5sum] = "d41d8cd98f00b204e9800998ecf8427e"
SRC_URI[sha256sum] =
"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"



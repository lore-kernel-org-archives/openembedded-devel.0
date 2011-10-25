Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <itodroid@gmail.com>) id 1RImhE-0000t5-K7
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Oct 2011 21:30:01 +0200
Received: by qam2 with SMTP id 2so759741qam.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2011 12:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:x-mailer:thread-index:content-language;
	bh=5t2sYgnbXSbVGL4GtlNUDCmI1POITPiN8hn3V6FbtaM=;
	b=BPfD8CHCx/g1a6FrCIS28AUMT3cFrvS2jXZAiBVUDYBGB/fZqxTNbDli1jRTjZfFbw
	TebwZrt4dzJ1fCPWfg6ZOd5D5oCNKWxh17X6K8t4CL5wGRYFwfp2JGZB1l9WKN4zmCnu
	z128A5bigym/8E3YmXYuWEbM9EICcmVknr/Q4=
Received: by 10.68.26.69 with SMTP id j5mr58454665pbg.110.1319570640983;
	Tue, 25 Oct 2011 12:24:00 -0700 (PDT)
Received: from AZPCMATTWALTER (wsip-174-78-94-230.ph.ph.cox.net.
	[174.78.94.230])
	by mx.google.com with ESMTPS id x7sm9394573pbf.5.2011.10.25.12.23.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Oct 2011 12:23:59 -0700 (PDT)
From: "itodroid" <itodroid@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Oct 2011 12:23:56 -0700
Message-ID: <01b901cc934b$a5a00620$f0e01260$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AcyTSv8DtpUTjkBeTFuK3ULqBAm2wQ==
Subject: Creating an ejre receipe
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
X-List-Received-Date: Tue, 25 Oct 2011 19:30:01 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Greetings all.  I'm not sure of the frequency of posting to this list, but I
thought I would ask all of you a question regarding creating a recipe for
Oracle/Sun's embedded JRE.  I can't seem to figure out the syntax needed to
create an appropriate recipe for automatically including the ejre in my
image.

Everytime I try to bitbake, my deployment packet (ipk) is < 1000 bytes.  In
other words, I think its empty.  The recipe should simply untar the .tar.gz
file and put it into a format that can be distributed into the sysroot (I'm
picking /usr/java for its destination).  I'd appreciate any
feedback/comments/fixes to the following:

DESCRIPTION = "Oracle/Sun Embedded JRE"
PV = "1.6.0"
PR = "27"
SRC_URI =
"file://ejre-1_6_0_27-fcs-b07-linux-arm-vfp-eabi-headless-18_jul_2011.tar.gz
"

S = "${WORKDIR}"

SRC_URI[md5sum]="b30175c5168e1df394bc79474583f2a3"
SRC_URI[sha256sum]="d8b02bd16c95435d9c460cea060bc10b6eda00a2e8864d6412074903
dd73243c"

do_compile() {
}

do_install() {
  install -d ${D}/usr/java
  cp -R ${S}/ejre${PV}_${PR}/* ${D}/usr/java
}

do_qa_staging() {
}

do_package_qa() {
}

FILES_${PN} = " \
  ${D}/usr/java/* \
"

PACKAGE = ${PN}




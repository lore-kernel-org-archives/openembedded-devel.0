Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OrEap-00068e-8e
	for Openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 20:33:00 +0200
Received: by iwn2 with SMTP id 2so703408iwn.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=YL+xKttVsnJeI/jh5u8UYul7j6Ih7vpgAKMtdB3SFdg=;
	b=aYl+4POBv2AS+FXw9HDOkYF6cizdsXkm63NIB7mbjOd4qlE9Q1YWDL1swBRhft+E/D
	C3q9BrZvyKtadbqdMv5vAqQRCONH7kH1vL8Z3SKXFPfat14W8HwfDFc4jA3RckyXICv6
	9SAQC3WAXyry9QRmS3Am47f3ytUwD0D6cH28M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=ZVb9tdd8LAlSpYeaRjZTtzJoJHYS28jGnE15yA9ldzk+gtzdCzNgTK3Sp14b69WHxs
	i4+H+Lze92aZpeYLOpu5wbR8zUyDWv5q7UPiZ5KnkRYceyQ3NJk03sU4n7MN+Qkw58it
	AK2FSDdHHrWhx/VqmlWxDbRJW1f6Itl6AQgwA=
Received: by 10.231.36.134 with SMTP id t6mr11168743ibd.128.1283452345159;
	Thu, 02 Sep 2010 11:32:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Thu, 2 Sep 2010 11:32:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Sep 2010 11:32:05 -0700
Message-ID: <AANLkTik8+=mYOhnbv=R=-LJN81eHhTJd5Nh-dOdoEy0K@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: build errors bitbaking gnumail_1.1.2.bb
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
X-List-Received-Date: Thu, 02 Sep 2010 18:33:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

When I bitbake above recipe for qemuarm/minimal it ends up with this error

| checking for a BSD-compatible install...
/scratch/oe/sysroots/x86_64-linux/usr/bin/install -c
| checking whether build environment is sane... yes
| checking for arm-oe-linux-gnueabi-strip... arm-oe-linux-gnueabi-strip
| checking for a thread-safe mkdir -p...
/scratch/oe/sysroots/x86_64-linux/usr/bin/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking if /scratch/oe/sysroots/x86_64-linux/usr/bin/javac works... yes
| checking for fastjar... fastjar
| checking for /scratch/oe/sysroots/java/activation.jar... yes
| checking for /scratch/oe/sysroots/java/inetlib.jar... configure:
error: can't find inetlib.jar in specified path


This jar file is actually staged in

./x86_64-linux/usr/share/java/inetlib.jar
./armv5te-oe-linux-gnueabi/usr/share/java/inetlib.jar


for native and target in my sysroot but then I looked into
/scratch/oe/sysroots/java/
and indeed it has some .jar there but not the one its looking for and
recipe specifically
asks to look into this location via

 EXTRA_OECONF = "\
  --with-inetlib-jar=${STAGING_DATADIR_JAVA} \
  --with-activation-jar=${STAGING_DATADIR_JAVA} \
  "


As Andy also found out that

we have

native.bbclass:
STAGING_DIR_JAVA = "${STAGING_DATADIR_JAVA_NATIVE}"

java.bbclass:
STAGING_DATADIR_JAVA ?= ${STAGING_DIR_JAVA}
STAGING_DATADIR_JAVA_NATIVE ?= ${STAGING_DATADIR_NATIVE}/java

Who sets what here ?

Thanks for your help

-Khem



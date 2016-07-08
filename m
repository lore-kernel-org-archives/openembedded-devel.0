Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5ECE860119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 11:24:13 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id f30so43041800ioj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 04:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:organization:mime-version
	:content-transfer-encoding;
	bh=cdqWD4BgBQyn/UViOOLaXSL25lWpi9+lTgltmLRg3vg=;
	b=fbHTQk2FxNXAjB0S0fO2gyI/qULnfLGdrIL+0QbxHVmlkW4SDLLr2L1kjuBH3zcHMN
	ZGQPqeVz/s81ebQrOaa2L+RGvVPptep+qv0l0Oqk+rv5/v/6E5rRQ+TzRF0xmTsr9Z+R
	SxK5x928JyO1ce5u0XCPUnTpYUjo5TNIRzLWbBDaR3COFBFlY0plMddM5hNWb6ExvZmw
	o7pfi2lTtQA7DDA0zEsWjYZS8cWs7SkFqkfptcDexaUKUnv/yo7Ziz7OuCded2jCDlIK
	NDcpHJ3TvaoXglWIN//KuGMPvLTF85MRdQjt9/OoLsCBNTJTlOOCG52qD9P7ijddzM6m
	zglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:mime-version:content-transfer-encoding;
	bh=cdqWD4BgBQyn/UViOOLaXSL25lWpi9+lTgltmLRg3vg=;
	b=h1tIji24tcZ3z8hDJ+zZDejK7iN5ZeyuqdX08uHtOIn2vzlRBD43cR3I5qe/3eVQ8e
	I+kQ6L+peBwCsVWRZ0C/SD0RzPxNh6TpsGLapyGmmd1CL5HqKtFFWnTsMqpYnNfBPYud
	hx7CgDFuWvz9iXqWJw6KbaqIgT3TRLvv65lGDGDx0s9y8vAbxR2/W05KFPAv3L+bWilJ
	CY5dOELCUmUfznIJ1ka9ioLU+jdqcmf+QYH7cIuTGe6IYe4HZHnIEwRFr1qpQA/svPPi
	vFr+S/14Kf7gfWj6NyqpUl/2owTvEs8RxqrZ5DLc06PJQcMHIh9NWb7lmjcFKCLcOENr
	OofQ==
X-Gm-Message-State: ALyK8tK6iWZA7I9gRPHUfbYOHMlFCmDF2tUVKA1huhoel3jXFoPA3fw8fW/Ms0VlK0FP/QNh
X-Received: by 10.107.129.164 with SMTP id l36mr7685533ioi.179.1467977054244; 
	Fri, 08 Jul 2016 04:24:14 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C814.dip0.t-ipconnect.de. [93.232.200.20])
	by smtp.gmail.com with ESMTPSA id
	r78sm1149821ioe.15.2016.07.08.04.24.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jul 2016 04:24:13 -0700 (PDT)
Message-ID: <1467977051.1401.9.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 08 Jul 2016 13:24:11 +0200
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: [meta-java] icedtea7-native - IOException constructor compile error
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
X-List-Received-Date: Fri, 08 Jul 2016 11:24:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

I'm trying to build openjdk8, using the master branches of OE and
meta-java. Distro is Ostro, which configures:

PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
PREFERRED_PROVIDER_virtual/java-native = "cacao-native"
PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"

In this configuration, cacao-initial-native ecj-initial-native
classpath-native ecj-bootstrap-native jikes-initial-native get build
before icedtea7-native fails to compile with:

        build-bootstrap-javac:
            [javac] Compiling 1 source file to /fast/build/ostro/x86/tmp-glibc/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/langtools/build/bootstrap/classes
            [javac] ----------
            [javac] 1. ERROR in /fast/build/ostro/x86/tmp-glibc/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/langtools/src/share/classes/com/sun/tools/javac/file/ZipFileIndex.java (at line 1169)
            [javac]     super(message, cause);
            [javac]     ^^^^^^^^^^^^^^^^^^^^^^
            [javac] The constructor IOException(String, Throwable) is undefined
            [javac] ----------
            [javac] 1 problem (1 error)
        
        BUILD FAILED
        /fast/build/ostro/x86/tmp-glibc/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/langtools/make/build.xml:446: The following error occurred while executing this line:
        /fast/build/ostro/x86/tmp-glibc/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/langtools/make/build.xml:789: Compile failed; see the compiler error output for details.
        
        Total time: 2 seconds
        Makefile:201: recipe for target 'build' failed

Sure enough, classpath_0.99 only has IOException with a constructor that
takes a single parameter
(classpath-native/0.99-r6.0/classpath-0.99/java/io/IOException.java):

        public class IOException extends Exception
        {
          /**
           * Compatible with JDK 1.0+.
           */
          private static final long serialVersionUID = 7818375828146090155L;
        
          /**
           * Create an exception without a descriptive error message.
           */
          public IOException()
          {
          }
        
          /**
           * Create an exception with a descriptive error message.
           *
           * @param message the descriptive error message
           */
          public IOException(String message)
          {
            super(message);
          }
        } // class IOException
        
        

The code which doesn't compile is
icedtea-2.1.3/build/openjdk-boot/langtools/src/share/classes/com/sun/tools/javac/file/ZipFileIndex.java:

    static final class ZipFormatException extends IOException {
        private static final long serialVersionUID = 8000196834066748623L;
        protected ZipFormatException(String message) {
            super(message);
        }

        protected ZipFormatException(String message, Throwable cause) {
            super(message, cause);
        }
    }

So I'm not surprised that it fails; this can't work. The questions are:
what combination does work, and when did the combination above stop
working?

[please reply also directly, I'm not receiving list emails]

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.





Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JV8zI-0003ge-GB
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Feb 2008 18:25:42 +0100
Received: by an-out-0708.google.com with SMTP id b33so983478ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Feb 2008 09:24:39 -0800 (PST)
Received: by 10.100.138.4 with SMTP id l4mr19929949and.91.1204305879191;
	Fri, 29 Feb 2008 09:24:39 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Fri, 29 Feb 2008 09:24:39 -0800 (PST)
Message-ID: <c384c5ea0802290924i636e65dey9b6bfdceda20d17f@mail.gmail.com>
Date: Fri, 29 Feb 2008 18:24:39 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1204303564.8126.38.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1204303564.8126.38.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 209.85.132.248
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
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
X-List-Received-Date: Fri, 29 Feb 2008 17:25:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard,

excellent work and plan of attack.

The patch looks quite sane to me (although I'm not familiar with all
the pesky little details), and found one thing that I couldn't grasp:

+++ classes/sdk.bbclass 3d79f34a1ba3589e0d005c39cdaa6758bf8507f4
@@ -6,15 +6,15 @@ HOST_ARCH = "${BUILD_ARCH}"
 PACKAGE_ARCH = "${BUILD_ARCH}-${OLD_PACKAGE_ARCH}-sdk"

 HOST_ARCH = "${BUILD_ARCH}"
-HOST_VENDOR = "${BUILD_VENDOR}"
+HOST_VENDOR = "${TARGET_VENDOR}"

Could you explain why this must be TARGET_VENDOR instead of BUILD_VENDOR?

Thanks, regards,

-- 
Leon 'likewise'



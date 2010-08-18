Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Olm38-0003E0-V0
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 19:03:39 +0200
Received: by yws5 with SMTP id 5so322833yws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=iPGLQS6rw+EKkBNT0uWRjAnkWgE3PnV/XFTgr+xtEo8=;
	b=NiTskJ89rzCxrlVLVg+Rb5B/i+NvYAX5zFvy82wm+ZfwQpr0cE0Q4NJ1aPeMeNUnh9
	twyv87FHxXj5RKZqRNIAOy0A6A4/WUs/Mi51O06pPrd5F80Awdtq/I+hGFlnUJZlatli
	M79Gb79YmAdizv1uSnxTlNEAhKqxim964sSic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=bFyrK98BIyBdY2FzYCTKfpy6kpirNNw7Hk4mQS1/UQcubSwrWve3P4lr0yTHg7vpmZ
	v47OlXJw3BWSdxtJdS/CkHB+s7GNE9zcJ30MCjA2uOHOLtcCqq7QUme3w9i/3g2DQx3/
	6P8lDLabpetCul3lqA4F5UeosFs0JnuQ5fJdU=
MIME-Version: 1.0
Received: by 10.100.47.8 with SMTP id u8mr9574695anu.246.1282150998174; Wed,
	18 Aug 2010 10:03:18 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Wed, 18 Aug 2010 10:03:17 -0700 (PDT)
Date: Wed, 18 Aug 2010 19:03:17 +0200
Message-ID: <AANLkTikDziMxB-MXW=i0UR9b2tP87sRe=+jz8Ly6OyVN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: cmake-native and packaged staging error
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
X-List-Received-Date: Wed, 18 Aug 2010 17:03:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

When restoring cmake-native from packaged staging I got this error on
a package that used it (boost):

CMake Error: Could not find CMAKE_ROOT !!!
CMake has most likely not been installed correctly.
Modules directory not found in
/home/frans/oe/tmp_angstrom/sysroots/i686-linux/usr/bin
CMake Error: Error executing cmake::LoadCache(). Aborting.

Guess there is something wrong in the package. I've saved the pstage
package, so if info from it is needed let me know.

Frans



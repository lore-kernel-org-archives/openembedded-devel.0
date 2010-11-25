Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PLXZj-0005yC-RN
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 09:53:08 +0100
Received: by iwn7 with SMTP id 7so824468iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 00:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=sQJiy4I58P2qqxgbmhTl23wJe8gqwnGHgfwqybSag6Y=;
	b=Z1rmKrtNedyEvQA6/yJ+1vUnGFymS6PvykdA2tv4CZB7tTLl/XF3nWyc/fEkOVJWoB
	sxRzu4yNi/GQWxGwkB9yjixmS46dvLlQo0u+Owrz8KKTqfZ8H8aMpM6Q3WpE7YhRnfDi
	d2CPzKGLXkKJPTsMDA3SPwreMcorWJklqHL+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ks1eRl0FZnldMGufSqH15nPwP021ThlPKH5jGpfnFXxi/zoK8N32000BAYVG/et0U/
	L3G0Z0FsvwMuF01ilB7N7kPTsYVsDOsqHm6ipsFZUR4kWDsVx677TFCHcA9ZZGGX87HM
	Xnc/q6j81K9mpMVrIrbQfe/jlmXLicFT/l48A=
MIME-Version: 1.0
Received: by 10.231.37.197 with SMTP id y5mr336103ibd.151.1290675114085; Thu,
	25 Nov 2010 00:51:54 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Thu, 25 Nov 2010 00:51:54 -0800 (PST)
Date: Thu, 25 Nov 2010 09:51:54 +0100
Message-ID: <AANLkTinx62xyZaZyfa_m2M7MwJX8qQO9C3Zi92WnV6nf@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [release-2010.12] minimal: multiple providers
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
X-List-Received-Date: Thu, 25 Nov 2010 08:53:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I'm still getting multiple providers messages on the release branch:

Build Configuration:
BB_VERSION        = "1.10.0"
METADATA_BRANCH   = "release-2010.12"
METADATA_REVISION = "ee4389e"
TARGET_ARCH       = "powerpc"
TARGET_OS         = "linux-gnuspe"
MACHINE           = "calamari"
DISTRO            = "minimal"
DISTRO_VERSION    = "dev-snapshot-20101124"

NOTE: oestats: build 106072
NOTE: Resolving any missing task queue dependencies
NOTE: preferred version git of u-boot not available (for item u-boot)
ERROR: Multiple .bb files are due to be built which each provide
bluez-libs (/home/hudson/jobs/OE_test/workspace/openembedded/recipes/bluez/bluez4_4.42.bb
/home/hudson/jobs/OE_test/workspace/openembedded/recipes/bluez/bluez-libs_3.36.bb).
 This usually means one provides something the other doesn't and should.
NOTE: Preparing runqueue

For james-image I also get:
NOTE: multiple providers are available for libmodule-build-perl-native
(libmodule-build-perl-native, perl-native);
NOTE: consider defining PREFERRED_PROVIDER_libmodule-build-perl-native
This is because I use perl 5.10 which has this provided,
libmodule-builld-perl is still there for 5.8

Btw the multiple providers for depmod seems gone.

Frans



Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OkD4M-0007jL-5N
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 11:30:27 +0200
Received: by fxm6 with SMTP id 6so2316633fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 02:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=Xed/oqV2WZFbWwUpFKfwNzJb1danLmabnTdd4ID/jTg=;
	b=PYQOHQqVIVj+zLhAvjFeB3fP37f0X4ghbLsYDVLq6us+5ApgaYE+MsHRJGObKNBtDs
	b1TKQNY17LuvBcKvp4C6M32WtGIiOAv2aLceP94LqP3le5IRoaHweLJAfc7qSzO9EG+D
	bku+8SbF7qaFOQmB1zdb2uO+0C9FUdCutN0Lc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=hi2y3nN+rdKXS1gCkhL+Up0C2d4+JsaTzW4eCgkwn1TQeSLVKp7zUfnggSAqQYPdaF
	wyiXQSp/nTy2hIfzkDtUVKALPuEBhbundxGkf2HAOgQReqcdiJSXoDSRZyk0tlFHV+35
	8GXV4SfwrprkFwPjiz8fTAGHxa0VlvJOPKuH8=
Received: by 10.223.110.67 with SMTP id m3mr3061353fap.24.1281778208237; Sat,
	14 Aug 2010 02:30:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Sat, 14 Aug 2010 02:29:48 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Sat, 14 Aug 2010 03:29:48 -0600
Message-ID: <AANLkTimR-8k8h_FAtt3KaNM1fe_FAMu2wZdmbRu2Un=z@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: need help with do_install for v8 bitbake recipe
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
X-List-Received-Date: Sat, 14 Aug 2010 09:30:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've created a recipe for v8 and the do_compile() works.
http://fastr.github.com/articles/v8-on-OpenEmbedded.html

I'm still not very familiar with bitbake and I'd like to know what I need to
do with
do_install() and do_stage() so that the library is available to other
packages when
I add DEPENDS += "libv8".

The only file is libv8.a in the builddir.

Specifically I'm trying to build nodejs with v8 as a shared library, because
I can't get
the v8 that comes with it to cross-compile.

AJ ONeal


Return-Path: <otavio.salvador@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id C3E2073D17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 22:08:17 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so120276452wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 15:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent:mime-version
	:content-type; bh=GT+TuPpxuIzOo0aVJIQvbphumxuvSuT94x07gJ3s0Zc=;
	b=pdTvyNJjt3EhZfFwjvUeqo8/2atNctjepbYBy2gkIMXGNFC1AMeID9VvWOGQ+qJhcf
	+4udJaVcSP8QJu5XuAD3jxUjPbbgwlCW1oluxe7RQbiGqXMxsOu6kltpqnMT2sRoZa6f
	oBT/qGF056/jL/T2mUkcRqhle5dY688JBK8728RSgHNxvnEoZk/bZoVaUPg1T3BvoETu
	r/qMj3hg0GfMR8aFYMnxxn3ZAUDfwuQlVyJsD5Ec/YxYTwozgpRjLVyFdwe3MXoE6Sj4
	L8dikhIxsuMZI9jVfwoTrHrWKW8nxZIfGzsdxChibGlXC6J83x6siUtY7MVfd0r0zlEj
	W3ng==
X-Received: by 10.180.215.8 with SMTP id oe8mr21342525wic.0.1439935697704;
	Tue, 18 Aug 2015 15:08:17 -0700 (PDT)
Received: from localhost (83-244-151-247.cust-83.exponential-e.net.
	[83.244.151.247]) by smtp.gmail.com with ESMTPSA id
	kb1sm28214663wjc.24.2015.08.18.15.08.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 15:08:16 -0700 (PDT)
Message-ID: <55d3acd0.a1c9c20a.bf784.46d7@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Tue, 18 Aug 2015 19:08:13 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Tue, 18 Aug 2015 19:08:13 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.4
MIME-Version: 1.0
Subject: Updates to meta-browser (master) in 2015-08-18
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Aug 2015 22:08:21 -0000
Content-Type: text/plain; charset=US-ASCII

Hello,

I pushed following updates:

commit ca96f4326345dcd779fc539877a04f069f431749 (HEAD -> master, origin/master, origin/HEAD)
Author: Max Krummenacher <max.krummenacher@toradex.com>
Date:   Sun Aug 16 21:40:23 2015 +0200

    firefox-l10n: Update all languages for 10.0.12esr release
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 93a70a63c8f45a4f2a04a74f6efb355e9b56d6b1
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sun Aug 16 21:40:22 2015 +0200

    firefox: Update to 10.0.12esr
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit f74c807017e8e63de0ab5485731eaf5c69af0ce8
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sun Aug 16 21:40:21 2015 +0200

    mozilla.bbclass: do out of tree build
    
    Do a out of tree build by setting MOZ_OBJDIR to something != ${S}.
    Newer firefox do no longer allow do build in tree.
    
    Change firefox_10.0.11esr.bb accordingly.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 0b1fcf45ebe30d5ced856ae9ba1d109dc614188f
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sun Aug 16 21:40:20 2015 +0200

    firefox: stop using variable for local files
    
    Local file names are constant, so don't use ${PN} and friends to
    construct them.
    Fixes SRC_URI fetching a file with ${BPN} while installing it with ${PN}.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 6c3b2568f9eaa8eca4a578089767297b84efc99f
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sun Aug 16 21:40:19 2015 +0200

    firefox: prevent SIGILL crash #2 with arm build
    
    Firefox built with oe-core, daisy, crashes with a SIGILL signal during startup.
    No window is drawn, crash starts somewere in js/src/methodjit/MethodJIT.cpp
    JaegerCompartment::Initialize()
    The patch from https://bugzilla.mozilla.org/show_bug.cgi?id=803601#c28
    fixes this.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 22f24693bc4302f31a7fcc237502f21f64eb828d
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sun Aug 16 21:40:18 2015 +0200

    firefox: prevent SIGILL crash with arm build
    
    Firefox crashes with a SIGILL signal during startup.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit c1d61e5bdc64a14a2afe4ed17dbfdb38af2a055a
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sun Aug 16 21:40:17 2015 +0200

    firefox-l10n: Update download server
    
    The ftp mirror currently seems not to work, change to the download server
    recommended here:
    https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Source_Code/Downloading_Source_Archives
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 90c89997386866bd5ffbbe78467cd23f39d3b901
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sun Aug 16 21:40:16 2015 +0200

    firefox: Update download server
    
    The ftp mirror currently seems not to work, change to the download server
    recommended here:
    https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Source_Code/Downloading_Source_Archives
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 0037aa10c039247fbf6acbd2f2c6c0d7fb7c8e42
Author: Julien Brianceau \(jbriance\) <jbriance@cisco.com>
Date:   Wed Aug 12 12:07:30 2015 +0000

    chromium, cef: Set BB_NUMBER_THREADS jobs for ninja
    
    Do not let ninja choose the number of jobs to run in parallel.
    
    Signed-off-by: Julien Brianceau <jbriance@cisco.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit de309ddf8fe10ce4145893b066a289e97c3bd5d4
Author: Andre McCurdy <armccurdy@gmail.com>
Date:   Tue Jul 7 12:45:07 2015 -0700

    cef3: use x86 over-ride instead of i586
    
    Support i686 without needing to duplicate the i586 over-ride.
    
    Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit ffdea8ad515a126eda311776547a5d403b12ed3b
Author: Andre McCurdy <armccurdy@gmail.com>
Date:   Tue Jul 7 12:45:06 2015 -0700

    chromium.inc: use x86 over-ride instead of i586
    
    Support i686 without needing to duplicate the i586 over-ride.
    
    Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


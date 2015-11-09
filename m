Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id B320A766B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 10:49:51 +0000 (UTC)
Received: by qgec40 with SMTP id c40so78681459qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2015 02:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=lrBGuf8jr9bhwIGEVQqodzlAj+n2VAweKANfFkYbbNY=;
	b=Ds5h/JolttlegNjLdK7Tl1dMaFcq228ZY4V6MNwsXKiBWgq48tYDJ2QNLO+wPm07o2
	TteRjKZdvcqzJwN7BZSrjo0wDySYvDLazan1lBz69ofXK0EYtnEQ5C2JUzPQd4zuDjT+
	ANH8uMu6uv5yjQcBGRMiOM11+C8OYaxGUEHykjyytozvS2rbRg8sLfbruS1AEjv5jHb0
	fFpFmALpeVZa6bjxzJErorIWbRjk9Jc1/BfZSMJ59tm60l7lXKnPn7Wfv1AMfBsjXB31
	pEZP4NCOl5u0DUiA2L2W2p1ekeSMnG8d6l3HBaWxJZgfrH1DY6s88gi8l5G9gYcnaut7
	qfyQ==
X-Received: by 10.140.130.200 with SMTP id 191mr30837322qhc.32.1447066191291; 
	Mon, 09 Nov 2015 02:49:51 -0800 (PST)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	b108sm4607490qgf.20.2015.11.09.02.49.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 02:49:50 -0800 (PST)
Message-ID: <56407a4e.75698c0a.d8a77.525f@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Mon, 09 Nov 2015 08:49:46 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Mon, 09 Nov 2015 08:49:46 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-browser (master) in 2015-11-09
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
X-List-Received-Date: Mon, 09 Nov 2015 10:49:51 -0000

Hello,

I pushed following updates:

commit 7887e66d5df998b91d4df24a150c32a692784451 (HEAD -> pending, origin/master, origin/HEAD)
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sat Nov 7 13:20:29 2015 +0100

    cef3: fix build with gcc 4.9.4
    
    During the final link we get errors like this:
    .../4.9.4/ld: warning: hidden symbol 'sqlite3_temp_directory' in obj/.../sqlite.sqlite3.o) is referenced by DSO .../usr/lib/libsoftokn3.so
    .../4.9.4/ld: error: treating warnings as errors
    collect2: error: ld returned 1 exit status
    
    Use chromium.bb solution to not treat linker warnings as errors.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    
    Upstream-Status: Inappropriate configuration
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 8d4ad9ca4049cf8a75f37f260913f6ad106f1e52
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sat Nov 7 13:20:28 2015 +0100

    cef3: fix build of x86-64
    
    Use gypi file for i586 to create the configuration for the x86-64 architecture.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    
    Upstream-Status: Inappropriate configuration
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit c04205a73182b8d065b1afbc502be0b70fa6017f
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sat Nov 7 13:20:27 2015 +0100

    cef3: fix gcc5 compile issues
    
    A cef3 build with gcc5 fails with warnings treated as errors.
    
    bignum.cc, image_util.cc: strict-overflow warning
    gtest-typed-test.h: unused-variable warning
    SaturatedArithmetic.h: parentheses warning
    
    Compiles for qemux86 with gcc 5.2.0 and still compiles on
    armv7a with gcc linaro-4.9.4.
    Note that the resulting binary has not been tested on a target.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit e2b1f6dd53789f8434c424959485090f07982596
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sat Nov 7 13:20:26 2015 +0100

    cef3_280796.bb: change indent to 4 spaces
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 654ae2847858db5d62e2bc1f04e2049598cda18a
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Sat Nov 7 13:20:25 2015 +0100

    chromium: fix gcc5 compile issues
    
    A chromium build with gcc5 fails with warnings treated as errors.
    
    bignum.cc, image_util.cc: strict-overflow warning
    
    Compiles and runs on qemux86-64 with gcc 5.2.0 and still compiles on
    armv7a with gcc linaro-4.9.4.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


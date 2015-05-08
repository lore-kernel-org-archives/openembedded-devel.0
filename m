Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3768973F5B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 11:22:25 +0000 (UTC)
Received: by qgeb100 with SMTP id b100so34617038qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2015 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:date:to:subject:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=DUZb3rijrRBhMFDeNXijp8vy1ylKfdbIig2BxVYvz4A=;
	b=rVyWL+KZH2Z6ccRLYUbXIzLKeoisssQuTmAPRaj2rzxmbyZ87b8JoxNMrJ7hEv8ebx
	mmziSGRiW16yM/DSZEYHX7KjiBBmRvbKkR7Si01bBmnu6nErIczpYeVoOoW6+FF18ldf
	2SlEM7lrjEeEWdB2d8ZcYqli0dN5FggOaefelTtvSJ2Fi/LkVyJuLTijfgToo0+oyiUv
	5VVl+P7BDG4/VIjhoQFmVHE2TSDOyib4IiSXQUfbqXODrXZXLv4zvQLYEbsOri/IpNo9
	bfr4lobs4iPNa7z2F3tTMFUUkekkI3Lc//OvLd29eS+uhRkTELtCTA2OhPA3q7+1tuSC
	UEYA==
X-Received: by 10.55.31.168 with SMTP id n40mr6960117qkh.56.1431084146851;
	Fri, 08 May 2015 04:22:26 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id 13sm3381068qku.20.2015.05.08.04.22.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 May 2015 04:22:24 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
X-Google-Original-From: otavio@nano.lab.ossystems.com.br (Otavio Salvador)
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 55B901CE8770D; Fri,  8 May 2015 08:22:21 -0300 (BRT)
Date: Fri, 08 May 2015 08:22:21 -0300
To: <openembedded-devel@lists.openembedded.org>,
	listing@nano.lab.ossystems.com.br, Mailing@nano.lab.ossystems.com.br,
	Meta-OpenEmbedded@nano.lab.ossystems.com.br
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Message-Id: <20150508112221.55B901CE8770D@nano.lab.ossystems.com.br>
Subject: Updates to meta-browser (master) in 2015-05-08
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
X-List-Received-Date: Fri, 08 May 2015 11:22:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

I pushed following updates:

commit 713b7f4dd6292461180be17882bf468e92ac43d2 (HEAD, origin/master, origin/HEAD, master)
Author: Khem Raj <raj.khem@gmail.com>
Date:   Thu May 7 19:27:45 2015 -0700

    chromium/cef: Fix chromium installation regressions
    
    CEF rework caused few problems where we missed packaging needed resource
    files and misplaced some icu data files
    
    Use loops to install similar files
    
    Tested on x86 emulator making sure google-chrome starts up
    properly
    
    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Acked-by: Otavio Salvador <otavio@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit d53979350df5237a81b341e5a43f5759f1f6f856
Author: Chunrong Guo <B40290@freescale.com>
Date:   Thu Apr 30 16:29:48 2015 +0800

    firefox_10.0.11esr: use ${BPN} instead to avoid breaking multilib
    
        fix the following warning:
        |WARNING: Unable to get checksum for lib32-firefox SRC_URI entry mozilla-lib32-firefox.png: file could not be found
        |WARNING: Unable to get checksum for lib32-firefox SRC_URI entry mozilla-lib32-firefox.desktop: file could not be found
    
    Signed-off-by: Chunrong Guo <B40290@freescale.com>
    Acked-by: Otavio Salvador <otavio@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


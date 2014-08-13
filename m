Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4115C609BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 23:12:26 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id 19so405764ykq.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 16:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:cc:content-type; 
	bh=Ri6LGvlEmAuuz81GQmlp9F9qO7VrcouGL9MZGYauz7E=;
	b=QCqBCiStIWrEzJxzaal4huG5D7exot+kDJAyNW1BhLAE92AVa2fDWqj+car6cxnsRa
	6G9cuu1jGU/MfomDT4EJOB6yNFYeRhjLTCoHd0dU2QyX4Zyt53HmlE8soj5+qdJPSDzA
	FrDo+E8quEYbPNgB2Qvcu9Gg64FzKgQXlWCHpxv5797VFmlm4kIBH4kIUkr51FGFMPG5
	hFSrXsZ73xfLfgWL9QSLdHCTHKPep7OHvX5/ekEWsTpMXZEZ0C3jAPSDXJhq0cW+2JKy
	yOYJG31hcc7YAXsyuxCNLFUcqRnjbBx5Pzd3MWRZQHo8JTiLTPsqTA2Ym+6gpjrA4uBZ
	rDng==
MIME-Version: 1.0
X-Received: by 10.236.223.229 with SMTP id v95mr11589251yhp.128.1407971547230; 
	Wed, 13 Aug 2014 16:12:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Wed, 13 Aug 2014 16:12:27 -0700 (PDT)
Date: Wed, 13 Aug 2014 20:12:27 -0300
X-Google-Sender-Auth: HmWEm1wWWclMmxFmqMKCu9O81xk
Message-ID: <CAP9ODKr7+nzk9sCsHzB+Eg+YG_FpvO5U+X7d86fS4mybg_gNtg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [for-daisy] Backports for merging
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
X-List-Received-Date: Wed, 13 Aug 2014 23:12:33 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I am seeing this failure in Daisy branches:

commit 75ca64e5917d0177c48f58f631497a05e2773731
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Wed Jun 4 20:09:39 2014 -0300

    nbench-byte: Fix parallel building error

    This extends the dependencies on pointer.h to fix following error:

    | ./sysinfo.sh arm-poky-linux-gnueabi-gcc ...
    | In file included from misc.h:36:0,
    |                  from misc.c:23:
    | nmglobal.h:29:21: fatal error: pointer.h: No such file or directory
    |  #include "pointer.h"
    |                      ^
    | compilation terminated.
    | make: *** [misc.o] Error 1
    | make: *** Waiting for unfinished jobs....
    | ERROR: oe_runmake failed
    | WARNING: exit code 1 from a shell command.

    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Please wait for one more Ack and backport it, if fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


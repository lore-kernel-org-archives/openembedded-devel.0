Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id E318965D54
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 20:08:20 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id a41so6698855yho.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:cc:content-type; 
	bh=yvzikqU3ROMjtFB1XuYINgvjX5aiOwpbPnHTFi3KWXE=;
	b=f282jGkyGuExbeYXoQMiZZrbWUFezFUbpeRheJUnBvtuCMfMH7QGKrsLU/K3V4NnOC
	fKLrsyV1ybzqCDxNtRnnyT7EUaN+p9ldnBUIdcW1nB7K6NkiCR4ReUbwssFYl2Y7vn1/
	LgjkVL4GecYVKlmXsbjZOQuzrwGlONZURcKTpw9Kfzxn6Z6T3Kk0l47N76n1CdhPl3f7
	QFrjFoHw4dwEsTF1vP9MRxw3mWgKGri4HsM94uFyIrNwZl194FolMkwiGuaajmESUL7/
	6/RhS3OsHSkqHBNyHwhnX8I4zh93E2H+7+nj7TbiGokSflBLVTJoStAw1KueNAas1lrs
	qf7A==
MIME-Version: 1.0
X-Received: by 10.236.216.16 with SMTP id f16mr49294029yhp.90.1407787701754;
	Mon, 11 Aug 2014 13:08:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 11 Aug 2014 13:08:21 -0700 (PDT)
Date: Mon, 11 Aug 2014 17:08:21 -0300
X-Google-Sender-Auth: TZCmzP3u4WgorjeeIO2lQqZ_TJk
Message-ID: <CAP9ODKoPbC6qvtDq938R_1VZ4f27MrJJDMvOxKV88C2My519rw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Daisy pending backports
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
X-List-Received-Date: Mon, 11 Aug 2014 20:08:25 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

here goes the pending backports I am aware of:

commit 9c762b824cbf7ecd9ce7f7859d22ff89c59fa28d
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Mon Aug 4 15:38:34 2014 -0300

    evtest: Stop using Cgit based archive

    The Cgit based archive may change depending on the order of images,
    timestamp and like causing checksum to change.

    This patch uses the same 1.25 version but fetching it using Git, so no
    code changes are done.

    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
    Acked-by: Otavio Salvador <otavio@ossystems.com.br>
    Acked-by: Cliff Brake <cbrake@bec-systems.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

This one has been acked by all Daisy maintainers so please merge this.


commit 1fe211750e11420095dd29e08eba4bb615d9ffca
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Tue Jul 1 10:56:02 2014 -0300

    opencv: Disable 'gtk' backend if X11 is not available

    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

This one is new and Cliff and Armin need to review it.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


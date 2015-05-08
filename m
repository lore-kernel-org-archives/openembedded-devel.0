Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id C49A660034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 11:22:11 +0000 (UTC)
Received: by qku63 with SMTP id 63so45514896qku.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2015 04:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:date:to:subject:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=P0XB6lmWqZS2D5+scYuzEsVcYS+P43KLAxZTvHRxofo=;
	b=YLYbhDWbG/6X0LZJCvoGc3UTgSQPw9QDTEBVf+2x/GzEOBKil8Q3vJFPTpOw9Y37tp
	cYeswzWVdBNOLsDV0X+DwHG94DhXYoaGmZP/qSzeh872NNzV3XOsFpj/pOM47rNi/2Zp
	107UKED08HVqjOzqMoGovIchMUkbfvmlNCWJ9WNQUc1lN7noGHvIN5zRVobCxDC+JYwY
	TESvAto/2wE515P9sC3Tg3ZdCBtx6B6A8ThRVED8KKQRnNL5xXVTZyBLsp3V7B+Ps8zr
	dI4uYS6X2VmWu1dXpkWhzUltpyciiG16FtoqGrkXjpuBU76tDJ2KNxQykosXwoDw9kFQ
	/GCw==
X-Received: by 10.140.29.55 with SMTP id a52mr3962409qga.25.1431084132053;
	Fri, 08 May 2015 04:22:12 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id l74sm3427647qgd.7.2015.05.08.04.22.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 May 2015 04:22:10 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
X-Google-Original-From: otavio@nano.lab.ossystems.com.br (Otavio Salvador)
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 0EB271CE87703; Fri,  8 May 2015 08:22:07 -0300 (BRT)
Date: Fri, 08 May 2015 08:22:07 -0300
To: <openembedded-devel@lists.openembedded.org>,
	listing@nano.lab.ossystems.com.br, Mailing@nano.lab.ossystems.com.br,
	Meta-OpenEmbedded@nano.lab.ossystems.com.br
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Message-Id: <20150508112207.0EB271CE87703@nano.lab.ossystems.com.br>
Subject: Updates to meta-java (master) in 2015-05-08
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
X-List-Received-Date: Fri, 08 May 2015 11:22:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

I pushed following updates:

commit 4aea395deed99b2725b56d4a86fb4712fcf504d7 (HEAD, origin/master-next, origin/master, origin/HEAD, pending)
Author: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Date:   Mon Apr 27 22:27:09 2015 +0200

    README: Update PREFERRED_VERSION to new OpenJDK-7 version 75b13-2.5.4
    
    Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 405f6571be156af93a18580ca54350a29cbdfe43
Author: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Date:   Mon Apr 27 22:13:04 2015 +0200

    java-test-image: remove busybox-hwclock
    
    busybox-hwclock fails installing for me and I don't see the point for leaving
    it in the image. So I removed it.
    
    Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 7260c357d8e5136e1a0b91e28f9c7afee87fe3c3
Author: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Date:   Mon Apr 27 22:13:03 2015 +0200

    java-test-image: Add openjdk-7-vm-zero package
    
    There is no point in not installing the ZeroVM of
    OpenJDK-7 in a java-test-image.
    
    Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit c84cbe25d21422121c5dcb622d8fb82ed9ac461b
Author: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Date:   Mon Apr 27 22:13:02 2015 +0200

    openjdk-7: remove IcedTea 2.3.12, OpenJDK 7u25b30
    
    We have now updated to IcedTea 2.5.4, so we can remove the old version.
    
    Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit e65fdc9c690405f4a2b53474866f24f7c5e966f1
Author: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Date:   Mon Apr 27 22:13:01 2015 +0200

    openjdk-7: Add libxslt-native and krb5 as dependency
    
    Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit cf74220c5f9902e77845a21fce909c9e96f4da8e
Author: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Date:   Mon Apr 27 22:13:00 2015 +0200

    openjdk-7: use icedtea7-native as dependency instead of icedtea6
    
    Due to problems when using native rmic, I switched to using icedtea7.
    
    Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 31460be0ffad5fea3d41e50fba3eccce7993e409
Author: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Date:   Mon Apr 27 22:12:59 2015 +0200

    openjdk-7: Add IcedTea 2.5.4 OpenJDK 7u75b13
    
    Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 00cc75e823ef742fae6966a83dce69b0d2f56a76
Author: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Date:   Mon Apr 27 22:12:58 2015 +0200

    icedtea7-native: remove unused patch
    
    Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit a954cc87d1dcb8fb35a321e39f4b8fdddf26a987
Author: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Date:   Mon Apr 27 22:12:57 2015 +0200

    icedtea7-native: fix build with gcc 4.9
    
    Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit b6562720516428b74acf640e3e5445af31976317
Author: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Date:   Mon Apr 27 22:12:56 2015 +0200

    icedtea7-native: Add attr-native and libxslt-native as dependency
    
    Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


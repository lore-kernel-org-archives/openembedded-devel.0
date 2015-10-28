Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id AC0C7755F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:21:07 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so4212078qgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=OGYQc2f7uXvSBYFfdjrkfUEg74Znhl95IHcL/rEzovY=;
	b=TEWCNhHGr4+2pZgCkzUBw3LNUYgUNtVLq+sr1u3J/ImtibjCD1b03zNqThCj0s1PXD
	PJ2Viw1hagj3LaAvretveRmnibcZYoYfgzeQtYam9RL5B1CtopsZGSK1fuvhtxhCUJP1
	rJ3NCLeTASHG236wRXlAVILnQ8bIitrK4cu1DcvKeLkKPGcUSK/7B25On1thFpV9R/Vh
	N7AzYE74wrE/hHyuSUytkyQiIUx+wGefItO1gj+yAjqQMp5UAX1rYB4UO7u/seZge9in
	sF5xga479XEI7HIGutOIxAjDyNKbf8RlC6nl5qzcBsyVP9dNhAEBJe9LYUdwtJtJHBIW
	wlQQ==
X-Received: by 10.140.181.197 with SMTP id c188mr21899747qha.103.1446034867099;
	Wed, 28 Oct 2015 05:21:07 -0700 (PDT)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	d185sm7927262qka.8.2015.10.28.05.21.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 05:21:06 -0700 (PDT)
Message-ID: <5630bdb2.c236370a.dee47.5d00@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Wed, 28 Oct 2015 10:21:01 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Wed, 28 Oct 2015 10:21:01 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-java (master) in 2015-10-28
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
X-List-Received-Date: Wed, 28 Oct 2015 12:21:08 -0000

Hello,

I pushed following updates:

commit ed95222b71cc58f6039bdf944b0e11ce00fb0bf5 (HEAD -> pending, yocto/master, m/master)
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Wed Oct 28 13:07:19 2015 +0100

    openjdk-7: update to IcedTea 2.6.2 OpenJDK 7u91b01
    
    IcedTea 2.6.2 provides OpenJDK 7u91, which adds the October 2015 security
    updates. For more details see:
    http://blog.fuseyism.com/index.php/2015/10/23/security-icedtea-2-6-2-for-openjdk-7-released/
    
    Furthermore the patches directory for OpenJDK-7 was renamed to avoid the version number.
    This makes it easier for upgrades and to see diff's between patches.
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Acked-by: Otavio Salvador <otavio@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit d3b7aaba7df3ef623e1441470abaf29e200d5cfd
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Wed Oct 28 08:53:48 2015 +0100

    README: remove instructions for OpenJDK6
    
    Due to the fact OpenJDK6 was removed from meta-java, remove also its
    usage instructions from the README file.
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Acked-by: Otavio Salvador <otavio@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


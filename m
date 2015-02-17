Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5ACB47182C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 12:54:43 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id b13so22689859qcw.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 04:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:date:to:subject:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=FAc5ITfrY2/0YwH0339+M1QuQbtyFvRjU2aCbtCYNNE=;
	b=SVxJhX7ufmXH1sqW9Ti+ZKd3/hOdjWagvjBcIZ+2Ys0d6EqwpSRh1X9pfO/APr6VYa
	YbeCRA/2Nj5QG2TYC43zna74FE3ixPapgdgdcLgGFQs9qcIk7TvDFBXpTiXgAN5ZdZwm
	4TnVbHC8hYnbq5VS11HEQdh3Q950mEys5osGAkxRZA6DzIty8s/SIRezegy0Y2HOev2h
	kzx+egvaQhfXMWiPTfpxzYOtY/kCQ5+dKSClKWxzP0AE/MIM5TfPKA2RMrD4sQ6FhMC8
	eNxTq2U3mwnEZn97YnyrXxQl/gtS6iFWBbqPUPyE8MWP9ai7wEohuUVMrxDqKX2fwSVT
	R/uA==
X-Received: by 10.140.82.234 with SMTP id h97mr386423qgd.75.1424177684713;
	Tue, 17 Feb 2015 04:54:44 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id 142sm5750919qhg.16.2015.02.17.04.54.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Feb 2015 04:54:43 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
X-Google-Original-From: otavio@nano.lab.ossystems.com.br (Otavio Salvador)
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 444D61CBE74DF; Tue, 17 Feb 2015 10:54:41 -0200 (BRST)
Date: Tue, 17 Feb 2015 10:54:41 -0200
To: <openembedded-devel@lists.openembedded.org>,
	listing@nano.lab.ossystems.com.br, Mailing@nano.lab.ossystems.com.br,
	Meta-OpenEmbedded@nano.lab.ossystems.com.br
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Message-Id: <20150217125441.444D61CBE74DF@nano.lab.ossystems.com.br>
Subject: Updates to meta-java (master) in 2015-02-17
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
X-List-Received-Date: Tue, 17 Feb 2015 12:54:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

I pushed following updates:

commit 77f0eabfff1ff614f5c10abc35a164e8968e5130 (HEAD, origin/master, origin/HEAD, pending)
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Tue Feb 17 10:57:16 2015 +0100

    mark broken recipes with PNBLACKLIST
    
    While testing commit 'java-library: inherit allarch' I found some recipes
    throwing errors in do_compile.
    
    The recipes jaxme and xom currently don't build with compiler errors.
    
    jaxen, dom4j, jdom, commons-jxpath, commons-configuration depend directly
    or indirectly on jaxme and/or xom and thus are unbildable.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 9b33eee75b70bd431f6cac098e97d3b6dd220b51
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Tue Feb 17 10:57:15 2015 +0100

    antlr: fix override for native build
    
    The override virtclass_native has been deprecated and removed from the
    buildsystem, use class-native instead.
    
    While at it fix whitespace issues.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit c7f2b7dd60bff9092eeae6b7df7f8cae16994a21
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Tue Feb 17 10:57:14 2015 +0100

    java-library: inherit allarch
    
    Use the allarch class to make every packages in the 'all' ARCH.
    Recipes inheriting java-library which build additional packages which
    don't belong in to all ARCH must manually setting PACKAGE_ARCH after
    inheritting java-library.
    
    This fixes the following error when building e.g. rhino for a second
    machine of different architecture in the same build directory:
        ERROR: The recipe rhino is trying to install files into a
        shared area when those files already exist. Those files and their
        manifest location are:
           /.../ipk/all/librhino-java_1.7r4-r0_all.ipk
        Matched in manifest-armv7at2hf-vfp-rhino-package_write_ipk
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 91e4ed3f74bbd4368f2fbbd5399dbaedf195bcf9
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Tue Feb 17 10:57:13 2015 +0100

    rxtx: use autotools-brokensep
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit fd8924e7289834f056e54e3bebf0272b8b30c0c1
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Tue Feb 17 10:57:12 2015 +0100

    licence: add missing LIC_FILES_CHKSUM
    
    While at it change the LICENSE string to the oe one if applicable.
    e.g. AL-2.0 -> Apache-2.0
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 99a92881cd0df264eb4ed0654516fe43569e3f51
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Tue Feb 17 10:57:11 2015 +0100

    cleanup whitespace in tasks
    
    Indent with 4 spaces in task definitions.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 34E9C78917
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2018 15:44:09 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id r8so14727288qke.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jan 2018 07:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:from:date:to:subject:user-agent;
	bh=WZ4OccVDl99vRNlS299F8QH4CUp6gyo5ggvx/8VQQ2c=;
	b=FHr2xLqdCmBLO0Rbxjsez1mJ3N89JTuW3CBYL+XZQQBE0NkxtIBT/jtfDlnfCef4aO
	ksxaIIkaMiS5nwNcr8iDjo1uzahaMUqeNI9dZfrRrChEXHt4gg4WjnPdIk7ru7w3KEIH
	IcwGOAkUkLzgxcXBJbS5asJUHNHE+1S4A9e46d5tFwCucsmrpmlKpdhwWLiKpx4z73AW
	y0HGt4b3idhUQP4ZaGwqIEcoUpvVLCDaIWdWvcyH8UCAsSpCzvJ21p6z8RdKY5Yx2hle
	dr5hZYzBvc0PIheLa8QkXXUoLm5i/YcRxkFSVOoicx/f2n+TCRoUZ6O380X2O+NoOyBl
	oCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:from:date:to:subject:user-agent;
	bh=WZ4OccVDl99vRNlS299F8QH4CUp6gyo5ggvx/8VQQ2c=;
	b=noeJ+LFlQUpJFkKw2ZuDacNP6Nip2HQTGSnszN2vJJh0xFUI93yfZmiiDMKwOjWeQZ
	L387bclK/N3QQJzERlDllP8USkEzfNAEzo5lbXbriFIcvA9s29orzFYAqDNoG1YpdWDW
	6JY9lcg1ozu26b9tSJGPvWI+NMViNY6C8mZxLAC/XCl5cBvZLXy2QSzRQyPfTcAKIJ4a
	L4bFeK8jq1e83Vhvqs6HF3FY0KOJLADgYaB3TxEvVQYGCFZdKTof1jCG4+qowdzjDaxV
	NzZSOnvIKXs55aJxkTgtc2RZm+hLhYMCxNmKOs0lPmSDUepBxrZZmW45s31iJHEWdjBF
	KBVg==
X-Gm-Message-State: AKGB3mIOBb3elmDQAO0OvbJGrLHr8bsGvVkmK2e2YHUUCr/czaw7J3HF
	VSNOuyNbH9OIknpL37uXPu9ulA==
X-Google-Smtp-Source: ACJfBovRE0Pu/n3ethOwag1iT22y/RXFuKWrhhYLHB4Z2ocD01IUHntBkckR0Vm9pjmTnuFbzTvC6g==
X-Received: by 10.55.96.196 with SMTP id u187mr20499599qkb.257.1515512650747; 
	Tue, 09 Jan 2018 07:44:10 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	q52sm9320894qtc.16.2018.01.09.07.44.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 09 Jan 2018 07:44:09 -0800 (PST)
Message-ID: <5a54e349.f722ed0a.644ff.1971@mx.google.com>
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 09 Jan 2018 13:44:03 -0200
From: otavio.salvador@gmail.com
Date: Tue, 09 Jan 2018 13:44:03 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.9.6
Subject: Updates to meta-java (master) in 2018-01-09
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2018 15:44:10 -0000

Hello,

I pushed following updates:

commit 952e92b035b94b700abf094415db7c189362f146 (HEAD -> master, yocto/master, m/morty, m/master, m/krogoth)
Author: Ming Liu <liu.ming50@gmail.com>
Date:   Thu Jan 4 14:19:10 2018 +0100

    ant-contrib-native: add recipe
    
    The Ant-Contrib project is a collection of tasks (and at one point
    maybe types and other tools) for Apache Ant.
    
    Signed-off-by: Ming Liu <liu.ming50@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit f1ceb8474deb3670a9a1cd86e283e4fffd162bc6
Author: Ming Liu <liu.ming50@gmail.com>
Date:   Thu Jan 4 14:19:09 2018 +0100

    jamvm: avoid checking x11 distro feature for native build
    
    x11 is not a mandatory distro feature for building jamvm-native, so
    avoid checking it for native build, or else it would lead parsing
    errors.
    
    Signed-off-by: Ming Liu <liu.ming50@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 5c1f57bffad8550e60949fcc6c75878f23d6a88f
Author: Ming Liu <liu.ming50@gmail.com>
Date:   Thu Jan 4 14:19:08 2018 +0100

    commons-httpclient: extend native bbclass
    
    Signed-off-by: Ming Liu <liu.ming50@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 649e4d6c4d6fd88ecd8d421c2deb56d52d1153a6
Author: Ming Liu <liu.ming50@gmail.com>
Date:   Thu Jan 4 14:19:07 2018 +0100

    commons-codec: extend native bbclass
    
    Signed-off-by: Ming Liu <liu.ming50@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit e797427228f621f6c6c443eec1dcb81c229946bb
Author: Ming Liu <liu.ming50@gmail.com>
Date:   Thu Jan 4 14:19:06 2018 +0100

    commons-cli: extend native bbclass
    
    Signed-off-by: Ming Liu <liu.ming50@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 5561f84aa6aacc11743927da15043a9a8323b6a6
Author: Ming Liu <liu.ming50@gmail.com>
Date:   Thu Jan 4 14:19:05 2018 +0100

    meta: drop deprecated virtclass-native
    
    Replaces them with class-native.
    
    Signed-off-by: Ming Liu <liu.ming50@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit cfda09395f2c5c5e21f222798e7a07e26e99367e
Author: Ming Liu <liu.ming50@gmail.com>
Date:   Thu Jan 4 14:19:04 2018 +0100

    meta: drop redundant DEPENDS_virtcalss-native definitions
    
    The DEPENDS would be handled in native.bbclass, it's not necessary to
    set them explicitly in recipes.
    
    Signed-off-by: Ming Liu <liu.ming50@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit b2e309882732f3566f0459b0654b99b3e9bf9d25
Author: Haiqing Bai <Haiqing.Bai@windriver.com>
Date:   Thu Nov 2 16:33:12 2017 +0800

    openjdk-8-native, icedtea7-native: use JAVA_TOOL_OPTIONS from environment
    
    Solution on how to be able to build openjdk for a build
    host that need the environment variable JAVA_TOOL_OPTIONS.
    Use JAVA_TOOL_OPTIONS from environment. On some machines this is needed
    in order to start java when the amount of RAM is limited for the user.
    
    Author: Peter Bergin <peter.bergin@windriver.com>
    Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
    Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9F796736B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 16:49:16 +0000 (UTC)
Received: by qcrf4 with SMTP id f4so6118900qcr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 09:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:date:to:subject:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=XwrmlvUaW1RykhooClwJUWrFKC+AqSC0jWkk7xxKuwA=;
	b=ElWu/BZ6N+6TiN60xQuuvFEDE+mrJOW3fJJ3LW4QYLLq0oY75KIrUnAv53YgwIWyJF
	tOFIQiqzJ2bGbP8XZGqgif7oUTvYZeIneHTZ00PJyaLYTHlrQmmODLx5Kwkl6IjDQ9qv
	UlR5AhSgmkyd5xR2X/iolcQ/rMCvtKI1dqjkZ9OLyI3lGUYkaezz9m7QSRUVzpCc3JJ0
	MLdlzZV7n9RMqPcjMt4TLcgJlA0fbK5uuqmLc7g8ZpTncXcWL9Sw9W2kWnE6A37oIujR
	8HNOjIaXKcnfFZM+O6r6IiTk81yh+N2KH+pqrtIHMcNGcnYApkN2/OCow5Z7dv35g0yc
	Em1Q==
X-Received: by 10.140.37.7 with SMTP id q7mr48011251qgq.29.1427820557131;
	Tue, 31 Mar 2015 09:49:17 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id
	n19sm10207105qhb.12.2015.03.31.09.49.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Mar 2015 09:49:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
X-Google-Original-From: otavio@nano.lab.ossystems.com.br (Otavio Salvador)
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id EDB031CDDDD7E; Tue, 31 Mar 2015 13:49:12 -0300 (BRT)
Date: Tue, 31 Mar 2015 13:49:12 -0300
To: <openembedded-devel@lists.openembedded.org>,
	listing@nano.lab.ossystems.com.br, Mailing@nano.lab.ossystems.com.br,
	Meta-OpenEmbedded@nano.lab.ossystems.com.br
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Message-Id: <20150331164912.EDB031CDDDD7E@nano.lab.ossystems.com.br>
Subject: Updates to meta-java (master) in 2015-03-31
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
X-List-Received-Date: Tue, 31 Mar 2015 16:49:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

I pushed following updates:

commit 6d8dc1af442559380b2e247984961ba6609b6052 (HEAD, origin/master, origin/HEAD, pending)
Author: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
Date:   Tue Mar 31 13:39:59 2015 -0300

    cacao: fix problem with internal garbage collector
    
    Cacao uses an internal version of bdwgc that was being installed
    (headers, libs, etc.) together with the JVM, unnecessarily conflicting
    with original bdwgc package.
    
    A patch from Gentoo is applied so the system's bdwgc is used instead.
    
    Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 458f78f923d0a8bbfb4e2b98c708a3d9acd70949
Author: Mario Domenech Goulart <mario@ossystems.com.br>
Date:   Tue Mar 31 10:22:38 2015 -0300

    icedtea6-native.inc: remove --disable-npplugin
    
    Fixes:
    
    WARNING: QA Issue: icedtea6-native: configure was passed unrecognised
      options: --disable-npplugin
    
    Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit a005c5b58ffc92f85c81c50512dfbf20c656c32c
Author: Mario Domenech Goulart <mario@ossystems.com.br>
Date:   Tue Mar 31 10:22:37 2015 -0300

    openjdk-7: add /usr/lib/jni to DEFAULT_LIBPATH
    
    Some recipes install JNI-based bindings into /usr/lib/jni (e.g.,
    rxtx), so it's sensible to add this directory to DEFAULT_LIBPATH
    (java.library.path).  That's also how Debian does.
    
    Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit ff169c8e4337253f509f19aa933ce2b70d838a99
Author: Mario Domenech Goulart <mario@ossystems.com.br>
Date:   Tue Mar 31 10:22:36 2015 -0300

    cacao-initial-native, jamvm-initial-native: provide virtual/java-initial-native
    
    Since bd9c6023, virtual/java-initial is provided by
    cacao-initial-native and jamvm-initial-native.  For consistency, this
    commit makes them provide virtual/java-initial-native instead.
    
    Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 85c4d06c8052278edd7e23a9e8a7eb17e8700e23
Author: Mario Domenech Goulart <mario@ossystems.com.br>
Date:   Tue Mar 31 10:22:35 2015 -0300

    README: typo fix (s/lease/least/)
    
    Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 684b041637efa64785c266c6d4443aa10661015d
Author: Mario Domenech Goulart <mario@ossystems.com.br>
Date:   Tue Mar 31 10:22:34 2015 -0300

    rxtx: put .jar and .so files into the same package (librxtx-java)
    
    That's how Debian does, supposedly because it does not make sense to
    ship .jar and .so files into separate packages.
    
    Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 242937CA73
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Mar 2019 19:45:35 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y15so2717543wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Mar 2019 11:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=gVvfYrdLlt0JVcVLSpspd4lMGzDAVIeiZ23Bvn/VFeI=;
	b=U5E/2/qBGfdRbxt8dljz7AeazL7TPG8eexXLzJ3VFuI4JFci/qvkiSU7nqLIq0p1Tl
	7rfYFxksq8sFvEyB1hf8HO+TZnbBEyWPS2eQ2iZrs1SdQkuLlvZXfyCwUhdhcp26ycru
	Nv4EGvZGWmBXs2tAda0t9FsoKZA2dJsokxkCmIrae3sZ9uZJteLGehPKE2OCzOaW8czy
	JdDGa0C3ug6Y7qPoxVv1PlD/D/eaBoPBBOAmq5Kk9XijxRkA1J8ViQPOs//CrH6MMgRr
	/Aw2IzZzJ8+lrlMRh/tfWo9GS9hGxy9EsxwxA32BYmCAvsgkpMLEOZoLYVvLOJS63Z9t
	m0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=gVvfYrdLlt0JVcVLSpspd4lMGzDAVIeiZ23Bvn/VFeI=;
	b=gaIXtlhpLPsa5zCWyHfZm8fqDswtx/exBYGtJME0hiEnsaqQxRxGCShy2nyWIsy80N
	ro7FZT7NRvd8H6gBPKJbjw6o1iQ5wcdyUxx2IgJlj0DD3/3Y9QxZPY7KZdsdfHnuFzi6
	Zc4vBt/re3mGXm7u8bAk8eZHVRULrPseAQeUsRUsXy2U9Ifigy8TZT06l/nAJ/zDypFX
	gCtiQ8GLL3tYKzS0t5Ucw0gPoknF19K0oeDTAByAkFpFTEuYJS7hwaFhSZGneSaH55IN
	S5ZeHlLB2l/CWQ8dgxGNKHEGirsW5NcZoktybasRpng+rVoLqU6n0JjH4srRrM+pwi21
	Mb3g==
X-Gm-Message-State: AHQUAuZVqQzTRzne0GTLCtBvTP+uaq18ocvh6ANZ3shNFPW8vH+DtgvD
	TWOwMFm7F/9cSf3Zw6JORdrOiHVe9HxfWinECyZ6I5TfkPY=
X-Google-Smtp-Source: APXvYqwjOoXB20wHUwPs83nlhxVHqOAQRQEkOQkykxZ9m6Ct8dZ4g8LkSyPHldbiZDPUCc+jUBLWSQVF0XMo1CL86q0=
X-Received: by 2002:a1c:e0d7:: with SMTP id x206mr9359456wmg.152.1551642336401;
	Sun, 03 Mar 2019 11:45:36 -0800 (PST)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Sun, 3 Mar 2019 20:45:25 +0100
Message-ID: <CAAfyv34gwyZ_OQYw96owsFZ5A=vZ94X3oGGD6Nw6jXMU++hOHw@mail.gmail.com>
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java] Illegal instruction (core dumped) when compiling jaxp1.3-native-1.4.01-r0
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
X-List-Received-Date: Sun, 03 Mar 2019 19:45:36 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

forwarding from yocto mailing list as after reading README from meta-java
realised that this should be correct one :).

I'm using meta-java sumo branch and on ubuntu 18.04 I have this issue
(building for beaglebone-yocto machine):
ERROR: jaxp1.3-native-1.4.01-r0 do_compile: Function failed: do_compile
(log file is located at
/home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.15390)
ERROR: Logfile of failure stored in:
/home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.15390
Log data follows:
| DEBUG: Executing shell function do_compile
| Illegal instruction (core dumped)
| WARNING: exit code 132 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.15390)
ERROR: Task
(virtual:native:/home/jenkins/meta-java/recipes-core/xml-commons/jaxp1.3_1.4.01.bb:do_compile)
failed with exit code '1'
ERROR: gnujaf-native-1.1.1-r1 do_compile: Function failed: do_compile (log
file is located at
/home/jenkins/my_build/tmp/work/x86_64-linux/gnujaf-native/1.1.1-r1/temp/log.do_compile.15475)
ERROR: Logfile of failure stored in:
/home/jenkins/my_build/tmp/work/x86_64-linux/gnujaf-native/1.1.1-r1/temp/log.do_compile.15475
Log data follows:
| DEBUG: Executing shell function do_compile
| Illegal instruction (core dumped)
| WARNING: exit code 132 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/jenkins/my_build/tmp/work/x86_64-linux/gnujaf-native/1.1.1-r1/temp/log.do_compile.15475)

Looks like javac is failing (when run devshell and call java it will print
help though). I tried same setup on ubuntu 16.04 and here it works
perfectly fine. Any ides what can cause this - different toolchain or?

Also looks like when use this proposal [0] it start working (juts need to
update multiple recipes which calls javac in configure phase with
-Xnoinlining). Compiletime disable inlining doesn't work.

It thee some pending fix for that? When use host gcc 5.5 (from ubuntu
16.04) all works good (while not with gcc 7.3).

[0] - https://sourceforge.net/p/jamvm/mailman/message/25051239/

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com


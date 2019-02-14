Return-Path: <theknoppix@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 16B4C7C61A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 13:10:09 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id d15so6232581wmb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 05:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=58obBPm1EDtdwjLEp6ybl2q+T4GC4+aMD6RYrWzHlRk=;
	b=kI79gEgrxT78osbNqwfZzIFWOusXZpwjXshQe6SwnqG7J4KnfoN5FzJIp3EJZE7nGo
	V4/3/sfhUcv3uTfYue5PZktQlRM1hoc59q6Icw4JoHF2pEfYJrI02+T7WKltN3jZa8CS
	xYD/coh9+n4N+yBrhhtm0xQbHAXVMfv4Tw7frK9c6FCKJW/t8rt7tEYYI6p0xYfUwqzM
	nlCGf1yJ0zIyt/0W3DIi/lDSFqBBynCJpr6tXpkzqPjS0jFTzy3qvoz8NZqmBYc0COEQ
	ceGZOocMNtdHY+rMH6yDkC1N4LMB8AQoL0fO0vrZv9mR/bIj/Yim6j54F86nbODYQGeg
	+qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=58obBPm1EDtdwjLEp6ybl2q+T4GC4+aMD6RYrWzHlRk=;
	b=huSoiD2Ttx8FHowzKhV4YM8ZHO/DKDtD7adx6pj1Vb1sjvGRGF9K7PoMEFGVak1nL0
	qMlJsSmTc8BTZPQNinkuL9vxB3xR9KAcQ9I2NlNcx7e+JyvXNiUHMVRQ9NJ61joIYWKd
	cpYScqxYKXBaibmslSH+OIG5X1RtxX/Ih66g+yNhznuKLZC05+yE9lHdaPfMafOxj6Ex
	QQ/0/4unh1isa9CM6CC3L0QdIC4Fgu9n879wkcyULWLqv6u86FtdipTYcKexgHsetPzC
	FfIXoTK7fPWEj13ar9FxmhloxbGHo61KoL8G27W2ebHD+E4KlA3qQObN1n+V1Uz3Ze1l
	hiuw==
X-Gm-Message-State: AHQUAuY+NPO9CwfMy4N+hMsRqfSRJ9BJYfEZD1aVULUZbxoVo2PwZDgQ
	CdiyheyhbTdj5++e7Aa6F+PpNt141VcL9Vnu0/XXgbL/
X-Google-Smtp-Source: AHgI3Iba8o+CbZ8DNTsyJbT36+xek2mp6MIQmTk527LF2XfIDugL0JRPNkpdQwfErmF4Qbidx67XpEc9lMJr7JMwBZI=
X-Received: by 2002:a1c:b40b:: with SMTP id d11mr2894734wmf.80.1550149810537; 
	Thu, 14 Feb 2019 05:10:10 -0800 (PST)
MIME-Version: 1.0
From: Knoppix <theknoppix@gmail.com>
Date: Thu, 14 Feb 2019 16:09:59 +0300
Message-ID: <CAD9sEJvvXEKq70r=aUW52YEOsPi_PxNC2XJPCHqqWPqnzZQixw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: mongodb_git.bb (thud-mongodb4.0) > EXTRA_OESCONS mongod mongos
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
X-List-Received-Date: Thu, 14 Feb 2019 13:10:10 -0000
Content-Type: text/plain; charset="UTF-8"

(Excuse me for my english I am not native)

I am trying to install mongodb. Everything is okey if I just add the recipe
to my image. But I need "mongo - the database shell" and all mongo's
configuration files (i.e: systemd service, /etc conf files) (does the
installation copy conf files automatically or should I copy it manually?)

After installed successfully with default settings, on the yocto image
there isn't mongo binary but just mongod mongos.

I am not sure these are possible or not.
When I add "mongo" (mongo shell) keyword to mongodb_git.bb EXTRA_OESCONS
section, bitbake gives me error. And I cannot figure out what's the problem?

Does mongodb_git.bb recipe support mongo shell and conf files?

Could you pleae advice me anything? There is no enough documentation for
understand why mongodb_git.bb recipe's OESCONS doesn't contain mongo.
--
Error:
EXTRA_OESCONS = "--prefix=${D}${prefix} \
                 LIBPATH=${STAGING_LIBDIR} \
                 LINKFLAGS='${LDFLAGS}' \
                 CXXFLAGS='${CXXFLAGS}' \
                 TARGET_ARCH=${TARGET_ARCH} \
                 --ssl \
                 --disable-warnings-as-errors \
                 --use-system-pcre \
                 --use-system-zlib \
                 --js-engine=none \
                 --nostrip \
                 --endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS',
'le', 'little', 'big', d)} \
                 --wiredtiger=${@['off','on'][d.getVar('SITEINFO_BITS') !=
'32']} \
                 ${PACKAGECONFIG_CONFARGS} \
                 mongod mongo mongos"
--
| scons: *** Do not know how to make File target `mongo'
(/mnt/work/build-rpi-mt/tmp/work/aarch64-poky-linux/mongodb/4.0.1+gitAUTOINC+54f1582fc6-r0/git/mongo).
Stop.
| Skipping ranlib for thin archive
build/opt/mongo/db/libcommand_generic_argument.a
| Skipping ranlib for thin archive
build/opt/mongo/db/s/libsharding_runtime_d.a
| scons: building terminated because of errors.
| mongo failed: Do not know how to make File target `mongo'
(/mnt/work/build-rpi-mt/tmp/work/aarch64-poky-linux/mongodb/4.0.1+gitAUTOINC+54f1582fc6-r0/git/mongo).
| ERROR: scons build execution failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/mnt/work/build-rpi-mt/tmp/work/aarch64-poky-linux/mongodb/4.0.1+gitAUTOINC+54f1582fc6-r0/temp/log.do_compile.4225)
ERROR: Task
(/home/deb/yocto/poky/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 3460 tasks of which 2625 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

/home/deb/yocto/poky/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:
do_compile
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
--


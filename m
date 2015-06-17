Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 55B9072491
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 07:49:38 +0000 (UTC)
Received: by iesa3 with SMTP id a3so28651997ies.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QmK8vA6buewXATmyoziM3QeMz88jWtXHWuBJBtkW908=;
	b=IRHRoQYrHcZwJ3TKVFEutG4zvOGfzY+2ctVp8zBPkNwzfh+jHITLDuhEocU1QVOQJo
	/gc9/qfreKW8pzF8NgeJpMjC80+SwYQcL6MTX+gGKM0VAYvI51p5EjMJuWKzwY2z9S3h
	8BzQ808sa3SRt8Z6N8swTNWEhhH60LxW2ZKhICx6gQWs2k1hyogz3IIa/ueCPAJ6wk4Y
	9/BKSIQBX4Myvez/PfZJ6YG7UmwWyaKtu/UShaBpC6jyCESwDlE2wC/Z5yfD+yk2S+rG
	2xIKGeJyuZfcvxLd2SYHwKHFMEItxse0DM/egl/UQN34Vrhrr1SNXIPz+5UTHl60cX0p
	pUYQ==
MIME-Version: 1.0
X-Received: by 10.50.132.3 with SMTP id oq3mr8746958igb.21.1434527379832; Wed,
	17 Jun 2015 00:49:39 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Wed, 17 Jun 2015 00:49:39 -0700 (PDT)
Date: Wed, 17 Jun 2015 10:49:39 +0300
Message-ID: <CADnUhn0tx=iLncmcAXGNcRwtO=A5xZ_YaA0-2aZVoTGY0PBKvQ@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: daemontools
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
X-List-Received-Date: Wed, 17 Jun 2015 07:49:40 -0000
Content-Type: text/plain; charset=UTF-8

Hi!
As Arago distribution does not support systemd or upstart (which is kind of
dying), I'm looking for other decent service manager. I found daemontools
from openembedded/fido branch. It bakes fine. I would have few comments
regarding daemontools (svscanboot) starter  script and daemontools install
package.

Daemontools tend to install it's own commands to /command folder. However,
daemontools_0.76.bb does not install /command folder and instead, installs
binaries to Linux standard place ${D}/${bindir}. Also standard position for
daemontools service scripts is /service folder that is not installed at
all. I'm not sure how much daemontools commands rely on these standard
positions, but at least this svscanboot seems unpatched having these
default folders.

So, at least /command should be removed from svscanboot script:
/command/svc -dx /service/* /service/*/log
=>
svc -dx /service/* /service/*/log

Also I suppose service directory should also be installed somewhere. For
instance /etc/service (Ubuntu way) or /service to make things compatible
with examples or perhaps /etc/daemontools.

In any case, I'll try patching this on my own layer to check out if there
are built in dependencies.
-Matti


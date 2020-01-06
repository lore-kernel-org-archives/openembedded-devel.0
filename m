Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3BCF47FAC4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:36 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id p9so22032231plk.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GaZWonIRjfqGU5xGxrhi2qB09AUo+iu9jjX0GJVt8Ug=;
	b=JkcfuojYHPB7EVJQ5Bdy6cKeLB2pv3/z4IttTLrP6xpTWsoVqNnr/ZGJ/kT4s9Tfvp
	2sz0ppFgCGzYl6zlXqkNPSn4h62OIdbw/OhTNA/a29TezQ6zY/Eicw4O+H+jMwMLRh5+
	DFKF6vSd1dKNV1PjcEydD2SnWNUyLutJt8BlxOFKlnQiBQLjiCu0928X4zQGFMIbfgVJ
	0AqEfJirZSqUWYLNFWu0oondUPq58f1tanmr61Gt91E2/+9I/ZkZNZ6WnMLzCSBPkz6F
	6sZbPMWbjhztRWtG3PYGwp17OB1lNi3xAR3yua4c7nHj7yK8S9m0gfcgBq1qojOuw45Y
	vAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GaZWonIRjfqGU5xGxrhi2qB09AUo+iu9jjX0GJVt8Ug=;
	b=SW+K6bkDrOihn4wwy7xLn5CVapKulnM6I9XQw5QwtjfZL1fftSThgLrilkWZPQF5Fp
	2MRBN91QOt/NmBxpRL4qsYUSx4CGlK78dZzd/Yp3DJvNlocCl1WcJlkbxkgPwunDz5cu
	+TPyQ5YOFaNsls26hkv8KcKiP4E1h6pXEnvx6lUuCGzsgnzgl/CU7tVthPK2xmmoVgt/
	Ii8frJYz3ECixaGM5fjlQAph/vXm2qKou4OrFuqnTKPaqJbTufMsUn51JSc6tjt8Gt/E
	wepibdgsQihJea9/b40GsMmO/k27GO2rfveNAPMA1BWfAr2EuVYgTBxxJ85B043gohAy
	G8Xw==
X-Gm-Message-State: APjAAAVNiiL+MWEhwJSkyDBhiivpDCRKlUFDjkiimyxQN8ZiMBDzI0Po
	qa43CrGgSITNZdoNqm6zhNVFILIm
X-Google-Smtp-Source: APXvYqytHgqjGpH9gYqCGuvoFp1O01JhEU8mwVeYNPTMqjSpNtJulARNBogdW60g03knqN6kC+hmmA==
X-Received: by 2002:a17:902:a58b:: with SMTP id
	az11mr107126611plb.147.1578327637449; 
	Mon, 06 Jan 2020 08:20:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:08 -0800
Message-Id: <cover.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [1.44 00/25] Pull request
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Here is the next series for 1.44.
Please merge to 1.44.


The following changes since commit cfa307aabf710d79c404a8571b4158b864a94727:

  runqueue.py: not show warning for deferred multiconfig task (2019-11-29 11:26:07 +0000)

are available in the Git repository at:

  git://git.openembedded.org/bitbake-contrib stable/1.44-next
  http://cgit.openembedded.org/bitbake-contrib/log/?h=stable/1.44-next

Aníbal Limón (1):
  lib/bb: Add BB_SIGNATURE_LOCAL_DIRS_EXCLUDE to speed-up taskhash on
    directories

Chris Laplante via bitbake-devel (1):
  bb.utils.fileslocked: don't leak files if yield throws

Joshua Watt (1):
  runqueue: Batch scenequeue updates

Ola x Nilsson (1):
  prserv/serv: Use with while reading pidfile

Richard Purdie (21):
  hashserv: Add support for equivalent hash reporting
  runqueue/siggen: Allow handling of equivalent hashes
  runqueue: Add extra debugging when locked sigs mismatches occur
  knotty/uihelper: Switch from pids to tids for Task event management
  siggen: Avoid taskhash mismatch errors for nostamp tasks when
    dependencies rehash
  siggen: Ensure new unihash propagates through the system
  siggen: Fix performance issue in get_unihash
  runqueue: Rework process_possible_migrations() to improve performance
  runqueue: Fix task mismatch failures from incorrect logic
  siggen: Split get_tashhash for performance
  runqueue: Fix sstate task iteration performance
  runqueue: Optimise task migration code slightly
  runqueue: Optimise out pointless loop iteration
  runqueue: Optimise task filtering
  runqueue: Only call into the migrations function if migrations active
  lib/bb: Optimise out debug messages from cooker
  runqueue: Fix equiv hash handling build failures
  runqueue: Ensure task dependencies are run correctly
  runqueue: Fix task dependency corner case in sanity test
  siggen: Test extra cross/native hashserv method
  cache: Lower debug level for wold build messages

 lib/bb/__init__.py        |   5 ++
 lib/bb/build.py           |  25 +++----
 lib/bb/cache.py           |   6 +-
 lib/bb/checksum.py        |   5 +-
 lib/bb/fetch2/__init__.py |   4 +-
 lib/bb/runqueue.py        | 137 +++++++++++++++++++++++---------------
 lib/bb/siggen.py          | 104 +++++++++++++++++++++++------
 lib/bb/ui/knotty.py       |  12 ++--
 lib/bb/ui/uihelper.py     |  39 ++++++-----
 lib/bb/utils.py           |   9 +--
 lib/hashserv/client.py    |   8 +++
 lib/hashserv/server.py    |  36 ++++++++++
 lib/prserv/serv.py        |  12 ++--
 13 files changed, 277 insertions(+), 125 deletions(-)

-- 
2.17.1



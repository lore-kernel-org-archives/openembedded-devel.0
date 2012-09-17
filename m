Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TDbcY-0007lW-Ei
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 15:44:18 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 17 Sep 2012 06:31:38 -0700
Received: by oagn9 with SMTP id n9so4809579oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 06:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=9TCaIwQYLD4ZDO2cSdbFjW/pVUYdf4sgEyshSnx/2r8=;
	b=g3LZykGKt2K/EXp1HNtGC898vNoG4jdPJjuxhgVk/fbS3syR+2hEs90QSgw0lHJ7w3
	gtvXh0Byn7jsawxVHOXVROVQ8+wcqUJB+brnggPZXdlFwZyoEuaIg6udzmtIxupIKpsC
	qVkNYA2yj2DaSiOixdoNBNf1P6nVNtiSxX9k3UpGtEa8ZEg+RhzGvcj+CIbAfLt2w4H+
	goe4rlKmCd/pMA6uR3KStIvdMLu43wLc0xLZDGUlLUHBx01+HAY/n5XBefrZTXp8vStY
	cRtESGN2ol366sj8QWjmZzrQxunV4pqGhEMhba6jd4mRYk/naJ/yTo8kbfgTKE4DSI/K
	Qlmg==
Received: by 10.182.193.105 with SMTP id hn9mr11520480obc.11.1347888696831;
	Mon, 17 Sep 2012 06:31:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Mon, 17 Sep 2012 06:31:15 -0700 (PDT)
In-Reply-To: <CALEMqRG1qnHH-whuSm4fhB9x3jS4qS=6wukswge0phcWoOWG9A@mail.gmail.com>
References: <CALEMqRG1qnHH-whuSm4fhB9x3jS4qS=6wukswge0phcWoOWG9A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Sep 2012 14:31:15 +0100
Message-ID: <CAJTo0Lav6fEbsZkz2eh+u6OLAP+-yEEMnrj7qeG3K1h9FxYAQA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQljB1CuiEETpCbSVvLg1h/Aof2SdmMBU45qLiRt3FfSwZnpGSAe3CrkV9zw2rkPa9+BhlDJ
Subject: Re: package gobject-introspection-native-0.9.10-r1: task do_compile: Failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 13:44:18 -0000
Content-Type: text/plain; charset=UTF-8

On 17 September 2012 14:13, Lucas <lucas.gerads@gmail.com> wrote:
> symbol lookup error: /usr/lib/libgirepository-1.0.so.1: undefined symbol:
> g_mutex_lock

/usr/lib?  Broken build environment, that's picking up dependencies
(libgirepository, but the look of it) from the host instead of inside
the build.

But that's not the problem.  The *real* problem is that
gobject-instrospection doesn't work when cross-compiling.  oe-core
master has a gtk-doc-stub package that also doubles as a
gobject-introspection-stub, so I recommend pulling that in/using it
and changing any gobject-introspection-native dependencies to
gobject-instrospection-stub.

Ross



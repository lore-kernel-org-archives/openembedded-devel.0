Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm24g-0003po-LJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 13:51:39 +0100
Received: from mail-qc0-f198.google.com ([209.85.216.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 04:36:51 -0800
Received: by mail-qc0-f198.google.com with SMTP id l35so6451953qco.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 04:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=JPXnpF2VxDn86Bk+aBZN23h9g+oOAZ5r9XZAcZT+54k=;
	b=fliVHXNgCawovRoeyH7IljzoNzdTB4R4kjKzYX5AIDFH6v4uUepPsLb35Kv/G8SHgR
	XVRyT6zKlxUWGbL3SCs402dvx0cCTbklyK7QPHXBHrYrt10JbdNbscMC87SkmvtwCK2z
	aToQ+n1X16r05Td49LKB+STZxylraVbVI7qg98D3vmzySuXgROrHKIQBD870Rs4YSpYB
	lSN/Yavb7mix/PWTW3c052/MQmc4k5rHy8ivx8LLbrY2jXgWEXi82U4MInzTF+seZyAF
	IFYVbcMk7UlfqyQEQSGal/tqME14qfXLFqqoaflV/EDpGAqFGvT8idJAoaSvQLyHbINu
	ausw==
X-Received: by 10.221.10.6 with SMTP id oy6mr17783715vcb.65.1356093409551;
	Fri, 21 Dec 2012 04:36:49 -0800 (PST)
Received: by 10.221.10.6 with SMTP id oy6mr17783706vcb.65.1356093409450; Fri,
	21 Dec 2012 04:36:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 04:36:28 -0800 (PST)
In-Reply-To: <20121221094318.GQ14543@jama.palm1.palmone.com>
References: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
	<1356007963-12208-2-git-send-email-ross.burton@intel.com>
	<20121221094318.GQ14543@jama.palm1.palmone.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 12:36:28 +0000
Message-ID: <CAJTo0LadHbaD1iA7TXRS25EZbV4dbH5Q62mbSJEDZvxEqju+LA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnvmRZcSW/Wma7vQu4kKVXccjXPDb41mzuE+vQNMTNs4vLM7ArzN9YgmVgj8MO6PJwJcmEq9IJyo4dIpprKrCQuXL2aqbMvBSwNtLcb8DidIwto3MHBC+gWP5auAO63hz8jjN242VEoUvDys8mqoec6oHjrRfosG/hKHx0L1WYUl7cXQP1hz3upW3uoLNgwEt4SUgSL
Subject: Re: [meta-multimedia PATCH 1/6] gssdp: add 0.12.2.1 and 0.13.2
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
X-List-Received-Date: Fri, 21 Dec 2012 12:51:39 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2012 09:43, Martin Jansa <martin.jansa@gmail.com> wrote:
> vala-stub-native does not exist afaik, why not use vala-native?

Whoops, that patch didn't go anywhere did it.

commit 2471e89fe8b535c9fb4a1e15cb910d7d14b463b3
Author: Ross Burton <ross.burton@intel.com>
Date:   Thu Dec 20 12:40:17 2012 +0000

    vala-stub: add a stub for vala-native

    Some packages have optional support for Vala but require vala.m4 to provide
    VALA_PROG_VAPIGEN so that autoreconf works.

    vala-stub provides a dummy VALA_PROG_VAPIGEN which doesn't do
anything, so the
    configure script runs and believes that vala isn't present.

    Signed-off-by: Ross Burton <ross.burton@intel.com>

(pending for oe-core)

For software that's written in C but has optional Vala bindings you
need Vala to configure even if you're going to turn it off.  A stub
macro that lets configure run is all you need if you don't want to
build all of Vala (for example because you don't want to pull all of
meta-oe into your project).

I meant to change that to vala-native once I'd added the provides to
vala-stub, V2 shortly.

Ross



Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5854A71C0F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 15:20:12 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id o138so2121773ito.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 07:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9LK3tw/9mU5FKF3zzV9TgfS7NXDkyq8mOzcdfver43I=;
	b=IEHbAI+H/DnIgGVPCayovIFWqV1KOVMirXks3WTAtUt/jdrHdTH0L8N39vmr+3w4qk
	gjs5tZn99zSWtItXQ3Om5046oxr8ApfYg1EUQFptvWvD2toctmT5GQT2VO0rJ5KWY6wt
	pHC+yE1w8hUJzjo4Q5nq5Kw1FuRPMmeqGR569aNwZQW15VLrDIX/Tw5E10CZ6AtoZ2GF
	bghpsNz8kG8K3U+usdT15gwGJgt8GWFZMycNZ6KnytXxbqdt+QOyltRD4zzuMQ6mnka/
	04L1uoaHQP2aEjxiMeJbz4W3KXxHc17jWwpHFOkR1nBrmHohZkfIrR9AUCUsZytK5Q+a
	LxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9LK3tw/9mU5FKF3zzV9TgfS7NXDkyq8mOzcdfver43I=;
	b=Udata6z7KK2A/Frs6pPIvQ+YAWYpg+uABwNDjPoCYhD+fDoJDx/4tgnhb8Pz8u+Y1h
	QKV7RHenzpYXsjYnVVgPoB32eZAGY38QF6s/012VsbmKroSX5v/g1ojsWBz+11b1OBlg
	s26GNBpLv+U78hamhUStC/clZ51Zzl5fqOZ6tx0pEcnKpAosQ9G5GaPjDvtqri5OIOON
	MaJH2nyDLR1EmbucNqHRIMwJIIazfzUqOvvdiISQit/E+1cn3qZmBYt/WfQcmzqOtueg
	GwUXpYSc/LG5dYXgRdNG4qPxV30CUdyuALVh9RHu7WbggJZxHen5Hz8VOr4GtRaBcw8h
	PN4A==
X-Gm-Message-State: AIkVDXIyXAHpEpqQPEviHmvN4vY+ZY6xUc0RQMXxyQTI4Gr+ZoEiBkQ0xez69tIOSLV0Qg==
X-Received: by 10.36.23.18 with SMTP id 18mr10272427ith.48.1484234412415;
	Thu, 12 Jan 2017 07:20:12 -0800 (PST)
Received: from linux-uys3 (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	w188sm1206272itc.9.2017.01.12.07.20.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 07:20:11 -0800 (PST)
Date: Thu, 12 Jan 2017 10:20:09 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170112152009.GA15330@linux-uys3>
References: <20170112144413.GA7854@linux-uys3>
	<8801566a-4012-0323-dc60-6833ab0079a7@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <8801566a-4012-0323-dc60-6833ab0079a7@linux.intel.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: meta-browser duplicate patch
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
X-List-Received-Date: Thu, 12 Jan 2017 15:20:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu 2017-01-12 @ 04:59:20 PM, Alexander Kanavin wrote:
> On 01/12/2017 04:44 PM, Trevor Woerner wrote:
> > Does the do_patch logic now ignore the same patch being applied twice? I was
> > quite sure this was a problem in the past (and if it isn't, maybe it should
> > be?)
> > 
> > In commit fb4e542079958b6afde324a1e9bfdd695842aeeb
> > the patch recipes-browser/chromium/chromium/chromium/Do-not-depend-on-Linux-4.5.patch
> > 
> > and in commit c6fc9da7be64af7cd08c2bbb026e4c3ffc760687
> > the patch recipes-browser/chromium/chromium/chromium/unset-madv-free.patch
> > 
> > are exactly the same. Yet they're both happily applied without so much as a
> > warning, not even in temp/log.do_patch.
> 
> Can you inspect the resulting file? Are the changes being applied twice in
> two *different* locations in the file?

Ah yes, there it is, applied twice:

	 44 #if OS(LINUX) && defined(MADV_FREE)
	 45 // Added in Linux 4.5, but it breaks the sandbox.
	 46 #undef MADV_FREE
	 47 #endif
	 48 
	 49 #if OS(LINUX) && defined(MADV_FREE)
	 50 // Added in Linux 4.5, but we don't want to depend on 4.5 at runtime
	 51 #undef MADV_FREE
	 52 #endif


> We have a bug to fix this issue:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450

Great, thanks :-)


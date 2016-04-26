Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3B26D60119
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:37:03 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id u10so55251036igr.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ccTFHbMuU7w7gYei/fuTd1Erl9x9EGz7VxIaOcYpBxQ=;
	b=xH7aZcf8jZrAtHe+QKa33+TO70VV0WS9XF2PbDJIfQqBVRcuWDvptNcjxghfQO9d47
	+AYpt0LNQEYpWrkroQL2NFkoFJZxNF+5yrNnBVz3s/Yvg6z8DGo8hTAlhIGjcsvKKxrt
	sqqmlUSRxbxN9G2Ihlv167FpwHQC0kNsalBlZ1KEHzQYnXYUaVAZ1ZOG2FzblouykyWT
	nq40z+hfVHTxSr3rhZAXGbhfWnRI+nDlrM3cr3sWmOdYHrR02JREhbOcYDIVM0D21gn5
	guO2dyKIXKOwWEL/YiCHYvzWWoyAHET2EnTPXUXtDxlnmThWunz8d5GBd6WBRQg+A4Pi
	x3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ccTFHbMuU7w7gYei/fuTd1Erl9x9EGz7VxIaOcYpBxQ=;
	b=jY4f2XOJBQsmPuzrSY92Pi0lV3sCgkyeGfO2isxPT36kSnnwcNDJoBaUch1E2UWgdq
	qjUj+jcKLtgk+6tbHWQIOLXFAfQawE39hv2irEOYItoaLHenswf/42l8u+Z8rn1pZG9c
	fWMf3/baQOlePvl6evC56tav4otE2W2HiPyOiNOYn2diWQHEAS5BcFjr4JtPo1iEz/W3
	id8HWtej5Il5uddee9Rgy2wM/9VVWenl7Ij9H6WEM8uzuvHKurbBTLT0qzCEzSfMyqMA
	Ec3Vk40RpEcELzSAw9PMsC1uD1VygCkWMqjw9pBmvjQm7HY5vtO8gBkcMjxz4H4v+m3X
	JCpg==
X-Gm-Message-State: AOPr4FVd81uYu6Rxzt0LK8PhBvnMOoWRsuEpSwYKJs62lbM0YhJhgWztPpx8agNIlTh+IsRAPjppxnRH10g6nftG
X-Received: by 10.50.233.40 with SMTP id tt8mr22721517igc.78.1461706624288;
	Tue, 26 Apr 2016 14:37:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Tue, 26 Apr 2016 14:36:44 -0700 (PDT)
In-Reply-To: <1461697722-20378-1-git-send-email-mark.asselstine@windriver.com>
References: <1461697722-20378-1-git-send-email-mark.asselstine@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Apr 2016 22:36:44 +0100
Message-ID: <CAJTo0LYyrrO+5277fe2q3wZ8Z_JEsxU=0OqyXu5b7CK9hsh_GQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] mozjs: fix configure host contamination
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
X-List-Received-Date: Tue, 26 Apr 2016 21:37:05 -0000
Content-Type: text/plain; charset=UTF-8

On 26 April 2016 at 20:08, Mark Asselstine <mark.asselstine@windriver.com>
wrote:

> | Traceback (most recent call last):
> |   File "./config.status", line 9, in <module>
> |     from ConfigStatus import config_status
> |   File
> "/build/bitbake_build/tmp/work/corei7-64-wrs-linux/mozjs/17.0.0-r0/mozjs17.0.0/js/src/build/ConfigStatus.py",
> line 11, in <module>
> |     import sys, re, os, posixpath, ntpath
> |   File "/usr/lib/python2.7/ntpath.py", line 15, in <module>
> |     from genericpath import _unicode
> | ImportError: cannot import name _unicode
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /build//bitbake_build/tmp/work/corei7-64-wrs-linux/mozjs/17.0.0-r0/temp/do_configure/log.do_configure.1056
>

I'm not sure using pythonnative is the right fix here.  Executing python
using the host python should just work, so why does importing ntpath fail
using your host python?

What happens if you run the host python in a terminal and do "import
ntpath"? Does your host's python have a crippled class library or is broken
in some way?

Ross


Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E8EA960132
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 18:18:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 18 Mar 2016 11:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,356,1455004800"; d="scan'208";a="927197482"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2016 11:18:58 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 951506A4006; Fri, 18 Mar 2016 12:06:43 -0700 (PDT)
Received: from 10.252.7.138 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 18 Mar 2016 21:06:43 +0200 (EET)
Message-ID: <51386.10.252.7.138.1458328003.squirrel@linux.intel.com>
In-Reply-To: <1458166402-10786-1-git-send-email-schnitzeltony@googlemail.com>
References: <1458166402-10786-1-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 18 Mar 2016 21:06:43 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: [PATCH 1/2] gnome-bluetooth: fix compile
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
X-List-Received-Date: Fri, 18 Mar 2016 18:19:01 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> fixes error series starting with
> | Caught exception: <type 'exceptions.TypeError'> TypeError('expected a
> string or other character buffer object',)
> | >
> /home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py(22)<module>()
> | -> PREFIX = os.path.normpath(sys.prefix).replace(
> os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )

Both this patch and the second one should be replaced with a patch that
simply adds

inherit gobject-introspection

to the recipe. For some reason I forgot to do that in my g-i fixes patchset.

Alex


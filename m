Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PNscn-0001OC-14
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 20:45:57 +0100
Received: by fxm17 with SMTP id 17so4974010fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 11:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=X8vyAga79Msmsy/1ulJFvySMoaRu6osEtvooLQdVP0E=;
	b=x4k4EIUgbVqT3ei9u5pD0Tyo5LC4X9OzZ1MQsC/l34xQqmJq+UNL7Qe1G79OOwM/lt
	ia390uRxhJdygmVwOAaOl+js4JpK3IXGkmwH9xNVUNuAmNaoP5XcTnZC1aqlc9hkQeUs
	DZB0jB9Ejlk0M7oG15n04oePx+5OJ9CIYvYnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=A2V51a2/kNMVf/leDiDQ0kyeKozcuXUx2nS8UJLWDGKZf/WXA/or0xv/bnsMUbo3YV
	CMNL3L3BLzf4Y0gqnujL40agBwQOVTUMGODnJJFcmm2n0XBIikk0a8z+IKbg3gqmYWVn
	VU4Hrr2UGzupIm8QqJeQXjHlF0w3OfT1aFkfk=
Received: by 10.223.97.10 with SMTP id j10mr8787425fan.112.1291232669151;
	Wed, 01 Dec 2010 11:44:29 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id y3sm166279fai.14.2010.12.01.11.44.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 11:44:27 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PNsbJ-00007i-DK; Wed, 01 Dec 2010 20:44:25 +0100
Date: Wed, 1 Dec 2010 20:44:25 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Tom Rini <tom_rini@mentor.com>
Message-ID: <20101201194425.GA6145@mx.loc>
References: <4CE682D4.1040304@mentor.com>
	<1291230954-31990-1-git-send-email-rep.dot.nop@gmail.com>
	<4CF6A16D.10206@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4CF6A16D.10206@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 0/3] ext4 image support
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
X-List-Received-Date: Wed, 01 Dec 2010 19:45:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 01, 2010 at 12:26:37PM -0700, Tom Rini wrote:
>On 12/01/2010 12:15 PM, Bernhard Reutner-Fischer wrote:
>>Changes from previous iteration:
>>o factor out e2fsprogs.inc changes into separate patch
>>o use do_install_append_pn-e2fsprogs
>>
>>Bernhard Reutner-Fischer (3):
>>   e2fsprogs: add 1.41.12, remove old versions
>>   e2fsprogs: fix alternatives of non-packaged native sysroot
>>   add ext4 image support
>>
>>  conf/bitbake.conf                      |    4 +++
>>  conf/local.conf.sample                 |    2 +-
>>  recipes/e2fsprogs/e2fsprogs.inc        |   42 +++++++++++++------------------
>>  recipes/e2fsprogs/e2fsprogs_1.41.12.bb |   10 +++++++
>>  recipes/e2fsprogs/e2fsprogs_1.41.9.bb  |   10 -------
>>  5 files changed, 33 insertions(+), 35 deletions(-)
>>  create mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.12.bb
>>  delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.9.bb
>
>Whole series is:
>Acked-by: Tom Rini <tom_rini@mentor.com>

May i ask you to push them (i think i have no write-access to oe, just
bitbake)? Khem?
thanks,



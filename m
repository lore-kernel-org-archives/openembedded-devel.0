Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 09EED71B85
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Dec 2016 01:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id D742D31C2255;
	Wed,  7 Dec 2016 02:57:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id nLbXmZ8tZYPH; Wed,  7 Dec 2016 02:57:10 +0100 (CET)
Received: from [172.22.22.61] (55d40c51.access.ecotel.net [85.212.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 136C531C207A;
	Wed,  7 Dec 2016 02:57:10 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1480507543-21520-1-git-send-email-obi@opendreambox.org>
	<20161202083248.GC3721@jama>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <ca559e68-43b4-312a-fee2-8ec8f2083d0b@opendreambox.org>
Date: Wed, 7 Dec 2016 02:57:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161202083248.GC3721@jama>
Subject: Re: [meta-filesystems][PATCH] xfsprogs: unblacklist and update to 4.8.0
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
X-List-Received-Date: Wed, 07 Dec 2016 01:57:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 02.12.2016 09:32, Martin Jansa wrote:
> On Wed, Nov 30, 2016 at 01:05:43PM +0100, Andreas Oberritter wrote:
>> A patch similar to drop-configure-check-for-aio.patch was applied upstream.
> 
> Khem already sent 4.8.0 earlier and I've merged his version today.
> 
> Can you rebase on current master to see if we still need anything from
> this?

Khem, your version fails to build for me (glibc; default PACKAGECONFIG):

| .../xfsprogs-4.8.0/libxfs/.libs/libxfs.a(xfs_alloc.o): In function `platform_uuid_compare':
| /usr/src/debug/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/include/linux.h:89: undefined reference to `uuid_compare'

The error disappears once I remove link_needed_libs.patch.

Regards,
Andreas


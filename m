Return-Path: <dhylands@gmail.com>
X-Greylist: delayed 1615 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 May 2014 14:48:13 UTC
Received: from mail-yk0-f181.google.com (unknown [209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 074F66FCAE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 14:48:13 +0000 (UTC)
Received: by mail-yk0-f181.google.com with SMTP id 131so337759ykp.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=dh6KdaeIq2a6vPptM9Guj5keLvWYL2YpS/WdSpPqSks=;
	b=UzRJr01To09ercRIgA6bGMH9L+E+xn/uCUrFVqeClIX69QboCFY4ABJ3sRpEoeKfEO
	lMkrFPbpWlOz5W9T8mMvSC7RFZ9ahq6WsXjsw0axHRhXSRBicHLHug2wkD6ld1oFQTwf
	H1HZ02ApSBPg+ol1u2KhwOiLo067LfesfMhjLo3+AhRKvjsZYlxOx5VLFimtKt9ddkYc
	YEMuXVRnOf6x/GCwv86c9RzKdDI0t9RRn0XF+nFQJXT758yhe1am9zRuVL6fRahqz5Hb
	mTnxUj7fJ/J7VfJsUnl0JPXI1um/M+wE+bPCqvQjwP5EeB8fyfw3roclpHJM07J+TnyH
	4ASA==
MIME-Version: 1.0
X-Received: by 10.236.180.169 with SMTP id j29mr10626140yhm.47.1401373279055; 
	Thu, 29 May 2014 07:21:19 -0700 (PDT)
Received: by 10.170.110.136 with HTTP; Thu, 29 May 2014 07:21:19 -0700 (PDT)
Date: Thu, 29 May 2014 07:21:19 -0700
Message-ID: <CABi1daHuRYWXAy629iwuUJfUwsQxDWaS3B8zdUO+sks4_fL8BQ@mail.gmail.com>
From: Dave Hylands <dhylands@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Issue with x264_git.bb
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
X-List-Received-Date: Thu, 29 May 2014 14:48:20 -0000
Content-Type: text/plain; charset=UTF-8

I've been working with the Intel Galileo, which I think is using the dylan
branch.

The meta-oe/recipes-multimedia/x264/x264_git.bb file contains:

SRCREV = "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"

which appears to no longer exist in the git.videolan.org repository. I
found this tree on gitorious:
https://gitorious.org/gxk-media/x264/commits/1cffe9f406cc54f4759fc9eeb85598fb8cae66c7
which has the correct hash, and by comparing the description, I was able to
determine that the corresponding hash in the current git.videolan.org
repository is c6bfcec47c9d1fff0489a30215501babea29f59c

I wasn't quite sure what the development procedure for this repo was, so I
thought I would raise the issue and ask how to proceed.

I'm happy to do a pull request. I noticed that x264 doesn't seem to exist
in the master branch, and I wasn't sure of the significance of that either.

--
Dave Hylands
Shuswap, BC, Canada
http://www.davehylands.com


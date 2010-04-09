Received: from smtp-out.google.com ([216.239.44.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alees@google.com>) id 1O076J-0008WV-3p
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 07:49:56 +0200
Received: from hpaq11.eem.corp.google.com (hpaq11.eem.corp.google.com
	[10.3.21.11]) by smtp-out.google.com with ESMTP id o395kWVl010847
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Apr 2010 22:46:33 -0700
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1270791993; bh=WLG1WJSwNwr3kNFwA7DDHzVTEZg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type;
	b=rWb+h9vHRvSA2ZNnSyOSnJVtXlPqR1ggR4nQR1tYvngrmPsmGQWEWXvAa5PRQASgy
	zay23vv62/ZtoZAsgqTsg==
DomainKey-Signature: a=rsa-sha1; s=beta; d=google.com; c=nofws; q=dns;
	h=mime-version:date:message-id:subject:from:to:content-type:x-system-of-record;
	b=v8l9By9/Iajfc+e30uQkc81n5xnjptXJpc/qpQmuuJ7OwKa8WQqEWzF6SwNXfiHf0
	hInJO7OgPBP1Lq2RpxhTw==
Received: from gwb20 (gwb20.prod.google.com [10.200.2.20])
	by hpaq11.eem.corp.google.com with ESMTP id o395kUTn027500
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Apr 2010 07:46:31 +0200
Received: by gwb20 with SMTP id 20so1669631gwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 22:46:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.218.1 with HTTP; Thu, 8 Apr 2010 22:46:30 -0700 (PDT)
Date: Fri, 9 Apr 2010 15:46:30 +1000
Received: by 10.90.242.11 with SMTP id p11mr421422agh.75.1270791990528; Thu, 
	08 Apr 2010 22:46:30 -0700 (PDT)
Message-ID: <n2ue96fffc41004082246g4269c2d2nd6aa9f3e7260db27@mail.gmail.com>
From: Angus Lees <alees@google.com>
To: openembedded-devel@lists.openembedded.org
X-System-Of-Record: true
X-SA-Exim-Connect-IP: 216.239.44.51
X-SA-Exim-Mail-From: alees@google.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Initial work on an Android SDK via openembedded
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
X-List-Received-Date: Fri, 09 Apr 2010 05:49:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just an FYI:

I put together an alternative Android NDK using Openembedded:
 git://github.com/anguslees/openembedded-android.git

It currently uses the prebuilt Android libc (bionic) and various tools
from the Google Android NDK/SDK, but builds gcc, etc from Openembedded
source.  I expect to expand it to build the other pieces from source
eventually.  I had to patch the gcc and other recipies a little, which
is why it's a git branch rather than a self-contained bitbake
collection.

This is my first-ever look at bitbake or openembedded, so apologies if
any of the recipies are atrocious ;)

(Totally unsupported by Google.  I work for Google but don't work on
anything to do with Android - I just happen to have an Android handset
and a desire to write native apps for it in my free time)

-- 
 - Gus



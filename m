Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBnqq-0006r4-IJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 16:23:36 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 12 Sep 2012 07:10:42 -0700
Received: by obblz20 with SMTP id lz20so2689458obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 07:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:cc:content-type
	:x-gm-message-state;
	bh=YNTFzr9yaU06SFHCrSxW1Iw7+bclFVRrWcN0HgmwNEc=;
	b=kZ5DWfHaAzqbGQ9u1YaMQ76l9FGQMgDCcsTCuX2QYvVmcMM/nbuSECWPkDz2cTYqns
	Vy8J3gLlrOpORwAZWSWPRveiCt2ET8btn4keejpeijd1+nlDACidQM7xuEWLZCCDJlgx
	Gr8i39PWAxTxjexej8kaU/WaUUsVpjNmhSzvM0VeFczbnWfrOAPtfWCQiy6Mj1xfOkBI
	sK960b7FYVwTdPojTPTa8MPgcAtgbiwgXqq8JSAmvoUkYByUJHvjB7/+0CbMzKvWJ95S
	yksvwd1azG2+T65OKGPmAYzlXT8UMKPyqwBKkGchXgkmOhe0OmNG0ZrG1doAOpZ1lmXW
	aNkg==
Received: by 10.182.154.70 with SMTP id vm6mr23136680obb.50.1347459040671;
	Wed, 12 Sep 2012 07:10:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 12 Sep 2012 07:10:20 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Sep 2012 15:10:20 +0100
Message-ID: <CAJTo0LbTipjuhpvyxgL1Z=WTn0yHNcLB4tQqcQeXCUth8ygWkA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQnLqOYRvP+YhYqzqGfv3iTQpXMxzqEEijWrqcRob9ByMPti6lHF/FftuebDDvTm1YAl8tvH
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: libx11-diet removal
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
X-List-Received-Date: Wed, 12 Sep 2012 14:23:36 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2012 14:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I don't think there are many such users so I've merged the series. We've
> had this mess around for a long time, keep talking about fixing and now
> someone gives me a patch series so I really just can't resist ;-)

Thanks, Richard.

The final question is do we keep libx11-diet?  It is substantially
smaller but the stubbing does knock out some non-deprecated
functionality - as far as I'm aware both GTK+ and Qt fail to
initialise with libx11-diet.

Two options:
1) delete it from oe-core
2) whoever actually uses it can have it, moving it from oe-core

I'll do (1) soonish unless someone speaks up in it's defence...

Ross



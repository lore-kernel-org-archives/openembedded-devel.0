Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6YpQ-00048u-V6
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 03:11:43 +0200
Received: by wwe15 with SMTP id 15so290731wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 18:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=YteCw0+oEMTfGUnl4myrp58mvctbXcwQ7rrKlrPjIKw=;
	b=PPO65rjUsWXzsrUXaJgTL29tlcioAs/HYYuAcxBtcdgF7KpYM1NQITCJ+1khdv1NxG
	pZLEpuW4kYIQ5aVZaf5/Rv0hcfawXYNkw31OqLD2WBSUzKNQNHFrInA1/nN+MZ9WtZlH
	dmhUcxx0iRwCvmng7xrXVxOQRH0V9F7lR84f8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=MUS9jSSlGTLHc7I/lKmEKpJUVJpbDcyUnLbhj/N60E4bfMM3r6OTFEumXKsjvAYoqc
	vt4GLA5wpQFLkkQMtVwSGTYJcgFRjJtkmiqGOfg4QCXF8V1YKojWbjEYdfuMBjMqzMJt
	cQIR4kwd+0HSUmoCgmOr3l+zMDXmhh2jSlPzU=
Received: by 10.216.54.16 with SMTP id h16mr38560wec.6.1287105054301; Thu, 14
	Oct 2010 18:10:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.0.142 with HTTP; Thu, 14 Oct 2010 18:10:34 -0700 (PDT)
In-Reply-To: <AANLkTinEFsqLJX70P6OTSOo6tPR2Hr+=3nwpttHPt3gD@mail.gmail.com>
References: <AANLkTinEFsqLJX70P6OTSOo6tPR2Hr+=3nwpttHPt3gD@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 14 Oct 2010 18:10:34 -0700
Message-ID: <AANLkTimPmCKtFyjVn=So5qk=MGx3_07JBMTWxOhVG=_j@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [ANNOUNCE] BitBake 1.10.1
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
X-List-Received-Date: Fri, 15 Oct 2010 01:12:02 -0000
Content-Type: text/plain; charset=UTF-8

Greetings all,

There is a new 1.10 bugfix release available: 1.10.1.
As usual, there is a tag in the git repository, as well as pristine-tar
metadata, and of course the release tarball is available on berliOS:

http://download.berlios.de/bitbake/bitbake-1.10.1.tar.gz

Changes in Bitbake 1.10.1:
       - Fix IndexError encountered when a 'depends' flag references a
         nonexistant task. (from master)
       - Fix clean of the environment. (from master)
       - Fix bug where a failed fetch could result in a "local file does not
         exist" error, rather than the real error. (from master)

Thanks,
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


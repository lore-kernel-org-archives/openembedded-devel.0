Received: from mail-ob0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TtG6F-0001Zc-3A
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:15:22 +0100
Received: by mail-ob0-f169.google.com with SMTP id v19so397950obq.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 02:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Fn2WkgavcEvofu/RQBddtPY5Grqx/8rFS4seLbSMxCs=;
	b=O89qVLXmqKbCHAKy60Zh0HAxFxhDTxEKH6OCmQX3sMhLNnaLS7h+k4WHqp7gIS1TAn
	wfVjzraTVfWhE9hMAaBFA+jJDn8R7VDT4Zwfs6h/Pgo9003lHvC4a6DtysscT0PkyVjp
	7hXOO2cxvXiPDcAAuRrTDj+fCNlWJiVE0tqMset4+VHHBZc7h4UVQia8Z4sxF7xoekSu
	vtgjSW7fcai1UQ+czjsp+kOKqTbMnxihGDYxA0H4TZXg9+VjJtbT51DKsKxRz21tCVI3
	IpaSuOPO+9owYQ8ZclOaCR9sDXeo8k25wwBGWWbkgWO6GsmjB22xqlcDiv2s9rT8W54g
	55aQ==
MIME-Version: 1.0
Received: by 10.182.152.4 with SMTP id uu4mr49963910obb.85.1357815593406; Thu,
	10 Jan 2013 02:59:53 -0800 (PST)
Received: by 10.60.54.34 with HTTP; Thu, 10 Jan 2013 02:59:53 -0800 (PST)
Date: Thu, 10 Jan 2013 11:59:53 +0100
Message-ID: <CAGiJk9d25RWg6UB-wO5Eg3M80MWjBhu6Kk=pVKbMzAaS440WKg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Disabling sstate cache generation
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
X-List-Received-Date: Thu, 10 Jan 2013 11:15:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

what is the preferred way to disable sstate cache generation?

In my use-case the build machine doesn't do incremental builds (e.g.
it only does builds from scratch)


--
Regards
Samuel



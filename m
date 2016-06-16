Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE0060589
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 09:09:06 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id e5so41640688ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 02:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=sJ9yGuLNVUETg9uRcqGV/qsAlGll2mCgrHi6v7ZWFAY=;
	b=VKWxOeuG81tKRvj6SsgEpBkbbX8diQRuusD8tpsrTTgS538kHxVFmuzjyLIstlJqkZ
	UYq8q5ggKGPb17iG/00LUgLIqR9oOpc9NbVere7KnizGTC75Vp1PfU4HNXafsH/JCq9I
	Kx+tggbL3qMwSyJ88YBu0b+uMm5XpRld5OZvVePaRQ5/TuMEvgxJVFgfTTHNtcH6kbDA
	IjmphdgboHoaiOMcjpJUU/2FgF5axzMJNkrb/saQAEzPXg6BLOPE71uvvk9k0TgUhceK
	HH9GAPMGMrNkLqbR3uCY4TiBWNQunyguEoehQwJJjUBWphBk1bcQ5rDwPck2RBTRRVsM
	5QHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=sJ9yGuLNVUETg9uRcqGV/qsAlGll2mCgrHi6v7ZWFAY=;
	b=NxNvA6Db6R1z87LZyUUp0hiDn4YwyKPLC3QmJGBHGXT4wpaxzwhjzj/v1TxJw9OIfQ
	iH0psotZKt7/2ug2yDnqMCbvCN89cuG0bo30xws7tPTyr18F3Srdu3+6Jm1OSqHsgFnz
	LhHZQ/Yu+c2+6juu4nxa8VB8oP46B2O/W6zYx017dKJn8UC3ELf95hlFa6qHxWLFtCr/
	Jp/vmufA25SLbrrxvCmD3vWguAa+oDqPGx7zMKG8kPJ0k5L5MP75uVbwcC0w04Zuwd/f
	NsDczN9nveTcFItA1J1m/vZqEOBy8Tk36cddSQwziviuMO5pvMTRmNpzd8ohteAG/dyB
	l0jQ==
X-Gm-Message-State: ALyK8tIMexni3/FcMU3+6ak+Eifqd8FRLXZyplDF0rnKQoTTo5JgvSWU/59gph6uSWCGuM9j
X-Received: by 10.36.16.67 with SMTP id 64mr5941478ity.88.1466068146537;
	Thu, 16 Jun 2016 02:09:06 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D8A2.dip0.t-ipconnect.de. [93.232.216.162])
	by smtp.gmail.com with ESMTPSA id
	w189sm3178473itc.1.2016.06.16.02.09.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jun 2016 02:09:06 -0700 (PDT)
Message-ID: <1466068144.19334.34.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jun 2016 11:09:04 +0200
In-Reply-To: <1466003282-21411-1-git-send-email-patrick.ohly@intel.com>
References: <1466002419.9543.1.camel@intel.com>
	<1466003282-21411-1-git-send-email-patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/2] libgphoto2: fix compatibility with libjpeg-turbo
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
X-List-Received-Date: Thu, 16 Jun 2016 09:09:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-06-15 at 17:08 +0200, Patrick Ohly wrote:
> +Upstream-Status: Submitted [https://github.com/gphoto/libgphoto2/pull/64]

FWIW, the patch was merged, so "Backported" is now more accurate.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.





Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id B3338772CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 13:29:44 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id j13so106532120iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 05:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=nDiA4CnNydSQh/QV6l+YTnxtht24Y4nd534GMaxDfuc=;
	b=fGEvt/Bl67j2kU2bjAuK+FQAtJjyba2nKlL8WTZp5bqXn+09pB1aK/xImb0HaGL/vO
	QHRJ1MQmaYV60oPQNZe42DZZY7uZYZlsxrfVop2Fd5EkBGm5TEUOs6Rx3lnUcka8TwVg
	bbSD+1t9KHREIKyR0VwdDeOy8aUzaIWCMaQ2Efbkie19sVV5DqJEBTN28iS/UZxzjssl
	fh3EhcsaBu921vaWuFm8AAhqiNe1N8irpQPy0fupXcMVEQIU/Gh5Rsw46RJppfYCc/ax
	BpP7aiijDWV2cfC1TNMrpuLJ3vGeNqQuodN8D4QTnpKxght0HPGMpclnuyLYZq9Rw+OT
	ZgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=nDiA4CnNydSQh/QV6l+YTnxtht24Y4nd534GMaxDfuc=;
	b=QTDiNzvIatxBcotneT8Ja8U7LrljBRegH9VAmcb7KBGCGt3FqbCMYzjs6pl+mzEQ0B
	+UU/yZf5CP6C8i9obtlV2VpwfLs6UGGX7s1BVjrA1SlOhclnGe5i96ENfImqCM2tE9Uw
	fbecpFnyQKPnyLbNmqZQmtI2nYUm0xNIXSsbsInRggPqk81cVgq+xpjS9HHRCzPYcJAl
	hq6JJhaYVi9Xkk4o2f/+P2b27EGEdLMmjS64UAXhCNVYo2sR8DWDw+EaUa48DzbWD+Ls
	m99ZNatO+oh4GdcPSVB6ftiB0BhyT3TRBZTP+I3+zzzLm5OJagOG1Acqf0boXjpJv/oN
	caoQ==
X-Gm-Message-State: AIkVDXKvyEOB2L/zz6bryBbd3mTKlJ0Gdku77etAg8PKOUE5od0XYsE5EQ4zzWGueSFE+aJW
X-Received: by 10.107.173.133 with SMTP id m5mr19079575ioo.186.1485782984277; 
	Mon, 30 Jan 2017 05:29:44 -0800 (PST)
Received: from pohly-mobl1 (p5DE8CDEB.dip0.t-ipconnect.de. [93.232.205.235])
	by smtp.gmail.com with ESMTPSA id l3sm8174011ioa.31.2017.01.30.05.29.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jan 2017 05:29:43 -0800 (PST)
Message-ID: <1485782980.20333.132.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2017 14:29:40 +0100
In-Reply-To: <20170130121805.GA13746@jama>
References: <20170127101200.25785-1-patrick.ohly@intel.com>
	<20170130121805.GA13746@jama>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH] multipath-tools: update to 0.6.4
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
X-List-Received-Date: Mon, 30 Jan 2017 13:29:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-01-30 at 13:18 +0100, Martin Jansa wrote:
> On Fri, Jan 27, 2017 at 11:11:23AM +0100, Patrick Ohly wrote:
> > No particular reason for updating besides following upstream.
> > 
> > Only kpartx has been tested after updating! Seems to work as before;
> > unfortunately that means that as in 0.5.0, "kpartx -d" doesn't do
> > anything.
> > 
> > Upstream refreshed the COPYING file, hence the checksum change:
> > $ git log --oneline 0.5.0..HEAD COPYING
> > bf05f63 multipath-tools: replace COPYING with a fresh copy from gnu.org
> > 1d6c88a Update FSF address
> > 
> > The QA error that do-not-link-libmpathpersist-to-TMPDIR.patch fixes
> > no longer occurs because upstream changed that particular part of
> > the Makefile.
> > 
> > A new patch is needed to avoid building libcheckerrdb, which depends
> > on the (currently) unavailable librados.
> 
> FWIW: it would be even better if you mark
> https://patchwork.openembedded.org/patch/136518/
> as Superseded as patchwork is where I take patches for master-next and I
> need to remember that there was e-mail reply for this one that it should
> be ignored.

Thanks, I'll try to remember that going forward. Would have been a nice
testcase for

[Patchwork-Status: Superseded]

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.





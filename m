Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3B43E65C91
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jan 2015 03:11:02 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so21724060pdi.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 19:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=fppDqTOfFpXPjDN39g7svuragzVoNEpnWgWGtFhc9j4=;
	b=iy2GPHs4DvXAg5SZFtarHDzgTLfW0o2CtqC1Yu5QAkZm54EoHASqCOqncth6kMoH65
	6Y978beamaThTXVVzOD50/b7a/h/3vvuff2acJ/MQCki9erhG1x7LKTTr6h50kG7kv4k
	Cl6n6CAm8BnCWIpFNOjVRdgf6Ln7YPQ0qtOKr+4WLHQK9IYJljzKyIsIYVLw/5K7RVlh
	xvV9Wk1rIQYKz6F58UIRlE2xEwPnCXtfXr+9wCPgnf3r7UiaPDHRbcsq1ohGafG/djzc
	QBmzHRZ/zPCtnjMUzfHX2fuenfJzzT4PjZqR8e3MUwOn2eSW8QgiN9S4yIHtup+0B7fG
	OyEg==
X-Received: by 10.70.128.173 with SMTP id np13mr110506198pdb.15.1420081863365; 
	Wed, 31 Dec 2014 19:11:03 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:57d:8d0:eedc:6d7a?
	([2601:9:3580:84c:57d:8d0:eedc:6d7a])
	by mx.google.com with ESMTPSA id
	by8sm40524432pab.25.2014.12.31.19.11.02
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Dec 2014 19:11:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1419965292-10709-2-git-send-email-ben.shelton@ni.com>
Date: Wed, 31 Dec 2014 19:11:01 -0800
Message-Id: <217FC2A1-7DF3-4FAD-8F0D-500FCDB83B35@gmail.com>
References: <1419965292-10709-1-git-send-email-ben.shelton@ni.com>
	<1419965292-10709-2-git-send-email-ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1993)
Cc: Guy Morand <guy.morand@netmodule.com>, Guy Morand <morandg@gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] iperf3: Adds git and 3.0.8 version
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
X-List-Received-Date: Thu, 01 Jan 2015 03:11:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> On Dec 30, 2014, at 10:48 AM, Ben Shelton <ben.shelton@ni.com> wrote:
> 
> +PV = "3.0.8+git${SRCPV}"
> +SRCREV = "${AUTOREV}"

bad idea to use AUTOREV unless this is DP = -1 recipe
otherwise its preferred to have a locked rev for less craziness.



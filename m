Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0D775D52
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2015 23:34:35 +0000 (UTC)
Received: by ieik3 with SMTP id k3so3007937iei.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2015 16:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=cHXqfpTrZtjMjFHP/VJ0JDfBP8RZCiiukEGKhA5IUMc=;
	b=BqCT3R7LMoS+NXygHTnrwrBN8WFBPjULLwL5qOVWDdRa2ngkFv5+sg2/l2b8cYj/1W
	4aaQX5AFZXgoyDUuF3KAMl+GHS00qnKErHZrDQ1gtuoEy2u6F/cUpFm0qFRiJqBDiF9h
	0L3uBeBR6jYTwI0+ySy1LH8DsDbj8pN7QnyOX8lZVtQPAfv2kFQFBpVDMLFzinX6kFSI
	HXQMJbtYD/6/dID1NRZniMoYlxUh3rgfa2XjPzOeu7FDJJ+yl9oi9IeFe7qz3UbliAPx
	s5UOXnsmuJhgTmvyNWA1D//GZ4pAp7SVSgDHPHqrc8ufp88fnVkpq6Mr1M5g7ZQDrBOz
	hnxw==
X-Received: by 10.107.132.215 with SMTP id o84mr10519702ioi.36.1436657675699; 
	Sat, 11 Jul 2015 16:34:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sat, 11 Jul 2015 16:34:06 -0700 (PDT)
In-Reply-To: <559DCDF7.3020003@windriver.com>
References: <1436234152-4937-1-git-send-email-rongqing.li@windriver.com>
	<mnfurd$pvc$1@ger.gmane.org> <559B8063.7010906@windriver.com>
	<mnir45$f4q$1@ger.gmane.org> <559DCDF7.3020003@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Jul 2015 16:34:06 -0700
Message-ID: <CAMKF1so433uHtgyMAdGL5CF6H=Sege_Qn8tQ900s8mmtxoupAw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking][v2] znc: upgrade to 1.6.0
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
X-List-Received-Date: Sat, 11 Jul 2015 23:34:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 8, 2015 at 6:27 PM, Rongqing Li <rongqing.li@windriver.com> wrote:
> lots of recipes under oe-core is using this style { PV=version+git}

There is a pattern for using PV+git and that is when you are not at a
release point but somewhere between two releases
so it facilitates package updates when next release comes out. Its
better to not use it if you are on point release.


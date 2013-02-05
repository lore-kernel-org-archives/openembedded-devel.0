Received: from mail-vc0-f170.google.com ([209.85.220.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2hHJ-0003Jr-9H
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 13:05:40 +0100
Received: by mail-vc0-f170.google.com with SMTP id p16so25919vcq.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 03:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=q8VxVBVyOj9AGFZQL7bquwNuQm4dQWdGI6nMIXh93H0=;
	b=k41nuxcZ2LrfRdcqtPVZVEftewZ2vW4nSePtBvoGlPmMIs5EJV4ap+byl4ZJl2OTk2
	dDot5wiYrlNFEvOPAwNJprUgscrcmOp3FLmVeTU6IrpYr3kKiTmZRoYRUIUgVUBhtxvb
	yAjD0iIpwQ65KWFF97P4XlVNsN9rNcFC0CX44oIqxfWT6OkQDgBJTFVlyRSHW9Lhfrv5
	MWby3vlt1YDim3PkNSdfrgx+CmHt6jU1QY2HLUrBhqRdtD1Ht3jHZCEYzXXuqAbews3c
	Bzrio+wkonRQEySEf4IyS+iEgs7+CKHnnRuLRDcrt5pEHxuH0XL/tO08R3XIFs2w20xF
	Lh0w==
MIME-Version: 1.0
X-Received: by 10.52.66.168 with SMTP id g8mr24105156vdt.27.1360064983533;
	Tue, 05 Feb 2013 03:49:43 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Tue, 5 Feb 2013 03:49:43 -0800 (PST)
In-Reply-To: <20130205112251.GO3271@jama>
References: <1360062139-10894-1-git-send-email-andrei.gherzan@windriver.com>
	<20130205112251.GO3271@jama>
Date: Tue, 5 Feb 2013 12:49:43 +0100
Message-ID: <CALbNGRSpp0mq7e7ZUR-+yDpaq8XWSsfRiMMUyt1QAJwY13VYQQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [meta-oe][meta-systemd][PATCH] wpa-supplicant: Add bbappend to package systemd service in a -systemd package
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
X-List-Received-Date: Tue, 05 Feb 2013 12:05:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 5, 2013 at 12:22 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Feb 05, 2013 at 01:02:19PM +0200, Andrei Gherzan wrote:
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
>> ---
>>  .../wpa-supplicant/wpa-supplicant_2.0.bbappend     |    7 +++++++
>>  1 files changed, 7 insertions(+), 0 deletions(-)
>>  create mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
>
> oe-core wpa-supplicant now installs wpa_supplicant.service to PN, is
> this SYSTEMD_PACKAGES correct now?
>
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-January/043675.html
>
> --
oe-core has set facts. The decision systemd or not is made by
DISTRO_FEATURE. I think we have to follow that (=let meta-systemd die)
to avoid two concurrent systemd enable mechanisms.

Andreas



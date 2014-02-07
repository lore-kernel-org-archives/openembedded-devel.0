Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 95C946CAD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2014 09:27:55 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id i11so3882952oag.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Feb 2014 01:27:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5DohPhcH7+E0C7cYpHRPXfz9PjMgq9+TxnozwOtmC2M=;
	b=VTCUbDkO5Qrum/ThK6Q1e5i62m0j3whFTYahh4Go6FjINfaxH6E+vr05NG/88CANS5
	/O/Bff7+URSZeliAXdh9Y/0VpNEEC5fUmEl3XU/q6vwH0mQhy2Bc5RzeP8ixWSJcS7mH
	xoAbu82nvLVucleb/WVlnOYW8cuTnN33TlYPYrgBrYC3ENCNWT0CGf8WiH193WXvKY0h
	7otUkge9Ip4My+eU2nIBlZ1U7sWOJOKAZab9xuoAsYGxRBuFKej03ar7ngNIEFMvAIzx
	gIpzigQOCZpnY+IJMBh1C8Q1PN8QRUzKIXFMDnlXwmnVoa0W9+QksdA1hqyzK4H8WioA
	Umzg==
X-Gm-Message-State: ALoCoQlZrKkf4OLjauH9/FzL0o5QWM0OsE+MbLbA4uTT3XZv/SuIBRykowuIw/GngQy5qRPSdCat
X-Received: by 10.182.219.197 with SMTP id pq5mr781913obc.64.1391765276158;
	Fri, 07 Feb 2014 01:27:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Fri, 7 Feb 2014 01:27:36 -0800 (PST)
In-Reply-To: <20140207015414.GL31128@edge>
References: <1385430478-31824-1-git-send-email-denis@denix.org>
	<1385430478-31824-2-git-send-email-denis@denix.org>
	<CAP71Wjx52AHWurONaP7Fsq9A9jGKuy1S9+xviYQ7+iCUGYnRdw@mail.gmail.com>
	<20140207015414.GL31128@edge>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 7 Feb 2014 10:27:36 +0100
Message-ID: <CAP71WjwJ6ckOKNXpRWj3TE_3TvL73ae2FBxdmr+4sE6bY09jSQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/2] nativesdk-qtbase: add nativesdk version of qtbase necessary for SDK tools
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
X-List-Received-Date: Fri, 07 Feb 2014 09:27:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 7, 2014 at 2:54 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 1. Make the qmake switch above at the end of do_compile instead
> 2. Keep it in do_install, but manipulate ${D} instead of ${B} by installing
> ${B}/qmake-real into ${D}/qmake

i would say #2. since the 'hack' is needed for do_install, let's keep
the dirty stuff in do_install ;-)


Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8D29E71BDF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 16:14:18 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id n6so256420970qtd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 08:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VJ8P/GxEeD8/1gpRDjq1foNMAhpDiAmAYPYOnuhN01g=;
	b=Y2NypEHY7XbkzYErLgAtPWXe0A+tLoZfVxhYCaA+YYTM5ck93sHM2BlFIg2EZvul/6
	nVofPbIW5D0Kz3QLcMSuZ1rfDxRL+eG1obJIUfMYqPQ/nETR5T0ovzO5lOyRJ8OlAhGR
	QrloHVZMF371Dy3UL1PBFInN4Xtg9ufFrq+FW0w4JD9nO79RVFSbRNl2vClSmujCtGzr
	X7EpoEDgrvfrgAhy+eKbYj11hIjflr5hmubbrkWdGEmSSLqaQNxxIdBPQ8EdKhLcJV0h
	4QD6IOjMeP7wQyPKQF11A9ReocMxy/0WsgWnKn+0lQP0LRfWUTWDjqkqmp45JzTsvTxS
	vEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VJ8P/GxEeD8/1gpRDjq1foNMAhpDiAmAYPYOnuhN01g=;
	b=QY+y7S+zby8U3asm+m/y3Mrlv3gKuAwBtLizaaPR3vkJDiUKv6I6a+0gCYN001bsVH
	KDClCpaCuDWNz3dGvQkRHL8ZHwMYZfJCkvwQgwNULv9ebgD+v8DLkFHD8oAxHqcg0oOx
	xwZePH+hjm1EYcwWIFPfD4f9izRXB/9RJmbNyVFBb8V2T2+jvWjxXut56JyxJ+KhZMRV
	j4wxXgkSht+wOM48LyloYwpXk3w9+hhKn8Dpbfek+8ly7WKSagEDgyRByD1HYBNJn+Sq
	KAwonDqkICvtD0wxLd6MDO63gckFAxUS6oOzn3S4+VJ1Q6K2TAkfy2LHKHJb4DPWP4MJ
	Q0vg==
X-Gm-Message-State: AKaTC03d8bQw92qB7OU6yZmxy9bV4rl7zNbF/xU5nHcdFzRvZyQqi2EojfG/i9sd7azwXvOP5+5il28vRhpIvOmo
X-Received: by 10.237.37.77 with SMTP id w13mr43585767qtc.197.1480695260237;
	Fri, 02 Dec 2016 08:14:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 2 Dec 2016 08:13:59 -0800 (PST)
In-Reply-To: <1480694061.30023.78.camel@linux.intel.com>
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
	<o1jct4$pvp$1@blaine.gmane.org>
	<CAJTo0LYLgFFR+6d3SDkso6X28N00tVAnUGuJg4sPG-msMKWU6A@mail.gmail.com>
	<8632C69E-1C6B-482D-AF15-965F55F0AF88@gmail.com>
	<CAJTo0LYTYa4A42+FA9Ou=bVA6ddH8gzVBpJZJvNfa9Jyb9QQfA@mail.gmail.com>
	<CAMKF1spw8bvo8guTWkhYeQcn+Vs0kU-2X5D-03etwOj3dGroaw@mail.gmail.com>
	<1480694061.30023.78.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Dec 2016 16:13:59 +0000
Message-ID: <CAJTo0LYT3o+W+RVNwegA6aLHhi-VKcq7d5kn+djM2fdJ5bhQSw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Fri, 02 Dec 2016 16:14:20 -0000
Content-Type: text/plain; charset=UTF-8

On 2 December 2016 at 15:54, Saul Wold <sgw@linux.intel.com> wrote:

> I'm wondering if we should also move the gstreamer-vaapi-1.0 recipe to
> oe-core to be with it's brethren?
>

Yes, I think so.

Ross


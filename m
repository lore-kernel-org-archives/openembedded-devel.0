Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id F07FA605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 10:35:24 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 10so5667460ykt.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Dec 2014 02:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=AMbDjKvCmY1wiQdfNfYuaoGwqdT5w2S3uwuXHd1If9I=;
	b=PGqpusYKx7f4VYmq1TxCeszdBOhslkT9yUgzEowK3NbUG+4ArnPPKLgmF7e436IHPN
	FWRHeZl6NUxl2/dDTomu7pLKVBeW5cxZFWzKwNwQMBJ8qtzeAtIpO+nYcHF14e/AgJN5
	Erp69rKbrQAzMcqRV2Ip6/ZtVRmp5SZDyEqUcK8iJs5XZarj4auf7g9bcV18AObH3IsS
	43DaMEj2fTd5TBQdPR36Eha9zoDj+IIkuzegE7ICkX6/wE1zZDwxZD0D0SXjyIXEmzhB
	fPkF97gp/CSDWwwCN+jOEu1b97o0hs7R5mkYAyebHboAFhl8ITFrdDpBFp0+IpWlyoKZ
	gXRg==
MIME-Version: 1.0
X-Received: by 10.236.44.8 with SMTP id m8mr67575367yhb.136.1417516525246;
	Tue, 02 Dec 2014 02:35:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Tue, 2 Dec 2014 02:35:25 -0800 (PST)
In-Reply-To: <20141202092623.7645e77e@Fedora>
References: <1417425246-30891-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<CAP9ODKpj=+MZGBRbKw5ruo+5wUJE+oSKkkyHsNVBdiviyFby8w@mail.gmail.com>
	<20141202092623.7645e77e@Fedora>
Date: Tue, 2 Dec 2014 08:35:25 -0200
X-Google-Sender-Auth: m8YjYf8D9FmoIclUddixjHGXRM0
Message-ID: <CAP9ODKqddBa0zo_h9m+jdi4=HzSmKg+zv+RsgCx6HN6qhsyk_Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Qian Lei <qianl.fnst@cn.fujitsu.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] logwatch: Add new recipe
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
X-List-Received-Date: Tue, 02 Dec 2014 10:35:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 1, 2014 at 11:26 PM, Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:
> On Mon, 1 Dec 2014 13:29:33 -0200
> Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> On Mon, Dec 1, 2014 at 7:14 AM, Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:
>> > Logwatch is a customizable, pluggable log-monitoring system. It will go
>> > through your logs for a given period of time and make a report in the areas
>> > that you wish with the detail that you wish. Easy to use - works right out
>> > of the package on many systems.
>> >
>> > Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
>>
>> Doesn't it have a  'make install' ?
>>
>>
>
> No, there's only a shell script to install some lib/script/conf files
> to the host, so I have to implement do_install myself to do the same work.

Well so wouldn't be better to reuse the shell script? adding DESTDIR
support might reduce a lot the recipe size and easy maintenance.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


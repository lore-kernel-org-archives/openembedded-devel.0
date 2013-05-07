Received: from mail-la0-f51.google.com ([209.85.215.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UZicO-00063Z-Ma
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 May 2013 16:11:54 +0200
Received: by mail-la0-f51.google.com with SMTP id ep20so579393lab.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=MhZyApCmUNA5C3WdBq1cjTV8LAq3y+nnqsNAbb+fvWc=;
	b=Q8T9yED/bN0Jw0+YvCErn8y5SW6dr7eL4yq8lETYJrMsK2LeMY2MjyQsbARfsdQJAP
	SWEIHNabf1x+mYCwxY+ysgZjvBM3VVeF6F6U8SSIZVmNYOmHK0iiXfsmiJ97te+SfCBX
	Wtz+aeJoROQgfm/7YcG7oG7LFwrxKXGlLEVgoiVzracPXT2WEyrnWb0mVgSwdB0OF7TH
	18zLd4PPmORVFpdkP7WKdcM+y6ZjALnKW9eR9BzTlD6YedvLXuZPDKslSr7LuvqMFuOd
	nryCCl9y3Z92THKr0U122Iihj3Cxe241rmWxt9NKpHftmbwfI9IB49hLAflaxaYQux4/
	L8qw==
X-Received: by 10.152.27.39 with SMTP id q7mr1012348lag.36.1367934827797; Tue,
	07 May 2013 06:53:47 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.143.100 with HTTP; Tue, 7 May 2013 06:53:27 -0700 (PDT)
In-Reply-To: <5188DC2B.9080909@pseudoterminal.org>
References: <2924564.6VWmlqGvL5@helios> <5182701F.5030605@pseudoterminal.org>
	<1714072.P9NRZQZN5F@helios>
	<969F26A8BAB325438E7EB80D3C3134FB1622BB2A@IRSMSX102.ger.corp.intel.com>
	<5188DC2B.9080909@pseudoterminal.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 7 May 2013 06:53:27 -0700
X-Google-Sender-Auth: UKXQftiVZCkCp1l1oxdcndhfyqw
Message-ID: <CABcZANnX=s+aY+a5teETC_gUbzuNYw0VKWsy3zmXazAWSwG-6A@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "Iorga, Cristian" <cristian.iorga@intel.com>
Subject: Re: Please submit your unindexed layers
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
X-List-Received-Date: Tue, 07 May 2013 14:11:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 7, 2013 at 3:49 AM, Carlos Rafael Giani
<dv@pseudoterminal.org>wrote:

> * it uses _prepend in various places; I was able to replace all but one of
> them with prefuncs. The remaining one is populate_packages_prepend , and I
> just do not see how this could be turned into a prefunc. (And it is
> necessary to use it, because do_packages_split apparently cannot be used
> anywhere else.)
>   I think prefuncs are cleaner, because they do not modify an existing
> function. Also, if the indentation style changes again someday, prefuncs
> cause less problems than _prepend does.
>

Warning: as things stand today, as far as I know, prefuncs/postfuncs don't
affect the checksums of the variable they interact with, so changing the
contents of a prefunc/postfunc won't cause the function to be re-run
automatically. You can work around this by adding it to vardeps as well:

    do_foo[vardeps] += "bar"
    do_foo[prefuncs] += "bar"
-- 
Christopher Larson


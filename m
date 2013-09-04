Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 84C6961613
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 22:03:01 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id hz10so580699vcb.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 15:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=zwvdHcFPNJjFhG0Ce8fnydsi1FNiEjgb4nq2Bu30bME=;
	b=olo96pJ+erxdFSEU5XejkwyRojEgGVbTQ7UPvlerlRTssUp+SG0VYUsGDdf33F4NXC
	dUwLqU1uuhkfehb5U2O6jTdg0bjaec3eT5TowmbxDwLg9YFJPtdlpl5EY9ZkzxlIOi0C
	koU2v4VYNBT8ZtqzxlA0Ietknbez2oNq6kfZC+DGb3bs/6LlMNy03aRHSKeIaRMdbKnf
	IJDwf5XhXq3RPVdCITTHYg7I9fJpO9q5BXQKv5MxAGuj58dwq1jYwow8+i/caRvc9Rkg
	mlNAXlLTTm+UEoW6Eiewb3Ck7Ygqhh6IHeJqauOW3lG3ycZaG/DARIFCOG1QARNCwklN
	Bjhg==
X-Received: by 10.58.146.71 with SMTP id ta7mr3797749veb.23.1378332183075;
	Wed, 04 Sep 2013 15:03:03 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.155.17 with HTTP; Wed, 4 Sep 2013 15:02:21 -0700 (PDT)
In-Reply-To: <16E29A58-2D18-42F9-9A52-C27BB0A9FE3E@gmail.com>
References: <16E29A58-2D18-42F9-9A52-C27BB0A9FE3E@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 4 Sep 2013 23:02:21 +0100
X-Google-Sender-Auth: BwWTJGgMNvVt8h_EOgo6ODpQgl4
Message-ID: <CANyK_8c9rr+g0iZ+6urSwVEPCCuWK2T71nfTNTnidn8+kXaGug@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: mercurial fetch issues
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
X-List-Received-Date: Wed, 04 Sep 2013 22:03:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 4 September 2013 20:42, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> I am seeing something like below with dylan branch
>
> WARNING: Failed to fetch URL hg://vim.googlecode.com/hg/;protocol=https;module=vim, attempting MIRRORS if available
> ERROR: Fetcher failure: Fetch command failed with exit code 255, output:
> warning: vim.googlecode.com certificate with fingerprint ca:2d:b2:a7:41:f5:00:83:e7:66:57:bf:6f:be:57:a7:56:92:c0:4f not verified (check hostfingerprints or web.cacerts config setting)
> abort: HTTP Error 404: Not Found
>
> ERROR: Function failed: Fetcher failure for URL: 'hg://vim.googlecode.com/hg/;protocol=https;module=vim'. Unable to fetch URL from any source.
>

I set the URL for this so figured I should test this quickly: I can
manually clone that with "hg clone https://vim.googlecode.com/hg" and
"hg clone https://vim.googlecode.com/hg/vim", both work and are
equivalent so it's likely not a problem with the URL or Google Code
being down.

I'm getting the certificate warning running mercurial on my desktop
system (Arch Linux).

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


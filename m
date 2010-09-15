Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OvxT2-0007uo-BZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 21:16:57 +0200
Received: by eyb7 with SMTP id 7so346159eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 12:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=sLpMRiGoIS7hn3q+GoIqhZ2G3H/IHL+C08Wh/YClcec=;
	b=cvvRuUJ5icBxOP8nwu9ROIyIRlfyynPKAZxRAfccq07EafOxTJhnfatIEK0UY7PQs6
	0iVXc5695zOfihaJrDDZ9lKl141dKOzftGjBl+TIhr3OlfJAb6nthAb+mIZ3qRAiAMSQ
	qmnBYGTfhKsQKJrN6zlWsQBV3crtwj9Ltl2Yo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=vyIRnPcpHeSx8DnczJKjIKMlGH9MW97pqMn4dj31aPATXnfZKHgTvvURgd3MRIRQPU
	jV4KEfgrGGhfZu6eqW5dWB25yYZjiSBT8w3gV212+6a3FLLIk6eYGWXqyI704nvQN8JK
	clTZ5im7GqLQ4RvQRa3zlNY1y5GpUWANDYhDM=
Received: by 10.223.120.80 with SMTP id c16mr917042far.59.1284578139097; Wed,
	15 Sep 2010 12:15:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.121.5 with HTTP; Wed, 15 Sep 2010 12:15:19 -0700 (PDT)
In-Reply-To: <4C911753.9080601@balister.org>
References: <AANLkTi=vSWgp8MpCRDOhE=3x_d2WPgvKsc4Qy9Y5j7O1@mail.gmail.com>
	<4C911753.9080601@balister.org>
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 15 Sep 2010 13:15:19 -0600
Message-ID: <AANLkTim=BGd9RPbKB3DD5W9POD0vmgyFNzc229C6AK+d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: vimrc and vim defaults
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
X-List-Received-Date: Wed, 15 Sep 2010 19:17:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Here's what I've done so far - just enough to not drive me mad:

opkg install vim-syntax

vim /etc/share/vim/vimrc

" most important
syntax on
set nocompatible
set backspace=indent,eol,start
" tab stuff
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
" sometimes useful
"set ignorecase

AJ ONeal


On Wed, Sep 15, 2010 at 12:58 PM, Philip Balister <philip@balister.org>wrote:

> On 09/15/2010 02:32 PM, AJ ONeal wrote:
>
>> Why does vimrc go in /usr/share/vim/vimrc rather than /etc/vimrc like on
>> other distros?
>>
>
> This explains why vim has been driving me nuts.
>
>
>  Would it be a sin to include some "reasonable defaults" so that it's
>> actually the vim that people expect rather than vi?
>>
>
> This would be great. I'd love to look at any patches you have.
>
> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


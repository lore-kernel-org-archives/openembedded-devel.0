Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1USnhI-0006tA-F7
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 14:12:20 +0200
Received: by mail-vc0-f178.google.com with SMTP id hv10so2341981vcb.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 04:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Lyk1nyfnLf3Jy9PGupz+8z/znwa1aGNra29fk0g8qds=;
	b=sV6wxhlVItJdnIur7peawycYX8S4/0EPH6Q/GMj47WlaVEfr6j6FkOqKS05b3uUg3D
	HPhfjxDOcujqkcpCaJt9A3Br7EhrIgDsXGzOwVKqvz6Q/VONPHqd127ge+S17hAvI4k/
	ofJlmBKqNKpoxZoGWUTB5J6mIQ5CEzHYTP8oCB8nb+tFGjS8Hl4EHrbu5bqSwQT9Tj4B
	LOVPtWB3hLXJBfgk9wL8849Dsu7iWPgxbKNcXdE3OAvkkB8KdExuKAgmxcugfF7ENnS1
	JLsWbghPpJW+rowAPdR69lrZb8ybsurxNE1fP5v4bbrgeOrcyHZf6dwVFR++UeNuhuN4
	hYcQ==
MIME-Version: 1.0
X-Received: by 10.52.27.52 with SMTP id q20mr7017445vdg.16.1366286082778; Thu,
	18 Apr 2013 04:54:42 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.224.135 with HTTP; Thu, 18 Apr 2013 04:54:42 -0700 (PDT)
In-Reply-To: <20130418105310.GN26007@jama>
References: <CANyK_8frhEkQ3-ktHygKdQOWZB3cDVEsqLj_VK7ZeLLL-XEj5A@mail.gmail.com>
	<20130416111424.GJ10628@jama.dyndns-home.com>
	<CANyK_8cWf21+4CgXwJLE4-nxYGZwhXdpkQEW4MtfaQ5t=QdXMA@mail.gmail.com>
	<CANyK_8ft6aY8KFArMc35eKAZGYET5O++VpErsgWOrOZ9=r8vbA@mail.gmail.com>
	<20130418105310.GN26007@jama>
Date: Thu, 18 Apr 2013 12:54:42 +0100
X-Google-Sender-Auth: wTSYXDc4zM2m_MF4iY4H9eVvKNw
Message-ID: <CANyK_8csDRyi9wzB4SwyxYOYEp6Kq0DZX6rY_2uiRLvrfobgJA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] vim 7.3
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
X-List-Received-Date: Thu, 18 Apr 2013 12:12:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 April 2013 11:53, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Apr 18, 2013 at 10:51:21AM +0100, Paul Barker wrote:
>> 1) vim has new patch releases very often so if I stick with a fixed
>> version we'll fall behind quickly. However the default branch might
>> become vim-7.4 at some point in the future but I'm not sure we want to
>> move to that automatically. There isn't even a vim-7.4 development
>> branch in the upstream repository so that may be a long while away. Do
>> you have any advice on whether I should specify a fixed version or use
>> AUTOREV? It could also be possible to include both a vim_7.3.905.bb
>> file and a vim_hg.bb file.
>
> No AUTOREV in meta-oe, but it's fine to add both
> vim_7.3.905.bb and vim_hg.bb if hg versions have negative
> DEFAULT_PREFERENCE and SRCREV that you can confirm is working (you can change
> it to AUTOREV later in your local.conf if you want).
>

Pretty much every commit to the default branch of vim is released as a
new version (hence .905) so I'll just stick with the single
vim_7.3.905.bb file.

>> 3) There's a vimrc file kept along with the recipe for vim, I can't
>> see much useful in the git history of this file. There's also a
>> vimrc_example.vim file in the runtime files distributed with vim that
>> will keep up-to-date with any changes to syntax or features, should we
>> move to using this?
>
> You mean to use vimrc_example.vim from vim archive instead of our local
> vimrc copy? Sounds good too.
>

Yes that's right. I'll split this change out into a separate patch.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk



Received: from mail-we0-f170.google.com ([74.125.82.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sankar.m@hardcube.in>) id 1U5vsi-00011x-6o
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 11:18:43 +0100
Received: by mail-we0-f170.google.com with SMTP id z53so1875263wey.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 02:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:in-reply-to:references
	:date:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=nx+URHlo/d0BeoMuDpV5YUyIgCAXmEJ420gV4Rz4+n0=;
	b=eJhOyeC7ozKWXbodzKrU+UoSBQjEA8j1Ps1ZO6JrpU2JWhJT5STNwTOTkgqYR77kZ8
	aH5U3PCihtzhlOJ9PLh8bWkQxa5hr+xThLKRRw0wW1hJs4nyjI6YL6CR4gsnkW+1b4W9
	Muw7jW7l6wPA9t+c/lPWy86XYJx+YHUEgEBinGy2qsr03uxqQS2ErvpLBCdObE6donhu
	9XtijSw9IymhXiohuMsoETd6JIvFk/5VpCpb5jyFlO1VD16ECN0Q+SI8avlpW8RQ/i2O
	7pwkzKbU9LSF6KyvbHzKbR3d/NMzZWqcyHA+IE5TbzetQvj63JIJrA9TBHQZziFWkuvc
	BgHw==
MIME-Version: 1.0
X-Received: by 10.194.104.137 with SMTP id ge9mr43899258wjb.59.1360836079273; 
	Thu, 14 Feb 2013 02:01:19 -0800 (PST)
Received: by 10.217.3.136 with HTTP; Thu, 14 Feb 2013 02:01:19 -0800 (PST)
X-Originating-IP: [203.193.158.21]
In-Reply-To: <511CAFF3.3090004@communistcode.co.uk>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
Date: Thu, 14 Feb 2013 15:31:19 +0530
Message-ID: <CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
From: Sankar H Malarmani <sankar.m@hardcube.in>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnMV0kCBbWZRMObYeOQS6pJDI7QTfx76MZj9v/0TuoggXNruehLbJBMjcjXyXXRXA8CDQjk
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Thu, 14 Feb 2013 10:18:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Jack Mitchell,

Thanks for your reply..

openembedded-core is what you are referring as new openembedded. right?

I'm trying to build a linux image version which could be done only using
openembedded-classic.. And these errors i'm stuck on with are dealing with
gtk+ installation and versions.. I could figure out what I'm doing wrong..
Can I get your help here please ???

And please refer me how to get started with new oipenembedded.. I'll have a
go at it..



On Thu, Feb 14, 2013 at 3:05 PM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> On 14/02/13 05:08, Sankar H Malarmani wrote:
>
>> Hi All,
>>
>> I'm tryin to build a linux image by using openembedded classic. On giving
>> the bitbake command I'm getting the following errors.
>>
>> failed to load "./apple-red.png": Couldn't recognize the image file format
>> for file './apple-red.png'
>>
>> ERROR: Function 'do_compile' failed (see
>> /home/hc/oe/output/work/i686-**linux/gtk+-native-2.24.8-r1/**
>> temp/log.do_compile.11738
>> for further information)
>> ERROR: Task 6157 (virtual:native:/home/hc/oe/**
>> stuff/trdx/recipes/gtk+/gtk+_
>> 2.24.8.bb, do_compile) failed with exit code '1'
>> ERROR: '/home/hc/oe/stuff/**openembedded/recipes/eglibc/eg**libc_2.12.bb<http://eglibc_2.12.bb>'
>> failed
>> ERROR:
>> 'virtual:native:/home/hc/oe/**stuff/openembedded/recipes/**
>> gobject-introspection/
>> gobject-introspection_1.29.17.**bb<http://gobject-introspection_1.29.17.bb>'
>> failed
>> ERROR: 'virtual:native:/home/hc/oe/**stuff/trdx/recipes/gtk+/gtk+_2**
>> .24.8.bb <http://2.24.8.bb>'
>> failed
>>
>> I'm a newbie to this openembedded stuffs..
>> Please guide me to solve this issue.
>>
>>
> Is there a reason you are using OE Classic? If not, then transfer to the
> new OpenEmbedded, OE Classic has been EOL for a long time now.
>
> Regards,
>
> --
>
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   http://www.embed.me.uk
>
> --
>
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>



-- 
Thanks & Regards
*Sankar*


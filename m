Received: from mail-bk0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1U7SZY-00033B-Id
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 16:24:05 +0100
Received: by mail-bk0-f50.google.com with SMTP id jg9so2574343bkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 07:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=rVLi5fS8mJt60wJ26UGhoWZihfnnfIGh6V9/tjT3gQA=;
	b=BSNHqe6+b3OYX2MwUm9F5Fjt3fZkg/nJTcXpYMUwBKcoQvqUdeSVNTgSozG2hwRaND
	0p2n1GVqkAeItdqtkchxhswQ0mU43ErQ1CRndYF47IUQh4k6Zwa2fnggRWmV6PnFSZH5
	OUNbWlzOqtGkrmlqJqER+V7X9ClnJxgdS31IQ9Jt7a+MEDAF5uWUmPPHdWlpSh9RrJlc
	vVbU6IKmKAQWGFP4ssfck7w/PO46JW1yTTDZ2PbVfiGR425iKLYbxMwRmFJJDDPni7ui
	5B5HKLmcbpBmTVQaQk4pJiZW9IW7zuhPwmjbQG3jiC6mDMfDfwCyPCi8O5aM5i5rExXs
	DTWQ==
X-Received: by 10.204.156.206 with SMTP id y14mr4824582bkw.34.1361200076543;
	Mon, 18 Feb 2013 07:07:56 -0800 (PST)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.204.25.141 with HTTP; Mon, 18 Feb 2013 07:07:36 -0800 (PST)
In-Reply-To: <20130218142026.7849.12017@hoothoot>
References: <20130218094145.29630.63354@hoothoot>
	<CAPESJy7YAk9vj56pPkATdJO95xv8gwysyRyA9vyEq5YX-MyD=Q@mail.gmail.com>
	<20130218142026.7849.12017@hoothoot>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Tue, 19 Feb 2013 00:07:36 +0900
X-Google-Sender-Auth: 1iDToPKtv-ScrpVtPau5M9f752Y
Message-ID: <CAPESJy5Rox_qo+g6T1j0dT0uZ_ZaUyHmZSk8hdwZZDRSh0=UzA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: build dependency cycles in openembedded
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
X-List-Received-Date: Mon, 18 Feb 2013 15:24:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Before continuing to write reply,
I want to make sure about the usage of the word "native":

in OpenEmbedded recipe, let's say, when you work on a x86-64 system to build
for target system which has ARM architecture,

if you want to borrow a xz tool from x86-64 environment: you can write
 DEPENDS = xz-native

if you depends on xz tool build on target environment: you just write
 DEPENDS = xz

Is this the custom you assume?

What I had to find was the word "native" is used to point the target environment
in [1].
-- 
Takeshi Hamasaki

2013/2/18 Johannes Schauer <j.schauer@email.de>:
> Hi,
>
> Quoting Takeshi Hamasaki (2013-02-18 13:26:38)
>> you can find the line like:
>> DEPENDS = "XXXXXX-native"
>> in some recipes.
>>
>> So, you can describe dependency to native tools from target build if necessary.
>
> Sure, when cross compiling you can satisfy lots of dependencies by native
> binaries but others need the foreign version. In Debian based distribution,
> this distinction for cross build dependency resolution is made using
> Multi-Arch.
>
> Since some of the cross build dependencies can be satisfied by (already
> available) native tools, the dependency cycle situation is *much* less severe
> during cross compilation than it is during native compilation.
>
> But still, even when one wants to cross compile a native, minimal Debian build
> system (just containing the init, shell and compiler) one runs into build
> dependency cycles because some dependencies have to be satisfied by foreign
> (not yet built) binaries and thereby creating some dependency cycles.
>
> Is it different in OpenEmbedded?
>
> cheers, josch
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NJQSD-0003Oa-DB
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Dec 2009 12:48:08 +0100
Received: by fxm8 with SMTP id 8so2017737fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Dec 2009 03:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=8y++GEHIicsvHD4GwOQWH/b64D3YkwDIp7kyHonNNXw=;
	b=LOVI2MIaSnmfIl+7aIOQqfCwf2HMz4tJ7VptYKVg6bjWj75Xn+7on9u9nskx/XWiQn
	Gs+3TILs0NXtuxg1722eE2xHvq588NUbx/5SvceNHHlUgPJRIgBe/sB2L3KqTKThPxUi
	lrcLvNGkaGfIkxuca4nTivEdXU4e6NGEmgfLE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AmVX0dFIWmn+4bl3PHwnUSEx0ksS2vNSK9xOm5NkQT5CMuZM5rYF8Ql7/aEsVxt73Z
	uWtzJfFDvGROgbJsa1KRNUeq3JDu1S91MK9DMH3dik8faDL0BopX39oodMLJYoBM80C+
	yqDwbYxVtd3QqhAIUHK9zH/tftrgEKIYYLrXI=
Received: by 10.223.17.65 with SMTP id r1mr2924757faa.5.1260618381996;
	Sat, 12 Dec 2009 03:46:21 -0800 (PST)
Received: from s42.loc (85-127-241-136.dynamic.xdsl-line.inode.at
	[85.127.241.136])
	by mx.google.com with ESMTPS id h2sm4258951fkh.32.2009.12.12.03.46.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 12 Dec 2009 03:46:19 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NJQTd-0005CQ-SM; Sat, 12 Dec 2009 12:49:33 +0100
Date: Sat, 12 Dec 2009 12:49:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20091212114933.GA8391@mx.loc>
References: <1260393869-8231-1-git-send-email-rep.dot.nop@gmail.com>
	<19c1b8a90912092039w592aed8btf658721b77f8e646@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90912092039w592aed8btf658721b77f8e646@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] binutils-2.20: remove unneeded/unwanted patches
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
X-List-Received-Date: Sat, 12 Dec 2009 11:48:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 09, 2009 at 08:39:20PM -0800, Khem Raj wrote:
>On Wed, Dec 9, 2009 at 1:24 PM, Bernhard Reutner-Fischer
><rep.dot.nop@gmail.com> wrote:
>> Hi khem,
>>
>> In 33630af91d1027a91b43f697c86e809a770668e1 you (AFAICS) added
>> binutils-2.20 support, yet the hunks mentioned below were already
>> applied or are unneeded in that release?! How did you patch/compile
>> this, perhaps i'm missing some crucial part in the setup?
>> Thanks for clarification/fixing this up,
>
>out of these three only patch which is applied right now is
>binutils-arm-pr7093.patch and by nature of the patch it adds a check
>and returns if true. Now that the patch it applied twice the check is done twice
>making one redundant but not incorrect. Just existence of patch does not apply
>them automatically you have to add the patches to SRC_URI in order to include
>them.

I'm aware of this, yes. But the fact that you pulled them into the 2.20
patchdir suggested that they were somehow still of interrest for that
version, although not applied.
>
>I will remove these patches from repo as they are not applied.

Thanks alot for removing them, they're just taking up space and
bandwidth.

cheers,



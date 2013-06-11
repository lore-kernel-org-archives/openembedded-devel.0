Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 769576A9C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 07:48:35 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id x12so607801ief.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 00:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=8bj7CR0bcj8lLJWjBdSEDBW5sM+4LVvFr6BuJ7+lyDA=;
	b=ONGWUDMGqDhzB55vbvUKln+CxOTaZDP07rrrZ75sPrF7O3uh3Dz162cMgIihJo6Wea
	VZbMJi66A1xYsHxcEqNMr756VHG2Zo108OaO/5l0ThGMiNxXYTvrQUlnsEvyesv6I6HM
	XE1RBqQQpBIgqmI/rpkWuWJdcWj14UTG48aJyTto+aOEuMthN/NvOF8M1+nZREInNEwl
	UnoQjH50QagwuZo+qpDbPFRyyGwKoC2K8VjBjiukepepYaVvfgluT73a81GJofgQQhhI
	QxJqL63kUEK8+N4y9B1ubPk0cH+WpNXsfsCdz/Wumu9wW29Uk0U2PkWtBBYikgaz/rm+
	YmsA==
X-Received: by 10.50.22.37 with SMTP id a5mr304958igf.78.1370936916702; Tue,
	11 Jun 2013 00:48:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 00:48:06 -0700 (PDT)
In-Reply-To: <51AB1684.1080500@juszkiewicz.com.pl>
References: <1370165592-15697-1-git-send-email-net147@gmail.com>
	<51AB1684.1080500@juszkiewicz.com.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 00:48:06 -0700
Message-ID: <CAMKF1soSa-S9kUC1PH9pJYbnJsvRiubNxbgNvYEx8zs4XiwmLw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] llvm3.2: new recipe
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
X-List-Received-Date: Tue, 11 Jun 2013 07:48:35 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 2, 2013 at 2:55 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> W dniu 02.06.2013 11:33, Jonathan Liu pisze:
>> +def get_llvm_arch(d):
>> +    import bb;
>> +
>> +    arch = bb.data.getVar('TARGET_ARCH', d, 1)
>> +
>> +    if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
>> +        arch = "x86"
>> +    elif arch == "x86_64":
>> +        arch = "x86_64"
>> +    elif arch == "arm":
>> +        arch = "arm"
>> +    elif arch == "mipsel" or arch == "mips":
>> +        arch = "mips"
>> +    elif arch == "powerpc" or arch == "powerpc64":
>> +        arch = "powerpc"
>> +    else:
>> +        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
>> +
>> +    return arch
>
> Can we get rid of such blocks? They are worthless and only generate
> extra support questions when OE newbies use OE with 'not supported'
> architectures.

why do you think they are worthless ? when they give good information
instead of failing to build
and then generating support question which need more work to come to
same conclusion

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


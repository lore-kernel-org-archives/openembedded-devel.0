Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PzlBX-0007b3-6C
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 08:30:23 +0100
Received: by iyb26 with SMTP id 26so1411700iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=jlwdMHbdpNf2C1Z1f69ocNdhDNz7eZMAuuskySbDCQQ=;
	b=hz2o8k06D0M3hZ4mw3v1z+eR7aPWy95bwNirkX5tLD/AvHffefZFXvrDQZH9TrrIhU
	RKKqxpk7cxGXTMAxsBirY8cKqn9QFC5Mt9xF07IFFi/iYMo+GR9x9StIxZT9COI1oHmE
	vtYoe9toEenJmh0RyPoz85eppuGBiv6TkNnTI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KhawdfjFgd/PWSVn2UEpzJLb+6gW7mNUUkffncvPTupYZiWc2DkEpTypRSSJgfa1l+
	ioOMAXeWKXVzbZ/LAf8MFgjhOyO9aVgKsBSUUlWufl72Ir35m3E2fZBLNNljtdkrAJ0D
	pUbeNaiak7q3UZ7Bu70PCyhDR+Mtt6mGjUzhM=
MIME-Version: 1.0
Received: by 10.231.122.132 with SMTP id l4mr368150ibr.170.1300260519803; Wed,
	16 Mar 2011 00:28:39 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Wed, 16 Mar 2011 00:28:39 -0700 (PDT)
In-Reply-To: <4D8061DE.6030106@gmail.com>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha> <20110315220301.GC3042@denix.org>
	<1300254477.2818.5.camel@eha>
	<989A078976CDAD4CB2DC976EEF70E2A50547990E@eu2-mail.mgc.mentorg.com>
	<4D8061DE.6030106@gmail.com>
Date: Wed, 16 Mar 2011 08:28:39 +0100
Message-ID: <AANLkTikfnLb0XW6B6M0s+w=VuOkaeq0=MrYwUniQ6B_x@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Python-native dependency in libxml2
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
X-List-Received-Date: Wed, 16 Mar 2011 07:30:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/16 Khem Raj <raj.khem@gmail.com>:
> On 3/15/2011 11:22 PM, Ahsan, Noor wrote:
>>
>> Hello,
>>
>> I was looking at the libxml2 package. While going through the recipes I
>> came to know that its native package depends on python-native package as
>> well. This dependency is defined in libxml2.inc file.
>>
>> DEPENDS_virtclass-native = "python-native"
>>
>> This package build fine after removing this dependency. I am not clear
>> why this dependency is being added in libxml2 package. Can somebody
>> clear that to me. While looking at the git log I came to know that this
>> change is coming from libxml2-native.inc file. But I am not clear why
>> this dependency was added as this package build fine without it.
>>
>> Please help me in understanding this dependency. Thanks.
>
> Try to build this recipe from scratch and see if it still works then we can
> remove the dep

I'm not sure if that is the right way.
It might well be that typically python-native is already there in a
scratch build because some earlier package needed it (or even because
of the scheduling of build steps.

Probably a better way is to build with packaged staging (with staging
dir outside TMPDIR) then rm TMPDIR and bake the package.
Alternately peek into the package to see if it needs python. If it is
needed then the DEPENDS should stay.

Looking at the issue at hand maybe the best person to ask is Martin
Jansa as he last touched that line according to git blame:
3cd9ddbf recipes/libxml/libxml2.inc  (Martin Jansa
2010-02-26 12:32:53 +0100  5) DEPENDS_virtclass-native =
"python-native"

The other thing is that further on in the .inc file I see:
XPY_virtclass-native = " --with-python=${PYTHON_DIR}"

This strongly suggests a hard dependency on python, so removing the
DEPENDS "because it builds without it" does not seem to be a good plan
to me.

My strong feeling is that recipes should be self-contained (so should
list all packages they need to build, minus the ones that are
inherited from classes (and maybe a few implicit ones like maybe make)

Frans



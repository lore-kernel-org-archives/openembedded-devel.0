Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1S5BcE-00007q-Lo
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Mar 2012 08:48:55 +0100
Received: by wibhq12 with SMTP id hq12so3305002wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 23:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=uiMXFDySg99ogHRV26+T+3z/yG2l9mIQc6PSpdxvQhs=;
	b=W7WXzhx9etNlkjcxSygB+1uN3h57z28OGGF29gWvCH1IFFmjaxtU6NfyFa7lWJPYbz
	i741pGZI0gsNF6RYYN7qNATm0lcvXz5TnM7rlxnvlYTulCzM3AoQci7YMKWEOp1Z2rqb
	qbaXnXlUSioSWcgZFHd8ffDtH5t6sAtkPX93vHfgaFkGTm4o48zXjXUDufyInhFdYKUh
	NypCbPmlpc4WtQTteRo6+XK+bL2Id0JpvsbubOkNIsW6TGvBPzq7x463sfCrXFr7SQKs
	i0ySLUsP+TEMnIBzXiJ3GWitVlWYE39U+xKCpizxpArtHHsgbCCs0wltJO3VmkfAWfzQ
	/XiQ==
Received: by 10.180.80.40 with SMTP id o8mr1812077wix.10.1331106018037;
	Tue, 06 Mar 2012 23:40:18 -0800 (PST)
Received: from [192.168.0.14] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id
	ep17sm32709060wid.2.2012.03.06.23.40.16 (version=SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 23:40:16 -0800 (PST)
Message-ID: <4F5710D6.8000606@gmail.com>
Date: Wed, 07 Mar 2012 08:40:06 +0100
From: Piotr Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120301 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1330980801-19523-1-git-send-email-tworaz666@gmail.com>
	<20120306015941.GC6841@sakrah.homelinux.org>
	<4F56622F.8040803@gmail.com>
	<CAMKF1sqqCDcFv970c0TZU-tn41wpuH_rKDyYf5_xciuWwETajw@mail.gmail.com>
In-Reply-To: <CAMKF1sqqCDcFv970c0TZU-tn41wpuH_rKDyYf5_xciuWwETajw@mail.gmail.com>
Subject: Re: [meta-oe] zsh: Add initial recipe for version 4.3.17.
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
X-List-Received-Date: Wed, 07 Mar 2012 07:48:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/06/2012 10:25 PM, Khem Raj wrote:
> On Tue, Mar 6, 2012 at 11:14 AM, Piotr Tworek <tworaz666@gmail.com> wrote:
>> On 03/06/2012 02:59 AM, Khem Raj wrote:
>>> On (05/03/12 21:53), Peter Tworek wrote:
>>>> Run tested on netbook pro.
>>>>
>>>> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
>>>> ---
>>>>  meta-oe/recipes-extended/zsh/zsh_4.3.17.bb |   51 ++++++++++++++++++++++++++++
>>>>  1 files changed, 51 insertions(+), 0 deletions(-)
>>>>  create mode 100644 meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
>>>>
>>>> diff --git a/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb b/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
>>>> new file mode 100644
>>>> index 0000000..9192f20
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
>>>> @@ -0,0 +1,51 @@
>>>> +DESCRIPTION = "UNIX Shell similar to the Korn shell"
>>>> +HOMEPAGE="http://www.zsh.org"
>>>> +SECTION = "base/shell"
>>>> +
>>>> +LICENSE = "ZSH"
>>>> +LIC_FILES_CHKSUM = "file://LICENCE;md5=ad234d4b46db63491c4a9789da4fb341"
>>>> +
>>>> +DEPENDS = "ncurses libcap libpcre gdbm groff-native"
>>>> +
>>>> +SRC_URI = "ftp://ftp.zsh.org/pub/${P}.tar.bz2"
>>>> +SRC_URI[md5sum] = "8258967060b2654f30001a011946ac6a"
>>>> +SRC_URI[sha256sum] = "054e0452afd9c742c9f1489465175e1d4d7db50d88b602d132551d850cf7a704"
>>>> +
>>>> +FILES_${PN}-dbg += "\
>>>> +    ${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
>>>> +    ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
>>>> +    ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
>>>> +    "
>>>> +
>>>> +inherit autotools
>>>> +
>>>> +EXTRA_OECONF = " \
>>>> +    --bindir=${base_bindir} \
>>>> +    --enable-etcdir=${sysconfdir} \
>>>> +    --enable-fndir=${datadir}/${PN}/${PV}/functions \
>>>> +    --enable-site-fndir=${datadir}/${PN}/site-functions \
>>>> +    --enable-function-subdirs \
>>>> +    --with-term-lib='ncursesw ncurses' \
>>>> +    --with-tcsetpgrp \
>>>> +    --enable-pcre \
>>>> +    --enable-cap \
>>>> +    --enable-multibyte \
>>>> +    --enable-gdbm \
>>>> +    --enable-dynamic \
>>>> +    zsh_cv_shared_environ=yes \
>>>> +    "
>>>> +
>>>> +do_configure () {
>>>> +    oe_runconf
>>>> +}
>>>> +
>>> why do you need to run oe_runconf explicitly.
>> Because I want to avoid invoking autotools, I just need to run
>> configure. I wrote this recipe some time ago, but from what I remember
>> zsh comes with some preloaded m4 macros that cause problems when default
>> autootols do_configure() step is executed. The preloaded configure
>> scripts works fine, even when cross-compiling. IMO it's better to use it
>> than to patch the package.
> generated .la files will not work which may not be so much of an issue
> for zsh. Usually we autoreconf and thats to avoid compatibility issues
Not a problem:
$ find tmp/work/armv5te-oe-linux-gnueabi/zsh-4.3.17-r0/image -type f
-name '*.la' | wc
-l                                                                                                                                                    

$ 0

In general, compiled version of zsh doesn't come with any files that
could be shipped in -dev or -staticdev packages. In fact the only
packages that contain some files are zsh and zsh-dbg. I've only tested
zsh and I can't find anything that's broken. I've used the same zshrc
file as on my desktop and all the modules load fine.

/ptw




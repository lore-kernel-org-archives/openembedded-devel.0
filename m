Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1S4zz5-00075P-V5
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 20:23:44 +0100
Received: by wera1 with SMTP id a1so3457582wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 11:15:08 -0800 (PST)
Received-SPF: pass (google.com: domain of tworaz666@gmail.com designates
	10.216.136.202 as permitted sender) client-ip=10.216.136.202; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tworaz666@gmail.com
	designates 10.216.136.202 as permitted sender)
	smtp.mail=tworaz666@gmail.com;
	dkim=pass header.i=tworaz666@gmail.com
Received: from mr.google.com ([10.216.136.202])
	by 10.216.136.202 with SMTP id w52mr6810525wei.109.1331061307985
	(num_hops = 1); Tue, 06 Mar 2012 11:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=rKqGsNNpH/m63woV+BnIlarjhbE8e7Rdc0Knd3fV5g8=;
	b=yR0Hw8ipX70Cfiy6BYGlobPuXxh4owbCb53XSZ+3+iUXMAfGWBLr5MVcmp3vyjQiq9
	xWQ2zZyysnc+BNSi30mATp2C0hzNGtBIRZaVwxlzx5shbt0iLkDvvToe26hDRh5GFoRZ
	UoR8xLQwoMd0Lq3infDUpEkjpNKBF3SdTD85VSI9G6F11ebhawPdroymMygRM1Co1+GF
	etvFcbsOvZoXmn2N+UPGwl2v7YSE36qU2vi/NZ1H2PWRg+3IPfi8rBua7mhYgW9V5jRC
	nz80WKVRLaIO0REqoUCGcPsY2W+uxZj2rUTQtxFW+pdp32l/vulmvbwM7VjQbfCEWtMq
	Cu4A==
Received: by 10.216.136.202 with SMTP id w52mr5480176wei.109.1331061307856;
	Tue, 06 Mar 2012 11:15:07 -0800 (PST)
Received: from [192.168.0.14] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id 9sm82958302wid.2.2012.03.06.11.15.06
	(version=SSLv3 cipher=OTHER); Tue, 06 Mar 2012 11:15:07 -0800 (PST)
Message-ID: <4F56622F.8040803@gmail.com>
Date: Tue, 06 Mar 2012 20:14:55 +0100
From: Piotr Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120301 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1330980801-19523-1-git-send-email-tworaz666@gmail.com>
	<20120306015941.GC6841@sakrah.homelinux.org>
In-Reply-To: <20120306015941.GC6841@sakrah.homelinux.org>
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
X-List-Received-Date: Tue, 06 Mar 2012 19:23:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/06/2012 02:59 AM, Khem Raj wrote:
> On (05/03/12 21:53), Peter Tworek wrote:
>> Run tested on netbook pro.
>>
>> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
>> ---
>>  meta-oe/recipes-extended/zsh/zsh_4.3.17.bb |   51 ++++++++++++++++++++++++++++
>>  1 files changed, 51 insertions(+), 0 deletions(-)
>>  create mode 100644 meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
>>
>> diff --git a/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb b/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
>> new file mode 100644
>> index 0000000..9192f20
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
>> @@ -0,0 +1,51 @@
>> +DESCRIPTION = "UNIX Shell similar to the Korn shell"
>> +HOMEPAGE="http://www.zsh.org"
>> +SECTION = "base/shell"
>> +
>> +LICENSE = "ZSH"
>> +LIC_FILES_CHKSUM = "file://LICENCE;md5=ad234d4b46db63491c4a9789da4fb341"
>> +
>> +DEPENDS = "ncurses libcap libpcre gdbm groff-native"
>> +
>> +SRC_URI = "ftp://ftp.zsh.org/pub/${P}.tar.bz2"
>> +SRC_URI[md5sum] = "8258967060b2654f30001a011946ac6a"
>> +SRC_URI[sha256sum] = "054e0452afd9c742c9f1489465175e1d4d7db50d88b602d132551d850cf7a704"
>> +
>> +FILES_${PN}-dbg += "\
>> +    ${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
>> +    ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
>> +    ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
>> +    "
>> +
>> +inherit autotools
>> +
>> +EXTRA_OECONF = " \
>> +    --bindir=${base_bindir} \
>> +    --enable-etcdir=${sysconfdir} \
>> +    --enable-fndir=${datadir}/${PN}/${PV}/functions \
>> +    --enable-site-fndir=${datadir}/${PN}/site-functions \
>> +    --enable-function-subdirs \
>> +    --with-term-lib='ncursesw ncurses' \
>> +    --with-tcsetpgrp \
>> +    --enable-pcre \
>> +    --enable-cap \
>> +    --enable-multibyte \
>> +    --enable-gdbm \
>> +    --enable-dynamic \
>> +    zsh_cv_shared_environ=yes \
>> +    "
>> +
>> +do_configure () {
>> +    oe_runconf
>> +}
>> +
> why do you need to run oe_runconf explicitly.

Because I want to avoid invoking autotools, I just need to run
configure. I wrote this recipe some time ago, but from what I remember
zsh comes with some preloaded m4 macros that cause problems when default
autootols do_configure() step is executed. The preloaded configure
scripts works fine, even when cross-compiling. IMO it's better to use it
than to patch the package.

/ptw




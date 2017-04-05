Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D9D9771DF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 16:56:47 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w43so4367011wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fceEvPiJyYhMv5JaPKL4OK55SpqJM/8jSL/KKQDF+Kw=;
	b=Fqe51chFlwCe7w0niunlUR6hXxK+g7F7Q1uAgeRa25I7oMaSpvjER97sW/tHxdqPNJ
	dT24yYQy487FMO+2KCXrTZyS2/6AmYolcZnYuNDUgJnHjYJaDsZCVpXEL+r2mEEjOmPm
	MHnBCYg90XoJ3rtw+krBK1EYqHOu3dw23xct+biQGRHzvZKn6Ggd15XlGOS6UobNVcAB
	/ZCAN9B3yiRvhMQEk/hPquYgBoHJAUQYrWg65+DpDQWg7oUHHAYLhTDDOvo2yd31Wc7k
	Ik84nqCEohehcLd4pdM7pH335mt2l3osN/nYKVk7pW44blrQRfnypKH9nigZBgDByZ9s
	dF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fceEvPiJyYhMv5JaPKL4OK55SpqJM/8jSL/KKQDF+Kw=;
	b=tZRZb+gibsR5XMan7DXxwaNnDtJwfDJCeDujYw0TkVF4aVS+0CYdH7ovBKbBRd5Ziq
	Tt8NlCCIZyw/rnLx4tDWYNbolbbUn3KO3krMZ81hY+SvuLaPj90ygzsq7WsT3eIvkSpe
	IwmoLIXZij+bjs8OHOQZ4rBpP26tjYisBAOe9rcl903nkekpouk8JvyWmzIYQCmk9sfw
	WYh9GbKigxnyS6qS5eJ323f7fE7izLIsPwYSb8LlfW6hQZrFOJnhmS+DHsssK7RrKmbM
	KebldVKmCWXXM4fAN1hm9LjewmhIeeDUu1I4clyJjgiArMRkQ/3le4gbeDkJWTQ5Lcyx
	Se9A==
X-Gm-Message-State: AFeK/H1pHZTF48kw62M68wfuigtIloLjk8K4kCtSExbVeUSNdzDS8vTR
	CmkdL0dp6Mye7UVARN6nodyxhrtHrA==
X-Received: by 10.28.71.87 with SMTP id u84mr20400228wma.101.1491411408268;
	Wed, 05 Apr 2017 09:56:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 5 Apr 2017 09:56:17 -0700 (PDT)
In-Reply-To: <CA+chaQcx810httXF=Ypgc9Hei5hS2meva6MRP=TkPpjSGk6OSw@mail.gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-18-raj.khem@gmail.com>
	<CA+chaQcx810httXF=Ypgc9Hei5hS2meva6MRP=TkPpjSGk6OSw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Apr 2017 09:56:17 -0700
Message-ID: <CAMKF1sp1CNwRJKxSx337JT6DOXeW2MY+Pt0Rgc_uxP4=4mMA_w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 18/43] ttf-inconsolata: Move copying of .otf to .ttf into do_compile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Apr 2017 16:56:50 -0000
Content-Type: text/plain; charset=UTF-8

Drop this one, I see same error without this change, since it does not
fix the problem, I can look into it and send a new version if I find
the proper fix

On Sun, Apr 2, 2017 at 12:14 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> mv: cannot stat
> 'TOPDIR/tmp-glibc/work/all-oe-linux/ttf-inconsolata/20100526-r0/Inconsolata.otf':
> No such file or directory
> WARNING: exit code 1 from a shell command.
>
> http://errors.yoctoproject.org/Errors/Details/138841/
>
>
>
> On Fri, Mar 31, 2017 at 6:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Fixes errors like
>>
>> | mv: cannot stat
>> '/mnt/b/build/tmp-musl/work/all-oe-linux/ttf-inconsolata/20100526-r0/Inconsolata.otf':
>> No such file or directory
>> | WARNING:
>> /mnt/b/build/tmp-musl/work/all-oe-linux/ttf-inconsolata/20100526-r0/temp/run.do_configure.2485:1
>> exit 1 from 'mv
>> /mnt/b/build/tmp-musl/work/all-oe-linux/ttf-inconsolata/20100526-r0/Inconsolata.otf
>> /mnt/b/build/tmp-musl/work/all-oe-linux/ttf-inconsolata/20100526-r0/ttf-inconsolata-20100526/Inconsolata.ttf'
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb | 7
>> ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git
>> a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
>> b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
>> index 20041bb7b..0d6df242a 100644
>> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
>> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
>> @@ -13,13 +13,14 @@ S = "${WORKDIR}/ttf-inconsolata-${PV}"
>>  FILES_${PN} = "${datadir}/fonts/truetype/Inconsolata.ttf \
>>      ${datadir}/doc/ttf-inconsolata/*"
>>
>> -do_configure() {
>> +deltask do_configure
>> +
>> +do_compile_prepend() {
>>      mv ${WORKDIR}/Inconsolata.otf ${S}/Inconsolata.ttf
>>  }
>>
>>  do_install_append() {
>> -    install -d ${D}${datadir}/doc/ttf-inconsolata/
>> -    install -m 0644 ${WORKDIR}/OFL.txt
>> ${D}${datadir}/doc/ttf-inconsolata/
>> +    install -D -m 0644 ${WORKDIR}/OFL.txt
>> ${D}${datadir}/doc/ttf-inconsolata/OFL.txt
>>  }
>>
>>  SRC_URI[md5sum] = "0fbe014c1f0fb5e3c71140ff0dc63edf"
>> --
>> 2.12.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


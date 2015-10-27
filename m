Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id DB1187570D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 18:27:01 +0000 (UTC)
Received: by igpw7 with SMTP id w7so12421489igp.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=iGnXcSLj9lJPvURb/kzgKr0tWVM7rMPAAezaX4fDgjM=;
	b=s3qDaWzmuieqbIsOMo1sLztaiwHbiPgMIPsReK9KhfEEBA1zlf+PjGi7yFrzqdy6rC
	wUxwvxoy6bLPFcUBbE1j42D9CIRkW9crjaSXqzef6plP9yCf97OZuXa1n+u6td+PhEND
	pgZMHe1FRFI0/FGqYnMoZyVlS2rV2br/phx9BwgVmmRffnZCV1gxc5WF5kkWhWbDDoNB
	mvbZ5sAh9+lQ43v5DAUFi3TPT2NJT53qvAh9FjcLngH7H0F2W22CeVUTQSS/hegJr2z8
	EbBK52BmrfreOcD4TFHxXRFUtTCuVNXMeDxTY6eknKIssGaDgmlZLbO860c/z1J/N0Zk
	VFYQ==
X-Received: by 10.50.142.8 with SMTP id rs8mr28065174igb.77.1445970421435;
	Tue, 27 Oct 2015 11:27:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Tue, 27 Oct 2015 11:26:32 -0700 (PDT)
In-Reply-To: <20151027182121.GF2577@jama>
References: <55EAE272.5010904@topic.nl> <20151027182121.GF2577@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Oct 2015 11:26:32 -0700
Message-ID: <CAMKF1spKg10RUh3O3f+skxykHvGHA9Si-LvD1jKLDUQCrE2rtw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: "krb" fails to build, suspect GCC bug
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
X-List-Received-Date: Tue, 27 Oct 2015 18:27:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 27, 2015 at 11:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Sep 05, 2015 at 02:39:14PM +0200, Mike Looijmans wrote:
>> I got this weird build failure from the "krb" package:
>>
>> | make[3]: Entering directory
>> '/TOPDIR/build/tmp/work/mips32el-oe-linux/krb5/1.13.2-r0/krb5-1.13.2/src/lib/krb5/ccache'
>> | mipsel-oe-linux-gcc  -mel -mabi=32 -mhard-float -march=mips32
>> --sysroot=/TOPDIR/build/tmp/sysroots/formuler1 -fPIC -DSHARED
>> -DHAVE_CONFIG_H  -I../../../include -I../../../include -I./ccapi -I. -I.
>>   -DKRB5_DEPRECATED=1 -DKRB5_PRIVATE  -Os -pipe -g
>> -feliminate-unused-debug-types -DDESTRUCTOR_ATTR_WORKS=1
>> -I/TOPDIR/build/tmp/sysroots/formuler1/usr/include/et -Wall -Wcast-align
>> -Wshadow -Wmissing-prototypes -Wno-format-zero-length -Woverflow
>> -Wstrict-overflow -Wmissing-format-attribute -Wmissing-prototypes
>> -Wreturn-type -Wmissing-braces -Wparentheses -Wswitch -Wunused-function
>> -Wunused-label -Wunused-variable -Wunused-value -Wunknown-pragmas
>> -Wsign-compare -Werror=uninitialized -Werror=pointer-arith
>> -Werror=declaration-after-statement
>> -Werror-implicit-function-declaration -pthread -c cc_file.c -o
>> cc_file.so.o && mv -f cc_file.so.o cc_file.so
>> | cc_file.c: In function 'fcc_next_cred':
>> | cc_file.c:368:9: error: 'maxsize' may be used uninitialized in this
>> function [-Werror=maybe-uninitialized]
>> |      ret = load_data(context, id, maxsize, buf);
>> |          ^
>> | cc_file.c:1091:12: note: 'maxsize' was declared here
>> |      size_t maxsize;
>> |             ^
>> | cc1: some warnings being treated as errors
>>
>> Looking at the source, this doesn't make any sense at all. The
>> declaration of the variable isn't even in the same method body. And the
>> line it complains about is about the fifth time it passes that variable
>> to another method.
>>
>> And working around it by initializing maxsize=0 just makes the compiler
>> choke on a similar situation elsewhere:
>> | packet.c:50:67: error: 'id' may be used uninitialized in this function
>>
>>
>> I suspect the problem here is GCC and not the krb code. Anyone seen this?
>
> I've seen it today in my world builds, It seems to fail only when building with -Os.
>
> I've seen similar issue in mdadm, also only with -Os.
>

is this regression ? or seen for first time?

> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


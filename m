Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id AC5BB6CBDA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 14:27:44 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id e14so9351487iej.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=PhQZxE5xW0To4eUqFLJwBmUPI3O/RjjwSDnUcr0bJUU=;
	b=KOHM5kL1LMrBRjDx2PZuUMBzK543qfDuV3pvHYN+8hDKNdxO6wLaHIMsjmru2T4WGo
	qbXxGH8ykDMUuPj4CKFzYXod+yMvSuPWJsnxriv6GYqZrzZNfqVDab2Z169Mqu8rlieq
	l3APaqbiDSpYdz40pUM0gFeCErDlNGnuE6eCnkeriJv78iGb4M7U6871JAFNU8C1zzZk
	w0gC4jelwweNgsnE7F1EGb0fmfyEA+YKKlR6GjiQTcn4vUy7szx5/v1LOJhOPBhZ6aq+
	yQBjzspJyzwiquzKXzWbkNNEks7N6g0XxnPW212qUlqYN2E+3ZA61dXk1Wiz42fCFrY8
	7TyQ==
MIME-Version: 1.0
X-Received: by 10.50.153.16 with SMTP id vc16mr6642157igb.8.1380896866323;
	Fri, 04 Oct 2013 07:27:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Fri, 4 Oct 2013 07:27:46 -0700 (PDT)
In-Reply-To: <20131004141938.GI6240@jama>
References: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
	<CAP9ODKpxHF4NUurt-U9HakdAWJ6LAz6HaNoHnuuf5fpEh0h-ow@mail.gmail.com>
	<20131004141938.GI6240@jama>
Date: Fri, 4 Oct 2013 11:27:46 -0300
X-Google-Sender-Auth: N8YFnH1Gov8yfPOH0-YFL3xydFk
Message-ID: <CAP9ODKqLRgh2jO4dDDPwkFd5RLM+hZjaFVVg=VXuTy0C_ukTkg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/2] wvstreams: add recipe for version 4.6.1
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
X-List-Received-Date: Fri, 04 Oct 2013 14:27:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 4, 2013 at 11:19 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Sep 24, 2013 at 11:42:21AM -0300, Otavio Salvador wrote:
>> On Tue, Sep 24, 2013 at 9:43 AM, Mario Domenech Goulart
>> <mario@ossystems.com.br> wrote:
>> > Recipe based on OE classic's recipe for version 4.4.1, as of
>> > 0585ccfa49f71a81652c7f63885202e952ebd0e9.
>> >
>> > Summary of changes against OE classic's recipe:
>> >
>> > * Apply some Debian patches from
>> >   http://patch-tracker.debian.org/package/wvstreams/4.6.1-6
>> >
>> > * Minor adjustments for the current build system (add
>> >   LIC_FILES_CHKSUM, md5 and sha256 sums for SRC_URI, fix LICENSE, remove
>> >   PR)
>> >
>> > * Disable parallel make, since it was causing errors like
>> >
>> > Log data follows:
>> > | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
>> > | DEBUG: Executing shell function do_compile
>> > | NOTE: make -j 8
>> > | ./CXX -c utils/wvbuffer
>> > | ./CXX -c utils/wvbufferstore
>> > | ./CXX -c utils/wvcont
>> > | /bin/bash: ./CXX: No such file or directory
>> > | /bin/bash: ./CXX: No such file or directory
>> > | /bin/bash: ./CXX: No such file or directory
>> > | * Generating CC using c
>> > | make: * Generating CXX using cc
>> > | *** [utils/wvbuffer.o] Error 127
>> > | make: *** Waiting for unfinished jobs....
>> > | make: *** [utils/wvbufferstore.o] Error 127
>> > | make: *** [utils/wvcont.o] Error 127
>> > | ERROR: oe_runmake failed
>> > | WARNING: .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/run.do_compile.19302:1 exit 1 from
>> > |   exit 1
>> > | ERROR: Function failed: do_compile (log file is located at .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/log.do_compile.19302)
>> >
>> > Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
>>
>> Just for reference, Mario and I discussed about the path for including
>> this recipe.
>>
>> We agreed it to be placed at wvdial subdir as it will only be used by it.
>>
>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Sorry for huge delay caused by monster build running on jenkins for 11
> days.. but this needs small fix for new QA issue:
>
> wvstreams-4.6.1: wvstreams: Files/directories were installed but not
> shipped
>   /usr/lib/valgrind
>   /usr/lib/valgrind/wvstreams.supp

Sure; Mario, can you split this into a ${PN}-valgrind package?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


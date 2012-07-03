Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SlxEh-0001Ap-W1
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jul 2012 09:09:29 +0200
Received: by obcva7 with SMTP id va7so9475468obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jul 2012 23:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=p2QBta/vZhRJJZcXgmhhYYgOCqBfI/uKntqDIVsQAiQ=;
	b=Jy6A3x9V+1pzthHT2T/wjB1YQCKkDoy8zyqihxwtNLLTZGCTPzfGIaXujdosNjk+zP
	mppxkIo5N3pyJ0HtIncpiJBZRE2yUX0AsIuXxUsF/4vFs8eipATYX4ZC/wyL2+mvyCsE
	PEHfmfsTPr7MtDR8zDg0/VWI7oNNkrR13dICSksG72r6UiO2f6GEr++WQ7Wo39BZ2PnN
	P4u0mW+TEQWgmUPWObyg1uUSiUe/zoHCzyhlMSJ9n/VqvonRsBSj03a/7PDku4VOVjan
	9wsyZwXJuyJVJxoHVhLN9V9R5kdrtWSD3urQtowMgomn1KQPdsFI6CRZa1W11TCS9iT1
	VM6A==
MIME-Version: 1.0
Received: by 10.60.29.72 with SMTP id i8mr16905731oeh.26.1341298701778; Mon,
	02 Jul 2012 23:58:21 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Mon, 2 Jul 2012 23:58:21 -0700 (PDT)
In-Reply-To: <20120703062713.GA3771@jama.jama.net>
References: <1341280162-18161-1-git-send-email-dennis.yxun@gmail.com>
	<20120703062713.GA3771@jama.jama.net>
Date: Tue, 3 Jul 2012 14:58:21 +0800
Message-ID: <CAF1ZMEfL4Fgo4krD7A15mnpEK03m8aH568=m8rbfdAYpP25hww@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core][PATCH v3] openjade-native: fix undefined Getopts error, use std namespace
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
X-List-Received-Date: Tue, 03 Jul 2012 07:09:29 -0000
Content-Type: text/plain; charset=UTF-8

My bad~
Will bump PR
I didn't even notice that, just copy and paste the ML

On Tue, Jul 3, 2012 at 2:27 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Jul 03, 2012 at 01:49:22AM +0000, Dennis Lan wrote:
>> Using Gentoo Linux as the build host, it fails without this patch
>> Use Getopt::Std in place of getopts.pl.
>
> Hi,
>
> missing PR bump in recipe and this time (in v3) wrong ML.
>
> Cheers,
>
>>
>> https://bugs.gentoo.org/show_bug.cgi?id=420083
>>
>> which following error:
>> /usr/bin/perl -w ./../msggen.pl -l jstyleModule InterpreterMessages.msg
>> /usr/bin/perl -w ./../msggen.pl -l jstyleModule DssslAppMessages.msg
>> Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
>> make[2]: *** [InterpreterMessages.h] Error 2
>> make[2]: *** Waiting for unfinished jobs....
>> Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
>> make[2]: *** [DssslAppMessages.h] Error 2
>>
>> Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
>> ---
>>  .../openjade/openjade-1.3.2/msggen.pl.patch        |   44 ++++++++++++++++++++
>>  .../openjade/openjade-native_1.3.2.bb              |    1 +
>>  2 files changed, 45 insertions(+), 0 deletions(-)
>>  create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
>>
>> diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
>> new file mode 100644
>> index 0000000..b47fd46
>> --- /dev/null
>> +++ b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
>> @@ -0,0 +1,44 @@
>> +commit fcc5b94f118495b1a467edcda6c6f631691c3f69
>> +Author: Dennis Lan <dennis.yxun@gmail.com>
>> +Date:   Tue Jul 3 09:25:42 2012 +0800
>> +
>> +    openjade: fix undefined Getopts error, use std namespace
>> +
>> +    Using Gentoo Linux as the build host, it fails without this patch
>> +    Use Getopt::Std in place of getopts.pl.
>> +
>> +    Upstream-Status: Inappropriate [no upstream]
>> +    Original-Author-By: Mike Gilbert <floppym@gentoo.org>
>> +    Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
>> +
>> +diff --git a/msggen.pl b/msggen.pl
>> +index 0c33968..2ee3f66 100644
>> +--- a/msggen.pl
>> ++++ b/msggen.pl
>> +@@ -4,6 +4,7 @@
>> + # See the file COPYING for copying permission.
>> +
>> + use POSIX;
>> ++use Getopt::Std;
>> +
>> + # Package and version.
>> + $package = 'openjade';
>> +@@ -18,8 +19,7 @@ $gen_c = 0;
>> + undef $opt_l;
>> + undef $opt_p;
>> + undef $opt_t;
>> +-do 'getopts.pl';
>> +-&Getopts('l:p:t:');
>> ++getopts('l:p:t:');
>> + $module = $opt_l;
>> + $pot_file = $opt_p;
>> +
>> +@@ -72,7 +72,7 @@ while (<DEF>) {
>> +     else {
>> +     $field[0] =~ /^[IWQXE][0-9]$/ || &error("invalid first field");;
>> +     $type[$num] = substr($field[0], 0, 1);
>> +-    $argc = int(substr($field[0], 1, 1));
>> ++    $argc = substr($field[0], 1, 1);
>> +     }
>> +     $nargs[$num] = $argc;
>> +     $field[1] =~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ || &error("invalid tag");
>> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
>> index 5b29c1f..efd1e11 100644
>> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
>> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
>> @@ -14,6 +14,7 @@ RDEPENDS_${PN} = "sgml-common-native"
>>
>>  SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
>>             file://makefile.patch \
>> +           file://msggen.pl.patch \
>>             file://reautoconf.patch \
>>          file://user-declared-default-constructor.patch"
>>
>> --
>> 1.7.9.rc2
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



Received: from mail-ie0-f172.google.com ([209.85.223.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TfXyT-0005bu-W1
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 16:30:26 +0100
Received: by mail-ie0-f172.google.com with SMTP id c13so5274936ieb.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 07:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QkCln5sOJkK7IR/VUXLNFBL+DzpaqGGfOdj1ndUXX0s=;
	b=ITtCKySa0PLp/uVYPgpQf8RXYJxyYIeAyS5LgsbnubZqMcl6GHmwzNuUKEh4mm3ASU
	wmE/vaTZfERBGSADRc3h5NkrfJQxuTXdYzSUg1oq/jDb6flrLT1O693RJl0b5DBxlW42
	DvUeHNhAxtI66+if57+sEH958bWR80tP+BznSSivvIxMlL/7an4MzEo0NMa6n00BegJu
	CMjG3RQV5f16IDTO72MIUiO1OVO8FCjRrevoBSJV52S6c+NVYKUl10u7qAayKL4UCAsM
	OBc4rEqr0kJtkWQ5dVwSHCbSnMAl7NfYoNGAsWH3+sE1kzenvdkGvz+eprwx3dNEL1ve
	CF9Q==
MIME-Version: 1.0
Received: by 10.50.242.73 with SMTP id wo9mr6521488igc.36.1354547764134; Mon,
	03 Dec 2012 07:16:04 -0800 (PST)
Received: by 10.64.24.179 with HTTP; Mon, 3 Dec 2012 07:16:03 -0800 (PST)
In-Reply-To: <CA+chaQfjv11Mk_vZwAHsfQEr=ncqda9BOKfych_xU+Gs8wZyQQ@mail.gmail.com>
References: <1351604444-16246-1-git-send-email-s.stirtzel@googlemail.com>
	<CA+chaQfjv11Mk_vZwAHsfQEr=ncqda9BOKfych_xU+Gs8wZyQQ@mail.gmail.com>
Date: Mon, 3 Dec 2012 16:16:03 +0100
Message-ID: <CAGiJk9f3+e19_wk6SnoBPcgPCxYVAMW5Uq+-eouJ8B9Y04P4QQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] maliit-plugins: Clean up recipe and add missing RDEPENDS
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
X-List-Received-Date: Mon, 03 Dec 2012 15:30:26 -0000
Content-Type: text/plain; charset=UTF-8

2012/12/3 Martin Jansa <martin.jansa@gmail.com>:
> On Tue, Oct 30, 2012 at 2:40 PM, Samuel Stirtzel
> <s.stirtzel@googlemail.com> wrote:
>> The following errors are only shown when started from console, also there are no visible errors during execution.
>> Error fixed: QML Image: Error decoding: file:///usr/share/maliit/plugins/org/nemomobile/icon-m-input-methods-shift-lowercase.svg: Unsupported image format
>>
>> This is unaffected from whether libqtsvg4 is installed or not.
>>
>> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> ---
>>  .../recipes-support/maliit/maliit-plugins_git.bb   |   10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
>> index 932c0ae..2fb52c7 100644
>> --- a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
>> +++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
>> @@ -8,6 +8,8 @@ inherit autotools qt4x11
>>
>>  DEPENDS = "maliit-framework"
>>
>> +RDEPENDS_${PN} += "qt4-plugin-iconengine-svgicon qt4-plugin-imageformat-svg"
>> +
>>  SRC_URI = "git://gitorious.org/maliit/maliit-plugins.git;branch=master"
>>
>>  SRCREV = "0760e585df494b394df1b887e5138ffef19c481f"
>> @@ -23,12 +25,8 @@ FILES_${PN} += "\
>>      ${datadir} \
>>      "
>>
>> -FILES_${PN}-dbg += "\
>> -    ${libdir}/maliit/plugins-*/.debug \
>> -    "
>> +FILES_${PN}-dbg += "${libdir}/maliit/plugins-*/.debug"
>>
>>  S= "${WORKDIR}/git"
>>
>> -do_install() {
>> -  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
>> -}
>> \ No newline at end of file
>> +EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
>> --
>
> It fails to build docs on hosts without doxygen, can we disable docs?

Seems like I was careless, this hasn't been noticed as doxygen is
installed on all my build machines.

However I'll send a follow-up patch, do you want me to disable docs
for the framework as well? The Framework uses gtk-doc.
>
> | make[1]: Entering directory
> `/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/git/doc'
> | sed -e "s;@VERSION@;0.92.3;g" -e
> "s;@IN_PWD@;/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/git/doc;g"
> doxyfile.conf.in >
> /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/git/doc/doxyfile.conf
> && doxygen /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/git/doc/doxyfile.conf
> | /bin/sh: doxygen: command not found
> | make[1]: *** [html/index.html] Error 127
> | make[1]: Leaving directory
> `/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/git/doc'
>
> Cheers,
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Regards
Samuel



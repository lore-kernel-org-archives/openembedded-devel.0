Return-Path: <net147@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5222770761
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 01:21:42 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id q107so2472096qgd.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 18:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2zr9R044EiMSbXqAlgaMqitBNXt5oaNvgxEYgxpIh3Q=;
	b=cvwvzG8PiLmIKGcKlvXMRe6PxT2pkFoYAu52GPAG1Q7gBsPS5ZjUmamZzVlS3kn0w/
	tSDWoNinTxf4OaP+9IVXLLp5GojeSACrWNXbo5KVkf4sjoJ9bljkRubx5thWPAnuR8uf
	Jw9D2Y8tlqM452vnOQ+QBcEv1V7os4NTPm8JY/QrnxFtYG9CgjjkjrjAmavM6fq40sKe
	mwBeTzNLB89L7AtAVMbZbMv0jAWQ8Jvn5Pa4YbW+2GIELIkkYknK1FCegBUEOu7tdUze
	1hQTZndViL/UbMwc2k9YsLpXhXliX6isCkYBKW8fZJrJaCy46597VdFGa05Ime5L0JOH
	tCzQ==
MIME-Version: 1.0
X-Received: by 10.140.27.144 with SMTP id 16mr8516515qgx.18.1406164903038;
	Wed, 23 Jul 2014 18:21:43 -0700 (PDT)
Received: by 10.96.73.169 with HTTP; Wed, 23 Jul 2014 18:21:42 -0700 (PDT)
In-Reply-To: <CAPbeDCkbza6BYMHWDEPn9Fmfevv6s3in9-wPKzF_rC0637xzGA@mail.gmail.com>
References: <1404965315-9777-1-git-send-email-net147@gmail.com>
	<CAPbeDCkbza6BYMHWDEPn9Fmfevv6s3in9-wPKzF_rC0637xzGA@mail.gmail.com>
Date: Thu, 24 Jul 2014 11:21:42 +1000
Message-ID: <CANwerB0vDa_SRuoUDPs61aGUAirMZTDvAoeUie-Woew66dXxzA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: fix 0003-Add-external-hostbindir-option.patch
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
X-List-Received-Date: Thu, 24 Jul 2014 01:21:49 -0000
Content-Type: text/plain; charset=UTF-8

On 24 July 2014 00:44, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> On Thu, Jul 10, 2014 at 6:08 AM, Jonathan Liu <net147@gmail.com> wrote:
>>
>> The isEmpty function takes a variable name instead of a value.
>> As $$[QT_EXTERNAL_HOST_BINS] is a built-in we need to assign it to a
>> variable to check if it is empty.
>>
>> If QT_EXTERNAL_HOST_BINS is empty (as is the case for generated Qt 5
>> toolchains), we need to fallback to QT_HOST_BINS when determining
>> the path for tools such as moc otherwise you get the following error
>> when building a Qt project using the generated toolchain:
>> make[1]: /moc: Command not found
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  .../0003-Add-external-hostbindir-option.patch      | 65
>> +++++++++++++---------
>>  .../0003-Add-external-hostbindir-option.patch      | 65
>> +++++++++++++---------
>>  2 files changed, 78 insertions(+), 52 deletions(-)
>>
>
> On my system, this change seems to cause "syncqt.pl" being removed from the
> "qtbase-tools" package.
> From buildhistory:
>
> -FILELIST = /usr/bin/qt5/moc /usr/bin/qt5/qdoc /usr/bin/qt5/qlalr
> /usr/bin/qt5/rcc /usr/bin/qt5/syncqt.pl
> +FILELIST = /usr/bin/qt5/moc /usr/bin/qt5/qdoc /usr/bin/qt5/qlalr
> /usr/bin/qt5/rcc
>
> Is this by intention ? The package still RDEPENDS on perl.
>
> /Jacob

No, it is not intentional.

Regards,
Jonathan


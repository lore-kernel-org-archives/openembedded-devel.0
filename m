Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB0072F7B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:15:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1488244553; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=mPXoIV64Ffkqw+e3XiFG90fKMeQFRq4vXrexx18HBNI=;
	b=O+V1iB93VcPspW9aPM/Zzp6qFl5/DojE6FtV13sG7Yzncq8H3R5XgefBknt91vn/yuiY7lXz
	JRS2eApcqZBz/HVeIK5MTeOHV4L1FQFsipIZWDvBgk7AFXbhKVQSPZK8xxXP4PP3Jhx3kQHY
	xc35gxCyZCIZpHJdSfvLVqLtok0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=DGLwzH3MGx/JGmBdp8KYzSHb7kON1sqiY0DKPJLoDzDG72aesgsuFMo3OS/zxl6vUsuTpN
	IVglJTt6/tmGlCs+TEfA/jP7rR9Pvy7hOYhgkYILGUIIAQoaRn5gsXFDYuXa13yseFyI7VJW
	c8MJAYelQqVkvS8/gMshfFAg1fn0c=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mxa.mailgun.org with ESMTP id 58b4cf49.7f7dd8cd1530-smtp-out-n02;
	Tue, 28 Feb 2017 01:15:53 -0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id 203so70604146ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 17:15:53 -0800 (PST)
X-Gm-Message-State: AMke39lXLod6ePbFCnkUCiYIxYme73J9tl4MczJsc2PiuvIu/CXj31PPXD46xrK1JzJr3xDWe7ai3CmKaTCTWw==
X-Received: by 10.36.36.142 with SMTP id f136mr18278546ita.0.1488244552878;
	Mon, 27 Feb 2017 17:15:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Mon, 27 Feb 2017 17:15:52 -0800 (PST)
In-Reply-To: <CA+chaQcMcm3mkYNpMnHhvVw78TXBSzRihKa3so5am+Jbwd+sKQ@mail.gmail.com>
References: <1487965301-24934-1-git-send-email-derek@asterius.io>
	<CA+chaQcMcm3mkYNpMnHhvVw78TXBSzRihKa3so5am+Jbwd+sKQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 27 Feb 2017 20:15:52 -0500
X-Gmail-Original-Message-ID: <CADNbA1o1CR_yGUdW0FGLg78oB8O3q4WWzdqX++aLw5AUYdPZ3A@mail.gmail.com>
Message-ID: <CADNbA1o1CR_yGUdW0FGLg78oB8O3q4WWzdqX++aLw5AUYdPZ3A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ruby][PATCH] bundler: resolve build issues with RSS
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
X-List-Received-Date: Tue, 28 Feb 2017 01:15:53 -0000
Content-Type: text/plain; charset=UTF-8

I'll take a look at the failure, but I may not get to it for a few days.
Feel free to drop it until I send a v2.

-Derek

On Mon, Feb 27, 2017 at 9:08 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Still fails in bitbake world:
>
> ERROR: bundler-1.9.4-r0 do_compile: Function failed: do_compile (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/bundler/1.9.4-r0/temp/log.do_compile.3462)
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/bundler/1.9.4-r0/temp/log.do_compile.3462
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | ERROR:  Loading command: build (LoadError)
> | 	cannot load such file -- zlib
> | ERROR:  While executing gem ... (NoMethodError)
> |     undefined method `invoke_with_build_args' for nil:NilClass
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/bundler/1.9.4-r0/temp/log.do_compile.3462)
> NOTE: recipe bundler-1.9.4-r0: task do_compile: Failed
> ERROR: Task (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-ruby/recipes-devtools/ruby/bundler_git.bb:do_compile) failed with exit code '1'
>
>
> On Fri, Feb 24, 2017 at 8:41 PM, Derek Straka <derek@asterius.io> wrote:
>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  meta-ruby/recipes-devtools/ruby/bundler_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
>> b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
>> index f2d8f3c..2b5cef4 100644
>> --- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
>> +++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
>> @@ -20,6 +20,8 @@ PV = "1.9.4"
>>
>>  S = "${WORKDIR}/git"
>>
>> +DEPENDS += "zlib"
>> +
>>  SRC_URI = " \
>>      git://github.com/bundler/bundler.git;branch=${BRANCH}
>> <http://github.com/bundler/bundler.git;branch=$%7BBRANCH%7D> \
>>      "
>> @@ -29,5 +31,3 @@ inherit ruby
>>  RDEPENDS_${PN} = "git"
>>
>>  BBCLASSEXTEND = "native"
>> -
>> -PNBLACKLIST[bundler] ?= "Fails to build with RSS
>> http://errors.yoctoproject.org/Errors/Details/130640/"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>


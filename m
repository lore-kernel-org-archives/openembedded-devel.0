Return-Path: <max.oss.09@gmail.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 420D8722C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 20:51:54 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id j7so12817759qaq.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 12:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fgotIG2bujVDwr/1HdsSEp6Dn3tpBR4M7iMzKcKUBQU=;
	b=U9koz11LXISEmhIh411wmDA+0CHAjolVvlB0KsNyHymR4Hd8h4YuZFknKSce/OmP6r
	lvS96eIxIh5K3ixfGlzCPhwGbAX684CqzoTsLIYN4o1ASPbLLpdTOyTsSeLO3/48uZ7w
	4le2UpILmY3GbWUYhxIoS6tOTvHfJSUAiWA55qS8kj0mNGe6bhThpaoK+TxfnxodtECA
	lRjZiiWhDA5za+7oTH5rNGYlyLWNRJzsIVloIKbxAwdf5GNyel5/ofm8PQR2gnk//JZc
	o0E4ricy+BOGzn2OtsmP7Xm+DngfGg4Wxk7bKNhJYYQ1xOaPIl1eeYKfozISLgMfUCuV
	QCKQ==
MIME-Version: 1.0
X-Received: by 10.224.130.198 with SMTP id u6mr19891082qas.9.1421355115063;
	Thu, 15 Jan 2015 12:51:55 -0800 (PST)
Received: by 10.140.30.229 with HTTP; Thu, 15 Jan 2015 12:51:55 -0800 (PST)
In-Reply-To: <CAEHkU3WoztGsMLVriJWqFCSuYboaQAFf8G_y1EtYHiyrh3i0UQ@mail.gmail.com>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
	<20150113132422.GJ18240@mail.itconsulting-heinold.de>
	<CAP9ODKocqaD+cXFba28jxXyd75aRmWnpwNY3NNx1wVY4Q3wVuA@mail.gmail.com>
	<loom.20150115T002923-253@post.gmane.org>
	<CAP9ODKpZzfTV41SDZjacbMi9=_BKkA7AoTgU+az4+7oUDreB3Q@mail.gmail.com>
	<CAEHkU3WoztGsMLVriJWqFCSuYboaQAFf8G_y1EtYHiyrh3i0UQ@mail.gmail.com>
Date: Thu, 15 Jan 2015 21:51:55 +0100
Message-ID: <CAEHkU3VmOOfi+nmyB2gERxghmb7n0uNXaNhiQ1zbaYtH33vAaw@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Henning Heinold <heinold@inf.fu-berlin.de>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Alex de Cabo <alejandro.de-cabo-garcia@congatec.com>
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Thu, 15 Jan 2015 20:52:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2015-01-15 12:29 GMT+01:00 Max Krummenacher <max.oss.09@gmail.com>:
> 2015-01-15 1:11 GMT+01:00 Otavio Salvador <otavio@ossystems.com.br>:
>> Hello,
>>
>> (I am adding Alex on Cc as well)
>>
>> On Wed, Jan 14, 2015 at 9:52 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
>>> Otavio Salvador <otavio <at> ossystems.com.br> writes:
>>>>  Can you prepare a patchset for it?
>>>>
>>>
>>> I'm not really convinced that reverting the static linking is a good
>>> approach as obviously something failed when linking dynamically.
>>>
>>> Both mails which reported the issue with the failing qemu-arm run were built
>>> for colibri-t20. The Tegra T20 SOC is a bit special as it does not have a
>>> Neon unit. Plus our standard setup uses angstrom which builds the linaro
>>> toolchain with thumb2 support.
>>>
>>> So the failing builds are failing with an unusual oe toolchain configuration
>>> and the root cause is the toolchain.
>>> I'm unsure if risking the failing builds with dynamic linking poping up
>>> again justifies fixing the build failures in an unusual configuration.
>>>
>>> If you don't think so I can prepare a patch, no problem.
>>
>> It is failing on me as well.
>>
>> Alex has found that QEMU -L command is causing issue so if your patch
>> fixes it, it could be an option for sure.
>>
>> I think there's no good answer as a patch for test. :-) I think we all
>> can try it and see if it improves it after all.
>
> OK, I will prepare a patch on top of meta-java master.

Patches done. I also added a test recipe with less dependencies to
test for the compiler issue.
See http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099849.html

Regards
Max
>
>
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


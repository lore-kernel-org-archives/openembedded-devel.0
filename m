Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 482A4756C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 20:15:06 +0000 (UTC)
Received: by iofh134 with SMTP id h134so636048iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 13:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=lQWy+e8SJShy8tQ6DiC4+KDticQzAhviK7uSDOwNbPA=;
	b=dh13jeEMpKdMDc7symUb7z7t0IHLrnnZFh5z7B0KwRpzrAw5c6wwc3zmXk4Q7oA38U
	3TWOdIRrSfXeDPZ6kdhILP8WCCZdSHKcbAYugEwWS7u4mg+SMRkmtFw1bUazf+yRhej9
	L4FuJJAgoxwRXw7smq+aw7lsYjLP3QVOsnH6TqpV/2gn0+fpZ2SSj1YQViIUOoVd5e+s
	sPM644lVjEa8Ual0R6er59ALIzzyEtMtNp1yyL1G9MgDHg734rjkJbRh0fpx9Nm/El4j
	czAK4f2coGk1X1QcaG7/2emt4l0KwlqUWpC7tSxaBCFlLqgKpAvAVFQml+yQ7Mnw0pPk
	467Q==
X-Received: by 10.107.34.149 with SMTP id i143mr54975ioi.195.1442434507157;
	Wed, 16 Sep 2015 13:15:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Wed, 16 Sep 2015 13:14:37 -0700 (PDT)
In-Reply-To: <55F977E4.3030202@igalia.com>
References: <1442321402-22469-1-git-send-email-clopez@igalia.com>
	<1442321402-22469-4-git-send-email-clopez@igalia.com>
	<CAMKF1sqRmW0WYzAyusDEW47onz-h9W0tZ-sYWyqp28=u3fbzgQ@mail.gmail.com>
	<55F977E4.3030202@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Sep 2015 13:14:37 -0700
Message-ID: <CAMKF1spB0fDhZfDcvoDwUMYow9hJq-OknnksHbV=kMyzokEQog@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 3/3] chromium: Rework the evaluation of the Wayland feature.
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
X-List-Received-Date: Wed, 16 Sep 2015 20:15:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 16, 2015 at 7:08 AM, Carlos Alberto Lopez Perez
<clopez@igalia.com> wrote:
> On 15/09/15 18:56, Khem Raj wrote:
>> On Tue, Sep 15, 2015 at 5:50 AM, Carlos Alberto Lopez Perez
>> <clopez@igalia.com> wrote:
>>> +    CHROMIUM_BUILD_TYPE = d.getVar('CHROMIUM_BUILD_TYPE', True)
>>
>> Lets default to one if its not set by user and set a bb.note about
>> what is chosen may be Release as default is good.
>>
>
> It already defaults to Release. The first patch in the series does that
> in chromium.inc
>

OK I did not see it first time.

>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


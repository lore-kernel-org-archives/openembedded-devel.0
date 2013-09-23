Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 509BB6007B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 07:26:17 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id n2so267620oag.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 00:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=zKq998oF4eIEhioWDlp465eXQnS1t5pWb5KGuEvVjEc=;
	b=cEn7dKfexYq4mzWw4KD6U3F7/gsToOqngqG7oxnnsEK/xj0+xDVkGWmUpPRJkRvh6e
	wCaVwqnpSD1t7jvHYHNDX/r01QsPdsWYbbOX1TFWcFtgODfqHdUjHV75+ootmSxbC1CI
	+1Y7RayBx+PNrEW0saVtEc7zNCptcAfnqI9v9qkWZnZWPFJD414LS6ekqDg0PpebEfbl
	Lr0zEqorbWmPKV1cOwfvFA6tCF4mHh4GIgo6Z0HACzxiD0f7UwngfKdNKD2AX5ra4XLr
	PEFsAzYBRnms9lLJqpXEsPxcRz3QdDqhYAipnfMIWuU1D8ebCN5OfnhG1+NgLoHywoBq
	AF+w==
X-Received: by 10.182.34.194 with SMTP id b2mr604867obj.41.1379921178345; Mon,
	23 Sep 2013 00:26:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.44.66 with HTTP; Mon, 23 Sep 2013 00:25:58 -0700 (PDT)
In-Reply-To: <20130920211831.GK18414@jama>
References: <1379509584-16503-1-git-send-email-s.stirtzel@googlemail.com>
	<1379509584-16503-2-git-send-email-s.stirtzel@googlemail.com>
	<20130920211831.GK18414@jama>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Mon, 23 Sep 2013 09:25:58 +0200
Message-ID: <CAGiJk9dLp4kuH4xSggSyN=quj=fHjL4-eR1VdKNuAvk1d-bz9A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] utouch-frame: Add initial recipe
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
X-List-Received-Date: Mon, 23 Sep 2013 07:26:18 -0000
Content-Type: text/plain; charset=UTF-8

2013/9/20 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, Sep 18, 2013 at 03:06:23PM +0200, Samuel Stirtzel wrote:
>> used by utouch-mtview, a visual multitouch test application for X
>>
>> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> ---
>>  meta-oe/recipes-support/utouch/utouch-frame_git.bb |   15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/utouch/utouch-frame_git.bb
>>
>> diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
>> new file mode 100644
>> index 0000000..83a4e25
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
>> @@ -0,0 +1,15 @@
>> +SUMMARY = "Touch Frame Library"
>> +DESCRIPTION = "The frame library and tools are used to handle touch frames, i.e., collections of tracked contacts. Bindings for mtdev and XI2.1."
>> +HOMEPAGE = "http://bitmath.org/code/evemu/"
>> +
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
>> +
>> +inherit autotools
>> +
>> +SRC_URI = "git://bitmath.org/git/frame.git;protocol=http"
>> +SRCREV = "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
>> +
>> +PV = "1.1.2+git${SRCPV}"
>> +
>> +S = "${WORKDIR}/git/"
>
> Missing dependency on utouch-evemu
>
> | configure:12204: error: Package requirements (utouch-evemu >= 1.0.5) were not met:
> | No package 'utouch-evemu' found
>

Hi,

fixed in v2.
Thanks for testing.


-- 
Regards
Samuel


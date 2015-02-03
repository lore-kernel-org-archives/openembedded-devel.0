Return-Path: <coldnew.tw@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 86C8260024
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Feb 2015 03:32:03 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lj1so90427752pab.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Feb 2015 19:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:references:to:subject:date:in-reply-to:message-id:mime-version
	:content-type; bh=zeL6twg8CG+pwW2Isap/WV8r/Y6z0JxNe2BFE0xNP3U=;
	b=anCTNv7EXGd+RxoRI4f9Uq2uDBVlvi5JWeHNrZqXW4LMTT3RHTheT7hQHEBB0zxxk+
	Wm9vgoeHu1iLVVkIezMRgZjPAda9Q95rMpST4nou1TR1RUck3pYbCm2CwnerxSMI4r7C
	0eehn3BYWLve+4ZuyQ0bTKGc/aGRIulOV+VgjNCz98QkAesmF6q3DqYf20DnB0/ovFD7
	+CWkqDgLsAdq3u7624997bxVGT8XKQhB0nntl+ayd28NpXw5j0S7Rl0c7H1WL5pUWI/Q
	Tftj9ssz2cCeUL9wH82dDy+nd4S7TZX0226PefewfNM2Q+CO5T/Fr7ZjinUGUbB4HGsy
	X4ag==
X-Received: by 10.66.62.229 with SMTP id b5mr35012177pas.30.1422934324029;
	Mon, 02 Feb 2015 19:32:04 -0800 (PST)
Received: from Rosia ([203.70.194.104])
	by mx.google.com with ESMTPSA id bc1sm502019pad.12.2015.02.02.19.32.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Feb 2015 19:32:02 -0800 (PST)
From: coldnew.tw@gmail.com
X-Google-Original-From: Yen-Chin, Lee <coldnew.tw@gmail.com>
References: <1422339291-43625-1-git-send-email-coldnew.tw@gmail.com>
	<20150131003637.GB9471@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 03 Feb 2015 11:31:41 +0800
In-reply-to: <20150131003637.GB9471@gmail.com>
Message-ID: <m2y4ofy8k1.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-raspberrypi][PATCH] layer.conf: handle dynamic layer configuration
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
X-List-Received-Date: Tue, 03 Feb 2015 03:32:12 -0000
Content-Type: text/plain


Ok, I'll resend these patches.

Andrei Gherzan writes:

> Hello,
>
> On Tue, Jan 27, 2015 at 02:14:51PM +0800, Yen-Chin Lee wrote:
>> Using a separate layer specific directory as meta-fsl-arm does with
>> qt5-layer, this will prevent meta-raspberrypi change layer dependencies
>> when add qt5 packages.
>>
>> patch is taken from:
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/conf/layer.conf#n20
>>
>> Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
>> ---
>>  conf/layer.conf | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/conf/layer.conf b/conf/layer.conf
>> index 7bffd4b..71f22b4 100644
>> --- a/conf/layer.conf
>> +++ b/conf/layer.conf
>> @@ -12,3 +12,7 @@ BBFILE_PRIORITY_raspberrypi = "6"
>>  # Additional license directories.
>>  LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
>>
>> +# Let us add layer-specific bbappends which are only applied when that
>> +# layer is included in our configuration
>> +BBFILES += "${@' '.join('${LAYERDIR}/%s/recipes*/*/*.bbappend' % layer \
>> +               for layer in BBFILE_COLLECTIONS.split())}"
>> --
>> 1.9.3 (Apple Git-50)
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> Thanks for your contribution but meta-raspberrypi uses the yocto mailinglist as
> stated in README. Please resend this patch accordingly.
>
> Thanks a lot,
>
> --
> Andrei Gherzan

--


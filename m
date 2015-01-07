Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4F371F26
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 01:52:43 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id v10so1447293pde.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 17:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=8VFzv297p7XlC62jIWf6sMoM9iute7YzpMkH3yDRvKQ=;
	b=s2FkA/1wv7mNbZoRdj09AAVQMeadPMp6ehHUhAJmYL7/AbWfqu3IiWEWdO2pG3yBBN
	mx6cRNFMTN5IDu3OKO0qpnrAaPHqXhrxGGUzSMNwZe9t9nZ5j8jl/nYLFdPg4sijEk1h
	cHvXqaON9/Xnv5gDgPEm0OLN9y422/uWqxLdqBA8xf3lByR01coLVIyoYD1ocsMLDaE+
	q2612BYGBVvMp33ZqMQC68dX61O1ewquXTzhHOCoP/MmutfIs+ZvZF30g7a54wlluQla
	86S7rW1JpO5rjJsSYRVMqvQyuDtfEDrKRNvQeErQ1Ncsubecry+d+eEPwG3vhcQww0gZ
	xNJw==
X-Received: by 10.66.155.170 with SMTP id vx10mr483234pab.137.1420595563670;
	Tue, 06 Jan 2015 17:52:43 -0800 (PST)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id uq15sm156966pab.8.2015.01.06.17.52.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 17:52:42 -0800 (PST)
Message-ID: <54AC9168.7030200@gmail.com>
Date: Tue, 06 Jan 2015 17:52:40 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1420560067-8617-1-git-send-email-akuster808@gmail.com>	<1420560067-8617-2-git-send-email-akuster808@gmail.com>
	<20150106163028.GA29986@jama>
In-Reply-To: <20150106163028.GA29986@jama>
Subject: Re: [meta-oe][PATCH 2/2] libssh: fix krb5 rdepends issue
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
X-List-Received-Date: Wed, 07 Jan 2015 01:52:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/06/2015 08:30 AM, Martin Jansa wrote:
> On Tue, Jan 06, 2015 at 08:01:07AM -0800, Armin Kuster wrote:
>> the default is to build with GSSAPI enable so we need
>> krb5 support.
>
> shouldn't it be in DEPENDS then? RDEPENDS could be too late for
> do_configure to detect it.
k.

>
> Also I don't see 0.6.3 version in current master:

hmm, Monday...

- Armin

> OE @ ~/meta-openembedded $ find . -name libssh\*
> ./meta-oe/recipes-support/libssh2
> ./meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
> ./meta-oe/recipes-support/libssh
> ./meta-oe/recipes-support/libssh/libssh_git.bb
>
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta-oe/recipes-support/libssh/libssh_0.6.3.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/libssh/libssh_0.6.3.bb b/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
>> index 771a47a..9c5ebf5 100644
>> --- a/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
>> +++ b/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
>> @@ -27,3 +27,6 @@ do_configure_prepend () {
>>   }
>>
>>   FILES_${PN}-dev += "${libdir}/cmake"
>> +
>> +# This builds with GSSAPI enabled as default
>> +RDEPENDS_${PN} = "krb5"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>


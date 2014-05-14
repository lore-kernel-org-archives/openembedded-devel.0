Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f50.google.com (unknown [209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 06D396098B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 14:18:59 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id b8so1502258lan.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 07:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kpOdMRfvcmiHAy2pJjRFCF8qlro20Ak5RQm3cBnyOwQ=;
	b=cffMaY3UxNC7A4xDu4Suj3QQLnKET/HjR8Lu7VmYcUpzVt3VG+omDWrhzaR/HEb7aa
	QuijSKC7be+SN2ZvZvcF624fkZe6VT5+gg/kCcBG+1XaCaI3+zX1XSaFa4p+ybX9le9e
	brCE0OdLRST90qpTJP5k0Eq5G+c9sdyXTFm/Q6ck6JFhLHilXzBYGhNgAtqAM61YHAJy
	rOmLHlK+9WtBPyuZ4RGcWQgC+BKkHYdWSt0r0K36cXpPb2PncjT3bRYwJd8K/uigX/aU
	V+SwXyO9MSSqqdY3V/sXl0LbFy+VIuya5npYZsJeD+JROEPoroC301AeFuokzA0xLLqn
	bv1g==
MIME-Version: 1.0
X-Received: by 10.112.155.105 with SMTP id vv9mr2520352lbb.29.1400076814550;
	Wed, 14 May 2014 07:13:34 -0700 (PDT)
Received: by 10.114.216.4 with HTTP; Wed, 14 May 2014 07:13:34 -0700 (PDT)
In-Reply-To: <53704ECE.6070403@windriver.com>
References: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
	<53704ECE.6070403@windriver.com>
Date: Wed, 14 May 2014 07:13:34 -0700
Message-ID: <CANx9H-A9_R=vqTmXS2T_tq16wfUewG85UO9QvifDiEqgo0qxZQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH v3 0/9] perl modules
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
X-List-Received-Date: Wed, 14 May 2014 14:19:09 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 11, 2014 at 9:32 PM, Hongxu Jia <hongxu.jia@windriver.com>wrote:

> It seems the URL http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Module-
> Build-Tiny-0.030.tar.gz
> could not access in China, I use http://cpan.metacpan.org/
> authors/id/L/LE/LEONT/Module-Build-Tiny-0.030.tar.gz
> instead, and the build is successed. The others is fine to me.
>
> Would you prefer I add a "MIRRORS +=" or do you think it is because the
latest release of this package is 0.036?


> //Hongxu
>
>
>
> On 05/07/2014 10:09 AM, Tim Orling wrote:
>
>> From: Tim Orling <TicoTimo@gmail.com>
>>
>> This series of recipes is the first step towards the
>> ultimate goal of getting Slic3r to build in OE.
>>
>> Changes since v2:
>>    * dropped libmodule-metadata as a patch for oe-core/meta/perl provides
>>        ** http://patches.openembedded.org/patch/71565/
>>    * correct DEPENDS for libmodule-build-tiny-perl ('*-perl-*' missing)
>>
>> Tim Orling (9):
>>    libtext-diff-perl: add 1.41
>>    libcapture-tiny-perl: add 0.23
>>    libmodule-runtime-perl: add 0.013
>>    libextutils-config-perl: add 0.007
>>    libextutils-helpers-perl: add 0.021
>>    libextutils-installpaths-perl: add 0.010
>>    libmodule-build-tiny-perl: add 0.030
>>    libextutils-cppguess-perl: add 0.07
>>    libalgorithm-diff-perl: add 1.15
>>
>>   .../libalgorithm/libalgorithm-diff-perl_1.15.bb    | 23 +++++++++
>>   .../libcapture/libcapture-tiny-perl_0.23.bb        | 36 +++++++++++++++
>>   .../libextutils/libextutils-config-perl_0.007.bb   | 24 ++++++++++
>>   .../libextutils/libextutils-cppguess-perl_0.07.bb  | 38 +++++++++++++++
>>   .../libextutils/libextutils-helpers-perl_0.021.bb  | 29 ++++++++++++
>>   .../libextutils-installpaths-perl_0.010.bb         | 25 ++++++++++
>>   .../libmodule/libmodule-build-tiny-perl_0.030.bb   | 54
>> ++++++++++++++++++++++
>>   .../libmodule/libmodule-runtime-perl_0.013.bb      | 35 ++++++++++++++
>>   .../recipes-perl/libtext/libtext-diff-perl_1.41.bb | 27 +++++++++++
>>   9 files changed, 291 insertions(+)
>>   create mode 100644 meta-perl/recipes-perl/libalgorithm/libalgorithm-
>> diff-perl_1.15.bb
>>   create mode 100644 meta-perl/recipes-perl/libcapture/libcapture-tiny-
>> perl_0.23.bb
>>   create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-
>> config-perl_0.007.bb
>>   create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-
>> cppguess-perl_0.07.bb
>>   create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-
>> helpers-perl_0.021.bb
>>   create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-
>> installpaths-perl_0.010.bb
>>   create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-
>> tiny-perl_0.030.bb
>>   create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-runtime-
>> perl_0.013.bb
>>   create mode 100644 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.
>> 41.bb
>>
>>
>


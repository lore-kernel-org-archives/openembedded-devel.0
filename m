Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PcvKB-0005vh-An
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 08:40:55 +0100
Received: by pzk12 with SMTP id 12so51267pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 23:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=fTJ8mFPZb0kd8dFJrtlLr9QU4jxgx1WE3cc1mVZE+lw=;
	b=rZgDf2fH/ylRP7N63dAq2TVKHI9AB/rIuYQniIDYlBII3bslEDJKNshNrH+YU/dvsO
	c2rvb7vxf81/0KXGTRIVgQbZhyYzCQ4+T1o0BJ70A7LnzgC0S7vdStLdId4MpGk58U6T
	MwrOP9LZruYvEFkcH+JG18G5O9+e66gUWxRuc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=FKWhjjFr82JUMSc7YGii2g8x0qOSt29ehN/dUX6etxViWtrNP7u5JE56ucnVi5LQGy
	S6Tblp3TwsT6aDQAw+x3tnJy0RX63zvnpmN8xTqkax9sfRJqtoBxOyv285/VNCFcoJxP
	EzqiKbsycokLG3FVRvJqGDvy4/DEusi45YrY0=
Received: by 10.142.43.10 with SMTP id q10mr646145wfq.106.1294818023162;
	Tue, 11 Jan 2011 23:40:23 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b11sm456006wff.21.2011.01.11.23.40.21
	(version=SSLv3 cipher=RC4-MD5); Tue, 11 Jan 2011 23:40:22 -0800 (PST)
Message-ID: <4D2D5AE2.7000806@gmail.com>
Date: Tue, 11 Jan 2011 23:40:18 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>	<1294084926-3115-12-git-send-email-rep.dot.nop@gmail.com>
	<20110111201854.GF6584@mx.loc>
In-Reply-To: <20110111201854.GF6584@mx.loc>
Subject: Re: [PATCH 12/12] xz: bump version
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
X-List-Received-Date: Wed, 12 Jan 2011 07:40:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/2011 12:18 PM, Bernhard Reutner-Fischer wrote:
> ping?
>

You should check the repo. This patch was pushed with my sign offs
now I have pushed this update as well

Thanks
-Khem

> A follow-up could also
> diff --git a/recipes/xz/xz.inc b/recipes/xz/xz.inc
> index ad23884..2ad345e 100644
> --- a/recipes/xz/xz.inc
> +++ b/recipes/xz/xz.inc
> @@ -4,7 +4,7 @@ LICENSE = "Public Domain"
>   HOMEPAGE = "http://tukaani.org/xz/"
>   INC_PR = "r0"
>   S ?= "${WORKDIR}/xz-${PV}"
> -EXTRA_OECONF = "--enable-shared"
> +EXTRA_OECONF = "--enable-shared --enable-small --disable-lzma-links"
>   BBCLASSEXTEND = "native"
>
>   inherit autotools
>
> but that's for another day..
>
> On Mon, Jan 03, 2011 at 09:02:06PM +0100, Bernhard Reutner-Fischer wrote:
>> Signed-off-by: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
>> ---
>> recipes/xz/xz.inc            |    1 +
>> recipes/xz/xz_4.999.9beta.bb |    5 -----
>> recipes/xz/xz_5.0.0.bb       |    5 +++++
>> 3 files changed, 6 insertions(+), 5 deletions(-)
>> delete mode 100644 recipes/xz/xz_4.999.9beta.bb
>> create mode 100644 recipes/xz/xz_5.0.0.bb
>>
>> diff --git a/recipes/xz/xz.inc b/recipes/xz/xz.inc
>> index cc4f966..ad23884 100644
>> --- a/recipes/xz/xz.inc
>> +++ b/recipes/xz/xz.inc
>> @@ -1,6 +1,7 @@
>> DESCRIPTION = "XZ Utils is free general-purpose data compression software with high compression ratio.  XZ Utils are the successor to LZMA Utils."
>> SECTION = "console/utils"
>> LICENSE = "Public Domain"
>> +HOMEPAGE = "http://tukaani.org/xz/"
>> INC_PR = "r0"
>> S ?= "${WORKDIR}/xz-${PV}"
>> EXTRA_OECONF = "--enable-shared"
>> diff --git a/recipes/xz/xz_4.999.9beta.bb b/recipes/xz/xz_4.999.9beta.bb
>> deleted file mode 100644
>> index 8733023..0000000
>> --- a/recipes/xz/xz_4.999.9beta.bb
>> +++ /dev/null
>> @@ -1,5 +0,0 @@
>> -require xz.inc
>> -PR = "${INC_PR}.0"
>> -SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"
>> -SRC_URI[xz.md5sum] = "cc4044fcc073b8bcf3164d1d0df82161"
>> -SRC_URI[xz.sha256sum] = "330312c4397608d8b7be362cc7edbfeafa6101614bc2164d816ea767656aa15c"
>> diff --git a/recipes/xz/xz_5.0.0.bb b/recipes/xz/xz_5.0.0.bb
>> new file mode 100644
>> index 0000000..cbf1112
>> --- /dev/null
>> +++ b/recipes/xz/xz_5.0.0.bb
>> @@ -0,0 +1,5 @@
>> +require xz.inc
>> +PR = "${INC_PR}.0"
>> +SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2"
>> +SRC_URI[md5sum] = "0652c09fdbb93ae2ce78c1368ffda612"
>> +SRC_URI[sha256sum] = "47a89e65c4690364a0123871a221e663d23a9fbd1ca756a804b10dd4006056d8"
>> --
>> 1.7.2.3
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




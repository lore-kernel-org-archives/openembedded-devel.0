Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5E508722C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 20:15:36 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 20so10399154yks.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 12:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=lWJRbmAFajQegAdSD/mn42NMb/A5Zjypd69eqUD/arM=;
	b=XG/oP2dYnYXbQMbKr5CirTdCMYPnttAutnizzqySzFWsNNFRJ0C1CBL6zVnBelkqvS
	DNTUjKMzs4FL0icWtcPtaD1qraOlIdAHMTB3poAwX/TND821/aaWg4GDdw7m1RiR/04A
	676mtnhr4eqO5IC0RZm9Hr7IQk44BeYQ4dwiJ20kVJBwSd3EbH8lG31YTsmboMolN4hn
	lcNB4h8nevl4ZkxoUp5IOeYa8Rqe1DaVIjaI8AmN8BZfVm000ycPOQp35pLc1CQiRbMX
	aXfLoLQmL23toDehWr60rYK98rXmzbxtub9d/2XM5noCLYpEEde5GLylwOvz2KNf4eEM
	xRAQ==
MIME-Version: 1.0
X-Received: by 10.170.70.193 with SMTP id m184mr12008656ykm.50.1421439336817; 
	Fri, 16 Jan 2015 12:15:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Fri, 16 Jan 2015 12:15:36 -0800 (PST)
In-Reply-To: <54B966E7.8010102@mlbassoc.com>
References: <1421435951-15401-1-git-send-email-mario@ossystems.com.br>
	<1421435951-15401-2-git-send-email-mario@ossystems.com.br>
	<54B966E7.8010102@mlbassoc.com>
Date: Fri, 16 Jan 2015 18:15:36 -0200
X-Google-Sender-Auth: KFRkfxePXjwyIDDl6uRgWuMxbuE
Message-ID: <CAP9ODKp4Mw=bE5-xrquGKJc6gSXbpjJ4O8hfA8RT+=_kB3cNpg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 2/2] layer.conf: add dependency on gnome-layer
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
X-List-Received-Date: Fri, 16 Jan 2015 20:15:40 -0000
Content-Type: text/plain; charset=UTF-8

Hello Gary,

On Fri, Jan 16, 2015 at 5:30 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2015-01-16 12:19, Mario Domenech Goulart wrote:
>>
>> This layer contains a bbappend file for gnome-settings-daemon, which
>> is provided by meta-gnome.
>>
>> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
>> ---
>>   conf/layer.conf | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/conf/layer.conf b/conf/layer.conf
>> index 5275778..06cb69a 100644
>> --- a/conf/layer.conf
>> +++ b/conf/layer.conf
>> @@ -9,3 +9,5 @@ BBFILE_PATTERN_browser-layer := "^${LAYERDIR}/"
>>   BBFILE_PRIORITY_browser-layer = "7"
>>
>>   LAYERVERSION_browser-layer = "1"
>> +
>> +LAYERDEPENDS_browser-layer = "gnome-layer"
>>
>
> It would be better to make inclusion of the .bbappend file
> dependent on whether or not you have meta-gnome present, much
> like many of the .bbappend files found in meta-fsl-arm.
>
> In particular, I want to use meta-browser but don't expect
> to need meta-gnome, so this change would break my systems :-(

Great idea; Mario, take a look how we did in meta-fsl-arm so we can do
the same there.

However, let's check if the bbappend does make sense. Otherwise  we
just drop it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


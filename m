Return-Path: <eduardo@monkey.io>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id C44F760116
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 14:12:54 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id t10so137577030ywa.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=monkey-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=JFfkl6Mqy/JwiKDMknjxu3FhvasxcItdnn/RAXFPq4I=;
	b=pMYG5lcz0ckp770cMMfW/wII1Hk8w+cvqrXopnFtUyvM+1GstSJ1tAEuYyZ7z+3D5M
	zMgFHruXQxBQgooPQFMrZGPqqsJh1KgnMKAcIsfXbGRxaMp6Q0NrE0ihHO75Op/7lAO/
	iVDWSmjuhIfIfieFQzQLCg3zsEkmeaDVQYudoyGc+MSMBCiwSJK4sMEYHMkrXU9+UsOj
	ssDCgozaL+e7z6dRIib+Cdp6g95/RtJ7COdmcxaZiEWU/rDHuJTKEyTPn+6eSPjTSNI+
	ubnS4fegiDbMax/C/ziL3K5ND/PeZsZlqiHUMZz0SU2sKizT/w+fZZpFp8TGykK4PFBg
	sVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=JFfkl6Mqy/JwiKDMknjxu3FhvasxcItdnn/RAXFPq4I=;
	b=E48ILI/oUsq7wUsPf9kWSU3r3K5DzPBxFElOR5aQRaYf5CUkdrxXHHmyWVBxRoeqJa
	4/BHgn5aIesFR+3FnjXFQgKPQLLnlE05w6b+CnE4fdueVpVyFMnIfnx31QfaxOlLbniP
	XB3zv6DAtJBpbEbBvbNESy/6fwU/zMZrBPXpsWQ8G7KklvVYNA6gtL6yjmj+Mej4uYhw
	Rp2iVEfdjepMgcdCTDukhwC7evB8Wrexj+hQD81+z4qVscpscQNYIVWys1lJjtDJX5xe
	z7pjbXqhc33vJ2sNuc1+/CNSO1wyKr9hbkhpa6aS4oNvJ+snkeNfjdV4Kob58bidd3c5
	0nrA==
X-Gm-Message-State: AOPr4FWmMGt+3Tuj28BHNPyNGgQjZpoPNgloFxtb7xqCUi80OttEuLyNsB3dOLYTV5baR8AQKByx7zzWhdXc5w==
MIME-Version: 1.0
X-Received: by 10.129.120.8 with SMTP id t8mr11863144ywc.204.1460729574993;
	Fri, 15 Apr 2016 07:12:54 -0700 (PDT)
Received: by 10.13.236.200 with HTTP; Fri, 15 Apr 2016 07:12:54 -0700 (PDT)
In-Reply-To: <CAEaCVQjOC2sp3MWAntW4LU6mdDyb-T-CxJCBuXw1ivz3tiaHhA@mail.gmail.com>
References: <1459750358-12047-1-git-send-email-eduardo@monkey.io>
	<5704E88E.2070402@felipetonello.com>
	<CAEaCVQjOC2sp3MWAntW4LU6mdDyb-T-CxJCBuXw1ivz3tiaHhA@mail.gmail.com>
Date: Fri, 15 Apr 2016 08:12:54 -0600
Message-ID: <CAEaCVQgOCvFJzTBmDjYqVPSnvxOf43hX6b5bGRcX4Lmo6H1YJA@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: Felipe Ferreri Tonello <eu@felipetonello.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] fluentbit: add new recipe
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
X-List-Received-Date: Fri, 15 Apr 2016 14:12:54 -0000
Content-Type: text/plain; charset=UTF-8

is the patch OK ?

On Wed, Apr 6, 2016 at 10:38 AM, Eduardo Silva <eduardo@monkey.io> wrote:

>
>
> On Wed, Apr 6, 2016 at 4:44 AM, Felipe Ferreri Tonello <
> eu@felipetonello.com> wrote:
>
>> Hi Eduardo,
>>
>> On 04/04/16 07:12, Eduardo Silva wrote:
>> > Fluent Bit is an open source data collector for Embedded Linux, this
>> > patch adds the recipe for version 0.7.2.
>> >
>> >   Project web site: http://fluentbit.io
>> >   Documentation   : http://fluentbit.io/documentation/
>> >
>> > Signed-off-by: Eduardo Silva <eduardo@monkey.io>
>> > ---
>> >  meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb | 15
>> +++++++++++++++
>> >  1 file changed, 15 insertions(+)
>> >  create mode 100644 meta-oe/recipes-extended/fluentbit/
>> fluentbit_0.7.2.bb
>>
>> If the project package is called fluent-bit, why did you name the recipe
>> fluentbit?
>>
>
> just to follow the convention of RPM and DEB packages.
>
> regards,
>



-- 
Eduardo Silva
Monkey Software


Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB5760670
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 06:58:14 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so18871248ieb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=scEtfHLRyvNn6+afHwSQWc+YHeaCYUWjM6LIGix0Hyk=;
	b=SsN3enU1Pd0uA5ySwLYcF6lKctWecj0TF/+CrMIA6D9+IRRGtJMBUi8ExCiUUZmtML
	ymwtkBrIUNycq0webUWu3OXITHSdgbhKrOjBOtgVed1A+26YkzTHKtxBBefPS1WWn4Id
	z1zInDNZfsylDIHUQohZiMwzY1B1oaigTnalbZTuC615uZlqKvPHInG2+9H9nm6DEJAv
	M2Q7kUQqPtAJAf29g2ZKGXaNRu3Ci2ZfYKPaTUhJhj0yI0CIZaP4k0Rui+y8+MUW9ROo
	1eIUdONFU6Q6DeY9Gl4SoietRPQaJt25Zq/4HmWDi78SINUwgUpVcvYh2FRPMbIkAYPb
	oVPQ==
X-Gm-Message-State: ALoCoQl0hS2IEbPc+z5F9qAQr5ZUUT7NevEQ1gCqfPIFPbCzXSnfiBhubyYzzveaSQtQANx2ZMqd
X-Received: by 10.107.6.136 with SMTP id f8mr15674232ioi.61.1434092295897;
	Thu, 11 Jun 2015 23:58:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.109.129 with HTTP; Thu, 11 Jun 2015 23:57:55 -0700 (PDT)
In-Reply-To: <557A817E.7070709@mail.bg>
References: <5579F20D.5040900@mail.bg> <557A817E.7070709@mail.bg>
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Fri, 12 Jun 2015 08:57:55 +0200
Message-ID: <CAAzKXnhLePQYW43RdumMTtB4zO6FSRMzptFGGi4V8_F1gCmywQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: meta-freescale@yoctoproject.org
Subject: Re: [meta-freescale] Chromium crashes on HTML5 video tag
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
X-List-Received-Date: Fri, 12 Jun 2015 06:58:18 -0000
Content-Type: text/plain; charset=UTF-8

Do you have a crash log? If not, you should change your build from Release
to Debug and
get some backtraces.

Zoltan

On 12 June 2015 at 08:51, Nikolay Dimitrov <picmaster@mail.bg> wrote:

> Adding openembedded guys in the loop.
>
>
> On 06/11/2015 11:39 PM, Nikolay Dimitrov wrote:
>
>> Hi gang,
>>
>> Chromium tabs are crashing when they see an HTML5 <video> tag, like
>> this one:
>>
>> <video width="320" height="240" controls>
>>    <source src="movie.mp4" type="video/mp4">
>> </video>
>>
>> (Code is from http://www.w3schools.com/html/html5_video.asp)
>>
>> I'm pretty sure that this worked fine some weeks ago, so it's a recent
>> regression on Fido, 100% reproducible on imx6q sabresd. At this moment
>> I still can't point to a specific commit in meta-fsl-arm or
>> meta-browser.
>>
>> Thanks in advance for any ideas. Regards,
>> Nikolay
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Zoltan Kuscsik

Senior Software Developer, Linaro Digital Home Group
email: zoltan.kuscsik@linaro.org
IRC: zoli_ on irc.linaro.org


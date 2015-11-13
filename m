Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6707727C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:10:28 +0000 (UTC)
Received: by igl9 with SMTP id 9so11772754igl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 01:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=K7Qm1zAoD2mCMURyBW0QLQWs5EI0dUqDeJFmh15SK1o=;
	b=WV5xmo7X9AlC++scNLn7/nC2VxazwHT3jh5dmG/OpyColfdQbg0aeCUzz54CiFMdPB
	/wDNQEQjbV8Dwyj7r96QYV4t/7TEjvTdmqo7aMvWumX2fuNxYP8/h8HSfa12KTuMb7+P
	XPxarFSdimCLmsydzAZViZJ6zOTfvD4ft23NoHPO6CI24SgUd5a/50c1eIM9lWwRQ1bq
	SJ4TF09kdy4oPJisHDbq5mmpRRWVb5BAU+RRh777HyDl0k8E/2z5WWkeZ0xnDUEOr0pl
	7ltkYetTEq3o9WdiXXVLIUtfceVyx+xXyKHOZWdBF+lMTqj0vR9/ixsWusmTVRIPMBib
	6ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=K7Qm1zAoD2mCMURyBW0QLQWs5EI0dUqDeJFmh15SK1o=;
	b=JoJSEV1Pvh6MSrZiYs5VM4iUGhG35M6HKp3iTk+FNhQp+iSGcVvIFfTFt9hJSBFWM/
	3E3J8Nu9DBTyOjtf6rXoy1usThuD73bHehVNRpyTikZ6BjDBAi+UO6t3fucJoUFtxbiR
	A7OkyabhokCe7ekMVmoQZi6Y/QzQYJYJkUzlng9QOWyU0CqTnMpP3rL8lCQm65UGdKlC
	1GpPxWsZM92+OB+hxiCf7GRw5jy4PA7fm6ExS39ScpUt7I15xGfSFlIRyY4q35XegtbR
	l9e7BcrSd4vZDguQy0rxvjdSwUeoVErZv1PiZhw2H/8twPfO5fyhJSCwnJtMR9myCfvd
	bajQ==
X-Gm-Message-State: ALoCoQlLFgWImc7A+v2jbWazdtdIfCB+XiXlf88lq32+CzBisdvT50mztd8zvnfTZwxE0DcY62bR
X-Received: by 10.50.112.99 with SMTP id ip3mr2370428igb.78.1447405828951;
	Fri, 13 Nov 2015 01:10:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 13 Nov 2015 01:10:09 -0800 (PST)
In-Reply-To: <OF7A12C232.50FCBFAB-ONC1257EFC.002CEC65-C1257EFC.002CEC6A@leica-geosystems.com>
References: <OF7A12C232.50FCBFAB-ONC1257EFC.002CEC65-C1257EFC.002CEC6A@leica-geosystems.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Nov 2015 09:10:09 +0000
Message-ID: <CAJTo0Lbi-sV524kh3zNfdYPbS+5g9e14Xp-6X6jSePZbP_XBVg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Is there a recipe for gdbserver?
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
X-List-Received-Date: Fri, 13 Nov 2015 09:10:30 -0000
Content-Type: text/plain; charset=UTF-8

On 13 November 2015 at 08:10, <daniel.markus@leica-geosystems.com> wrote:

> Is there a recipe for gdbserver only, so I can get that small application
> cross-compiled and installed on target?
>

It's part of gdb, and packaged separately so you can just install gdbserver
on the target.

Ross


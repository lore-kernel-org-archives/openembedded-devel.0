Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L57kT-0001jc-7I
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 00:55:17 +0100
Received: by rv-out-0708.google.com with SMTP id f25so208014rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2008 15:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=EVOstIDARMlFhQBqkvdTv0JLMsGSL+bY3bhxdXnPi3A=;
	b=jIock4fO+106sRn4pApiSKGbr/zj0MNET45LzOu6bNNj+bfInwO6nGNlksyIJA9cb6
	ekUaVfFLDGTY/wocW6/PO8zUEGRWC5nxpAJ+wr/qjnBqSENmpDXcbFEVfco4oJyjHjl5
	yTnwoM4r4lVg9oKUghVCJoHXB02tUVCd+c8BI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=me0sibM0lV4AAPqvv1+Zkg9n+0MafZRLLeLIbH1zKSNVu36VAeN9Q0Svl6cYU0wYKq
	uuXPHY6wI4OpdgemE0jsK57Vob36/IWOlFrrrFMEbl9pWa+W1ebBqlOfC+FW+BtCw07M
	YdKjSzPLuaiYoJ9zLu8i2ZWfkyiCgwPN15Kdk=
Received: by 10.140.248.15 with SMTP id v15mr2610972rvh.295.1227657138286;
	Tue, 25 Nov 2008 15:52:18 -0800 (PST)
Received: by 10.141.86.3 with HTTP; Tue, 25 Nov 2008 15:52:18 -0800 (PST)
Message-ID: <19c1b8a90811251552w125189b5wc43cbb595d6fc3dc@mail.gmail.com>
Date: Tue, 25 Nov 2008 15:52:18 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1227628013.10122.37.camel@akaza1>
MIME-Version: 1.0
References: <1227628013.10122.37.camel@akaza1>
Subject: Re: uclibc support for x86
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
X-List-Received-Date: Tue, 25 Nov 2008 23:55:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Looks sane to me. Have you tried to build a distro with this change ?

Thx

-Khem

On Tue, Nov 25, 2008 at 7:46 AM, Mikael Rosbacke <mikael@rosbacke.org> wrote:
> Hello!
>
> Seems I'm the only one crazy enough to try to run a uClibc based
> distribution on x86. (I can see the response, What's the point?)
>
> Anyway, it turns out uClibc is currently lacking support for x86.
> I've added the folder openembedded/packages/uclibc/uclibc-0.9.30/x86
> and created the file uClibc.machine in this folder. (See attachment)
>
> Is there some way to get this into the git tree? Should I file a bug
> report or could some maintainer give feedback on things to fix before
> inclusion? I've tried to keep the config file in style with similar
> config files for other machines.
>
> Thanks in advance,
>
>
> --- Mikael Rosbacke
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



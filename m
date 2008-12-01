Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mturquette@gmail.com>) id 1L76Vm-0003Kb-0q
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Dec 2008 12:00:18 +0100
Received: by yw-out-1718.google.com with SMTP id 5so999236ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2008 02:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=JgcYpPxmzS/FMnHJbo0/d6ALqmnJfU/Q/sYFMvFhcnQ=;
	b=jRPMmE7+osQAyrK/483GEBwJocxg6uDMeyklguiDYcoDZ+j5D5CpF1l61KSTJjf0XP
	u/Q+TG+ECz7Ao4Bcq64wKcmI02IjMAO2qJg+pf95YnReoknZOA+x37b/4NVlqT0v053S
	7Fa+rx3Qz1k4q/Af3dl/5+nHvdBCHFLeMUTwU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=YJgJNFzU46TBjZ4XHUJIxK+dj2OhcMbPqLxpMFX/gnMji4PbDaprDKXJ5oRRzbT1IS
	vUkMTplvVdrma/WZnFx7FO6I8RXAU2MlYY0Vf9pqkVzLkTKMLW3sqpQ46dLGPjzQQQ1F
	/0apgchyT1vpC3qpiM5vvDFXozgKDyUhEcpos=
Received: by 10.151.42.18 with SMTP id u18mr1132794ybj.218.1228129016850;
	Mon, 01 Dec 2008 02:56:56 -0800 (PST)
Received: by 10.151.134.3 with HTTP; Mon, 1 Dec 2008 02:56:56 -0800 (PST)
Message-ID: <59e7e6f90812010256x4a800057x372da51842085a8c@mail.gmail.com>
Date: Mon, 1 Dec 2008 04:56:56 -0600
From: "Mike Turquette" <mturquette@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gh0a8k$gpc$1@ger.gmane.org>
MIME-Version: 1.0
References: <59e7e6f90812010038u77d22e6m181cb0a02f732220@mail.gmail.com>
	<gh0a8k$gpc$1@ger.gmane.org>
Subject: Re: conditional kernel configuration
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
X-List-Received-Date: Mon, 01 Dec 2008 11:00:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 1, 2008 at 3:20 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 01-12-08 09:38, Mike Turquette wrote:
>>
>> Hi,
>>
>> I was recently looking into configuring the kernel dynamically based
>> on IMAGE_FEATURES.
>
> First: there's no such thing as IMAGE_FEATURES in OE:

You've found me out!  I'm based off of Poky and assumed this was a
similar to OE.

> koen@dominion:/OE/org.openembedded.dev$ grep IMAGE_FEATURES . -rn
> koen@dominion:/OE/org.openembedded.dev$
>
> Secondly: This looks a lot like USE flags, which we decided not to use in OE
> since it's impossible to do deterministic builds with them and at run-time
> there are a QA nightmare.

Yes, it is similar to USE flags to a degree.

> To illustrate the second point:
>
> a) clean tmp/
> b) unset 'my-conn', build image
> c) set 'my-conn', build image
>
> You now have an image in deploy where 'my-conn' is present, but the kernel
> is lacking WLAN support since it didn't get rebuilt after b).

Right.  I understood this problem going into it, but it seemed an
acceptable issue given that state of the code I'm wrestling with.

> I suspect what you need is a switch whether to include wlan *modules* into
> the image or not.

This is by and large be the best solution.  However I'm given very
little flexibility with the code I'm being handed at work so I'll keep
searching until the code gets cleaned up.

Thanks,
Mike

> regards,
>
> Koen
>
>
>
>> Here is a snippet from my kernel recipe:
>>
>> OVERRIDE_WLAN = "${@base_contains("IMAGE_FEATURES", "my-conn",
>> ":mywlan", "",d)}"
>> OVERRIDES .= "${OVERRIDE_WLAN}"
>>
>> SRC_URI = "git://some_tree"
>> SRC_URI_prepend_mywlan = "git://some_other_tree_with_wlan"
>>
>> This is a simplified example of what my recipe does (in fact I don't
>> fetch from git in this recipe at all).  But the point is clear:
>> looking for my-conn in IMAGE_FEATURES (which is set or not set in
>> my-cool-image.bb) should determine whether SRC_URI has one tree or
>> both trees in it.
>>
>> The problem is that IMAGE_FEATURES only has the stuff specified in
>> local.conf when the kernel recipe gets selected (this obviously
>> happens when I bitbake mykernel, but also when I bitbake
>> my-cool-image).  All of the features specified in my-cool-image.bb are
>> not in it (yet).
>>
>> Am I going about this the wrong way?  I would really like to
>> conditionally set which code to build in my kernel recipe based on
>> whether or not the my-conn task is included in IMAGE_FEATURES.
>>
>> Any other solutions that depart from my IMAGE_FEATURES scrape method
>> are very welcome too!
>>
>> Thanks,
>> Mike
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1PkgZJ-0006Z4-EN
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 18:32:37 +0100
Received: from homiemail-a75.g.dreamhost.com (mailbigip.dreamhost.com
	[208.97.132.5])
	by hapkido.dreamhost.com (Postfix) with ESMTP id B145317E23D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 09:31:41 -0800 (PST)
Received: from homiemail-a75.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a75.g.dreamhost.com (Postfix) with ESMTP id 9435D5EC079
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 09:31:34 -0800 (PST)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gumstix.com;
	b=EpMqleMp954rNwmU0h08TxGuJmX308v7RpTsadcDW5squWvnbgsMTnmcGbaM3
	Afl9RDZRK/aGX5voXS3WFYS/UViAGDsAThJyWxCgUeKjjwVm+y4oFCslRFi+/f6C
	l45WpNsHw/VD011z6cf3jNSm/8UZKKbHRag5p2yIWWMXYc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=gumstix.com; bh=qO+YW
	ZhCKdRoM0sUXaNmgllro3o=; b=S0LS+4h64lnSzoQYBSKfj5Hk5CSniQTu+ecjQ
	8esKm3vk2jFeDCIsVbmZ5Kyj8W2XAsfGih/4elBsMClBz+QMZ3vKTsey7TQSFeGY
	qbkMZD/awBCjcGmU/A5sKGan4PJOhEOX3Fkq9G3vwW3tmCgYhILFCE+mEJFflOed
	99Yyjw=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a75.g.dreamhost.com (Postfix) with ESMTPSA id 3BB175EC077
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 09:31:34 -0800 (PST)
Message-ID: <4D4994F6.3080102@gumstix.com>
Date: Wed, 02 Feb 2011 09:31:34 -0800
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296592622161142500@rkmorris.us>
In-Reply-To: <1296592622161142500@rkmorris.us>
Subject: Re: tslib Issue
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
X-List-Received-Date: Wed, 02 Feb 2011 17:32:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am seeing the same thing using the omap3-palmtop-image for Gumstix 
Overo. On first boot, /etc/X11/Xinit.d/89xTs_Calibrate doesn't find 
/etc/pointercal so it runs ts_calibrate. The calibration doesn't take 
effect until I reboot though - restarting gpe-dm doesn't solve the problem.

I think that the library /usr/lib/ts/linear.so looks for /etc/pointercal 
and defaults to some preset values if the file doesn't exist. I thought 
that restarting gpe-dm would reload linear.so (which fuser suggests it 
does) but this doesn't solve the problem. It would appear that I am 
missing something...

--
Neil


On 11-02-01 12:37 PM, openembedded@rkmorris.us wrote:
> Hi,
>
> I have successfully build and then run several OE images on my target hardware (h1940) - and have noticed an interesting oddity (bug?).
>
> If I run the opie-image for example, everything works just great. However, if I run an X-based image (like, say x11-gpe-image) when the GUI starts up tslib calibration is run ... but then basically thrown away, as the driver for the touchscreen is set to evdev by default (and the touchscreen isn't calibrated / does not work right). If I manually build and install xf86-input-tslib, and then configure the input as tslib (not evdev) - once I restart gpe-dm it works as expected!
>
> Is this supposed to be the case, or perhaps something not configured quite right in the builds?
>
> Thanks!
>
> ... Russell
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




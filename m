Received: from hapkido.dreamhost.com ([66.33.216.122])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1PkkLd-0001a4-OI
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 22:34:46 +0100
Received: from homiemail-a12.g.dreamhost.com (caiajhbdcaib.dreamhost.com
	[208.97.132.81])
	by hapkido.dreamhost.com (Postfix) with ESMTP id B959217B256
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 13:33:44 -0800 (PST)
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id 2321571406B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 13:33:40 -0800 (PST)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gumstix.com;
	b=U49ArBzY8Cq+FE/mPBKM7O3wxRzXgXLGgMlXOqMksLhS6Sq6AUujt94hNBQWd
	l+qmAl0DSp/6s3t+M2cv0HmFT5C5G6hQa5JYSG0afCvYpquWIGK8plYzBUxQQOb6
	hJSbf9VPbjbMBxmR31WY205RLjmz2HumpZmumSp71t2CFk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=gumstix.com; bh=4mN7w
	NgdwfOI+EgXdcj1GZmXCYc=; b=toy80lbDQX4oY6aXUb9pGO7+KXLtk6uiqLinR
	QfkzQb/v3UO2uWjXiZ23mvGQ00l3CTqPdGwGMzu/X91nUxt+g72nWiLpZq9zwcn7
	2I04Ac38rXXcXU5QSb+kpvZd3aBDR35MgisC6NY844uqyChx/QcSfbEQtFmtYDrM
	SJVEXI=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id EF52171406A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 13:33:39 -0800 (PST)
Message-ID: <4D49CDB6.1040604@gumstix.com>
Date: Wed, 02 Feb 2011 13:33:42 -0800
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296592622161142500@rkmorris.us> <4D4994F6.3080102@gumstix.com>
In-Reply-To: <4D4994F6.3080102@gumstix.com>
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
X-List-Received-Date: Wed, 02 Feb 2011 21:34:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

After a few cycles of:

  # rm /etc/pointercal
  # shutdown -r now
  # stat /etc/pointercal

I found that pointercal is only accessed on the first restart after it 
has been modified/created.

The problem seems to be that Xorg is started before ts_calibrate runs 
for the first time. I found a fairly simple hack that seems to fix the 
problem.

  # cp /etc/X11/Xinit.d/89xTs_Calibrate /etc/rc5.d/S89xTs_Calibrate

Though this fails to address the situation where ts_calibrate is run and 
pointercal already exists - a manual reboot is still necessary for the 
new calibration to take effect. Does anyone know of a better, more 
permanent fix?


--
Neil

On 11-02-02 09:31 AM, Neil MacMunn wrote:
> I am seeing the same thing using the omap3-palmtop-image for Gumstix
> Overo. On first boot, /etc/X11/Xinit.d/89xTs_Calibrate doesn't find
> /etc/pointercal so it runs ts_calibrate. The calibration doesn't take
> effect until I reboot though - restarting gpe-dm doesn't solve the problem.
>
> I think that the library /usr/lib/ts/linear.so looks for /etc/pointercal
> and defaults to some preset values if the file doesn't exist. I thought
> that restarting gpe-dm would reload linear.so (which fuser suggests it
> does) but this doesn't solve the problem. It would appear that I am
> missing something...
>
> --
> Neil
>
>
> On 11-02-01 12:37 PM, openembedded@rkmorris.us wrote:
>> Hi,
>>
>> I have successfully build and then run several OE images on my target
>> hardware (h1940) - and have noticed an interesting oddity (bug?).
>>
>> If I run the opie-image for example, everything works just great.
>> However, if I run an X-based image (like, say x11-gpe-image) when the
>> GUI starts up tslib calibration is run ... but then basically thrown
>> away, as the driver for the touchscreen is set to evdev by default
>> (and the touchscreen isn't calibrated / does not work right). If I
>> manually build and install xf86-input-tslib, and then configure the
>> input as tslib (not evdev) - once I restart gpe-dm it works as expected!
>>
>> Is this supposed to be the case, or perhaps something not configured
>> quite right in the builds?
>>
>> Thanks!
>>
>> ... Russell
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




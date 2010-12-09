Received: from mail-ey0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chris.spehn@gmail.com>) id 1PQlpP-0004Gv-EC
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 20:06:57 +0100
Received: by eyf5 with SMTP id 5so1747849eyf.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 11:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pdZyy77Iy4BQCSYOsg8C0FdZ1R0Lhr6avB07CB0XetU=;
	b=wiYE+zOdZQ5Ho6fpHk39EJwBiH/dn9u1eX8zkx/ZtCJKS49jm/cT64//SHtIw/aGqw
	GWWHtscrCXSgto8qRMsNUFEdEGcTEpgX/oLVTAtQ0z0sEwlf8Q0gBN+FlbaDWb+U1Kj8
	/YEqiKmuh4de+4//3qL2gZQi6wLZqckzu7YzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GHPuq3hl9rKWD5gkwMmgDnjJYnpwZ96T/pHau64+eN8odclV/ojF2HYwb3dKGbkht2
	RQc+WcOq0JNiGuSjr+jUmssENrSNaQmXaaF0YA3QnKXtl+WpBKULK8fevgIJFH6VFeZX
	29FLKVkuMAHwsBoop0KBjXIVLZ3MRLvGj4EOE=
MIME-Version: 1.0
Received: by 10.213.19.201 with SMTP id c9mr1075168ebb.89.1291921519512; Thu,
	09 Dec 2010 11:05:19 -0800 (PST)
Received: by 10.213.22.16 with HTTP; Thu, 9 Dec 2010 11:05:19 -0800 (PST)
In-Reply-To: <20101209143500.GD29826@excalibur.local>
References: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
	<1291732373-17953-4-git-send-email-GNUtoo@no-log.org>
	<20101209143500.GD29826@excalibur.local>
Date: Thu, 9 Dec 2010 13:05:19 -0600
Message-ID: <AANLkTi=XyUfKKrFLrgwb3GAcNH6gqTRXA3OCSb-hoRKm@mail.gmail.com>
From: Chris Spehn <chris.spehn@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.170
X-SA-Exim-Mail-From: chris.spehn@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] xserver-xorg-conf: add iphone3g support
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
X-List-Received-Date: Thu, 09 Dec 2010 19:06:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I think Jama mentioned this to me on irc in #openmoko-cdevel, but I
simply forgot about it. I can make a pointercal file instead of using
the xorg.conf option.

On Thu, Dec 9, 2010 at 8:35 AM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> Hello.
>
> On Tue, 2010-12-07 at 15:32, Denis 'GNUtoo' Carikli wrote:
>> Signed-off-by: Chris 'Lopi' Spehn <chris.spehn@gmail.com>
>> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
>> ---
>> =C2=A0.../xserver-xorg-conf/iphone3g/xorg.conf =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 31 ++++++++++++++++++++
>> =C2=A0recipes/xorg-xserver/xserver-xorg-conf_0.1.bb =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 =C2=A02 +-
>> =C2=A02 files changed, 32 insertions(+), 1 deletions(-)
>> =C2=A0create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/iphone3g=
/xorg.conf
>>
>> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf b=
/recipes/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
>> new file mode 100644
>> index 0000000..19f02e9
>> --- /dev/null
>> +++ b/recipes/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
>> @@ -0,0 +1,31 @@
>> +Section "Device"
>> + =C2=A0 =C2=A0 Identifier "Builtin Default fbdev Device 0"
>> + =C2=A0 =C2=A0 Driver =C2=A0"fbdev"
>> + =C2=A0 =C2=A0 Option "ShadowFB" "on"
>> + =C2=A0 =C2=A0 #Option "Rotate" "CW" # comment for disabling rotation
>> +EndSection
>> +
>> +Section "Screen"
>> + =C2=A0 =C2=A0 Identifier "Builtin Default fbdev Screen 0"
>> + =C2=A0 =C2=A0 Device "Builtin Default fbdev Device 0"
>> +EndSection
>> +
>> +
>> +Section "InputDevice"
>> + =C2=A0 =C2=A0 Identifier "touchscreen"
>> + =C2=A0 =C2=A0 Driver "evdev"
>> + =C2=A0 =C2=A0 Option "Device" "/dev/input/event2"
>
> Are you sure that it always is event2? The nodes are assigned dynamically
> normally and we have /dev/touchscreen to work around this
>
>> + =C2=A0 =C2=A0 Option "Calibration" "0 4602 0 7306"
>
> Why here? We happen to use the pointercal file for this.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



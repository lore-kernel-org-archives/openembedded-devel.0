Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <captain.deadly@gmail.com>) id 1P4U1A-0002LT-Ek
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 09:38:57 +0200
Received: by wwe15 with SMTP id 15so1585952wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:x-enigmail-version:content-type:content-transfer-encoding;
	bh=1CvaoA+54ud20REG8qpbDbAUcrQaGqYge4dB9Y6uR7w=;
	b=sBij6fbXJyaogJJ14ztb9K/xE23HLhqDt6nmVZqVpLyorBXHvIrS1Y8jehJXFyxMG1
	mkcqlA7292qaMVLLqc5kRy94r+6tC08Y1737Uw0JMeN5KGUaoIdxoon1iYYoMcdfwCk0
	D3bt1P1YvLgCUHkfDsmnu/tMqTNyQAmkbMjDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=RYTEBcvoxHMoFx6Q6A6yYB//ACewnNIGMzZQ5IV/Vs/gi/D/5qvd/h+cDea5raZPgH
	zuPTs4xHoQWcfWEo1NDqOzZUH4GcwG5yoGzSCVL1ImgxxUzJvlMkt7OZe7T4qyxuaoyk
	n/hrgva8k5/qSoxcfOTDSWZLdKfd58Uh8q8+Y=
Received: by 10.216.161.71 with SMTP id v49mr3142981wek.94.1286609911723;
	Sat, 09 Oct 2010 00:38:31 -0700 (PDT)
Received: from [192.168.1.24] (host81-157-150-153.range81-157.btcentralplus.com
	[81.157.150.153])
	by mx.google.com with ESMTPS id h3sm425438wej.43.2010.10.09.00.38.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 09 Oct 2010 00:38:30 -0700 (PDT)
Message-ID: <4CB01BED.5030407@gmail.com>
Date: Sat, 09 Oct 2010 08:38:21 +0100
From: Arigead <captain.deadly@gmail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CAC8B19.9050502@gmail.com>	<20101006145051.GK3264@jama>
	<AANLkTimJ3fCOZopbAKG7UvszQGNMfnaq1HnAB6mKqmu_@mail.gmail.com>
In-Reply-To: <AANLkTimJ3fCOZopbAKG7UvszQGNMfnaq1HnAB6mKqmu_@mail.gmail.com>
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: captain.deadly@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: /usr/bin/fop ???
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
X-List-Received-Date: Sat, 09 Oct 2010 07:38:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Martin Jansa wrote:
> On Wed, Oct 6, 2010 at 4:50 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Wed, Oct 06, 2010 at 03:43:37PM +0100, Arigead wrote:
>>> trying to "bitbake tangogps" and getting errors about /usr/bin/fop
>>>
>>> I'm searching for a solution but not getting too far with that. I'm not
>>> sure why and embedded verison of tangogps would require Apache FOP but
>>> I'm on the wrong end of a learning curve.
>>>
>>> Cheers for any pointers which would get me over this hurdle.
>> what about providing whole log.do_compile and log.do_configure to be
>> sure which recipe has this problem (I see libx11 in log, but you're
>> talking about tangogps).
>>
>> Regards,
> 
> In case it fails in libx11 then it's probably because of:
> http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=e14273f44c1501ab51db4adcb83b18a1073787d8
> you can force fop disabled with --with-fop=no in EXTRA_OECONF or try
> to fix XORG_WITH_FOP (to ignore fop on buildhost and look only in
> sysroots)
> 
> Regards,
> 

Been busy and only getting back to this now. Yes that worked buy forcing
fop out of the libx11 build. Thanks a million for your help. I'm not
sure why this problem only seems to be effecting my build and nobody
else seemed to hit that issue. Anyhow back on the road again.

Thanks again



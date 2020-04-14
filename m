Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com (mailrelay2-3.pub.mailoutpod1-cph3.one.com [46.30.212.11])
 by mx.groups.io with SMTP id smtpd.web10.14773.1586881712286991243
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 09:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embexus.com header.s=20191106 header.b=jwNZ6lzz;
 spf=none, err=permanent DNS error (domain: embexus.com, ip: 46.30.212.11, mailfrom: ayoub.zaki@embexus.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=s+sGSz/Z6UWWqsg6jtPEHVUrY4rhQan0lHKRb8vRv4M=;
	b=jwNZ6lzzd9qAqgJxa4Zq7vFNISjKeGk7z2lC2h6n1RxXGvGTFwhiMaZcBGoFYXNVrKGEP/RxQTesX
	 cdVvDtoR1IbcfamIu79gmJeXl5aMpCw2ddmZaPJqNQ9A8dE5GuQHAYdTu5cvkeZKSOEm7mM9sLww2i
	 JyLoOw32ORUFVJlLTCmam4h5bGo+UBm43dsZ0Zu6juQA8Pc77sXZH1tXZZq+Hw9L7XNQjUiSX0GPuk
	 9LA1ALg9YQu+6mfeMQb+Mwi0/qw0Kt8P2QYnwD3COZz0JePo9i89QzOzXe5KjJfyJdJd28/pPmsZ9q
	 0FxA1Xr07NgU8peRxZBwo91H4sbrdFQ==
X-HalOne-Cookie: 0c3fc88bef97be040363ff6e75c26c8db13f0f91
X-HalOne-ID: f9090f2f-7e6c-11ea-9551-d0431ea8a290
Received: from [192.168.178.22] (x4dbe77ca.dyn.telefonica.de [77.190.119.202])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id f9090f2f-7e6c-11ea-9551-d0431ea8a290;
	Tue, 14 Apr 2020 16:28:29 +0000 (UTC)
Subject: Re: [oe] [meta-security][RFC 1/2] classes: provide a class for generating dm-verity meta-data images
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20200410124135.24217-1-brgl@bgdev.pl>
 <20200410124135.24217-2-brgl@bgdev.pl>
 <34f4335a-c9ed-a790-c683-3b6db93eceb7@embexus.com>
 <CAMRc=MeJOmwqPnZbgT-XugtQRU8okQMPGvgWx+cjnMw=1WyM=A@mail.gmail.com>
 <8896403c-4f12-5d3c-5722-5b9b0a000067@embexus.com>
 <CAMRc=MdO=x4FCEE2MVtFBZxr0sbChjMjHwOrMAYx23dkxKCJiw@mail.gmail.com>
From: "Ayoub Zaki" <ayoub.zaki@embexus.com>
Message-ID: <677ae603-2d39-e550-c4ee-6a2cbf41784b@embexus.com>
Date: Tue, 14 Apr 2020 18:28:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMRc=MdO=x4FCEE2MVtFBZxr0sbChjMjHwOrMAYx23dkxKCJiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 14.04.20 18:19, Bartosz Golaszewski wrote:
> wt., 14 kwi 2020 o 11:17 Ayoub Zaki <ayoub.zaki@embexus.com> napisał(a):
>> Hi,
>>
>> On 14.04.20 11:05, Bartosz Golaszewski wrote:
>>
>> pon., 13 kwi 2020 o 12:58 Ayoub Zaki <ayoub.zaki@embexus.com> napisał(a):
>>
>> basically this class generate a dm-verity hash that needs to be injected
>> inside the initramfs...it's a bit hacky.
>>
>> wouldn't be signing the hash, include the verifiication public key in
>> initramfs more portable ?
>>
>> Sorry, but I don't see how this is a better solution. You then have to
>> store two things somewhere: the hash and its signature. If the
>> fitImage is already signed - there's no reason to have a second
>> signature for the hash: it already comes from a trusted source.
>>
>> This would also inflate the size of the initramfs - not only would it
>> need to include the cryptsetup tools but also additional tools for
>> signature verification.
>>
>>
>> The hash + signature doesn't need to be stored in initramfs in this case but appended to the rootfs image.
>>
>> yes you would need in this case a signature verification tool inside your initramfs and the corresponding public key.
>>
> But how is this better? I know this is how Android does dm-verity, but
> it's not any simpler - I'd argue the actual implementation is more
> complicated.


In case you do OTA Update with your approach you will need to always 
update kernel+initramfs and rootfs even nothing has changed in kernel 
oder initramfs for example to make sure that the Hash inside the 
initramfs is updated!


Another case is if your kernel+initramfs are part of the rootfs how you 
will deal with it ? it's chicken/egg problem.

>
>> It is clearly much better than to poke around with circular dependencies.
>>
> No it's not clearly better. Circular dependencies result from bad
> design and should be fixed. I proposed simple changes that fix them in
> OE-core.
>
>>  From another point the veritysetup is not quite correct:
>>
>> veritysetup --data-block-size=1024 --hash-offset=$SIZE format $OUTPUT $OUTPUT
>>
>>
>> If the size of your image is not 1K multiple then you are excluding the last block!
>>
> Good catch! This is only an issue for ext2 but needs to be verified anyway.
>
> Bart

Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg


Mobile   : +4917662901545
Email    : ayoub.zaki@embexus.com
Homepage : https://embexus.com
VAT No.  : DE313902634


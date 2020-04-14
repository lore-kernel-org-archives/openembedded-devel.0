Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com (mailrelay4-3.pub.mailoutpod1-cph3.one.com [46.30.212.13])
 by mx.groups.io with SMTP id smtpd.web11.7665.1586855861094699104
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 02:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embexus.com header.s=20191106 header.b=NmMcAYc/;
 spf=none, err=permanent DNS error (domain: embexus.com, ip: 46.30.212.13, mailfrom: ayoub.zaki@embexus.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:cc:to:
	 subject:from;
	bh=yUUtekRxMh3ADGVwdmgUWR045TlIFLZl8kSP5h5vTM8=;
	b=NmMcAYc/NYSxIKATRVf/rmECHxb9BCFnZZHIGt6Lv8WRsQ0490NTRV/PGtM5CpVnzMiA0PCk9Lah0
	 Heze62f/fiNsWEtooQDhaphhmsWkSdWNKBPpzDPxHFndFoUmB2ihP3nL71n8RaAoCTJS5vs6MsyJjZ
	 /VUW2axih3XcgLmveTyyETZkTd2IT+O5AyT2xsiD0ikYy1clpjWmU4JPUkwZwGp1NuSrxMe/aC0vVP
	 SOSsCEgrjO2Fo5O0PYvkvy0LTMV8T6ZSjingD/x+uKh9/zO2p+ohhmGYVwss1H/G/fgOnGAwWh9PVN
	 VDSHxva5zCrBPcPO/Fsoucr0nEwj/fw==
X-HalOne-Cookie: 3665905ab8f0124dbdd5db7d6e09198c810c42c1
X-HalOne-ID: c8658ba8-7e30-11ea-8c7d-d0431ea8bb10
Received: from [192.168.178.22] (x4dbe77ca.dyn.telefonica.de [77.190.119.202])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id c8658ba8-7e30-11ea-8c7d-d0431ea8bb10;
	Tue, 14 Apr 2020 09:17:37 +0000 (UTC)
Subject: Re: [oe] [meta-security][RFC 1/2] classes: provide a class for generating dm-verity meta-data images
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20200410124135.24217-1-brgl@bgdev.pl>
 <20200410124135.24217-2-brgl@bgdev.pl>
 <34f4335a-c9ed-a790-c683-3b6db93eceb7@embexus.com>
 <CAMRc=MeJOmwqPnZbgT-XugtQRU8okQMPGvgWx+cjnMw=1WyM=A@mail.gmail.com>
From: "Ayoub Zaki" <ayoub.zaki@embexus.com>
Message-ID: <8896403c-4f12-5d3c-5722-5b9b0a000067@embexus.com>
Date: Tue, 14 Apr 2020 11:17:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMRc=MeJOmwqPnZbgT-XugtQRU8okQMPGvgWx+cjnMw=1WyM=A@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------FADA76ED155AE172E1DF34DA"
Content-Language: en-US

--------------FADA76ED155AE172E1DF34DA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 14.04.20 11:05, Bartosz Golaszewski wrote:
> pon., 13 kwi 2020 o 12:58 Ayoub Zaki <ayoub.zaki@embexus.com> napisał(a):
>>
>> basically this class generate a dm-verity hash that needs to be injected
>> inside the initramfs...it's a bit hacky.
>>
>> wouldn't be signing the hash, include the verifiication public key in
>> initramfs more portable ?
>>
> Sorry, but I don't see how this is a better solution. You then have to
> store two things somewhere: the hash and its signature. If the
> fitImage is already signed - there's no reason to have a second
> signature for the hash: it already comes from a trusted source.
>
> This would also inflate the size of the initramfs - not only would it
> need to include the cryptsetup tools but also additional tools for
> signature verification.


The hash + signature doesn't need to be stored in initramfs in this case 
but appended to the rootfs image.

yes you would need in this case a signature verification tool inside 
your initramfs and the corresponding public key.

It is clearly much better than to poke around with circular dependencies.


 From another point the veritysetup is not quite correct:

veritysetup --data-block-size=1024 --hash-offset=$SIZE format $OUTPUT 
$OUTPUT


If the size of your image is not 1K multiple then you are excluding the 
last block!

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


--------------FADA76ED155AE172E1DF34DA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 14.04.20 11:05, Bartosz Golaszewski
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMRc=MeJOmwqPnZbgT-XugtQRU8okQMPGvgWx+cjnMw=1WyM=A@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">pon., 13 kwi 2020 o 12:58 Ayoub Zaki <a class="moz-txt-link-rfc2396E" href="mailto:ayoub.zaki@embexus.com">&lt;ayoub.zaki@embexus.com&gt;</a> napisał(a):
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

basically this class generate a dm-verity hash that needs to be injected
inside the initramfs...it's a bit hacky.

wouldn't be signing the hash, include the verifiication public key in
initramfs more portable ?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sorry, but I don't see how this is a better solution. You then have to
store two things somewhere: the hash and its signature. If the
fitImage is already signed - there's no reason to have a second
signature for the hash: it already comes from a trusted source.

This would also inflate the size of the initramfs - not only would it
need to include the cryptsetup tools but also additional tools for
signature verification.</pre>
    </blockquote>
    <p><br>
    </p>
    The hash + signature doesn't need to be stored in initramfs in this
    case but appended to the rootfs image.<br>
    <br>
    yes you would need in this case a signature verification tool inside
    your initramfs and the corresponding public key.<br>
    <br>
    It is clearly much better than to poke around with circular
    dependencies.<br>
    <br>
    <br>
    From another point the veritysetup is not quite correct:<br>
    <br>
    veritysetup --data-block-size=1024 --hash-offset=$SIZE format
    $OUTPUT $OUTPUT <br>
    <br>
    <br>
    If the size of your image is not 1K multiple then you are excluding
    the last block!<br>
    <p><span style="color: rgb(36, 41, 46); font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(230, 255, 237); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
</span></p>
    <p><span style="color: rgb(36, 41, 46); font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(230, 255, 237); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
</span></p>
    <pre class="moz-signature" cols="72">Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg


Mobile   : +4917662901545
Email    : <a class="moz-txt-link-abbreviated" href="mailto:ayoub.zaki@embexus.com">ayoub.zaki@embexus.com</a>
Homepage : <a class="moz-txt-link-freetext" href="https://embexus.com">https://embexus.com</a>
VAT No.  : DE313902634</pre>
  </body>
</html>

--------------FADA76ED155AE172E1DF34DA--

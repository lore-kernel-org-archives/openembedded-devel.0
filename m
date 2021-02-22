Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com (mailrelay2-2.pub.mailoutpod1-cph3.one.com [46.30.212.1])
 by mx.groups.io with SMTP id smtpd.web09.32221.1613978137350186040
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 23:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bsorensen.net header.s=20191106 header.b=CySaKYTp;
 spf=none, err=permanent DNS error (domain: bsorensen.net, ip: 46.30.212.1, mailfrom: yocto@bsorensen.net)
Received: from mailrelay6.pub.mailoutpod2-cph3.one.com (mailrelay6.pub.mailoutpod2-cph3.one.com [104.37.34.11])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPS
	id c1abc679-74dd-11eb-b55e-d0431ea8a290;
	Mon, 22 Feb 2021 07:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bsorensen.net; s=20191106;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:cc:to:
	 subject:from;
	bh=vK/N51QMadHMtxk3QIO9wooXlW1CiBGkxwU+Fm75cb0=;
	b=CySaKYTpgzWidc0Lh+UopzWMzdxT/p24D4oBzCa5u9mJqDoO8yy6sgpEgM1k7D0zFO2fUPCkipa3s
	 YmImcn2XY6o+2FflJrbLRzrAMz3sPXDjSxzUHnzXLdLFUjZhDixXKZ07i0GuYYIPYnMX8M3LerKohd
	 I1LG3kTT1T9IwpTgROpqJsGqi23Bz8Hn4NFo+UktS8S04NJymPUPdYf0b4jqXTMn72Vgx6PwmDgiQX
	 XR2f6KV7g/D1xK007FhbW5Y8ed9AisAcNGgL49BdzcR4o1lh1UgJft10yfv1Oz22t4xbD6kbdhCxCX
	 TdpTMi6VAPqXECWuP0D273eLMzcFEZg==
X-HalOne-Info: 4aBQpctI3CkHVtkhLuRi8zAwKgkiYgQFgm/9tEJ8uXZp5Z6yLtgUcjEYuGXZK+c/
 bQe0mSMmiAtw98BiaiJTHHwl5tuoC6lEsJcuR+xerdtyveT7F1sq5TVnrb61I8z/
X-HalOne-ID: c0751d09-74dd-11eb-b468-f1c5f498dca4
Received: from [172.16.11.66] (unknown [81.216.59.226])
	by mailrelay6 (Halon) with ESMTPSA
	id c0751d09-74dd-11eb-b468-f1c5f498dca4;
	Mon, 22 Feb 2021 07:15:34 +0000 (UTC)
Subject: Re: [oe] "[meta-oe][PATCH] libgpiod: packageqa problem => static python lib to ${PN}-python-staticdev
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 chbs@prevas.dk
References: <20210219085229.25707-1-yocto@bsorensen.net>
 <CAMKF1srC8Nej+pDK2nqepYBkqazBs4aFrSW+F8du2UXUy7D6eQ@mail.gmail.com>
From: =?UTF-8?B?Q2hyaXN0aWFuIEIuIFPDuHJlbnNlbg==?= <yocto@bsorensen.net>
Message-ID: <f784b954-14f7-0960-20aa-e6c5bb8b90a2@bsorensen.net>
Date: Mon, 22 Feb 2021 08:15:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srC8Nej+pDK2nqepYBkqazBs4aFrSW+F8du2UXUy7D6eQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------B8812DCE3D0B95E0142651EA"
Content-Language: en-US

--------------B8812DCE3D0B95E0142651EA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 2/19/21 5:34 PM, Khem Raj wrote:
> On Fri, Feb 19, 2021 at 12:52 AM Christian B. Sørensen
> <yocto@bsorensen.net> wrote:
>> Problem:
>> QA Issue: non -staticdev package contains static .a library
>>
>> Reason:
>> Both /usr/lib/python3.8/site-packages/gpiod.a and
>> /usr/lib/python3.8/site-packages/gpiod.so are in ${PN}-python.
>>
>> Signed-off-by: Christian Bräuner Sørensen <yocto@bsorensen.net>
>> ---
>>   meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
>> index aec50e7e6..ab9639fc2 100644
>> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
>> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
>> @@ -27,7 +27,8 @@ PACKAGES =+ "${PN}-tools libgpiodcxx"
>>   FILES_${PN}-tools = "${bindir}/*"
>>   FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
>>
>> -PACKAGES =+ "${PN}-python"
>> -FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
>> +PACKAGES =+ "${PN}-python ${PN}-python-staticdev"
> why not put .a  file in ${PN}-staticdev

I was a bit unsure of whether to put it in PN-staticdev or in a specific 
python staticdev package, after looking ingo having a look a look into 
meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb which has a specific 
PYTHON_PN-staticdev package.

I'll create a new patch v2 with it being inserted into PN-staticdev

>> +FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
>> +FILES_${PN}-python-staticdev = "${PYTHON_SITEPACKAGES_DIR}/*.a"
>>   RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
>>   RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>> 
>>

--------------B8812DCE3D0B95E0142651EA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi<br>
    </p>
    <div class="moz-cite-prefix">On 2/19/21 5:34 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1srC8Nej+pDK2nqepYBkqazBs4aFrSW+F8du2UXUy7D6eQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Feb 19, 2021 at 12:52 AM Christian B. Sørensen
<a class="moz-txt-link-rfc2396E" href="mailto:yocto@bsorensen.net">&lt;yocto@bsorensen.net&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Problem:
QA Issue: non -staticdev package contains static .a library

Reason:
Both /usr/lib/python3.8/site-packages/gpiod.a and
/usr/lib/python3.8/site-packages/gpiod.so are in ${PN}-python.

Signed-off-by: Christian Bräuner Sørensen <a class="moz-txt-link-rfc2396E" href="mailto:yocto@bsorensen.net">&lt;yocto@bsorensen.net&gt;</a>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
index aec50e7e6..ab9639fc2 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
@@ -27,7 +27,8 @@ PACKAGES =+ "${PN}-tools libgpiodcxx"
 FILES_${PN}-tools = "${bindir}/*"
 FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"

-PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+PACKAGES =+ "${PN}-python ${PN}-python-staticdev"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
why not put .a  file in ${PN}-staticdev
</pre>
    </blockquote>
    <p>I was a bit unsure of whether to put it in PN-staticdev or in a
      specific python staticdev package, after looking ingo having a
      look a look into meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
      which has a specific PYTHON_PN-staticdev package.</p>
    <p>I'll create a new patch v2 with it being inserted into
      PN-staticdev<br>
    </p>
    <blockquote type="cite"
cite="mid:CAMKF1srC8Nej+pDK2nqepYBkqazBs4aFrSW+F8du2UXUy7D6eQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
+FILES_${PN}-python-staticdev = "${PYTHON_SITEPACKAGES_DIR}/*.a"
 RRECOMMENDS_PYTHON = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('PACKAGECONFIG','python3','${PN}-python','',d)}">"${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"</a>
 RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
--
2.25.1




</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------B8812DCE3D0B95E0142651EA--

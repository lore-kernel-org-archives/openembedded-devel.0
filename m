Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com (mailrelay4-3.pub.mailoutpod1-cph3.one.com [46.30.212.13])
 by mx.groups.io with SMTP id smtpd.web10.47226.1622483378167842753
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 10:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embexus.com header.s=20191106 header.b=xAlAJm3f;
 spf=none, err=permanent DNS error (domain: embexus.com, ip: 46.30.212.13, mailfrom: ayoub.zaki@embexus.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:to:
	 subject:from;
	bh=/SpGzrQngEJLPU4sk+sGMEnNrd9LtNTvbGAhw8QsHAs=;
	b=xAlAJm3fB+UeNBzEpJMzPGMwosQUBEM2pty1qc1XB+e9h2pAs/3dWys+q3n8vmKwSNptnI6Mosffu
	 MmFDgA2biirpVUUfb7HLqVXpW4LioKpWw095Qs16wxf0gvNfbH8BhGsJwQIEOP7Ru6aLMCA0nd4zZx
	 eG9HcbxJnX4m8tRfqZawuIX8G9M5VVZIUh7tsVEuxLQ0rUjzbq1CGxebMyNpSPmp6x9oG8b0wTq82w
	 iZutUF1KCuORG+UM/+kdVwGEqjOUwxxxiHlAxB6YimYujttuKKLFomFpRUqyyXJxJEl6+ISotU4AVH
	 PKb2YjZKzal0VCzIqwgUctYb6xcoPGA==
X-HalOne-Cookie: b720cdad8494f15c26cec7fdf6cac39373b10343
X-HalOne-ID: 8f41afe9-c238-11eb-a907-d0431ea8bb10
Received: from [192.168.178.41] (x4dbd064c.dyn.telefonica.de [77.189.6.76])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 8f41afe9-c238-11eb-a907-d0431ea8bb10;
	Mon, 31 May 2021 17:49:35 +0000 (UTC)
Subject: Re: [oe] [meta-oe][PATCH] evemu-tools: Add initial recipe
To: openembedded-devel@lists.openembedded.org
References: <20210530172125.16258-1-ayoub.zaki@embexus.com>
 <CAMKF1sq56JqYJ6+R8On3zc_HnUO4VwvAP91QNASS8y_P7AZCgw@mail.gmail.com>
 <588c056c-7880-c98f-7464-beb6347017bf@embexus.com>
 <CAMKF1spBjCLrJV+ccHE1HS7scCN1=Z7fZ3fPWV-Uh5cPzA-A9A@mail.gmail.com>
From: "Ayoub Zaki" <ayoub.zaki@embexus.com>
Message-ID: <2f963778-ce01-7f34-e185-ab76d0c8481e@embexus.com>
Date: Mon, 31 May 2021 19:49:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spBjCLrJV+ccHE1HS7scCN1=Z7fZ3fPWV-Uh5cPzA-A9A@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------E66317A3786C3CB0688BE182"
Content-Language: en-US

--------------E66317A3786C3CB0688BE182
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 5/31/21 6:40 PM, Khem Raj wrote:
> On Mon, May 31, 2021 at 8:17 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>> Hi,
>>
>> On 5/31/21 4:45 PM, Khem Raj wrote:
>>> On Sun, May 30, 2021 at 10:21 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>>>> ---
>>>>    .../evemu-tools/evemu-tools_git.bb            | 23 +++++++++++++++++++
>>>>    1 file changed, 23 insertions(+)
>>>>    create mode 100644 meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
>>>>
>>>> diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
>>>> new file mode 100644
>>>> index 000000000..f1172b0ef
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
>>>> @@ -0,0 +1,23 @@
>>>> +SUMMARY = "Kernel evdev device emulation"
>>>> +DESCRIPTION = "The evemu library and tools are used to describe devices, record data, create devices and replay data from kernel evdev devices."
>>>> +HOMEPAGE = "https://www.freedesktop.org/wiki/Evemu"
>>>> +
>>>> +LICENSE = "GPLv3"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
>>>> +
>>>> +DEPENDS = "libevdev"
>>>> +
>>>> +SRCREV = "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
>>>> +SRC_URI = "git://git@gitlab.freedesktop.org/libevdev/evemu.git;protocol=https;branch=master"
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +PV = "gitr${SRCPV}"
>>>> +
>>>> +inherit autotools pkgconfig
>>>> +
>>>> +EXTRA_OECONF_append = " --prefix=/usr"
>>> why do we need this
>>
>> default prefix is /usr/local
> this recipe is inheriting autotools bbclass and should ser --prefix
> properly. So I wonder.
> Can you check your confgure logs and see where /usr/local is being passed


yes indeed it's not required.

I'm sending a V2.


Thanks for the review.

>
>>>> +
>>>> +PACKAGES =+ "${PN}-python"
>>>> +FILES_${PN}-python = "${libdir}/python*/site-packages/*"
>>>> +RDEPENDS_${PN}-python = "python3"
>>>> +
>>>> --
>>>> 2.17.1
>>>>
>>>>
>>>>
>>>>
>> Mit freundlichen Grüßen / Kind regards
>>
>> --
>> Ayoub Zaki
>> Embedded Systems Consultant
>>
>> Vaihinger Straße 2/1
>> D-71634 Ludwigsburg
>>
>> Mobile   : +4917662901545
>> Email    : ayoub.zaki@embexus.com
>> Homepage : https://embexus.com
>> VAT No.  : DE313902634
>>
>>
>> 
>>
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


--------------E66317A3786C3CB0688BE182
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 5/31/21 6:40 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1spBjCLrJV+ccHE1HS7scCN1=Z7fZ3fPWV-Uh5cPzA-A9A@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, May 31, 2021 at 8:17 AM Ayoub Zaki <a class="moz-txt-link-rfc2396E" href="mailto:ayoub.zaki@embexus.com">&lt;ayoub.zaki@embexus.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hi,

On 5/31/21 4:45 PM, Khem Raj wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Sun, May 30, 2021 at 10:21 AM Ayoub Zaki <a class="moz-txt-link-rfc2396E" href="mailto:ayoub.zaki@embexus.com">&lt;ayoub.zaki@embexus.com&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">---
  .../evemu-tools/evemu-tools_git.bb            | 23 +++++++++++++++++++
  1 file changed, 23 insertions(+)
  create mode 100644 meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb

diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
new file mode 100644
index 000000000..f1172b0ef
--- /dev/null
+++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Kernel evdev device emulation"
+DESCRIPTION = "The evemu library and tools are used to describe devices, record data, create devices and replay data from kernel evdev devices."
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.freedesktop.org/wiki/Evemu">"https://www.freedesktop.org/wiki/Evemu"</a>
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02">"file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"</a>
+
+DEPENDS = "libevdev"
+
+SRCREV = "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="mailto:git://git@gitlab.freedesktop.org/libevdev/evemu.git;protocol=https;branch=master">"git://git@gitlab.freedesktop.org/libevdev/evemu.git;protocol=https;branch=master"</a>
+
+S = "${WORKDIR}/git"
+PV = "gitr${SRCPV}"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF_append = " --prefix=/usr"
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">why do we need this
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

default prefix is /usr/local
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
this recipe is inheriting autotools bbclass and should ser --prefix
properly. So I wonder.
Can you check your confgure logs and see where /usr/local is being passed</pre>
    </blockquote>
    <p><br>
    </p>
    <p>yes indeed it's not required.</p>
    <p>I'm sending a V2.</p>
    <p><br>
    </p>
    <p>Thanks for the review.<br>
    </p>
    <blockquote type="cite"
cite="mid:CAMKF1spBjCLrJV+ccHE1HS7scCN1=Z7fZ3fPWV-Uh5cPzA-A9A@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python = "${libdir}/python*/site-packages/*"
+RDEPENDS_${PN}-python = "python3"
+
--
2.17.1




</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Mit freundlichen Grüßen / Kind regards

--
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : <a class="moz-txt-link-abbreviated" href="mailto:ayoub.zaki@embexus.com">ayoub.zaki@embexus.com</a>
Homepage : <a class="moz-txt-link-freetext" href="https://embexus.com">https://embexus.com</a>
VAT No.  : DE313902634

</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">


</pre>
      </blockquote>
    </blockquote>
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

--------------E66317A3786C3CB0688BE182--

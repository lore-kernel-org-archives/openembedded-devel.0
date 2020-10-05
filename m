Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web10.229.1601915888533172313
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 09:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=DGkc3Q0T;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4C4mVj5xFmzQlWP
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Oct 2020 18:38:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-type:content-type:in-reply-to
	:mime-version:date:date:message-id:from:from:references:subject
	:subject:received; s=mail20150812; t=1601915879; bh=BfVDYcRGNb/e
	YhJCIrhzoB/4Jm2RD66n62pLDaJE8J4=; b=DGkc3Q0TQNZZO0m7JLCWV5vNiOPP
	UhbLytuihrQ1hdt/CpELN+G9UKxcFDDw1wxYmseVgm262HHCX6aRaINncxUdq0DW
	8j8ZKtcb5sJmbfXHSoPvEQmZY1eNA2E9kWgbX7gleu65P55j6LX3wC1UhWsFtGqg
	K++uMPCUkIJqqMO79Ev9yf3NYkovZbBHURXWFuypdFQnHGXQ2wyaocX72cLsT+t/
	5eLg7XzJXmvvcThoa3YZHE+FcdIWSwik073EMGQUgDwwbNPtwlNTovPU8RGIUsz3
	Sw8PDnZj7qIeuYcBvOVDZsMj/eEeHbdYu9TzpYHf+uWOUkOn75xFy4sluw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1601915881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gfEdGFqJvTYffUgESlGiHlsUPUUDaSW27tyWMmzhG0A=;
	b=qsF1lE9eERLWEPrMwOtdR8SUaBcZkfSUow2jXxzzBXGax0qypkq/TAAq4RuI+EJc6C90y4
	Up/F1EoepJYswzHzNOhGY12B5xOsdsQopSiIba0bJm8Riiqajpm7ofHGSvRGgTEYxo9gLI
	L27lBnqmWAhpcYe125tS9QVhJorGE7NE+lBqc6PsDh6bMNM0y1uQKM7paqB5pdmOm0GGj5
	IIntSVIz/IfombqLcqgotAncRyxpzBcDETM2zCnuFMFZZe31P3bdNdoWbW5FzriB59xlOT
	xG7b3OWS6df9lY9+R7T24MzLbLMA2/whHVz0UK0noKDwS9tBiOm1BBLPmMYmZg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
	with ESMTP id XnP66OSNmyLJ
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2020 18:37:59 +0200 (CEST)
Subject: Re: [oe] [PATCH] Alliance for Open Media: new library
To: openembedded-devel@lists.openembedded.org
References: <20201005095019.30755-1-siew.hoon.lim@intel.com>
 <CAMKF1sojaqMS-FTVcLMj92750DqHykb2HhsWqMEFr1P-7-O5OA@mail.gmail.com>
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
Message-ID: <4ad399ed-27ae-40e1-4a4b-2e4e6d568db0@mailbox.org>
Date: Mon, 5 Oct 2020 18:37:59 +0200
MIME-Version: 1.0
In-Reply-To: <CAMKF1sojaqMS-FTVcLMj92750DqHykb2HhsWqMEFr1P-7-O5OA@mail.gmail.com>
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -1.13 / 15.00 / 15.00
X-Rspamd-Queue-Id: 7619D1706
X-Rspamd-UID: 9c7ea5
Content-Type: multipart/alternative;
 boundary="------------D03231EAC6AAA50AD4B9E917"
Content-Language: en-US

--------------D03231EAC6AAA50AD4B9E917
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'd also add this to meta-multimedia instead. After all, the whole idea 
of these newer meta-* sublayers was to organize the content of meta-oe 
better, wasn't it?

On 05.10.20 18:34, Khem Raj wrote:
> I wonder if this should be part of meta-multimedia, secondly add it to
> one of packagegroups e.g. packagegroups-meta-oe or
> packagegroups-meta-multimedia if it is in meta-multimedia.
>
>
> On Mon, Oct 5, 2020 at 2:50 AM Lim Siew Hoon <siew.hoon.lim@intel.com> wrote:
>> Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
>> Signed-off-by: Lim Siew Hoon <siew.hoon.lim@intel.com>
>> ---
>>   meta-oe/recipes-multimedia/aom/aom_2.0.0.bb | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
>>
>> diff --git a/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
>> new file mode 100644
>> index 000000000..4b388d57f
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY = "Alliance for Open Media - AV1 Codec Library"
>> +DESCRIPTION = "Alliance for Open Media AV1 codec library"
>> +
>> +LICENSE = "BSD-2-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5"
>> +
>> +SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https"
>> +
>> +SRCREV = "d1d1226af626a61f7ca664b270dd473b92228984"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +DEPENDS_append = " yasm-native"
> Just use DEPENDS +=
>
>> +
>> +inherit pkgconfig cmake perlnative python3native
>> +EXTRA_OECMAKE_append = " -DBUILD_SHARED_LIBS=1"
> Use EXTRA_OECMAKE +=
>
>> --
>> 2.17.1
>>
>>
>>
>>
>>
>> 
>>

--------------D03231EAC6AAA50AD4B9E917
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>I'd also add this to meta-multimedia instead. After all, the
      whole idea of these newer meta-* sublayers was to organize the
      content of meta-oe better, wasn't it?<br>
    </p>
    <div class="moz-cite-prefix">On 05.10.20 18:34, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sojaqMS-FTVcLMj92750DqHykb2HhsWqMEFr1P-7-O5OA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">I wonder if this should be part of meta-multimedia, secondly add it to
one of packagegroups e.g. packagegroups-meta-oe or
packagegroups-meta-multimedia if it is in meta-multimedia.


On Mon, Oct 5, 2020 at 2:50 AM Lim Siew Hoon <a class="moz-txt-link-rfc2396E" href="mailto:siew.hoon.lim@intel.com">&lt;siew.hoon.lim@intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Signed-off-by: Yong, Jonathan <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.yong@intel.com">&lt;jonathan.yong@intel.com&gt;</a>
Signed-off-by: Lim Siew Hoon <a class="moz-txt-link-rfc2396E" href="mailto:siew.hoon.lim@intel.com">&lt;siew.hoon.lim@intel.com&gt;</a>
---
 meta-oe/recipes-multimedia/aom/aom_2.0.0.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/aom/aom_2.0.0.bb

diff --git a/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
new file mode 100644
index 000000000..4b388d57f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Alliance for Open Media - AV1 Codec Library"
+DESCRIPTION = "Alliance for Open Media AV1 codec library"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5">"file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5"</a>
+
+SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https"
+
+SRCREV = "d1d1226af626a61f7ca664b270dd473b92228984"
+
+S = "${WORKDIR}/git"
+
+DEPENDS_append = " yasm-native"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Just use DEPENDS +=

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+inherit pkgconfig cmake perlnative python3native
+EXTRA_OECMAKE_append = " -DBUILD_SHARED_LIBS=1"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Use EXTRA_OECMAKE +=

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--
2.17.1




</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------D03231EAC6AAA50AD4B9E917--

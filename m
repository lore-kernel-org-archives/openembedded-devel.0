Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.11528.1592805607051459523
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Jun 2020 23:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05M5xIc2013253
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 21 Jun 2020 22:59:39 -0700
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Sun, 21 Jun 2020
 22:59:07 -0700
Subject: Re: [oe] [meta-python2][PATCH] python: update RRECOMMENDS for multilib
To: <openembedded-devel@lists.openembedded.org>
References: <1617BDFF89AD69A8.6417@lists.openembedded.org>
CC: <ticotimo@gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <c50790d4-a665-678a-06a2-865d71852f32@windriver.com>
Date: Mon, 22 Jun 2020 13:57:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1617BDFF89AD69A8.6417@lists.openembedded.org>
Content-Type: multipart/alternative;
	boundary="------------65F6CF88A4CB5401A9B0BF2F"
Content-Language: en-US

--------------65F6CF88A4CB5401A9B0BF2F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/20 4:16 PM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> There is a qa issue because of oe-core commit b3fda05 which updates
> multilib mechanism:
>
> | ERROR: lib32-python-2.7.18-r0 do_package: QA Issue: lib32-python package
>      lib32-python-crypt - suspicious values 'openssl' in RRECOMMENDS [multilib]
>
> Prepend ${MLPREFIX} to RRECOMMENDS to fix the issue.

Ping.


>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   recipes-devtools/python/python_2.7.18.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/python/python_2.7.18.bb b/recipes-devtools/python/python_2.7.18.bb
> index be7c6d2..0945cb3 100644
> --- a/recipes-devtools/python/python_2.7.18.bb
> +++ b/recipes-devtools/python/python_2.7.18.bb
> @@ -153,7 +153,7 @@ PACKAGES_remove = "${PN}"
>   # manual dependency additions
>   RPROVIDES_${PN}-modules = "${PN}"
>   RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
> -RRECOMMENDS_${PN}-crypt = "openssl"
> +RRECOMMENDS_${PN}-crypt = "${MLPREFIX}openssl"
>   
>   # package libpython2
>   PACKAGES =+ "lib${BPN}2"
>
> 


-- 
Kai Kang
Wind River Linux


--------------65F6CF88A4CB5401A9B0BF2F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 6/12/20 4:16 PM, kai wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1617BDFF89AD69A8.6417@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

There is a qa issue because of oe-core commit b3fda05 which updates
multilib mechanism:

| ERROR: lib32-python-2.7.18-r0 do_package: QA Issue: lib32-python package
    lib32-python-crypt - suspicious values 'openssl' in RRECOMMENDS [multilib]

Prepend ${MLPREFIX} to RRECOMMENDS to fix the issue.</pre>
    </blockquote>
    <p>Ping.</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:1617BDFF89AD69A8.6417@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 recipes-devtools/python/python_2.7.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python_2.7.18.bb b/recipes-devtools/python/python_2.7.18.bb
index be7c6d2..0945cb3 100644
--- a/recipes-devtools/python/python_2.7.18.bb
+++ b/recipes-devtools/python/python_2.7.18.bb
@@ -153,7 +153,7 @@ PACKAGES_remove = "${PN}"
 # manual dependency additions
 RPROVIDES_${PN}-modules = "${PN}"
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
-RRECOMMENDS_${PN}-crypt = "openssl"
+RRECOMMENDS_${PN}-crypt = "${MLPREFIX}openssl"
 
 # package libpython2
 PACKAGES =+ "lib${BPN}2"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------65F6CF88A4CB5401A9B0BF2F--

Received: from [209.85.222.193] (helo=mail-pz0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MbcR2-00029c-CN
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 17:41:51 +0200
Received: by pzk31 with SMTP id 31so671652pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 08:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ve0YFjMIYVg4+71vkDfcTX2oEsNKpTQTzxcxrMo/8aI=;
	b=XkYCgVzOfDET54V5/x9n88YgBJyzd7xwgqThELd4fsbcUrKgqeh9Z4ktUUD8DXtFst
	i9/CyNfROQQWDKxz9SkUSOuzs4/Kw9dZZ2wXT2MuV2dLpqVcPTWmfep2M4kpv0JbsT1C
	A7O5eQQ/M27wDHaY0oeEAyw2ZJ90LZ5PlOJUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EjY1tLRrVhVZ3E9ImRulQE0MpHj6D6HIoZvk/9c8YMSuVqHzAx8xUrNZnI7z5tMeL4
	SzSMWXoV+d9EmXTjcYo8/0qiWLuX/UCWBL0+9tX1aJus+l9oHvVxtlJWaHQekPSDAsZ/
	h045W7pfb6NFhPGNZGGBJDSXM/6S+CIRJJndY=
Received: by 10.142.209.13 with SMTP id h13mr181249wfg.169.1250177114053;
	Thu, 13 Aug 2009 08:25:14 -0700 (PDT)
Received: from gmail.com (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id 30sm1389293wfc.11.2009.08.13.08.25.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 Aug 2009 08:25:12 -0700 (PDT)
Date: Thu, 13 Aug 2009 08:25:07 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090813152507.GA8906@gmail.com>
References: <20090812095518.GA21131@zlo.nu>
MIME-Version: 1.0
In-Reply-To: <20090812095518.GA21131@zlo.nu>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Curl security advisory CVE-2009-2417 [PATCH]
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
X-List-Received-Date: Thu, 13 Aug 2009 15:41:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (12/08/09 11:55), Marc Olzheim wrote:
> Hi,
> 
> I'm not sure what the policy is for patch files of this type, but in
> this patch I decided to add them to recipes/curl/files, instead of
> including the curl.haxx.se urls in the SRC_URIs. I hope that that is the
> way to do it.
> 
> The patch for 7.18.1 applies on 7.18.2 fine. Apart from applying
> patches, I added 7.19.6.

You dont need to specify PR="r0" in new recipe.
You could also switch to use INC_PR

Thx

-Khem

> 
> Marc

> commit aab35ef35648250da1f37e8b60574b9359dff976
> Author: Marc Olzheim <marc@iphion.nl>
> Date:   Wed Aug 12 11:42:50 2009 +0200
> 
>     Add curl 7.19.6 and fix CVE-2009-2417 for the rest
>     http://curl.haxx.se/docs/adv_20090812.html
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 60d9729..f277e29 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -4390,6 +4390,10 @@ sha256=fb3436280dedbc8f8141d3841a5964c4491dd6457bc5b7123854aed0b794be86
>  md5=426d161661dce70c8ea9ad8f553363a3
>  sha256=05ad84a9c8d340917370f357ad9fdce5ea595deb11f4cb70f946fa48c7b02cd0
>  
> +[http://curl.haxx.se/download/curl-7.19.6.tar.bz2]
> +md5=8402c1f654c51ad7287aad57c3aa79be
> +sha256=ea88f48c8415f7d3af482e4d241277b2bdbfaffaf285e8001c88c1376cbc1021
> +
>  [http://downloads.sourceforge.net/curlftpfs/curlftpfs-0.9.2.tar.gz]
>  md5=b452123f755114cd4461d56c648d9f12
>  sha256=4eb44739c7078ba0edde177bdd266c4cfb7c621075f47f64c85a06b12b3c6958
> diff --git a/recipes/curl/curl-native_7.18.2.bb b/recipes/curl/curl-native_7.18.2.bb
> index c95591b..00c6215 100644
> --- a/recipes/curl/curl-native_7.18.2.bb
> +++ b/recipes/curl/curl-native_7.18.2.bb
> @@ -1,7 +1,9 @@
>  require curl-common.inc
>  inherit native
>  DEPENDS = "zlib-native"
> -PR = "r1"
> +PR = "r2"
> +
> +SRC_URI += "file://curl-7.18.1-CVE-2009-2417.patch;patch=1;pnum=0"
>  
>  do_stage () {
>  	autotools_stage_all
> diff --git a/recipes/curl/curl-sdk_7.18.2.bb b/recipes/curl/curl-sdk_7.18.2.bb
> index 35b0d88..8c667fa 100644
> --- a/recipes/curl/curl-sdk_7.18.2.bb
> +++ b/recipes/curl/curl-sdk_7.18.2.bb
> @@ -1,7 +1,9 @@
>  require curl-common.inc
>  inherit sdk
>  DEPENDS = "zlib-sdk"
> -PR = "r1"
> +PR = "r2"
> +
> +SRC_URI += "file://curl-7.18.1-CVE-2009-2417.patch;patch=1;pnum=0"
>  
>  do_stage () {
>          install -d ${STAGING_INCDIR}/curl
> diff --git a/recipes/curl/curl_7.18.2.bb b/recipes/curl/curl_7.18.2.bb
> index 3de6da4..2d32f6b 100644
> --- a/recipes/curl/curl_7.18.2.bb
> +++ b/recipes/curl/curl_7.18.2.bb
> @@ -1,4 +1,6 @@
>  require curl-common.inc
>  require curl-target.inc
>  
> -PR = "r1"
> +SRC_URI += "file://curl-7.18.1-CVE-2009-2417.patch;patch=1;pnum=0"
> +
> +PR = "r2"
> diff --git a/recipes/curl/curl_7.19.5.bb b/recipes/curl/curl_7.19.5.bb
> index b5b6182..61914e1 100644
> --- a/recipes/curl/curl_7.19.5.bb
> +++ b/recipes/curl/curl_7.19.5.bb
> @@ -2,5 +2,6 @@ require curl-common.inc
>  require curl-target.inc
>  
>  SRC_URI += "file://off_t_abi_fix.patch;patch=1;pnum=0 \
> -            file://curl-add_all_algorithms.patch;patch=1"
> -PR = "r1"
> +            file://curl-add_all_algorithms.patch;patch=1 \
> +            file://curl-7.19.5-CVE-2009-2417.patch;patch=1;pnum=0"
> +PR = "r2"
> diff --git a/recipes/curl/curl_7.19.6.bb b/recipes/curl/curl_7.19.6.bb
> new file mode 100644
> index 0000000..df83fe8
> --- /dev/null
> +++ b/recipes/curl/curl_7.19.6.bb
> @@ -0,0 +1,5 @@
> +require curl-common.inc
> +require curl-target.inc
> +
> +SRC_URI += "file://off_t_abi_fix.patch;patch=1;pnum=0"
> +PR = "r0"
> diff --git a/recipes/curl/files/curl-7.18.1-CVE-2009-2417.patch b/recipes/curl/files/curl-7.18.1-CVE-2009-2417.patch
> new file mode 100644
> index 0000000..e7c24c0
> --- /dev/null
> +++ b/recipes/curl/files/curl-7.18.1-CVE-2009-2417.patch
> @@ -0,0 +1,83 @@
> +---
> + lib/ssluse.c |   40 +++++++++++++++++++++++++++-------------
> + 1 file changed, 27 insertions(+), 13 deletions(-)
> +
> +--- lib/ssluse.c.orig
> ++++ lib/ssluse.c
> +@@ -1061,7 +1061,7 @@ static CURLcode verifyhost(struct connec
> +       if(check->type == target) {
> +         /* get data and length */
> +         const char *altptr = (char *)ASN1_STRING_data(check->d.ia5);
> +-        int altlen;
> ++        size_t altlen = (size_t) ASN1_STRING_length(check->d.ia5);
> + 
> +         switch(target) {
> +         case GEN_DNS: /* name/pattern comparison */
> +@@ -1075,14 +1075,16 @@ static CURLcode verifyhost(struct connec
> +              "I checked the 0.9.6 and 0.9.8 sources before my patch and
> +              it always 0-terminates an IA5String."
> +           */
> +-          if(cert_hostcheck(altptr, conn->host.name))
> ++          if((altlen == strlen(altptr)) &&
> ++             /* if this isn't true, there was an embedded zero in the name
> ++                string and we cannot match it. */
> ++             cert_hostcheck(altptr, conn->host.name))
> +             matched = TRUE;
> +           break;
> + 
> +         case GEN_IPADD: /* IP address comparison */
> +           /* compare alternative IP address if the data chunk is the same size
> +              our server IP address is */
> +-          altlen = ASN1_STRING_length(check->d.ia5);
> +           if((altlen == addrlen) && !memcmp(altptr, &addr, altlen))
> +             matched = TRUE;
> +           break;
> +@@ -1122,18 +1124,27 @@ static CURLcode verifyhost(struct connec
> +          string manually to avoid the problem. This code can be made
> +          conditional in the future when OpenSSL has been fixed. Work-around
> +          brought by Alexis S. L. Carvalho. */
> +-      if(tmp && ASN1_STRING_type(tmp) == V_ASN1_UTF8STRING) {
> +-        j = ASN1_STRING_length(tmp);
> +-        if(j >= 0) {
> +-          peer_CN = OPENSSL_malloc(j+1);
> +-          if(peer_CN) {
> +-            memcpy(peer_CN, ASN1_STRING_data(tmp), j);
> +-            peer_CN[j] = '\0';
> ++      if(tmp) {
> ++        if(ASN1_STRING_type(tmp) == V_ASN1_UTF8STRING) {
> ++          j = ASN1_STRING_length(tmp);
> ++          if(j >= 0) {
> ++            peer_CN = OPENSSL_malloc(j+1);
> ++            if(peer_CN) {
> ++              memcpy(peer_CN, ASN1_STRING_data(tmp), j);
> ++              peer_CN[j] = '\0';
> ++            }
> +           }
> +         }
> ++        else /* not a UTF8 name */
> ++          j = ASN1_STRING_to_UTF8(&peer_CN, tmp);
> ++
> ++        if(peer_CN && ((int)strlen((char *)peer_CN) != j)) {
> ++          /* there was a terminating zero before the end of string, this
> ++             cannot match and we return failure! */
> ++          failf(data, "SSL: illegal cert name field");
> ++          res = CURLE_PEER_FAILED_VERIFICATION;
> ++        }
> +       }
> +-      else /* not a UTF8 name */
> +-        j = ASN1_STRING_to_UTF8(&peer_CN, tmp);
> +     }
> + 
> +     if(peer_CN == nulstr)
> +@@ -1151,7 +1162,10 @@ static CURLcode verifyhost(struct connec
> +     }
> + #endif /* CURL_DOES_CONVERSIONS */
> + 
> +-    if(!peer_CN) {
> ++    if(res)
> ++      /* error already detected, pass through */
> ++      ;
> ++    else if(!peer_CN) {
> +       failf(data,
> +             "SSL: unable to obtain common name from peer certificate");
> +       return CURLE_PEER_FAILED_VERIFICATION;
> diff --git a/recipes/curl/files/curl-7.19.5-CVE-2009-2417.patch b/recipes/curl/files/curl-7.19.5-CVE-2009-2417.patch
> new file mode 100644
> index 0000000..f64232c
> --- /dev/null
> +++ b/recipes/curl/files/curl-7.19.5-CVE-2009-2417.patch
> @@ -0,0 +1,80 @@
> +--- lib/ssluse.c-7.19.5	2009-08-03 16:01:58.000000000 +0200
> ++++ lib/ssluse.c	2009-08-03 16:07:17.000000000 +0200
> +@@ -1092,7 +1092,8 @@
> +       if(check->type == target) {
> +         /* get data and length */
> +         const char *altptr = (char *)ASN1_STRING_data(check->d.ia5);
> +-        size_t altlen;
> ++        size_t altlen = (size_t) ASN1_STRING_length(check->d.ia5);
> ++
> + 
> +         switch(target) {
> +         case GEN_DNS: /* name/pattern comparison */
> +@@ -1106,14 +1107,16 @@
> +              "I checked the 0.9.6 and 0.9.8 sources before my patch and
> +              it always 0-terminates an IA5String."
> +           */
> +-          if(cert_hostcheck(altptr, conn->host.name))
> ++          if((altlen == strlen(altptr)) &&
> ++             /* if this isn't true, there was an embedded zero in the name
> ++                string and we cannot match it. */
> ++             cert_hostcheck(altptr, conn->host.name))
> +             matched = TRUE;
> +           break;
> + 
> +         case GEN_IPADD: /* IP address comparison */
> +           /* compare alternative IP address if the data chunk is the same size
> +              our server IP address is */
> +-          altlen = (size_t) ASN1_STRING_length(check->d.ia5);
> +           if((altlen == addrlen) && !memcmp(altptr, &addr, altlen))
> +             matched = TRUE;
> +           break;
> +@@ -1153,18 +1156,27 @@
> +          string manually to avoid the problem. This code can be made
> +          conditional in the future when OpenSSL has been fixed. Work-around
> +          brought by Alexis S. L. Carvalho. */
> +-      if(tmp && ASN1_STRING_type(tmp) == V_ASN1_UTF8STRING) {
> +-        j = ASN1_STRING_length(tmp);
> +-        if(j >= 0) {
> +-          peer_CN = OPENSSL_malloc(j+1);
> +-          if(peer_CN) {
> +-            memcpy(peer_CN, ASN1_STRING_data(tmp), j);
> +-            peer_CN[j] = '\0';
> ++      if(tmp) {
> ++        if(ASN1_STRING_type(tmp) == V_ASN1_UTF8STRING) {
> ++          j = ASN1_STRING_length(tmp);
> ++          if(j >= 0) {
> ++            peer_CN = OPENSSL_malloc(j+1);
> ++            if(peer_CN) {
> ++              memcpy(peer_CN, ASN1_STRING_data(tmp), j);
> ++              peer_CN[j] = '\0';
> ++            }
> +           }
> +         }
> ++        else /* not a UTF8 name */
> ++          j = ASN1_STRING_to_UTF8(&peer_CN, tmp);
> ++
> ++        if(peer_CN && ((int)strlen((char *)peer_CN) != j)) {
> ++          /* there was a terminating zero before the end of string, this
> ++             cannot match and we return failure! */
> ++          failf(data, "SSL: illegal cert name field");
> ++          res = CURLE_PEER_FAILED_VERIFICATION;
> ++        }
> +       }
> +-      else /* not a UTF8 name */
> +-        j = ASN1_STRING_to_UTF8(&peer_CN, tmp);
> +     }
> + 
> +     if(peer_CN == nulstr)
> +@@ -1182,7 +1194,10 @@
> +     }
> + #endif /* CURL_DOES_CONVERSIONS */
> + 
> +-    if(!peer_CN) {
> ++    if(res)
> ++      /* error already detected, pass through */
> ++      ;
> ++    else if(!peer_CN) {
> +       failf(data,
> +             "SSL: unable to obtain common name from peer certificate");
> +       return CURLE_PEER_FAILED_VERIFICATION;




> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




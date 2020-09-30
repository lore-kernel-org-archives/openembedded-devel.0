Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.6617.1601504310348452970
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NKL48lgI;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: chaoscodecircuits@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id q63so3259539qkf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 15:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=ingJzgPfsHfRDfofwT3ZKAs1cpAWXUglhyOsO8OFZWw=;
        b=NKL48lgISuCq5JR9la5tIDB9FLGDX0kR5wRG+zscHxKgP6bFCrrRCpLlk+GHAagf0C
         XyDLf+cFHLjcyfvcJhgp6mTa7UAoTWIFzfcUo1/OXoI+jkwpP4ZVekdwdfdriNjuCrab
         aC3gkT+S4NA8w6HiDuJnWolVBzhLlLM0X1G3UAGCEQQBxYP/jqKL3+nxA/NxRrv51fXd
         Uf1Cb5O8vocpCez5YaKG14Qcitqu61OQ9GSW0syZC1hTkjpRBrNC7GRBHFi9xoEoqUJ7
         voGVlbg9jjHwNC6QMlW6AKiekg/GmpejNOoqwe/rpQgVhzG9T62jrL7QFZiIonCdOIuB
         FccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=ingJzgPfsHfRDfofwT3ZKAs1cpAWXUglhyOsO8OFZWw=;
        b=kYtmCGij0IBIv0qKUMWJUhu7VFmh7Beefxz86eBEwse3DPI3kkOsSxL0228p7pGZpY
         XhRIc6L+tKAGx8Hgyp3XtMio6hE2MeHwwMG1qs25PYZFxD/XiMwbT1ZAR4hIF9awsWj/
         oTuUy2Smnk4L7/8y4kzpNGn9amJhkmXd1o61DUVVR0hE7E0lfBcWILSh35H85C2L4oGz
         lmokP+0S/VUmPS8JlBTLsLgimCG3iAvNNcv2z4kMzFbdl50W5dsmYFkUXUG/CpItvFnv
         sjoVcEfR3g9tMPZJPSq2mKYDyv2ToncdE626e/sQ87998R1HlCPLceeYwMUSwsxBic8W
         jGlg==
X-Gm-Message-State: AOAM530NC/TszW5kYS1ixDJYeHganwiaJBC9wjx4tdtWy6kBu8auEmqT
	h0afdwS6Xfx1KLZY3LVkx3z76PTMo1NSOg==
X-Google-Smtp-Source: ABdhPJzdT+Dr/J/GZlXXfLXOuYUEem115eWaObZtV6XesdKBT0wB6Ya6Um9JCWrxo4a/QTplIBvXFw==
X-Received: by 2002:a37:c403:: with SMTP id d3mr4728687qki.196.1601504309104;
        Wed, 30 Sep 2020 15:18:29 -0700 (PDT)
Return-Path: <chaoscodecircuits@gmail.com>
Received: from [192.168.0.55] (CPE64777de11593-CM64777de11590.cpe.net.cable.rogers.com. [174.115.236.231])
        by smtp.gmail.com with ESMTPSA id m138sm3752294qke.99.2020.09.30.15.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 15:18:28 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-djangorestframework: Upgrade 3.11.1 -> 3.12.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200929082645.32560-1-leon.anavi@konsulko.com>
 <20200929082645.32560-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <chaoscodecircuits@gmail.com>
Message-ID: <5d8a704a-ddad-77c2-4477-ea2aef127d78@gmail.com>
Date: Wed, 30 Sep 2020 18:18:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200929082645.32560-2-leon.anavi@konsulko.com>
Content-Type: multipart/alternative;
 boundary="------------95E79CC1E99A3FDEAB7C503F"
Content-Language: en-US

--------------95E79CC1E99A3FDEAB7C503F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/29/20 4:26 AM, Leon Anavi wrote:
> Upgrade to release 3.12.1:
>
> - Add --file option to generateschema command.
> - Support tags for OpenAPI schema generation. See the schema docs.
> - Support customising the operation ID for schema generation. See
>    the schema docs.
> - Support OpenAPI components for schema generation. See the schema
>    docs.
> - The following methods on AutoSchema become public API:
>    get_path_parameters, get_pagination_parameters,
>    get_filter_parameters, get_request_body, get_responses,
>    get_serializer, get_paginator, map_serializer, map_field,
>    map_choice_field, map_field_validators, allows_filters.
>    See the schema docs.
> - Add support for Django 3.1's database-agnositic JSONField.
> - SearchFilter now supports nested search on JSONField and
>    HStoreField model fields.
> - SearchFilter now supports searching on annotate() fields.
> - The authtoken model no longer exposes the pk in the admin URL.
> - Add __repr__ for Request instances.
> - UTF-8 decoding with Latin-1 fallback for basic auth credentials.
> - CharField treats surrogate characters as a validation failure.
> - Don't include callables as default values in schemas.
> - Improve ListField schema output to include all available child
>    information.
> - Allow default=False to be included for BooleanField schema
>    outputs.
> - Include "type" information in ChoiceField schema outputs.
> - Include "type": "object" on schema objects.
> - Don't include component in schema output for DELETE requests.
> - Fix schema types for DecimalField.
> - Fix schema generation for ObtainAuthToken view.
> - Support passing context=... to view .get_serializer() methods.
> - Pass custom code to PermissionDenied if permission class has one
>    set.
> - Include "example" in schema pagination output.
> - Default status code of 201 on schema output for POST requests.
> - Use camelCase for operation IDs in schema output.
> - Warn if duplicate operation IDs exist in schema output.
> - Improve handling of decimal type when mapping ChoiceField to a
>    schema output.
> - Disable YAML aliases for OpenAPI schema outputs.
> - Fix action URL names for APIs included under a namespaced URL.
> - Update jQuery version from 3.4 to 3.5.
> - Fix UniqueTogether handling when serializer fields use
>    source=....
> - HTTP HEAD requests now set self.action correctly on a ViewSet
>    instance.
> - Return a valid OpenAPI schema for the case where no API schema
>    paths exist.
> - Include tests in package distribution.
> - Allow type checkers to support annotations like
>    ModelSerializer[Author].
> - Don't include invalid charset=None portion in the request
>    Content-Type header when using APIClient.
> - Fix \Z/\z tokens in OpenAPI regexs.
> - Fix PrimaryKeyRelatedField and HyperlinkedRelatedField when
>    source field is actually a property.
> - Token.generate_key is now a class method.
> - @action warns if method is wrapped in a decorator that does not
>    preserve information using @functools.wraps.
> - Add TokenProxy migration.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...mework_3.11.1.bb => python3-djangorestframework_3.12.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.11.1.bb => python3-djangorestframework_3.12.1.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
> rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
> index 81f55ff9e7..60bdbaa9ec 100644
> --- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
>   
> -SRC_URI[md5sum] = "c8ea3e4c3c0d705acf70184faeb2b696"
> -SRC_URI[sha256sum] = "6dd02d5a4bd2516fb93f80360673bf540c3b6641fec8766b1da2870a5aa00b32"
> +SRC_URI[md5sum] = "47d5ea46923a131c5fbefeb610c6ce2c"
> +SRC_URI[sha256sum] = "d54452aedebb4b650254ca092f9f4f5df947cb1de6ab245d817b08b4f4156249"
>   PYPI_PACKAGE = "djangorestframework"
>   
>   inherit pypi setuptools3
>
> 
>

--------------95E79CC1E99A3FDEAB7C503F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/29/20 4:26 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200929082645.32560-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.12.1:

- Add --file option to generateschema command.
- Support tags for OpenAPI schema generation. See the schema docs.
- Support customising the operation ID for schema generation. See
  the schema docs.
- Support OpenAPI components for schema generation. See the schema
  docs.
- The following methods on AutoSchema become public API:
  get_path_parameters, get_pagination_parameters,
  get_filter_parameters, get_request_body, get_responses,
  get_serializer, get_paginator, map_serializer, map_field,
  map_choice_field, map_field_validators, allows_filters.
  See the schema docs.
- Add support for Django 3.1's database-agnositic JSONField.
- SearchFilter now supports nested search on JSONField and
  HStoreField model fields.
- SearchFilter now supports searching on annotate() fields.
- The authtoken model no longer exposes the pk in the admin URL.
- Add __repr__ for Request instances.
- UTF-8 decoding with Latin-1 fallback for basic auth credentials.
- CharField treats surrogate characters as a validation failure.
- Don't include callables as default values in schemas.
- Improve ListField schema output to include all available child
  information.
- Allow default=False to be included for BooleanField schema
  outputs.
- Include "type" information in ChoiceField schema outputs.
- Include "type": "object" on schema objects.
- Don't include component in schema output for DELETE requests.
- Fix schema types for DecimalField.
- Fix schema generation for ObtainAuthToken view.
- Support passing context=... to view .get_serializer() methods.
- Pass custom code to PermissionDenied if permission class has one
  set.
- Include "example" in schema pagination output.
- Default status code of 201 on schema output for POST requests.
- Use camelCase for operation IDs in schema output.
- Warn if duplicate operation IDs exist in schema output.
- Improve handling of decimal type when mapping ChoiceField to a
  schema output.
- Disable YAML aliases for OpenAPI schema outputs.
- Fix action URL names for APIs included under a namespaced URL.
- Update jQuery version from 3.4 to 3.5.
- Fix UniqueTogether handling when serializer fields use
  source=....
- HTTP HEAD requests now set self.action correctly on a ViewSet
  instance.
- Return a valid OpenAPI schema for the case where no API schema
  paths exist.
- Include tests in package distribution.
- Allow type checkers to support annotations like
  ModelSerializer[Author].
- Don't include invalid charset=None portion in the request
  Content-Type header when using APIClient.
- Fix \Z/\z tokens in OpenAPI regexs.
- Fix PrimaryKeyRelatedField and HyperlinkedRelatedField when
  source field is actually a property.
- Token.generate_key is now a class method.
- @action warns if method is wrapped in a decorator that does not
  preserve information using @functools.wraps.
- Add TokenProxy migration.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite"
      cite="mid:20200929082645.32560-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...mework_3.11.1.bb =&gt; python3-djangorestframework_3.12.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.11.1.bb =&gt; python3-djangorestframework_3.12.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
index 81f55ff9e7..60bdbaa9ec 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/djangorestframework">"https://pypi.python.org/pypi/djangorestframework"</a>
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1">"file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"</a>
 
-SRC_URI[md5sum] = "c8ea3e4c3c0d705acf70184faeb2b696"
-SRC_URI[sha256sum] = "6dd02d5a4bd2516fb93f80360673bf540c3b6641fec8766b1da2870a5aa00b32"
+SRC_URI[md5sum] = "47d5ea46923a131c5fbefeb610c6ce2c"
+SRC_URI[sha256sum] = "d54452aedebb4b650254ca092f9f4f5df947cb1de6ab245d817b08b4f4156249"
 PYPI_PACKAGE = "djangorestframework"
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------95E79CC1E99A3FDEAB7C503F--

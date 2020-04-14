Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.8298.1586860046081176257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 03:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aaaK01Q8;
 spf=pass (domain: konsulko.com, ip: 209.85.208.195, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lj1-f195.google.com with SMTP id d8so1487367ljo.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 03:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=mgy9ya6sZCf3O9rOo3dYXzk1U8i9gPuAl7xMS9o8alc=;
        b=aaaK01Q8Gih0Wjj8leixDl6X9OBwWr7KKOVbw3Mi57SswauKqjNIpZpsSnhESgByz0
         2W5nlMQzZBcz/MoyJTQ9yJ0D8UQwTJpO8m6SzlwZfqwbGNnjV8rGa+CuZXqbbpJs2gU4
         YSVppoZTytod3CDwb4APvaU5M2Dew1GA7bZNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=mgy9ya6sZCf3O9rOo3dYXzk1U8i9gPuAl7xMS9o8alc=;
        b=UTspw/5b5EJwMf9GMadh1eAR4Z6XN63p5nF5o2bB1JWeZJEwDPxLYR9ef1vM/jgbsB
         8fzMTT2d2HTlsunIJlBrT3vTRtgSVToxOqYlmAAKsq9GvLU37MyVbGbe1QZdVlqj7CXa
         t1Ysb7Mf2ByNpNxCKd+TBXrV1rOFESk4tpu50yLkpU+tsFQG12ir8bZ2s/kPZ3k21ohv
         nHqBoKqLdIFz/xGkhuU4/NARG0BkL6V39lwMNODP1QLaF/AFUhQZnl9QZ762Ms0BUm+V
         ug6ELF+HHtu+TNszIpQCshRDp+bJJbaT3wTskXpPnSMiv5ruplX0nh4Wsendh1zgYNd9
         yr6A==
X-Gm-Message-State: AGi0PubfZWUPm5gG4auvkejPa/WiiXPbrTVWFSV9i33+uaFnXmMY5eZz
	cFqhpH/+h/6VSIBc1+yjfqqJco4FDyc=
X-Google-Smtp-Source: APiQypLLB1hD25uxCNDsx3N6oY4V4ILKRcsuxN/8w4E6TC9K/Ai6BgQ7teVfOpEHSsZ296jSnkxqPw==
X-Received: by 2002:a2e:9a0d:: with SMTP id o13mr364697lji.142.1586860043798;
        Tue, 14 Apr 2020 03:27:23 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id j22sm10266118lfg.96.2020.04.14.03.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 03:27:23 -0700 (PDT)
Subject: Re: [oe] [meta-python2][PATCH 3/3] python-docker: move from meta-virtualization
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <1586807349-28557-1-git-send-email-leon.anavi@konsulko.com>
 <1586807349-28557-3-git-send-email-leon.anavi@konsulko.com>
 <CANx9H-C2ghXKToh9qjFWThE1N_7e939JyFLEp2H2XEM2PdLThA@mail.gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <e4316b3a-172a-6ec0-48e7-306a46b9c162@konsulko.com>
Date: Tue, 14 Apr 2020 13:27:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-C2ghXKToh9qjFWThE1N_7e939JyFLEp2H2XEM2PdLThA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------A8AA6CEA51A64C1EEF08A565"
Content-Language: en-US

--------------A8AA6CEA51A64C1EEF08A565
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tim,

Based on your feedback I have just sent version 2 of the patches for 
python-docker and python-websocket-client for meta-python2. The patch 
for python-docker-pycreds remains the same so I haven't sent it again.

Thanks,
Leon

On 14.04.20 г. 1:35 ч., Tim Orling wrote:
>
>
> On Mon, Apr 13, 2020 at 12:49 PM Leon Anavi <leon.anavi@konsulko.com 
> <mailto:leon.anavi@konsulko.com>> wrote:
>
>     Support for Python 2 has been dropped in meta-virtualization. Move
>     python-docker recipes to meta-python2 for backward compatibility
>     of legacy projects. Dependencies python-docker-pycreds and
>     python-websocket-client should be also present in meta-python2.
>
>     Signed-off-by: Leon Anavi <leon.anavi@konsulko.com
>     <mailto:leon.anavi@konsulko.com>>
>     ---
>      recipes-devtools/python/python-docker_4.1.0.bb
>     <http://python-docker_4.1.0.bb> | 18 ++++++++++++++++++
>      1 file changed, 18 insertions(+)
>      create mode 100644 recipes-devtools/python/python-docker_4.1.0.bb
>     <http://python-docker_4.1.0.bb>
>
>     diff --git a/recipes-devtools/python/python-docker_4.1.0.bb
>     <http://python-docker_4.1.0.bb>
>     b/recipes-devtools/python/python-docker_4.1.0.bb
>     <http://python-docker_4.1.0.bb>
>     new file mode 100644
>     index 0000000..434e463
>     --- /dev/null
>     +++ b/recipes-devtools/python/python-docker_4.1.0.bb
>     <http://python-docker_4.1.0.bb>
>
>
> Latest upstream is 4.2.0. Can you look into an upgrade?
>
>
>     @@ -0,0 +1,18 @@
>     +SUMMARY = "A Python library for the Docker Engine API."
>     +HOMEPAGE = "https://github.com/docker/docker-py"
>     +LICENSE = "Apache-2.0"
>     +LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
>     +
>     +inherit pypi setuptools
>     +
>     +SRC_URI[md5sum] = "e1e8dc73e3220fe9eec1faf80b0290de"
>     +SRC_URI[sha256sum] =
>     "6e06c5e70ba4fad73e35f00c55a895a448398f3ada7faae072e2bb01348bafc1"
>     +
>     +RDEPENDS_${PN} += " \
>     +       python-misc \
>     +       python-six \
>     +       python-docker-pycreds \
>     +       python-requests \
>     +       python-websocket-client \
>     +       python-backports-ssl \
>     +"
>     -- 
>     2.7.4
>
>     
>
-- 
Leon Anavi
Software Engineer
konsulko.com


--------------A8AA6CEA51A64C1EEF08A565
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Tim,<br>
      <br>
      Based on your feedback I have just sent version 2 of the patches
      for python-docker and python-websocket-client for meta-python2.
      The patch for python-docker-pycreds remains the same so I haven't
      sent it again.<br>
      <br>
      Thanks,<br>
      Leon<br>
    </p>
    <div class="moz-cite-prefix">On 14.04.20 г. 1:35 ч., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANx9H-C2ghXKToh9qjFWThE1N_7e939JyFLEp2H2XEM2PdLThA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Apr 13, 2020 at
            12:49 PM Leon Anavi &lt;<a
              href="mailto:leon.anavi@konsulko.com"
              moz-do-not-send="true">leon.anavi@konsulko.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Support
            for Python 2 has been dropped in meta-virtualization. Move<br>
            python-docker recipes to meta-python2 for backward
            compatibility<br>
            of legacy projects. Dependencies python-docker-pycreds and<br>
            python-websocket-client should be also present in
            meta-python2.<br>
            <br>
            Signed-off-by: Leon Anavi &lt;<a
              href="mailto:leon.anavi@konsulko.com" target="_blank"
              moz-do-not-send="true">leon.anavi@konsulko.com</a>&gt;<br>
            ---<br>
             recipes-devtools/python/<a
              href="http://python-docker_4.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python-docker_4.1.0.bb</a>
            | 18 ++++++++++++++++++<br>
             1 file changed, 18 insertions(+)<br>
             create mode 100644 recipes-devtools/python/<a
              href="http://python-docker_4.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python-docker_4.1.0.bb</a><br>
            <br>
            diff --git a/recipes-devtools/python/<a
              href="http://python-docker_4.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python-docker_4.1.0.bb</a>
            b/recipes-devtools/python/<a
              href="http://python-docker_4.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python-docker_4.1.0.bb</a><br>
            new file mode 100644<br>
            index 0000000..434e463<br>
            --- /dev/null<br>
            +++ b/recipes-devtools/python/<a
              href="http://python-docker_4.1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python-docker_4.1.0.bb</a></blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Latest upstream is 4.2.0. Can you look into an
            upgrade?</div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            @@ -0,0 +1,18 @@<br>
            +SUMMARY = "A Python library for the Docker Engine API."<br>
            +HOMEPAGE = "<a href="https://github.com/docker/docker-py"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/docker/docker-py</a>"<br>
            +LICENSE = "Apache-2.0"<br>
            +LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=34f3846f940453127309b920eeb89660">"file://LICENSE;md5=34f3846f940453127309b920eeb89660"</a><br>
            +<br>
            +inherit pypi setuptools<br>
            +<br>
            +SRC_URI[md5sum] = "e1e8dc73e3220fe9eec1faf80b0290de"<br>
            +SRC_URI[sha256sum] =
            "6e06c5e70ba4fad73e35f00c55a895a448398f3ada7faae072e2bb01348bafc1"<br>
            +<br>
            +RDEPENDS_${PN} += " \<br>
            +       python-misc \<br>
            +       python-six \<br>
            +       python-docker-pycreds \<br>
            +       python-requests \<br>
            +       python-websocket-client \<br>
            +       python-backports-ssl \<br>
            +"<br>
            -- <br>
            2.7.4<br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Leon Anavi
Software Engineer
konsulko.com</pre>
  </body>
</html>

--------------A8AA6CEA51A64C1EEF08A565--

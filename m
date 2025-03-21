Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84CDC35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 08:01:48 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.16087.1742544107398935827
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 01:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YlgwzmGy;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30beedb99c9so16725261fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742544105; x=1743148905; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eG1LiGpAuxaret4//YAUQQGyQPwHrOwMJbIfAOp3fk=;
        b=YlgwzmGyLxrj7jyu2jMEnrRygjNm9Qqh0oV4PpYLfy40z43+Ui4mdncm25MNpE3RHW
         u91qWR4zHCQ96YAQA7I2T3TPbm5X+t/H4CMTenW6PUs4Fujb/EFkKsmcfpUDB8c8v8EH
         0lytG8Uu8La77JaFUgjGe8FR4z3ozWCiUhEwiGvlDJw6Z4869CdZ2Dc54YDVoV7mMkN1
         WwllTV6MAIFPEsExtw3q2KrdIzwbMQrAdqGAEhKSYoSvm4WMh+ACMzzXLBUXpiIn/iR0
         186Hol3StyNu7DIP8LlInJDQdlWgoL81GKZdCKXEDrb5C2QGLEpe2vres0iQJwbRDYwc
         Q/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742544105; x=1743148905;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2eG1LiGpAuxaret4//YAUQQGyQPwHrOwMJbIfAOp3fk=;
        b=wM//PJYggoE6osSBIqide7cHsP2P5yzyVXLZEutXMBLloUArhEn212p4V6qApzYPy1
         BaI8SSlMBIji+4XWd86vEWm/E0mU6mRwsMpa48Ir6kO8vzfZOqRnFN4JvMu+TWrSn12f
         ADP+dMgCw7bI+lR93NuA5xCvTrslLs0tBzQ6GqAmdSxnc2g88MW8HkG/W+NBSQuk/9aX
         BhuiK3v/YnKICLMCMBFzjuVv49mabvNPy2mFFV3cnIy349wiGCQofmZ+vePWfwBy/tJI
         pD+SCOcCTddFeidyZrDkxxtYVUb4iVD0GjbPEHZ29lHSAqMajRwl53sL3hheDgHVvz7Y
         vAow==
X-Forwarded-Encrypted: i=1; AJvYcCWG2bkl2r+p3K9QnI2r6Q+YeRJ6wAujDi+6a4E6h2WgW2+dbJVrorVQlPHII/G76s4KfH7h098BKiOt0Ik8ZcypqP4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYLZdPGA8ELsVZ+W7r5yLIac0hYP3n886iboRu5HqdfqhAFo7i
	hnMEOfKK/Oh8JBANEezUXgCweRIaUq/RCewbR83zbPLKdP5bhywz
X-Gm-Gg: ASbGncsyqhYKrftztncprofZqKiLm8qehG9dNf3e4TT56BPPgUSLh1LGscNqvcq8qOc
	BYLHkejKEQAiuciyDew4D2n/3a+c7GcAE6vF59EZYQK2rL2f7PSfqL3Y4g38FHnX44r42quWTDS
	nOJ/fY2I/Ye6BlYptBACWdXf0DhQg/dhz/BxCd11MhCkpucpsMrg5IzL8JE8LsDCk+ck48EnYXC
	v+FuWDNB6TuApLbiMsNH0zicr+E7LhlRT9TQZkItjOWt3Zqf1Lxiqu0G5iKG5hOVud8y2ENVpq5
	DodCsnfwSiodCuArWeLWo62tbNk32p1pUkrDeD29FEgmm/lz1g==
X-Google-Smtp-Source: AGHT+IEF6iXCvelRCWd5Kxy8jfDTFy8thHEyd7MGLcC+0dq3CxBH9+l8w/sfcrcVCm/D5VAd9TQT3A==
X-Received: by 2002:a05:6512:a94:b0:545:93b:30bf with SMTP id 2adb3069b0e04-54ad64f08e6mr800771e87.41.1742544104663;
        Fri, 21 Mar 2025 01:01:44 -0700 (PDT)
Received: from [172.16.6.176] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6503830sm117981e87.173.2025.03.21.01.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 01:01:42 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------4hY00MBnnc6fRk5El2wl0ORC"
Message-ID: <ab1b1343-89a1-46ec-8d01-6cca7517916f@gmail.com>
Date: Fri, 21 Mar 2025 09:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH v2] python3-varlink: Add recipe
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20250320113010.1428716-1-omri.sarig13@gmail.com>
 <AS1PR10MB5697938634FFEB1D1A4B31D6FDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <cbd99f9b-efd9-4bed-977d-8fc075a540a8@gmail.com>
 <AS1PR10MB56972A5C5FF47506C2D912BFFDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Omri Sarig <omri.sarig13@gmail.com>
In-Reply-To: <AS1PR10MB56972A5C5FF47506C2D912BFFDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 08:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116172

This is a multi-part message in MIME format.
--------------4hY00MBnnc6fRk5El2wl0ORC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/21/25 08:54, Marko, Peter wrote:
>
> In ideal case we should do a good package split.
>
> e.g. main package + examples package + test package (with examples 
> depending on test)
>
> That would allow us to just install the tool with small footprint or 
> install also tests or everything.
>
> But we can also just keep it as is as it looks difficult.
>
> I just thought there is a low-hanging fruit somewhere.
>
That makes sense - unfortunately, that was not the case with the way 
they built the varlink-python repo and setuptool installation.

I'll add this explanation to the commit message and the version number, 
and will send a new patch shortly.


Thanks,
Omri

> Peter
>
> *From:*Omri Sarig <omri.sarig13@gmail.com>
> *Sent:* Friday, March 21, 2025 8:29
> *To:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; 
> openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [meta-python][PATCH v2] python3-varlink: Add recipe
>
> On 3/20/25 22:10, Marko, Peter wrote:
>
>     This recipe is missing version (e.g. 31.0.0+git).
>
> I'll add the version, I missed that.
>
>     Also the runtime dependencies should be split.
>
>     I think that at least unittests should go to ptest package, not main.
>
> I was not sure what is the right thing to do here is.
> When installing the package through setuptools, it also installs the 
> tests directory as part of the package (so it ends up in the target at 
> `/usr/lib/python3.12/site-packages/varlink/tests/`).
> Following the README, running the examples of the package require 
> running some files from the tests directory, that also import unittest.
>
> So, if we want to keep the full functionality, and allow a user on the 
> target to run the examples, we have to keep all of the current runtime 
> dependencies as part of main.
>
> So the options I can think of are:
>
> 1. Leave the dependencies as-is, adding the reasoning above to the 
> commit message.
> 2. Split the dependencies, and remove the tests directory from the 
> target (even though it is included through setuptools). This way, the 
> package is smaller (and have less dependencies), but it ends up being 
> significantly different than what will be available when it is usually 
> installed.
> 2a. If we want, we can have it done through a flag, so a user is able 
> to explicitly decide to include the test packages in.
> 3. Split the dependencies, but keep the tests directory as part of the 
> installation - this way, we have less runtime dependencies for regular 
> use of the package, but if a user is trying to run the examples on the 
> target, they will receive an import error.
>
> What do you think is the best solution here?
>
> Omri
>
>         -----Original Message-----
>
>         From:openembedded-devel@lists.openembedded.org <openembedded-
>
>         devel@lists.openembedded.org> On Behalf Of Omri Sarig via
>
>         lists.openembedded.org
>
>         Sent: Thursday, March 20, 2025 12:30
>
>         To:openembedded-devel@lists.openembedded.org
>
>         Cc: Omri Sarig<omri.sarig13@gmail.com> <mailto:omri.sarig13@gmail.com>
>
>         Subject: [oe] [meta-python][PATCH v2] python3-varlink: Add recipe
>
>         Add a python recipe to install the python implementation for the varlink
>
>         interface.
>
>         The recipe is using the current master head, instead of the version from
>
>         pypi. This is done as the pypi version is 4 years old, while the master
>
>         is continuously maintained in GitHub.
>
>         The runtime dependencies were created by looking at all the import
>
>         statement in the installed files of the repository and looking at the
>
>         relevant packages from the python3 manifest file in meta-poky.
>
>         Signed-off-by: Omri Sarig<omri.sarig13@gmail.com> <mailto:omri.sarig13@gmail.com>
>
>         ---
>
>           .../ptest-packagelists-meta-python.inc        |  1 +
>
>           .../python/python3-varlink_git.bb             | 28 +++++++++++++++++++
>
>           2 files changed, 29 insertions(+)
>
>           create mode 100644 meta-python/recipes-devtools/python/python3-varlink_git.bb
>
>         diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-
>
>         python/conf/include/ptest-packagelists-meta-python.inc
>
>         index 3a1fb13ba7..40df4f08f3 100644
>
>         --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
>
>         +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>
>         @@ -89,6 +89,7 @@ PTESTS_FAST_META_PYTHON = "\
>
>               python3-unidiff \
>
>               python3-uritemplate \
>
>               python3-validators \
>
>         +    python3-varlink \
>
>               python3-wrapt \
>
>               python3-wsproto \
>
>               python3-xlrd \
>
>         diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b/meta-
>
>         python/recipes-devtools/python/python3-varlink_git.bb
>
>         new file mode 100644
>
>         index 0000000000..8b5e01cf44
>
>         --- /dev/null
>
>         +++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
>
>         @@ -0,0 +1,28 @@
>
>         +SUMMARY = " Python implementation of the Varlink protocol"
>
>         +HOMEPAGE ="https://varlink.org/python/" <https://varlink.org/python/>
>
>         +LICENSE = "Apache-2.0"
>
>         +LIC_FILES_CHKSUM =
>
>         "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e" <file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e>
>
>         +
>
>         +SRC_URI ="git://github.com/varlink/python.git;protocol=https;branch=master" <git://github.com/varlink/python.git;protocol=https;branch=master>
>
>         +
>
>         +SRCREV = "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
>
>         +
>
>         +S = "${WORKDIR}/git"
>
>         +
>
>         +inherit python_setuptools_build_meta ptest-python-pytest
>
>         +
>
>         +DEPENDS += "python3-setuptools-scm-native"
>
>         +
>
>         +RDEPENDS:${PN} += " \
>
>         +    python3-core \
>
>         +    python3-datetime \
>
>         +    python3-io \
>
>         +    python3-json \
>
>         +    python3-netclient \
>
>         +    python3-netserver \
>
>         +    python3-shell \
>
>         +    python3-stringold \
>
>         +    python3-unittest \
>
>         +"
>
>         +
>
>         +PTEST_PYTEST_DIR = "varlink/tests"
>
--------------4hY00MBnnc6fRk5El2wl0ORC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/21/25 08:54, Marko, Peter wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:AS1PR10MB56972A5C5FF47506C2D912BFFDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator"
        content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Aptos;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Arial",sans-serif;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif">In
            ideal case we should do a good package split.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif">e.g.
            main package + examples package + test package (with
            examples depending on test)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif">That
            would allow us to just install the tool with small footprint
            or install also tests or everything.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif">But we
            can also just keep it as is as it looks difficult.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif">I just
            thought there is a low-hanging fruit somewhere.</span></p>
      </div>
    </blockquote>
    <p>That makes sense - unfortunately, that was not the case with the
      way they built the varlink-python repo and setuptool installation.</p>
    <p>I'll add this explanation to the commit message and the version
      number, and will send a new patch shortly.</p>
    <p><br>
      Thanks,<br>
      Omri<br>
    </p>
    <blockquote type="cite"
cite="mid:AS1PR10MB56972A5C5FF47506C2D912BFFDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <div class="WordSection1">
        <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif">Peter<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p> </o:p></span></p>
        <div
style="border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in 4.0pt">
          <div>
            <div
style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                  Omri Sarig <a class="moz-txt-link-rfc2396E" href="mailto:omri.sarig13@gmail.com">&lt;omri.sarig13@gmail.com&gt;</a>
                  <br>
                  <b>Sent:</b> Friday, March 21, 2025 8:29<br>
                  <b>To:</b> Marko, Peter (FT D EU SK BFS1)
                  <a class="moz-txt-link-rfc2396E" href="mailto:Peter.Marko@siemens.com">&lt;Peter.Marko@siemens.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a><br>
                  <b>Subject:</b> Re: [oe] [meta-python][PATCH v2]
                  python3-varlink: Add recipe<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p> </o:p></p>
          <div>
            <p class="MsoNormal">On 3/20/25 22:10, Marko, Peter wrote:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre>This recipe is missing version (e.g. 31.0.0+git).<o:p></o:p></pre>
          </blockquote>
          <p class="MsoNormal">I'll add the version, I missed that.<br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre><o:p> </o:p></pre>
            <pre>Also the runtime dependencies should be split.<o:p></o:p></pre>
            <pre>I think that at least unittests should go to ptest package, not main.<o:p></o:p></pre>
          </blockquote>
          <p>I was not sure what is the right thing to do here is.<br>
            When installing the package through setuptools, it also
            installs the tests directory as part of the package (so it
            ends up in the target at
            `/usr/lib/python3.12/site-packages/varlink/tests/`).<br>
            Following the README, running the examples of the package
            require running some files from the tests directory, that
            also import unittest.<o:p></o:p></p>
          <p>So, if we want to keep the full functionality, and allow a
            user on the target to run the examples, we have to keep all
            of the current runtime dependencies as part of main.<o:p></o:p></p>
          <p>So the options I can think of are:<o:p></o:p></p>
          <p>1. Leave the dependencies as-is, adding the reasoning above
            to the commit message.<br>
            2. Split the dependencies, and remove the tests directory
            from the target (even though it is included through
            setuptools). This way, the package is smaller (and have less
            dependencies), but it ends up being significantly different
            than what will be available when it is usually installed.<br>
            2a. If we want, we can have it done through a flag, so a
            user is able to explicitly decide to include the test
            packages in.<br>
            3. Split the dependencies, but keep the tests directory as
            part of the installation - this way, we have less runtime
            dependencies for regular use of the package, but if a user
            is trying to run the examples on the target, they will
            receive an import error.<o:p></o:p></p>
          <p>What do you think is the best solution here?<o:p></o:p></p>
          <p>Omri <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre><o:p> </o:p></pre>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>-----Original Message-----<o:p></o:p></pre>
              <pre>From: <a
              href="mailto:openembedded-devel@lists.openembedded.org"
              moz-do-not-send="true" class="moz-txt-link-freetext">openembedded-devel@lists.openembedded.org</a> &lt;openembedded-<o:p></o:p></pre>
              <pre><a href="mailto:devel@lists.openembedded.org"
              moz-do-not-send="true" class="moz-txt-link-freetext">devel@lists.openembedded.org</a>&gt; On Behalf Of Omri Sarig via<o:p></o:p></pre>
              <pre>lists.openembedded.org<o:p></o:p></pre>
              <pre>Sent: Thursday, March 20, 2025 12:30<o:p></o:p></pre>
              <pre>To: <a
              href="mailto:openembedded-devel@lists.openembedded.org"
              moz-do-not-send="true" class="moz-txt-link-freetext">openembedded-devel@lists.openembedded.org</a><o:p></o:p></pre>
              <pre>Cc: Omri Sarig <a
              href="mailto:omri.sarig13@gmail.com"
              moz-do-not-send="true">&lt;omri.sarig13@gmail.com&gt;</a><o:p></o:p></pre>
              <pre>Subject: [oe] [meta-python][PATCH v2] python3-varlink: Add recipe<o:p></o:p></pre>
              <pre><o:p> </o:p></pre>
              <pre>Add a python recipe to install the python implementation for the varlink<o:p></o:p></pre>
              <pre>interface.<o:p></o:p></pre>
              <pre><o:p> </o:p></pre>
              <pre>The recipe is using the current master head, instead of the version from<o:p></o:p></pre>
              <pre>pypi. This is done as the pypi version is 4 years old, while the master<o:p></o:p></pre>
              <pre>is continuously maintained in GitHub.<o:p></o:p></pre>
              <pre><o:p> </o:p></pre>
              <pre>The runtime dependencies were created by looking at all the import<o:p></o:p></pre>
              <pre>statement in the installed files of the repository and looking at the<o:p></o:p></pre>
              <pre>relevant packages from the python3 manifest file in meta-poky.<o:p></o:p></pre>
              <pre><o:p> </o:p></pre>
              <pre>Signed-off-by: Omri Sarig <a
              href="mailto:omri.sarig13@gmail.com"
              moz-do-not-send="true">&lt;omri.sarig13@gmail.com&gt;</a><o:p></o:p></pre>
              <pre>---<o:p></o:p></pre>
              <pre> .../ptest-packagelists-meta-python.inc        |  1 +<o:p></o:p></pre>
              <pre> .../python/python3-varlink_git.bb             | 28 +++++++++++++++++++<o:p></o:p></pre>
              <pre> 2 files changed, 29 insertions(+)<o:p></o:p></pre>
              <pre> create mode 100644 meta-python/recipes-devtools/python/python3-varlink_git.bb<o:p></o:p></pre>
              <pre><o:p> </o:p></pre>
              <pre>diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-<o:p></o:p></pre>
              <pre>python/conf/include/ptest-packagelists-meta-python.inc<o:p></o:p></pre>
              <pre>index 3a1fb13ba7..40df4f08f3 100644<o:p></o:p></pre>
              <pre>--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<o:p></o:p></pre>
              <pre>+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<o:p></o:p></pre>
              <pre>@@ -89,6 +89,7 @@ PTESTS_FAST_META_PYTHON = "\<o:p></o:p></pre>
              <pre>     python3-unidiff \<o:p></o:p></pre>
              <pre>     python3-uritemplate \<o:p></o:p></pre>
              <pre>     python3-validators \<o:p></o:p></pre>
              <pre>+    python3-varlink \<o:p></o:p></pre>
              <pre>     python3-wrapt \<o:p></o:p></pre>
              <pre>     python3-wsproto \<o:p></o:p></pre>
              <pre>     python3-xlrd \<o:p></o:p></pre>
              <pre>diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b/meta-<o:p></o:p></pre>
              <pre>python/recipes-devtools/python/python3-varlink_git.bb<o:p></o:p></pre>
              <pre>new file mode 100644<o:p></o:p></pre>
              <pre>index 0000000000..8b5e01cf44<o:p></o:p></pre>
              <pre>--- /dev/null<o:p></o:p></pre>
              <pre>+++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb<o:p></o:p></pre>
              <pre>@@ -0,0 +1,28 @@<o:p></o:p></pre>
              <pre>+SUMMARY = " Python implementation of the Varlink protocol"<o:p></o:p></pre>
              <pre>+HOMEPAGE = <a href="https://varlink.org/python/"
              moz-do-not-send="true">"https://varlink.org/python/"</a><o:p></o:p></pre>
              <pre>+LICENSE = "Apache-2.0"<o:p></o:p></pre>
              <pre>+LIC_FILES_CHKSUM =<o:p></o:p></pre>
              <pre><a
href="file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
              moz-do-not-send="true">"file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"</a><o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+SRC_URI = <a
href="git://github.com/varlink/python.git;protocol=https;branch=master"
              moz-do-not-send="true">"git://github.com/varlink/python.git;protocol=https;branch=master"</a><o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+SRCREV = "6012b8805bf2ebcc981c84bd56a3e949a2141c16"<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+S = "${WORKDIR}/git"<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+inherit python_setuptools_build_meta ptest-python-pytest<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+DEPENDS += "python3-setuptools-scm-native"<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+RDEPENDS:${PN} += " \<o:p></o:p></pre>
              <pre>+    python3-core \<o:p></o:p></pre>
              <pre>+    python3-datetime \<o:p></o:p></pre>
              <pre>+    python3-io \<o:p></o:p></pre>
              <pre>+    python3-json \<o:p></o:p></pre>
              <pre>+    python3-netclient \<o:p></o:p></pre>
              <pre>+    python3-netserver \<o:p></o:p></pre>
              <pre>+    python3-shell \<o:p></o:p></pre>
              <pre>+    python3-stringold \<o:p></o:p></pre>
              <pre>+    python3-unittest \<o:p></o:p></pre>
              <pre>+"<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+PTEST_PYTEST_DIR = "varlink/tests"<o:p></o:p></pre>
            </blockquote>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------4hY00MBnnc6fRk5El2wl0ORC--


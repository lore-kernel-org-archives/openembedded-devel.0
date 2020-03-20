Return-Path: <robert.berger.oe.devel@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5541A61ADC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 16:38:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r7so7660902wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 09:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=Eeidwq6mAdnoOpZL7+AwyUl1P+NWqUDAlNNxCfy6vf4=;
	b=UjrIE0W9eVUFxg93PruGCukA++Y2Mq/aYS8IICbJHaizvx+qr7exrRYG4Hd/3VX+sl
	m2/YXeoaRhKC/a4dm6mceccj5QQnc3omobbZIWQ3I/MZyKALPSvz1RRJQfHNChxHV+PO
	WD+hnJDFDQLZtW6K5QSWwBTRttkaim5d5cS2Wi0L5nvrDeCUojlEnzqZlNS80svfA3Wb
	XMrRFFe7UPY4pk1G7pxtq3aKrtfxb8fLe/2IlnejqM+HsgXVJQjdIFpeDLwvoObvqmQM
	r91IPISnDjXZI46YLnHCKm4qvJflkCDQ7j/yw3/tteRZIWlQqi8qTVnN7ljqgv4ZZCLD
	gMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=Eeidwq6mAdnoOpZL7+AwyUl1P+NWqUDAlNNxCfy6vf4=;
	b=hT7QE3bsUPas50iLsw9rofSLvf8LTi0Ny51v5bA0PY+zbvFKw/1pkX1UvXBEUolTuK
	sAxyo3p+ozPqA2Z+lcsTXGT1wEYVmttAtfbm25ZYD/Zqulu2s6Sc5YvBeDCRwbfAoNz6
	EauTjgkHF+w/k/67oAaD829X4qlGlJ8Vv4hnZqkKkUJijGfhIyFf8/0KtTp9SGnCdx+F
	XLRCSrXcPrs1I18Yjem9bDOv86iCYBRfxH2YuwBdF35tRMom1+bIn6NMsPf1NTu6M2wT
	iO6xSqwQ/hGyhPwax4w85gOqzwCXSCUwKKrXlsMWj8efFGMO9/nmpIfK+iR4OzlJuC+K
	2aYA==
X-Gm-Message-State: ANhLgQ2S35LF3bvm1hls5UmuDwPBjuCaiihm0E46HcRCVuZxB+qy9hA4
	4RUQfyXYRXFXhLaw4+qifIY=
X-Google-Smtp-Source: ADFU+vthKqGt2iCTWxbMRm04N8BXjD9bwdYyMdxvOR4Qgz3IDeALUrGgBChejMSw21HFR1wK3UwN3w==
X-Received: by 2002:a1c:456:: with SMTP id 83mr11341638wme.54.1584722299577;
	Fri, 20 Mar 2020 09:38:19 -0700 (PDT)
Received: from [192.168.42.52] (athedsl-4432938.home.otenet.gr.
	[79.129.148.26]) by smtp.gmail.com with ESMTPSA id
	138sm8724332wmb.21.2020.03.20.09.38.18
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 20 Mar 2020 09:38:19 -0700 (PDT)
To: Richard Leitner <richard.leitner@skidata.com>
From: "robert.berger.oe.devel" <robert.berger.oe.devel@gmail.com>
Message-ID: <add27e61-09ac-3e8a-af0e-73479a3f97ab@gmail.com>
Date: Fri, 20 Mar 2020 18:38:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Robert Berger <robert.berger@reliableembeddedsystems.com>
Subject: [meta-java] archiver.bbclass incompatible with openjdk-8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Mar 2020 16:38:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

The problem can be very easily reproduced. Just enable the 
archiver.bbclass and build openjdk-8 and it will break. I'll explain 
further down why.

I would really like to have some upstream solution, so openjdk-8 can be 
built with the archiver.bbclass active, but so far I only have my hacky 
patch[1].

[1] 
https://github.com/RobertBerger/meta-java/commit/a97d27ea0d6701df222c79fb1ce983fc39308c0c

Here I try to explain the problem:

1) Without the archiver class:

in openjdk-8-common.inc:

1.1) do_unpack[postfuncs] += "do_unpack_extract_submodules"

1.2)

do_unpack_extract_submodules () {
     cd "${S}"
     # tar --transform
     tar xjf ${WORKDIR}/${CORBA_FILE_LOCAL} --transform 
"s,-${CORBA_CHANGESET},,g"
...
}

2) With the archiver class:

2.1) do_unpack_and_patch could be used instead of do_unpack directly:

2.1.1) It is always used for ARCHIVER_MODE[src] = "patched" and 
ARCHIVER_MODE[src] = "configured".

2.1.2) For ARCHIVER_MODE[src] = "original" it is only enabled if 
ARCHIVER_MODE[diff] = "1" is also enabled.

2.1.3) And for the new ARCHIVE_MODE[src] = "mirror" it is never enabled.

Thanks to Saur for the detailed explanation when and when not 
do_unpack_and_patch is being called.

2.2) if do_unpack_and_patch() is used it sets WORKDIR itself to 
${ARCHIVER_WORKDIR}, which defaults to ${WORKDIR}/archiver-work/

2.3) Which makes

do_unpack_extract_submodules () {
     cd "${S}"
     # tar --transform
     tar xjf ${WORKDIR}/${CORBA_FILE_LOCAL} --transform 
"s,-${CORBA_CHANGESET},,g"
...
}

fail, since it should be tar xjf ${WORKDIR}/../${CORBA_FILE_LOCAL} 
--transform "s,-${CORBA_CHANGESET},,g"

...

due to the additional directory structure.

I would be happy to hear suggestions how to improve my hack.

If I could somehow programatically figure out within BitBake that 
do_unpack_extract_submodules is called from do_unpack_and_patch -> 
do_unpack I guess it would be better. Just don't know how this can be 
done. Is there a BitBake callstack?

3) My (hacky) solution

[1] 
https://github.com/RobertBerger/meta-java/commit/a97d27ea0d6701df222c79fb1ce983fc39308c0c


Regards,

Robert


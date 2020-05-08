Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.7841.1588933171280785854
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 03:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lxDGtJTv;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id z8so1234011wrw.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Np5hrcLXyQ51T3yHoH5IAe3jEm1547fqsIiQz+7wzIw=;
        b=lxDGtJTviHZolLV4gyPOq0swIu5wKpmUZZ+blAiGpWiUo3pOveEM17nVBKyo6kQIDW
         FE7T8VspXy91oGpLF/F/wQBQymsBGk5n4nP95yu8+VgCKV08RtzaY8VMPq1XtDMe2N0D
         57pfKhi+DLGlDWjk+2rkM5OcUhMmbcJ25puC0rkIcZreMADGjEl2lQCRkS+Y4Z0VVIRf
         aY0kojtoIIh52ItkkKn3mRattEwkrqaUaPiynIs7jp16jLDMnEQJJ5amT+Zpi7wzXqis
         q7kjWdeTAaAsk2W5wAElRpDWH1qKfmhFjt7ONGOkADTAz+8F8ofgqsWtd9HMym0Kcc49
         VrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Np5hrcLXyQ51T3yHoH5IAe3jEm1547fqsIiQz+7wzIw=;
        b=M6ofyf+B57gj1vjB6ViIbKboEeFsLfNEV97cerK7AcPdruw7MAnIaAwtVuAuvxrKaj
         TgFh0DMopPO4BQqeh6g6QlhnlW53PqlOzYlz/m7LCwR/DLTyqvOSN4dlLcyR6Upes1u+
         fxY6utuKLdpQ6A4/wbs3A8lNfIE029EZAdPjPZEFQk53OM06gBKKnIulNN/RMcOCFuh/
         t41lI7UmqN3Qiedt8hDZphSdM1mbGnfTg2nXsCaC19Xu5q5QsFNd3bpfSAz4OpgM5jlt
         ipvrvvoRsAQ1tV8oTN++OeMdGw4MEuFH5oT7Wc5/W2H6NlLY7ZBz6Jghaanxe4guUpqh
         oTfw==
X-Gm-Message-State: AGi0PuYcr/Ssivu59JLE1WZp/9tDJ+iEs5IfNpj1jwDriWuZYxpEKMl4
	V0y2WsG+hcwjEuQOQZSs+aI=
X-Google-Smtp-Source: APiQypJ1jTCncTY6kdyJklXzmRHNO3BRrHsp2QwrtG0WiN9XFWNSi8/tNKBUQtrHb5SSpJf+6IBhYQ==
X-Received: by 2002:adf:80ee:: with SMTP id 101mr2202962wrl.156.1588933169757;
        Fri, 08 May 2020 03:19:29 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id q14sm2333631wrc.66.2020.05.08.03.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 03:19:29 -0700 (PDT)
Subject: Re: [oe] [meta-java][PATCH v2] do_unpack_extract_submodules: WORKDIR and ARCHIVER_WORKDIR support
From: "Robert Berger" <oecore.mailinglist@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: richard.leitner@skidata.com,
 Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
References: <20200508095056.15810-1-robert.berger@ReliableEmbeddedSystems.com>
Message-ID: <bc474d70-f90e-1694-4740-d86ee98c4fac@gmail.com>
Date: Fri, 8 May 2020 13:19:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508095056.15810-1-robert.berger@ReliableEmbeddedSystems.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Further tests show that this does not work, please ignore!

Regards,

Robert


On 08/05/2020 12:50, Robert Berger wrote:
> Signed-off-by: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
> ---
>   recipes-core/openjdk/openjdk-8-common.inc | 26 +++++++++++++++++------
>   1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index 5ea83ed..2166147 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -32,14 +32,26 @@ do_configure_prepend () {
>   
>   do_unpack_extract_submodules () {
>       cd "${S}"
> +
> +    # default WORKDIR - __NOT__ called from archiver.bbclass:do_unpack_and_patch
> +    # WORKDIR is __NOT_ modified:
> +    SUBMOD_WORKDIR="${WORKDIR}"
> +
> +    # "special" WORKDIR - called from archiver.bbclass:do_unpack_and_patch
> +    # archiver.bbclass set's WORKDIR to ARCHIVER_WORKDIR:
> +    if [ "$WORKDIR" == "$ARCHIVER_WORKDIR" ]; then
> +       SUBMOD_WORKDIR="${ARCHIVER_WORKDIR}/.."
> +    fi
> +
>       # tar --transform
> -    tar xjf ${WORKDIR}/${CORBA_FILE_LOCAL} --transform "s,-${CORBA_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${HOTSPOT_FILE_LOCAL} --transform "s,-${HOTSPOT_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${JAXP_FILE_LOCAL} --transform "s,-${JAXP_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${JAXWS_FILE_LOCAL} --transform "s,-${JAXWS_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${JDK_FILE_LOCAL} --transform "s,-${JDK_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${LANGTOOLS_FILE_LOCAL} --transform "s,-${LANGTOOLS_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${NASHORN_FILE_LOCAL} --transform "s,-${NASHORN_CHANGESET},,g"
> +    tar xjf ${SUBMOD_WORKDIR}/${CORBA_FILE_LOCAL} --transform "s,-${CORBA_CHANGESET},,g"
> +    tar xjf ${SUBMOD_WORKDIR}/${HOTSPOT_FILE_LOCAL} --transform "s,-${HOTSPOT_CHANGESET},,g"
> +    tar xjf ${SUBMOD_WORKDIR}/${JAXP_FILE_LOCAL} --transform "s,-${JAXP_CHANGESET},,g"
> +    tar xjf ${SUBMOD_WORKDIR}/${JAXWS_FILE_LOCAL} --transform "s,-${JAXWS_CHANGESET},,g"
> +    tar xjf ${SUBMOD_WORKDIR}/${JDK_FILE_LOCAL} --transform "s,-${JDK_CHANGESET},,g"
> +    tar xjf ${SUBMOD_WORKDIR}/${LANGTOOLS_FILE_LOCAL} --transform "s,-${LANGTOOLS_CHANGESET},,g"
> +    tar xjf ${SUBMOD_WORKDIR}/${NASHORN_FILE_LOCAL} --transform "s,-${NASHORN_CHANGESET},,g"
>   }
>   
>   do_unpack_delete_X11_wrappers() {
> 
> 
> 
> 


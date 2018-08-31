Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1EE600BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 14:54:22 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id x197-v6so22168953oix.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KjhVUgA0nYowvPXif9VMWAWAffACNOyYY/sUsVuUmgs=;
	b=sSSXTpNwLChC4TYPJTe96FMlvUjvxjsKsX7BzVtayWGwyfIj3mD3+6pl1ZhMYFjhZQ
	FJYuQGZExpk9zfW5T6KF3k2dRqsAkYZE3jlgKSJS9XxDjXVETgxUFvdlvS+JjG+R6g95
	ZwiDiGBeviUSYcL59t+0GuBUL/V+UcIwI9pswk78qmA6MDBSqZvxZsYabsyXFBPFyLBN
	oDqs2KfFy4CfAIvyO3otSQj/pneqpjSYIraU1SpT6rUEkKds9j7UH6/QWCsh5AulhrXY
	VNFGL3KLF8kZwqJPhaRaw72lL3UPecdA7XD9+g/9M388KYp9OsCjp6RDk4NrTpIYiOKS
	2QbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KjhVUgA0nYowvPXif9VMWAWAffACNOyYY/sUsVuUmgs=;
	b=ht1AMxKO+uzrXjzqttTi/CSk2JcN8UnMtK5IXF3npNG32cZHk0SV40T450Qc+wvYRQ
	6xJ/gqxQcBTz1y6z3R434XgkcEqRiJOvN6nWqgtlhW+epU2t29z3QbEfs3PM2DpOsMuX
	QidzSjhrDPM13PKNc4zP+4wThRnJ64DY/i4inLFRzt6XwDRxeV/+QCkKdIh4/zME3Iu9
	WCvlpfubI3DroyZH8+L23URNJNMlURhZmMhSuObFmk07qo8y8yrU1LxkF+sJqfRd/3XI
	6PMYvgJo0acSLnCMUuJZOXaaKXe3dzgMY+csiRKq87XE5Kwywnop6jbxZ2lX+5soAsIV
	0HGw==
X-Gm-Message-State: APzg51Bg3CVBOnRFhqsM11FzC2f+Bz6YfC7JePN3ABGU4m67kkMrAnWB
	qmk0KxaAzJ2lNoYicy+H+2Ht5jMswwGCbcUO6Ymytg==
X-Google-Smtp-Source: ANB0VdZpvNEALzwZr7vTW1PX2HCCgVYkJDYMOu0j+FBAMgH6Irnw8SDOVfCSzezQktJm3RaxLEL92mir5Ll0pNQWujY=
X-Received: by 2002:aca:6cd5:: with SMTP id
	h204-v6mr7337828oic.140.1535727263525; 
	Fri, 31 Aug 2018 07:54:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7c0c:0:0:0:0:0 with HTTP; Fri, 31 Aug 2018 07:54:02
	-0700 (PDT)
In-Reply-To: <CA+chaQcmKvqbQ4pzX94deHRj7SP6Sn+3O=o=zsdgM=F2Of3mYg@mail.gmail.com>
References: <20180831144216.5212-1-ross.burton@intel.com>
	<CA+chaQcmKvqbQ4pzX94deHRj7SP6Sn+3O=o=zsdgM=F2Of3mYg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Aug 2018 15:54:02 +0100
Message-ID: <CAJTo0LZ8X1Z6UmHEtij7ULCPRtK1C90pPuJt31x4jkTMZALceg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] python-protobuf: disable clean
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
X-List-Received-Date: Fri, 31 Aug 2018 14:54:22 -0000
Content-Type: text/plain; charset="UTF-8"

Erm, yeah, that would be a rebase gone bad.

Thanks for spotting ;)
Ross

On 31 August 2018 at 15:45, Martin Jansa <martin.jansa@gmail.com> wrote:
> Isn't this already covered by:
> http://git.openembedded.org/meta-openembedded/commit/?id=19aeaf028f6819e5fa705593d4bcdbf0b98143e0
> http://git.openembedded.org/meta-openembedded/commit/?id=e65b1c4ebbbf2174125e7c659b908dd0f46c4509
> https://patchwork.openembedded.org/patch/154300/
> ?
>
> On Fri, Aug 31, 2018 at 4:42 PM Ross Burton <ross.burton@intel.com> wrote:
>>
>> The distutils class does a 'setup.py clean' but this breaks the protobuf
>> build:
>>
>> | Can't find required file: ../src/google/protobuf/descriptor.proto
>> | Generating google/protobuf/descriptor_pb2.py...
>> | ERROR: python3 setup.py build_ext execution failed.
>>
>> Disable the clean to work around this.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta-python/recipes-devtools/python/python-protobuf.inc | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc
>> b/meta-python/recipes-devtools/python/python-protobuf.inc
>> index 6a0568ae62..421775d394 100644
>> --- a/meta-python/recipes-devtools/python/python-protobuf.inc
>> +++ b/meta-python/recipes-devtools/python/python-protobuf.inc
>> @@ -25,3 +25,5 @@ RDEPENDS_${PN} += " \
>>
>>  # For usage in other recipies when compiling protobuf files (e.g. by
>> grpcio-tools)
>>  BBCLASSEXTEND = "native"
>> +
>> +CLEANBROKEN = "1"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


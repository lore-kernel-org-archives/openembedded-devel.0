Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 69ADA71B40;
	Fri,  3 Nov 2017 16:20:43 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id r25so2878028pgn.4;
	Fri, 03 Nov 2017 09:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=PZt6bl6yepwegs8HiiseLwJQm7/i7K59xbGoIJn/Ud4=;
	b=WEZu/P35Oa2F9N8NxrkGMjyOfd9RNWXjy0ztVMx/Y24tLPssICnsUqAsmWr+4+HuJB
	rR49Fm69mkFRfX0uS8t2UtG0ME+cia1/nRlsXSbZVyUOPjj+QYEfuX5dEJ/PHc7YYPfV
	FAVT27vjPKiklV8uTyhsQE9rW7wzvsxN8MEwLOmXaJxD6iRk9XkxNxQ8zGTSfeLhCkfO
	0gAwNHMlEykFMwlNcBREAwHkLm+GpyPzvEEPzF6P36M4LTWuOnnHRIlAhlyq4W8IVK34
	RK3rNnGUb18f//xh7l7SdSzkbj6FZWAo/uJrt3vaS+EfU/TOwnxK4JUtciXtrYzMxP+X
	pYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=PZt6bl6yepwegs8HiiseLwJQm7/i7K59xbGoIJn/Ud4=;
	b=UBVEi8nkjZR5vttYsqAIas7aLpGd3nNZIx0Rcgl4TiTfUijGBGv4Vn9ssG4cCyKvtk
	N4JcWB1XEbFhkXhcBeHl74q7BzZEBoFSVf3jijB+dztkCH4jWkGESX8uBnscy7883phR
	dUT0TCSUVTKclFZYsheGcY0KXMLcR5GR/FRh2a+FiB2jb6PjW3fRdD7Gz6uXcbZb80Ou
	tNtAlJooFKy+FuBaJ6E9lab2fVFUfu2vprBmVVDpyMlyEqQ24E/p3ElgwUqU4EXUaW/Z
	GWy3ZCrp8flWash/O8dEy6DIXff2BJg9O5oE1kNp6iBOb0zu3HfazLv24ZdhInO7VHHG
	Uq+g==
X-Gm-Message-State: AMCzsaXhaZAM0ToGw0ZziwqPKm76d7D5PcRilRH/Hm3ztP7V+mRsMNNC
	subdPCLu+dmUMkd9haI/kaA=
X-Google-Smtp-Source: ABhQp+Sc1DAAH4yMPcU81HDX/6wAL26rq8pp7ZqX5qMElNNDijt9QfameQmcFGpG3ItkZ2CQNXC/bQ==
X-Received: by 10.101.88.140 with SMTP id d12mr7753197pgu.166.1509726045364;
	Fri, 03 Nov 2017 09:20:45 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:78e5:dcc3:4839:af44?
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	v85sm11361377pfi.71.2017.11.03.09.20.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Nov 2017 09:20:44 -0700 (PDT)
From: akuster808 <akuster808@gmail.com>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Message-ID: <8075716d-066a-ec38-3787-fd64bb9c61d5@gmail.com>
Date: Fri, 3 Nov 2017 09:20:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
Subject: [RFC] stable branch naming scheme
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
X-List-Received-Date: Fri, 03 Nov 2017 16:20:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello,

The problem I hope to solve is that a Maintainer can stage changes in
any branch in the contrib repos making it difficult for folks to track
their back port requests. The also makes it harder to automate any kind
of build automation.

I would like to propose a contrib naming scheme for the stable release
branches. I am thinking of the following:

stable/{version}-next or {special char}_stable/{version}-next.

=C2=A0=C2=A0 "version" is either the code name or numeric like in bitbake=
=2E

=C2=A0=C2=A0 "special char" would be used to have these branches at the t=
op of th
list, if we wont that.


We can apply this to all OE / Yocto repos that have stable branch
maintenance process.

If we standardize on a naming scheme, We can then document this so
contributers can monitor their requests more easily. The community can
see what changes are being backport.=C2=A0 This will enable the possibili=
ty
to automate builds, etc.=C2=A0

let me know what you think.

Kind regards,

Armin




